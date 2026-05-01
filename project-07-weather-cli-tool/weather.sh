#!/bin/bash
set -euo pipefail

LOCATION=""
TEMP_ONLY=false

MAX_RETRIES=3
RETRY_DELAY=2

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m" 

#--Spinner function for loading animation

spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'

    while ps -p $pid > /dev/null 2>&1; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

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
            echo "LOCATION: Optional city name (e.g., delhi, london)"
            echo ""
            echo "OPTIONS:"
            echo "  --temp   Show only temperature"
            echo "  --help   Show this help message"
            exit 0
            ;;
        *)
            LOCATION="$arg"
            ;;
    esac
done

if [[ -z "$LOCATION" && -n "${CITY:-}" ]]; then
    LOCATION="$CITY"
fi

#--Default location
if [[ -z "$LOCATION" ]]; then
    echo -e "${YELLOW}Using current location...${NC}"
fi

API_URL="https://wttr.in/${LOCATION}?format=j1"

#--Fetching weather data
echo -e "${YELLOW}Fetching weather...${NC}"

attempt=1
success=false

while [[ $attempt -le $MAX_RETRIES ]]; do
    echo -e "${YELLOW}Attempt $attempt/$MAX_RETRIES...${NC}"

    curl -sS -w "\n%{http_code}" "$API_URL" > /tmp/weather_response &
    spinner

    sleep 0.2

    response=$(cat /tmp/weather_response)
    rm -f /tmp/weather_response

    body=$(echo "$response" | head -n -1)
    status=$(echo "$response" | tail -n1)

    if [[ "$status" -eq 200 ]]; then
        success=true
        break
    fi

    echo -e "${RED}Request failed (status $status). Retrying in $RETRY_DELAY sec...${NC}"
    sleep $RETRY_DELAY

    ((attempt++))
done

if [[ "$success" == false ]]; then
    echo -e "${RED}Error: Failed to fetch weather after $MAX_RETRIES attempts${NC}"
    exit 1
fi

#--HTTP Error Handling
if [[ "$status" -ne 200 ]]; then
    echo -e "${RED}Error: API request failed with status $status${NC}"
    exit 1
fi
#--Check if response is valid JSON
if ! echo "$body" | jq empty >/dev/null 2>&1; then
    echo -e "${RED}Error: Invalid response from API (possibly invalid location)${NC}"
    exit 1
fi

#--Check for invalid location
if echo "$body" | jq -e '.nearest_area == null' >/dev/null 2>&1; then
    echo -e "${RED}Error: Invalid location '$LOCATION'${NC}"
    exit 1
fi

#--Extract data
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
    echo -e "${GREEN}🌦️  Weather Report${NC}"
    echo "----------------------"
    echo "City: $city, $region, $country"
    echo "Temperature: ${temp}°C"
    echo "Condition: $weather"
    echo "Humidity: ${humidity}%"
fi