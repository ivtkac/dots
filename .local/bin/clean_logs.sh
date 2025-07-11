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

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleanup started. Prepare: $PREPARE" >>"$LOG_FILE"

while IFS= read -r -d '' file; do
    if "$PREPARE"; then
        echo "[INFO] Would delete: $file"
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Deleting: $file" >>"$LOG_FILE"

        if rm -i "$file"; then
            echo "Deleted: $file"
        else
            error "Failed to delete: $file"
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: Failed to delete: $file" >>"$LOG_FILE"
        fi
    fi
done < <(find "$LOG_DIR" -type f -mtime "+$DAYS_OLD" -print0)

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleanup finished." >>"$LOG_FILE"
