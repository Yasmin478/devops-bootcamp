#!/bin/bash

LOG_DIR="$HOME/Projects/devops-bootcamp/project-02-service-manager/logs"
LOG_FILE="$LOG_DIR/service.log"

mkdir -p "$LOG_DIR"

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Usage: $0 <action> <service_name>"
	echo "Example: $0 status nginx"
	exit 1
fi

ACTION=$1
SERVICE=$2

## Log function
log_message(){
	echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

status_service(){
	if systemctl is-active --quiet "$SERVICE"
	then
		echo "$SERVICE is running"
		log_message "$SERVICE is running"
		return 0
	else
		echo "$SERVICE is not running"
		log_message "$SERVICE is not running"
		return 2
	fi
}

start_service(){
	if systemctl is-active --quiet "$SERVICE"
	then
		echo "$SERVICE is already running"
		log_message "$SERVICE is already running"
		return 1
	else
		echo "Starting $SERVICE..."
		log_message "Starting $SERVICE..."
		sudo systemctl start "$SERVICE"
	
		if [ $? -eq 0 ]; then
			echo "$SERVICE started successfully"
			log_message "$SERVICE started successfully"
			return 0
		else
			echo "Failed to start $SERVICE"
			log_message "Failed to start $SERVICE"
			return 3
		fi
	fi
}

stop_service(){
	if systemctl is-active --quiet "$SERVICE"
	then
		echo "Stopping $SERVICE..."
		log_message "Stopping $SERVICE..."
		sudo systemctl stop "$SERVICE"
	
		if [ $? -eq 0 ]; then
			echo "$SERVICE stopped successfully"
			log_message "$SERVICE stopped successfully"
			return 0
		else
			echo "Failed to stop $SERVICE"
			log_message "Failed to stop $SERVICE"
			return 3
		fi
	else
		echo "$SERVICE is not running"
		log_message "$SERVICE is not running"
		return 1
	fi
}

restart_service(){
    echo "Restarting $SERVICE..."
    log_message "Restarting $SERVICE..."

    if sudo systemctl restart "$SERVICE"
    then
        echo "$SERVICE restarted successfully"
        log_message "$SERVICE restarted successfully"
        return 0
    else
        echo "Failed to restart $SERVICE"
        log_message "Failed to restart $SERVICE"
        return 3
    fi
}

case "$ACTION" in 
	start)
		start_service
		;;
	stop)
		stop_service
		;;
	restart)
		restart_service
		;;	
	status)
		status_service
		;;
	*)
		echo "Usage: $0 <start|stop|restart|status> <service_name>"
		echo "Example: $0 status nginx"
		exit 1
		;;
esac