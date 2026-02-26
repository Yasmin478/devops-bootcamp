#!/bin/bash

LOGFILE="system_info.log"
echo "------------------------------------------" >> $LOGFILE
echo "System Report - $(date)" >> $LOGFILE
echo "------------------------------------------" >> $LOGFILE

echo "Uptime:" >> $LOGFILE
uptime >> $LOGFILE

echo "" >> $LOGFILE
echo "Memory Usage:" >> $LOGFILE
free -m >> $LOGFILE

echo "" >> $LOGFILE
echo "Disk Usage:" >> $LOGFILE
df -h >> $LOGFILE

echo "" >> $LOGFILE
echo "CPU Load:" >> $LOGFILE
top -bn1 | grep "load average" >> $LOGFILE

echo "" >> $LOGFILE



echo "System Information"
echo "------------------"
echo "Hostname: $(hostname)"
echo "Operating System: $(uname -o)"
echo "Kernel Version: $(uname -r)"
echo "CPU Architecture: $(uname -m)"
echo "Total Memory: $(free -h | awk '/^Mem:/ {print $2}')"
echo "Available Memory: $(free -h | awk '/^Mem:/ {print $7}')"
echo "Memory Usage:" $(free -h | awk '/^Mem:/ {print $3}')
echo "Memory Used: $(free -m | awk '/^Mem:/ {printf "%.2f%%\n", ($3/$2)*100}')"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $5}')"
echo "Uptime: $(uptime -p)"
echo "Current User: $(whoami)"
echo "Current no. of Users: $(who| wc -l)"
echo "Current Date and Time: $(date)"
echo "IP Address: $(hostname -I | awk '{print $1}')"
