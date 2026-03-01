#!/bin/bash

SERVICE_NAME="my-app"
PID_FILE="/tmp/${SERVICE_NAME}.pid"

start_service() {
    if [ -f "$PID_FILE" ]; then
        echo "$SERVICE_NAME is already running."
        return 1
    else
        echo $$ > "$PID_FILE"
        echo "Starting $SERVICE_NAME..."
        return 0
    fi
}

stop_service() {
    if [ -f "$PID_FILE" ]; then
        echo "Stopping $SERVICE_NAME..."
        rm -f "$PID_FILE"
        return 0
    else
        echo "$SERVICE_NAME is not running."
        return 1
    fi
}

status_service() {
    if [ -f "$PID_FILE" ]; then
        echo "$SERVICE_NAME is running"
        return 0
    else
        echo "$SERVICE_NAME is stopped"
        return 1
    fi
}

restart_service() {
    stop_service
    start_service
}

case "${1,,}" in
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
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac