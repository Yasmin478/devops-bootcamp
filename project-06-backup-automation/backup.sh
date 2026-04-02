#!/bin/bash
set -euo pipefail

SOURCE_DIR="${1:-}"
BACKUP_DIR="./backups"

#----Validate input----
if [[ -z "$SOURCE_DIR" ]]; then
    echo "Usage: $0 <directory_to_backup>"
    exit 1
fi  

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Error: Directory does not exist."
    exit 1
fi

#----Create backup directory if it doesn't exist----
mkdir -p "$BACKUP_DIR"

#----Generate timestamp----
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

#----Extract directory name for backup file----
BASENAME=$(basename "$SOURCE_DIR")

#----Create backup file name----
BACKUP_FILE="$BACKUP_DIR/${BASENAME}_${TIMESTAMP}.tar.gz"

#----Create backup---
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

echo "Backup created successfully at: $BACKUP_FILE"
