#!/bin/bash

LOCATION=""
TEMP_ONLY=false

#--Parsing command-line arguments
for arg in "$@"; do 
    if [[ "$arg" == "--temp" ]]; then
        TEMP_ONLY=true
    else
        LOCATION="$arg"
    fi
done

#--Fetching weather data
if [[ -z "$LOCATION" ]]; then
    response=$(curl -s wttr.in?format=3)
else
    response=$(curl -s "wttr.in/$LOCATION?format=3")
fi

#--Output
if [[ "$TEMP_ONLY" == true ]]; then
    echo "Temperature: $(echo "$response" | awk '{print $NF}')"
else
    echo "Current Weather:"
    echo "$response"
fi

