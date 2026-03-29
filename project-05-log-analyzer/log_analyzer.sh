#!/bin/bash
set -euo pipefail

LOG_FILE="${1:-sample.log}"
KEYWORD="${2:-}"
DATE_FILTER="${3:-}"

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi  

FILTERED_LOG="$LOG_FILE"

if [[ -n "$KEYWORD" ]]; then
    FILTERED_LOG=$(mktemp)
    grep "$KEYWORD" "$LOG_FILE" > "$FILTERED_LOG" || true
fi

if [[ -n "$DATE_FILTER" ]]; then
    TEMP_FILE=$(mktemp)
    grep "$DATE_FILTER" "$FILTERED_LOG" > "$TEMP_FILE" || true
    FILTERED_LOG="$TEMP_FILE"
fi


echo "============================================="
echo "Analyzing log file: $LOG_FILE"
echo "--------------------------------------"

total_lines=$(wc -l < "$FILTERED_LOG")
error_count=$(grep -c "ERROR" "$FILTERED_LOG" || true)
warn_count=$(grep -c "WARN" "$FILTERED_LOG" || true)
info_count=$(grep -c "INFO" "$FILTERED_LOG" || true)

echo "Total lines : $total_lines"
echo "INFO count  : $info_count"
echo "WARN count  : $warn_count"
echo "ERROR count : $error_count"

echo ""
echo "------ Recent Errors ------"
grep "ERROR" "$FILTERED_LOG" | tail -n 5 || echo "No errors found." 

echo ""
echo "------ Top Error Messages ------"
grep "ERROR" "$FILTERED_LOG" | awk '{$1=$2=""; print $0}' | sort | uniq -c | sort -nr | head -n 5 || echo "No errors found."

echo ""
echo "Log analysis completed successfully."
echo "============================================="

[[ "$FILTERED_LOG" != "$LOG_FILE" ]] && rm -f "$FILTERED_LOG"
