#!/bin/bash
set -euo pipefail

LOG_FILE="sample.log"
KEYWORD=""
DATE_FILTER=""

usage() {
    echo "Usage: $0 [-f log_file] [-k keyword] [-d date]"
    echo ""
    echo "Options:"
    echo "  -f    Log file (default: sample.log)"
    echo "  -k    Keyword filter (e.g., ERROR)"
    echo "  -d    Date filter (e.g., 2026-03-28)"
    echo "  -h    Show this help message"
}

while getopts "f:k:d:h" opt; do
    case $opt in
        f) LOG_FILE="$OPTARG" ;;
        k) KEYWORD="$OPTARG" ;;
        d) DATE_FILTER="$OPTARG" ;;
        h) usage; exit 0 ;;
        *) usage; exit 1 ;;
    esac
done


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


echo ""
echo "=============================================="
echo "           LOG ANALYSIS REPORT"
echo "=============================================="
printf "%-20s : %s\n" "Log File" "$LOG_FILE"
printf "%-20s : %s\n" "Keyword Filter" "${KEYWORD:-None}"
printf "%-20s : %s\n" "Date Filter" "${DATE_FILTER:-None}"
echo "----------------------------------------------"

total_lines=$(wc -l < "$FILTERED_LOG")
error_count=$(grep -c "ERROR" "$FILTERED_LOG" || true)
warn_count=$(grep -c "WARN" "$FILTERED_LOG" || true)
info_count=$(grep -c "INFO" "$FILTERED_LOG" || true)

printf "%-20s : %s\n" "Total Lines" "$total_lines"
printf "%-20s : %s\n" "INFO Count" "$info_count"
printf "%-20s : %s\n" "WARN Count" "$warn_count"
printf "%-20s : %s\n" "ERROR Count" "$error_count"

echo ""
echo "----------------------------------------------"
echo "Recent Errors (Last 5)"
echo "----------------------------------------------"
errors=$(grep "ERROR" "$FILTERED_LOG" || true)

if [[ -z "$errors" ]]; then
    echo "No errors found."
else
    echo "$errors" | tail -n 5
fi

echo ""
echo "----------------------------------------------"
echo "Top Error Messages"
echo "----------------------------------------------"
top_errors=$(grep "ERROR" "$FILTERED_LOG" | awk '{$1=$2=""; print $0}' | sort | uniq -c | sort -nr || true)

if [[ -z "$top_errors" ]]; then
    echo "No errors found."
else
    echo "$top_errors" | head -n 5
fi

echo ""
echo "=============================================="
echo " Log analysis completed successfully"
echo "=============================================="

[[ "$FILTERED_LOG" != "$LOG_FILE" ]] && rm -f "$FILTERED_LOG"
