#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
LOG_DIR="$SCRIPT_DIR/logs"
LOG_FILE="$LOG_DIR/monitor.log"

mkdir -p "$LOG_DIR"

log(){
    local message="$*"
    echo "$message"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
}

echo ""
echo "===== SERVER HEALTH REPORT ====="
echo ""

log "[$0] Health check started"
log "----------------------------------------------------"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
log "CPU Usage     : $CPU_USAGE%"

MEM_USAGE=$(free | awk '/Mem/ {printf "%.2f", ($3/$2)*100}')
log "Memory Usage  : $MEM_USAGE%"

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
log "Disk Usage    : $DISK_USAGE"

UPTIME=$(uptime -p)
log "Uptime        : $UPTIME"

echo ""
log "----------------------------------------------------"
log "Top 5 Processes (by Memory):"
header=$(printf "%-8s %-10s %-6s %-6s %-20s" "PID" "USER" "%CPU" "%MEM" "COMMAND")
log "$header"
log "----------------------------------------------------"

ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6 | tail -n 5 | while read pid user cpu mem comm
do
    line=$(printf "%-8s %-10s %-6s %-6s %-20s" "$pid" "$user" "$cpu" "$mem" "$comm")
    log "$line"
done

echo ""
log "----------------------------------------------------"
log "Top 5 Processes (by CPU):"
log "$header"
log "----------------------------------------------------"

ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6 | tail -n 5 | while read pid user cpu mem comm
do
    line=$(printf "%-8s %-10s %-6s %-6s %-20s" "$pid" "$user" "$cpu" "$mem" "$comm")
    log "$line"
done
echo ""
log "Health check completed"
log "===================================================="
exit 0