#!/bin/bash

# ---------------- CONFIG ----------------
LOG_DIR="$HOME/Projects/devops-bootcamp/project-02-service-manager/logs"
LOG_FILE="$LOG_DIR/service.log"

mkdir -p "$LOG_DIR"

# ---------------- USAGE ----------------
show_usage() {
    echo "Usage:"
    echo "  $0 <service_name> <action>"
    echo "  OR"
    echo "  $0 <action> <service_name>"
    echo ""
    echo "Actions:"
    echo "  start | stop | restart | status"
    echo ""
    echo "Examples:"
    echo "  $0 nginx start"
    echo "  $0 start nginx"
}

# ---------------- ARGUMENT VALIDATION ----------------
if [ $# -ne 2 ]; then
    show_usage
    exit 1
fi

ARG1=${1,,}   # convert to lowercase
ARG2=${2,,}

# ---------------- DETERMINE ACTION & SERVICE ----------------
case "$ARG1" in
    start|stop|restart|status)
        ACTION=$ARG1
        SERVICE=$ARG2
        ;;
    *)
        case "$ARG2" in
            start|stop|restart|status)
                ACTION=$ARG2
                SERVICE=$ARG1
                ;;
            *)
                echo "Invalid command."
                show_usage
                exit 1
                ;;
        esac
        ;;
esac

# ---------------- LOG FUNCTION ----------------
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# ---------------- SERVICE EXISTENCE CHECK ----------------
if ! systemctl list-unit-files --type=service | grep -q "^${SERVICE}.service"; then
    echo "Service '$SERVICE' does not exist."
    log_message "Service '$SERVICE' does not exist."
    exit 2
fi

# ---------------- SERVICE FUNCTIONS ----------------

status_service() {
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is running"
        log_message "$SERVICE is running"
    else
        echo "$SERVICE is not running"
        log_message "$SERVICE is not running"
    fi
}

start_service() {
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is already running"
        log_message "$SERVICE is already running"
    else
        echo "Starting $SERVICE..."
        log_message "Starting $SERVICE..."

        if sudo systemctl start "$SERVICE"; then
            echo "$SERVICE started successfully"
            log_message "$SERVICE started successfully"
        else
            echo "Failed to start $SERVICE"
            log_message "Failed to start $SERVICE"
        fi
    fi
}

stop_service() {
    if systemctl is-active --quiet "$SERVICE"; then
        echo "Stopping $SERVICE..."
        log_message "Stopping $SERVICE..."

        if sudo systemctl stop "$SERVICE"; then
            echo "$SERVICE stopped successfully"
            log_message "$SERVICE stopped successfully"
        else
            echo "Failed to stop $SERVICE"
            log_message "Failed to stop $SERVICE"
        fi
    else
        echo "$SERVICE is not running"
        log_message "$SERVICE is not running"
    fi
}

restart_service() {
    echo "Restarting $SERVICE..."
    log_message "Restarting $SERVICE..."

    if sudo systemctl restart "$SERVICE"; then
        echo "$SERVICE restarted successfully"
        log_message "$SERVICE restarted successfully"
    else
        echo "Failed to restart $SERVICE"
        log_message "Failed to restart $SERVICE"
    fi
}

# ---------------- ACTION HANDLER ----------------
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
esac