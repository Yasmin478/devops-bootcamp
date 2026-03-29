#!/bin/bash
set -euo pipefail

LOG_FILE="${1:-sample.log}"

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi  

echo "Analyzing log file: $LOG_FILE"

total_lines=$(wc -l < "$LOG_FILE")
error_count=$(grep -c "ERROR" "$LOG_FILE" || true)
warn_count=$(grep -c "WARN" "$LOG_FILE" || true)
info_count=$(grep -c "INFO" "$LOG_FILE" || true)

echo "Total lines : $total_lines"
echo "INFO count  : $info_count"
echo "WARN count  : $warn_count"
echo "ERROR count : $error_count"

echo "Log analysis completed successfully."