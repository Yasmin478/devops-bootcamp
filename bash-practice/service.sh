#!/bin/bash

action=$1

SERVICE_NAME="my-app"

case "${action,,}" in 

	start)
		echo "Starting $SERVICE_NAME..."
		;;
	stop)
		echo "Stopping $SERVICE_NAME..."
		;;
	restart)
		echo "Restarting $SERVICE_NAME..."
		;;
	status)
		echo "Checking status of $SERVICE_NAME..."
		;;
	*)
		echo "Usage: $0 <start|stop|restart|status>"
		exit 1
		;;
esac
