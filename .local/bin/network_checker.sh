#!/bin/bash
# Pings network devices and logs the results

set -euo pipefail

declare -r RED='\033[0;31m'
declare -r GREEN='\033[0;32m'
declare -r NC='\033[0m'

if [[ ! -s "hosts.txt" ]]; then
    echo "Error: hosts.txt is empty or does not exist"
    exit 1
fi

mapfile -t HOSTS <"hosts.txt"

LOG_FILE="/var/log/network_check.log"
PING_COUNT=3
TIMEOUT=5

log() {
    local level=$1
    local message=$2
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $message" >>"$LOG_FILE"
}

check_host() {
    local host=$1

    echo "Checking $host"

    if ping_result=$(ping -c "$PING_COUNT" -W "$TIMEOUT" "$host" 2>&1); then
        avg_time=$(echo "$ping_result" | awk -F'/' '/^rtt/ {print $5}')
        packet_loss=$(echo "$ping_result" | awk -F', ' '/packet loss/ {print $3}')

        message="Host $host is reachable - Avg: ${avg_time}ms, Loss: $packet_loss"
        echo "$message"
        log "INFO" "$message"
    else
        message="Host $host is unreachable"
        echo "$message"

        log "ERROR" "$message"
    fi
}

: >"$LOG_FILE"

for host in "${HOSTS[@]}"; do
    check_host "$host"
done

echo "Check completed. Results logged to $LOG_FILE"

total_hosts=${#HOSTS[@]}
total_up=$(grep -c 'INFO' "$LOG_FILE")
total_down=$(grep -c 'ERROR' "$LOG_FILE")

echo -e "${GREEN}$total_up hosts${NC}, ${RED}$total_down hosts down${NC}, total ${total_hosts}"

if ((total_down > 0)); then
    exit 1
fi
