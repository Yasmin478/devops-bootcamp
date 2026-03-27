#!/bin/bash
set -euo pipefail
trap 'log "Script interrupted!"' SIGINT SIGTERM

#------Configuration

LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/system.log"

MAX_LOG_SIZE=1000000 #1MB
MAX_LOG_FILE=5

CPU_THRESHOLD=80
MEM_THRESHOLD=75
DISK_THRESHOLD=90


#------Setup

mkdir -p "$LOG_DIR"

timestamp(){
	date "+%Y-%m-%d %H:%M:%S"
} 

log(){
	echo "$(timestamp) | $1" | tee -a "$LOG_FILE"
}

#------Log rotation

rotate_logs(){
	if [[ -f "$LOG_FILE" ]]; then
		size=$(stat -c%s "$LOG_FILE" 2>/dev/null || stat -f%z "$LOG_FILE")

		if (( size > MAX_LOG_SIZE )); then
			log "Log size exceeded. Rotating logs..."
			
			rm -f "$LOG_FILE.$MAX_LOG_FILE"
			for (( i=MAX_LOG_FILE; i>=1; i-- )); do
				if [[ -f "$LOG_FILE.$i" ]]; then
					mv "$LOG_FILE.$i" "$LOG_FILE.$(( i+1 ))"
				fi
			done
			
			mv "$LOG_FILE" "$LOG_FILE.1"
			touch "$LOG_FILE"
		fi
	fi		
}


#------Metrics collection

get_cpu_usage(){
	top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}'
}

get_memory_usage(){
	free | awk '/Mem:/ {printf ("%.2f"), $3/$2*100}'
}

get_disk_usage(){
	df -P / | awk 'NR==2 {print $5}' | sed 's/%//'
}

#------Alerting

check_alerts(){
    local cpu=$1
    local mem=$2
    local disk=$3

	if (( ${cpu%.*} > CPU_THRESHOLD )); then
		log "ALERT: HIGH CPU USAGE - ${cpu}%"
	fi

	if (( ${mem%.*} > MEM_THRESHOLD )); then
		log "ALERT: HIGH MEMORY USAGE - ${mem}%"
	fi

	if (( ${disk%.*} > DISK_THRESHOLD )); then
		log "ALERT: HIGH DISK USAGE - ${disk}%"
	fi
}

#------Display Output

print_report(){
    local cpu=$1
    local mem=$2
    local disk=$3

	echo "================================="
	echo "----- System Monitor Report -----"
	echo "================================="
	echo "Time        : $(timestamp)"
	echo "Host		  : $(hostname)"
	echo "CPU Usage   : ${cpu}%"
	echo "Memory Usage: ${mem}%"
	echo "Disk Usage  : ${disk}%"
	echo "Uptime	  : $(uptime -p)"
	echo "---------------------------------"
	echo "Top Processes (CPU):"
	ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
	echo "---------------------------------"
	echo "Top Processes (Memory):"
	ps -eo pid,comm,%mem --sort=-%mem | head -n 6
	echo "================================="
}


#------Main Loop

main(){
    rotate_logs
    
    cpu=$(get_cpu_usage)
    mem=$(get_memory_usage)
    disk=$(get_disk_usage)

    print_report "$cpu" "$mem" "$disk"
    log "CPU: ${cpu}% | Memory: ${mem}% | Disk: ${disk}%"
    check_alerts "$cpu" "$mem" "$disk"
}
main