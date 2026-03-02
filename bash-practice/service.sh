#!/bin/bash

SERVICE_NAME="my-app"
PID_FILE="$HOME/${SERVICE_NAME}.pid"
LOG_FILE="$HOME/${SERVICE_NAME}.log"

start_service() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p "$PID" > /dev/null 2>&1; then
            echo "$SERVICE_NAME is already running (PID: $PID)"
            return 1
        else
            echo "Removing stale PID file..."
            rm -f "$PID_FILE"
        fi
    fi

    echo "Starting $SERVICE_NAME..."
    sleep 1000 >> "$LOG_FILE" 2>&1 &
    PID=$!
    echo "$PID" > "$PID_FILE"
    echo "$SERVICE_NAME started with PID $PID"
}

stop_service() {
    if [ ! -f "$PID_FILE" ]; then
        echo "$SERVICE_NAME is not running."
        return 1
    fi

    PID=$(cat "$PID_FILE")

    if ps -p "$PID" > /dev/null 2>&1; then
        echo "Stopping $SERVICE_NAME (PID: $PID)..."
        kill "$PID"
        rm -f "$PID_FILE"
        echo "$SERVICE_NAME stopped."
    else
        echo "Process not found. Cleaning up PID file."
        rm -f "$PID_FILE"
    fi
}

status_service() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p "$PID" > /dev/null 2>&1; then
            echo "$SERVICE_NAME is running (PID: $PID)"
        else
            echo "$SERVICE_NAME is not running but PID file exists."
        fi
    else
        echo "$SERVICE_NAME is stopped."
    fi
}

restart_service() {
    stop_service
    sleep 1
    start_service
}

case "$1" in
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