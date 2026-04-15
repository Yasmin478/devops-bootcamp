#!/bin/bash
set -euo pipefail

LOCATION=""
TEMP_ONLY=false

#--Parsing command-line arguments
for arg in "$@"; do
    case "$arg" in
        --temp)

            TEMP_ONLY=true
            ;;

        --help)
                echo "Usage: $0 [LOCATION] [OPTIONS]"
                echo ""
                echo "Fetch current weather information."
                echo ""
                echo "Arguments:"
                echo "LOCATION:         Optional city name (e.g., delhi, london)"
                echo ""
                echo "OPTIONS:"
                echo "  --temp          Show only temperature"
                echo "  --help          Show this help message"
                exit 0
                ;;

        *)
            LOCATION="$arg"
            ;;
    esac
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

