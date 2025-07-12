#!/bin/bash
# Log MySQL replica status to a file

set -euo pipefail

log() {
    local level="$1"
    local message="$2"

    echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $message"
}

LOG_FILE="/var/log/mysql_replica_status.log"
EMAIL=""
SERVER=$(hostname)
ERRORS=()
MYSQL_CHECK=$(mysql --login-path=mysql_login -e "SHOW VARIABLES LIKE '%version%';" 2>/dev/null)

STATUS_LINE=$(mysql --login-path=mysql_login -e "SHOW SLAVE STATUS\G")"1"
LAST_ERRNO=$(grep "Last_Errno" <<<"$STATUS_LINE" | awk '{print $2}')
SECONDS_BEHIND_SOURCE=$(grep "Seconds_Behind_Source" <<<"$STATUS_LINE" | awk '{print $2}')
IO_IS_RUNNING=$(grep "Replica_IO_Running:" <<<"$STATUS_LINE" | awk '{print $2}')
SQL_IS_RUNNING=$(grep "Replica_SQL_Running:" <<<"$STATUS_LINE" | awk '{print $2}')

if [[ -z "${MYSQL_CHECK}" ]]; then
    ERRORS+=("$(log "ERROR" "Can't connect to MySQL on ${SERVER}. Please check the MySQL service.")")
fi

if [[ -z "${STATUS_LINE}" ]]; then
    ERRORS+=("$(log "ERROR" "MySQL replica on ${SERVER} is not configured or not running.")")
fi

if [[ "$LAST_ERRNO" != 0 ]]; then
    LAST_ERROR=$(mysql --login_path=mysql_login -e "SHOW SLAVE STATUS\G" | grep "Last_Error" | awk '{print $2}')
    ERRORS+=("$(log "ERROR" "Error when processing relay log (Last_Errno = $LAST_ERRNO)")")
    ERRORS+=("$(log "ERROR" "(Last_Error = $LAST_ERROR)")")
fi

if [[ "$IO_IS_RUNNING" != "Yes" ]]; then
    ERRORS+=("$(log "ERROR" "I/O thread for reading the source's binary log is not running (Replica_IO_Running)")")
fi

if [[ "$SQL_IS_RUNNING" != "Yes" ]]; then
    ERRORS+=("$(log "ERROR" "SQL thread for executing events in the relay log is not running (Replica_SQL_Running"))")
fi

if [[ "$SECONDS_BEHIND_SOURCE" == "NULL" ]]; then
    ERRORS+=("$(log "ERROR" "The Replica is reporting 'NULL' (Seconds_Behind_Master)")")
elif [[ "$SECONDS_BEHIND_SOURCE" -gt 60 ]]; then
    ERRORS+=("$(log "ERROR" "The Replica is at least 60 seconds behind the source (Seconds_Behind_Source)")")
fi

if [[ "${#ERRORS[@]}" -gt 0 ]]; then
    for error in "${ERRORS[@]}"; do
        if command -v mail &>/dev/null && [[ -n "${EMAIL}" ]]; then
            echo "${error}" | mail -s "Errors on MySQL Replication on ${SERVER}" "${EMAIL}"
        else
            echo "${error}" >>"${LOG_FILE}"
        fi
    done
else
    "$(log "INFO" "MySQL replica works on ${SERVER}. Chill out! :)")" >>"${LOG_FILE}"
fi
