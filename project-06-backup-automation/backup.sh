#!/bin/bash
set -euo pipefail

LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/backup.log"

SOURCE_DIR="${1:-}"
BACKUP_DIR="./backups"

mkdir -p "$LOG_DIR"
mkdir -p "$BACKUP_DIR"

log() {
    local level="$1"
    local message="$2"
    local timestamp

    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    echo "[$timestamp] [$level] $message" | tee -a "$LOG_FILE"
}

#----Validate input----
if [[ -z "$SOURCE_DIR" ]]; then
    log "ERROR" "No directory provided"
    exit 1
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
    log "ERROR" "Directory does not exist: $SOURCE_DIR"
    exit 1
fi

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BASENAME=$(basename "$SOURCE_DIR")
BACKUP_FILE="$BACKUP_DIR/${BASENAME}_${TIMESTAMP}.tar.gz"

log "INFO" "Starting backup for $SOURCE_DIR"

tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

log "INFO" "Backup created successfully: $BACKUP_FILE"