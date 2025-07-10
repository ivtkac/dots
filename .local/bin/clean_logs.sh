#!/bin/bash
#
# Delete log files older than 30 days from /var/log/ safely
# Logs what was deleted to /var/log/cleaned.log

set -euo pipefail
IFS=$'\n\t'

LOG_DIR="/var/log/"
LOG_FILE="/var/log/cleaned.log"
DAYS_OLD=30
DRY_RUN=false

error() {
    echo "[ERROR] $*" >&2
}

usage() {
    echo "Usage: $0 [--dry-run]"
    echo "  --dry-run   Only show what would be deleted"
    exit 1
}

while [[ $# -gt 0 ]]; do
    case "$1" in
    --dry-run) DRY_RUN=true ;;
    -h | --help) usage ;;
    *) usage ;;
    esac
    shift
done

if [[ ! -d "$LOG_DIR" ]]; then
    error "Log directory $LOG_DIR does not exists."
    exit 1
fi

if ! touch "$LOG_FILE" 2>/dev/null; then
    error "Cannot write to log file: $LOG_FILE"
    exit 1
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleanup started. Dry-run: $DRY_RUN" >>"$LOG_FILE"

while IFS= read -r -d '' file; do
    if "$DRY_RUN"; then
        echo "[DRY RUN] Would delete: $file"
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
