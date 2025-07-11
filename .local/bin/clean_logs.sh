#!/bin/bash
#
# Delete log files older than 30 days from /var/log/ safely
# Logs what was deleted to /var/log/cleaned.log

set -euo pipefail
IFS=$'\n\t'

LOG_DIR="/var/log/"
LOG_FILE="/var/log/cleaned.log"
DAYS_OLD=30
PREPARE=false

log() {
    local level="$1"
    local message="$2"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $message" >>"$LOG_FILE"
}

error() {
    echo "[ERROR] $*" >&2
}

usage() {
    echo "Usage: $0 [--prepare]"
    echo "  --prepare   Only show what would be deleted but not actually delete them"
    exit 1
}

while [[ $# -gt 0 ]]; do
    case "$1" in
    --prepare) PREPARE=true ;;
    -h | --help) usage ;;
    *) usage ;;
    esac
    shift
done

if [[ ! -d "$LOG_DIR" ]]; then
    error "Log directory $LOG_DIR does not exists."
    exit 1
fi

if [[ $EUID -ne 0 ]]; then
    error "This script must be run as root."
    exit 1
fi

if [[ "$PREPARE" = false ]]; then
    log "INFO" "Cleanup started." >>"$LOG_FILE"
fi

while IFS= read -r -d '' file; do
    if "$PREPARE"; then
        echo "$file"
    else
        if rm -i "$file"; then
            log "INFO" "Deleted $file" >>"$LOG_FILE"
        else
            error "Failed to delete: $file"
            echo "ERROR" "Failed to delete: $file"
        fi
    fi
done < <(find "$LOG_DIR" -type f -mtime "+$DAYS_OLD" -print0)

echo "INFO" "Cleanup finished."
