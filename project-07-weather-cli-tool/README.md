# Project 07: Weather CLI Tool

## Overview

> A production-style CLI tool built with Bash, focusing on reliability, error handling, and real-world API interaction.

This project demonstrates real-world DevOps practices such as API integration, CLI design, input handling, and error management.

---

## Features

* Fetch weather for any location
* Temperature-only mode (`--temp`)
* Case-insensitive argument handling
* Built-in help menu (`--help`)
* Automatic detection of current location
* Clean and user-friendly CLI output with colors
* Spinner-based loading indicator
* JSON parsing using `jq`
* HTTP status handling
* Retry mechanism for handling temporary API failures
* Robust error handling for invalid locations and API issues

---

## Tech Stack

* Bash Scripting
* Linux Commands (`curl`, `jq`)
* API Integration (wttr.in)

---

## Project Structure

```
project-07-weather-cli-tool/
│
├── weather.sh
└── README.md
```

---

## Why This Project Matters

This project simulates real-world API consumption and CLI tool development.

It demonstrates:

* API-based data fetching
* Command-line interface design
* Robust input handling
* Error detection and handling
* Data extraction and formatting

---

## Usage

```
./weather.sh [LOCATION] [OPTIONS]
```

---

## Examples

### 🔹 Current location weather

```
./weather.sh
```

### 🔹 Specific location

```
./weather.sh delhi
```

### 🔹 Temperature only

```
./weather.sh delhi --temp
```

### 🔹 Case-insensitive flags

```
./weather.sh london --TeMp
```

### 🔹 Help menu

```
./weather.sh --help
```

---

## How It Works

1. Parses command-line arguments using `case`
2. Sends API request using `curl`
3. Implements retry logic for transient failures
4. Validates HTTP response status
5. Verifies JSON response using `jq`
6. Extracts required fields from JSON
7. Displays formatted output with colors
8. Handles invalid locations and errors gracefully

---

## Error Handling

* Uses strict mode (`set -euo pipefail`) for safe execution
* Implements retry mechanism for transient API/network failures
* Validates HTTP response status before processing
* Ensures response is valid JSON using `jq`
* Detects invalid locations from API response
* Prevents misleading output on failure
* Exits with appropriate error codes

---

## Retry Logic

To improve reliability, the script retries API requests in case of temporary failures.

- Maximum retries: 3  
- Delay between retries: 2 seconds  

This ensures the tool remains functional even during brief network issues or API instability.

---

## Exit Codes

* `0` → Success
* `1` → Invalid input (e.g., wrong location)

---

## Sample Output

```
Fetching weather...

🌦️  Weather Report
----------------------
City: Guwahati, Assam, India
Temperature: 29°C
Condition: Partly cloudy
Humidity: 78%
```

---

## Key Learnings

* API integration using `curl`
* CLI argument parsing with `case`
* Handling user input robustly
* Error handling in Bash scripts
* Data extraction using `awk`
* Writing production-style CLI tools

---

## Future Improvements

* Add multi-day forecast support
* Add JSON output format
* Add optional logging flag
* Improve output formatting with colors
* Containerize the application using Docker

---

## Author

**Yasmin Ara Islam**

DevOps Bootcamp Project