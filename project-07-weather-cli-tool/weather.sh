#!/bin/bash

LOCATION="${1:-}"

if [[ -z "$LOCATION" ]]; then
    weather=$(curl -s wttr.in?format=3)
else
    weather=$(curl -s "wttr.in/$LOCATION?format=3")
fi

echo "Current Weather:"
echo "$weather"
