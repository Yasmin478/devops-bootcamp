#!/bin/bash
set -euo pipefail

LOCATION=""
TEMP_ONLY=false

#--Parsing command-line arguments
for arg in "$@"; do
    case "${arg,,}" in
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

    # Extract location (text before :)
    current_location=$(echo "$response" | awk -F: '{print $1}')

    echo "Using current location: $current_location"
else
    response=$(curl -s "wttr.in/$LOCATION?format=3")
fi

#--Error Handling
if echo "$response" | grep -Eqi "unknown location|location not found|error"; then
    echo "Error: Invalid location '$LOCATION'"
    exit 1                                       #--user input error
fi

#--Output
if [[ "$TEMP_ONLY" == true ]]; then
    echo "Temperature: $(echo "$response" | awk '{print $NF}')"
else
    echo "Current Weather:"
    echo "$response"
fi

