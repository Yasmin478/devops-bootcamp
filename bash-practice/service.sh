#!/bin/bash

SERVICE_NAME="my-app"
PID_FILE="/tmp/${SERVICE_NAME}.pid"

start_service() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p $PID > /dev/null 2>&1; then
            echo "$SERVICE_NAME is already running."
            return 1
        else
            echo "Removing stale PID file..."
            rm -f "$PID_FILE"
        fi
    fi

    echo "Starting $SERVICE_NAME..."
    sleep 1000 &
    echo $! > "$PID_FILE"
    return 0
}

stop_service() {
    if [ ! -f "$PID_FILE" ]; then
        echo "$SERVICE_NAME is not running."
        return 1
    fi

    PID=$(cat "$PID_FILE")

    if ps -p $PID > /dev/null 2>&1; then
        echo "Stopping $SERVICE_NAME..."
        kill $PID
        rm -f "$PID_FILE"
        return 0
    else
        echo "Process not found. Cleaning up PID file."
        rm -f "$PID_FILE"
        return 1
    fi
}

status_service() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p $PID > /dev/null 2>&1; then
            echo "$SERVICE_NAME is running (PID: $PID)"
            return 0
        else
            echo "$SERVICE_NAME is not running but PID file exists."
            return 1
        fi
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