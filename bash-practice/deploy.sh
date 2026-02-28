#!/bin/bash

env=$1

if [ -z "$env" ] ; then
	echo "Usage: $0 {dev|staging|production}"
	exit 1
fi

case "${env,,}" in
	dev)
		echo "Deploying application to DEV environment"
		;;
	staging)
		echo "Deploying application to STAGING environment"
		;;
	production)
		echo "Deploying application to PRODUCTION environment"
		;;
	*)
		echo "Usage: $0 {dev|staging|production}"
		exit 1
		;;
esac
