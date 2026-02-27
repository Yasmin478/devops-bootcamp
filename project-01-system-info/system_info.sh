#!/bin/bash

LOGFILE="system_info.log"
STATUS=0

# Capture disk and memory usage for alerts
DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
MEM=$(free | awk 'NR==2 {printf "%.0f", $3/$2*100}')

# ---------- SUMMARY (Screen Output) ----------

echo "------------------------------------------"
echo "System Summary - $(date)"
echo "------------------------------------------"
echo "Hostname: $(hostname)"
echo "Operating System: $(uname -o)"
echo "Kernel Version: $(uname -r)"
echo "CPU Architecture: $(uname -m)"
echo "Current User: $(whoami)"
echo "Logged-in Users: $(who | wc -l)"
echo "IP Address: $(hostname -I | awk '{print $1}')"
echo "Uptime: $(uptime -p)"
echo "CPU Load: $(uptime | awk -F'load average:' '{print $2}')"
echo "Memory Usage: ${MEM}%"
echo "Disk Usage (/): ${DISK}%"
echo "------------------------------------------"

# ---------- ALERT CHECKS ----------

if [ "$DISK" -gt 80 ]; then
    echo "WARNING: Disk usage is above 80%!"
    STATUS=1
fi

if [ "$MEM" -gt 70 ]; then
    echo "WARNING: Memory usage is above 70%!"
    STATUS=1
fi
echo "Alert checks completed."
echo "------------------------------------------"
# ---------- DETAILED LOG (File Output) ----------

{
echo "=========================================="
echo "Detailed System Report - $(date)"
echo "=========================================="

echo ""
echo "Uptime:"
uptime

echo ""
echo "Memory Details:"
free -h

echo ""
echo "Disk Details:"
df -h

echo ""
echo "Top CPU Snapshot:"
top -bn1 | head -15

echo ""
} >> "$LOGFILE"

echo "Detailed system information logged to $LOGFILE"

# Exit with proper status
exit $STATUS