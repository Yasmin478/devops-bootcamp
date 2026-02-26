#!/bin/bash

LOGFILE="system_info.log"

# ---------- SUMMARY (Screen Output) ----------

echo "------------------------------------------"
echo "System Summary - $(date)"
echo "------------------------------------------"
echo "Hostname: $(hostname)"
echo "Operating System: $(uname -o)"
echo "Kernel Version: $(uname -r)"
echo "CPU Architecture: $(uname -m)"
echo "Current User: $(whoami)"
echo "Curent no. of users logged in: $(who | wc -l)"
echo "IP Address: $(hostname -I | awk '{print $1}')"
echo "Uptime: $(uptime -p)"
echo "CPU Load: $(uptime | awk -F'load average:' '{print $2}')"
echo "Memory Used: $(free -m | awk '/^Mem:/ {printf "%.2f%%", ($3/$2)*100}')"
echo "Disk Usage (/): $(df -h / | awk 'NR==2 {print $5}')"
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