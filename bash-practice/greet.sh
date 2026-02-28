#!/bin/bash

name=$1
country=$2

if [ -z "$name" ] || [ -z "$country" ]; then
	echo "Usage: ./greet.sh <name> <country>"
	exit 1
fi

echo "Hello $name from $country"
