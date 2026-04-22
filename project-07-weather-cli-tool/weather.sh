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

#--Default location
if [[ -z "$LOCATION" ]]; then
    LOCATION=""
    echo "Using current location..."
fi

API_URL="https://wttr.in/${LOCATION}?format=j1"

#--Fetching weather data (with status code)
response=$(curl -s -w "\n%{http_code}" "$API_URL")

body=$(echo "$response" | head -n -1)
status=$(echo "$response" | tail -n1)

#--HTTP Error Handling
if [[ "$status" -ne 200 ]]; then
    echo "Error: API request failed with status $status"
    exit 1
fi

#--Check for invalid location using JSON
if echo "$body" | jq -e '.nearest_area == null' >/dev/null 2>&1; then
    echo "Error: Invalid location '$LOCATION'"
    exit 1
fi

#--Extract data using jq
temp=$(echo "$body" | jq -r '.current_condition[0].temp_C')
weather=$(echo "$body" | jq -r '.current_condition[0].weatherDesc[0].value')
humidity=$(echo "$body" | jq -r '.current_condition[0].humidity')
city=$(echo "$body" | jq -r '.nearest_area[0].areaName[0].value')
region=$(echo "$body" | jq -r '.nearest_area[0].region[0].value')
country=$(echo "$body" | jq -r '.nearest_area[0].country[0].value')

#--Output
if [[ "$TEMP_ONLY" == true ]]; then
    echo "Temperature in $city: ${temp}°C"
else
    echo "🌦️ Weather Report"
    echo "----------------------"
    echo "City: $city, $region, $country"
    echo "Temperature: ${temp}°C"
    echo "Condition: $weather"
    echo "Humidity: ${humidity}%"
fi