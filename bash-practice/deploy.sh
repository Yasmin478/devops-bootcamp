#!/bin/bash

env=$1

if [ -z "$env" ]; then
	echo "Usage: ./deploy.sh <dev|staging|production>"
	exit 1
fi

if [ "$env" != "dev" ] && [ "$env" != "staging" ] && [ "$env" != "production" ]; then
	echo "Invalid envireonment!"
	exit 1
fi

echo "Deploying application to $env environment..." 
