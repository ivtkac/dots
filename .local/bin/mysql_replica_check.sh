#!/bin/bash
# Log MySQL replica status to a file

set -euo pipefail

declare -r LOG_FILE="/var/log/mysql_replica_status.log"
declare -r EMAIL="${EMAIL:-}"
declare -r SERVER="${HOSTNAME:-$(hostname)}"
declare -r MYSQL_LOGIN_PATH="${MYSQL_LOGIN_PATH:-mysql_login}"

log() {
    local -r level="$1"
    local -r message="$2"
    printf "[%(%Y-%m-%d %H:%M:%S)T] [%s] %s\n" -1 "$level" "$message"
}

mysql_exec() {
    local -r query="$1"
    mysql --login-path="$MYSQL_LOGIN_PATH" -e "$query" 2>/dev/null || return 1
}

parse_slave_status() {
    local -A slave_status=()
    local line key value

    while IFS=': ' read -r key value; do
        key="${key// /}"
        value="${value# }"
        [[ -n "$key" && -n "$value" ]] && slave_status["$key"]="$value"
    done < <(mysql_exec "SHOW SLAVE STATUS\G" | grep -E "^\s*[A-Za-z_]+:")

    LAST_ERRNO="${slave_status[Last_Errno]:-}"
    SECONDS_BEHIND_SOURCE="${slave_status[Seconds_Behind_Source]:-}"
    IO_IS_RUNNING="${slave_status[Replica_IO_Running]:-}"
    SQL_IS_RUNNING="${slave_status[Replica_SQL_Running]:-}"
    LAST_ERROR="${slave_status[Last_Error]:-}"
}

check_mysql_connection() {
    mysql_exec "SHOW VARIABLES LIKE '%version%'" &>/dev/null
}

check_replica_config() {
    mysql_exec "SHOW SLAVE STATUS\G" | grep -d "Slave_IO_State" 2>/dev/null
}

validate_replica_status() {
    local -a errors=()

    if ! check_mysql_connection; then
        errors+=("$(log "ERROR" "Can't connect to MySQL on ${SERVER}. Please check the MySQL service.")")
        printf "%s\n" "${errors[@]}"
        return 1
    fi

    if ! check_replica_config; then
        errors+=("$(log "ERROR" "MySQL replica on ${SERVER} is not configured or not running.")")
        printf "%s\n" "${errors[@]}"
        return 1
    fi

    parse_slave_status

    if [[ "${LAST_ERRNO:-0}" != "0" ]]; then
        errors+=("$(log "ERROR" "Error when processing relay log (Last_Errno = ${LAST_ERRNO})")")
        errors+=("$(log "ERROR" "Last_Error = ${LAST_ERROR:-'Unknown error'}")")
    fi

    if [[ "${IO_IS_RUNNING,,}" != "yes" ]]; then # Convert to lowercase for comparison
        errors+=("$(log "ERROR" "I/O thread for reading the source's binary log is not running (Replica_IO_Running = ${IO_IS_RUNNING:-'Unknown'})")")
    fi

    if [[ "${SQL_IS_RUNNING,,}" != "yes" ]]; then
        errors+=("$(log "ERROR" "SQL thread for executing events in the relay log is not running (Replica_SQL_Running = ${SQL_IS_RUNNING:-'Unknown'})")")
    fi

    case "${SECONDS_BEHIND_SOURCE:-NULL}" in
    "NULL")
        errors+=("$(log "ERROR" "The Replica is reporting 'NULL' for Seconds_Behind_Source")")
        ;;
    *[!0-9]*)
        errors+=("$(log "ERROR" "Invalid Seconds_Behind_Source value: ${SECONDS_BEHIND_SOURCE}")")
        ;;
    *)
        if ((SECONDS_BEHIND_SOURCE > LAG_THRESHOLD)); then
            errors+=("$(log "ERROR" "The Replica is ${SECONDS_BEHIND_SOURCE} seconds behind the source (threshold: ${LAG_THRESHOLD}s)")")
        fi
        ;;
    esac

    printf '%s\n' "${errors[@]}"
    return $((${#errors[@]} > 0))
}

errors=()

mkdir -p "${LOG_FILE%/*}" 2>/dev/null || true

readarray -t errors < <(validate_replica_status 2>&1)

if ((${#errors[@]} > 0)); then
    for error in "${errors[@]}"; do
        printf "%s\n" "$error" >>"$LOG_FILE"
    done
    exit 1
else
    success_msg="$(log "$INFO" "MySQL replica on ${SERVER} is healthy. Lag: ${SECONDS_BEHIND_SOURCE:-'Unknown'}s")"
    printf '%s\n' "$success_msg" >>"$LOG_FILE"
    exit
fi
