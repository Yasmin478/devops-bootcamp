# Project 07: Weather CLI Tool

## Overview

A CLI-based Bash tool to fetch real-time weather information using an external API.

This project demonstrates real-world DevOps practices such as API integration, CLI design, input handling, and error management.

---

## Features

* Fetch weather for any location
* Temperature-only mode (`--temp`)
* Case-insensitive argument handling
* Built-in help menu (`--help`)
* Error handling for invalid locations
* Automatic detection of current location
* Clean and user-friendly CLI output

---

## Tech Stack

* Bash Scripting
* Linux Commands (`curl`, `awk`, `grep`)
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
2. Fetches weather data using `curl`
3. Processes response using `awk`
4. Displays formatted output
5. Handles invalid inputs using pattern matching

---

## Error Handling

* Uses strict mode (`set -euo pipefail`) for safe execution
* Detects invalid locations from API response
* Prevents misleading output on failure
* Exits with appropriate error codes

---

## Exit Codes

* `0` → Success
* `1` → Invalid input (e.g., wrong location)

---

## Sample Output

```
Using current location: guwahati
Temperature: +29°C
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

---

## Author

**Yasmin Ara Islam**

DevOps Bootcamp Project