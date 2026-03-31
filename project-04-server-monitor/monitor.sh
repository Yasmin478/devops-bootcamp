#!/bin/bash
set -euo pipefail

#------Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/config.conf"

LOG_DIR="$SCRIPT_DIR/logs"
LOG_FILE="$LOG_DIR/system.log"

mkdir -p "$LOG_DIR"

#------Load Config

if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
else
    echo "Config file not found!"
    exit 1
fi

#------Command-line options

if [[ "${1:-}" == "--no-output" ]]; then
    SILENT=true
else
    SILENT=false
fi

#------Logging

timestamp(){
	date "+%Y-%m-%d %H:%M:%S"
} 

log() {
    local level=$1
    shift
    local message="$*"

	if [[ "$SILENT" == true ]]; then
   		echo "$(timestamp) [$level] $message" >> "$LOG_FILE"
	else
    	echo "$(timestamp) [$level] $message" | tee -a "$LOG_FILE"
	fi
}

#------Signal Handling

trap 'log "ERROR" "Script interrupted!"' SIGINT SIGTERM




#------Log rotation

rotate_logs(){
	if [[ -f "$LOG_FILE" ]]; then
		size=$(stat -c%s "$LOG_FILE" 2>/dev/null || stat -f%z "$LOG_FILE")

		if (( size > MAX_LOG_SIZE )); then
			log "INFO" "Log size exceeded. Rotating logs..."
			
			rm -f "$LOG_FILE.$MAX_LOG_FILES"

			for (( i=MAX_LOG_FILES; i>=1; i-- )); do
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
		log "WARN" "HIGH CPU USAGE: ${cpu}%"
	fi

	if (( ${mem%.*} > MEM_THRESHOLD )); then
		log "WARN" "HIGH MEMORY USAGE: ${mem}%"
	fi

	if (( ${disk%.*} > DISK_THRESHOLD )); then
		log "ALERT" "HIGH DISK USAGE: ${disk}%"
	fi
}

#------Display Output

print_report() {
    local cpu=$1
    local mem=$2
    local disk=$3

    echo ""
    echo "=============================================="
    echo "           SYSTEM HEALTH REPORT"
    echo "=============================================="
    printf "%-20s : %s\n" "Time" "$(timestamp)"
	printf "%-20s : %s\n" "Hostname" "$(hostname)"
    printf "%-20s : %s%%\n" "CPU Usage" "$cpu"
    printf "%-20s : %s%%\n" "Memory Usage" "$mem"
    printf "%-20s : %s%%\n" "Disk Usage" "$disk"
    printf "%-20s : %s\n" "Uptime" "$(uptime -p)"
    echo "----------------------------------------------"

    echo "Top Processes (CPU):"
    printf "%-8s %-20s %-6s\n" "PID" "COMMAND" "%CPU"
	printf "%-8s %-20s %-6s\n" "--------" "--------------------" "------"		
    ps -eo pid,comm,%cpu --sort=-%cpu | sed 1d | grep -Ev "ps|monitor.sh" | head -n 5 | \
	while read pid comm cpu; do
    	printf "%-8s %-20s %-6s\n" "$pid" "$comm" "$cpu"
	done
	echo "----------------------------------------------"

	echo "Top Processes (Memory):"
	printf "%-8s %-20s %-6s\n" "PID" "COMMAND" "%MEM"
	printf "%-8s %-20s %-6s\n" "--------" "--------------------" "------"		
	ps -eo pid,comm,%mem --sort=-%mem | sed 1d | grep -Ev "ps|monitor.sh" | head -n 5 | \
	while read pid comm mem; do
    	printf "%-8s %-20s %-6s\n" "$pid" "$comm" "$mem"
	done	

    echo "=============================================="
}


#------Main Loop

main(){
    rotate_logs
    
    cpu=$(get_cpu_usage)
    mem=$(get_memory_usage)
    disk=$(get_disk_usage)

    if [[ "$SILENT" == false ]]; then
    	print_report "$cpu" "$mem" "$disk"
	fi

    log "INFO" "CPU: ${cpu}% | Memory: ${mem}% | Disk: ${disk}%"
    check_alerts "$cpu" "$mem" "$disk"
}
main