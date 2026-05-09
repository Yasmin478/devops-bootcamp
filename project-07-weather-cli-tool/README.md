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



## Architecture Flow

```text
Developer
    ↓
Push Code to GitHub
    ↓
GitHub Actions CI Pipeline
    ↓
Build Docker Image
    ↓
Push Image to Docker Hub
    ↓
EC2 instance pulls Docker image from Docker Hub
    ↓
Docker container runs application
```

---

## CI/CD Pipeline

This project uses GitHub Actions to automate Docker image builds and pushes.

### Workflow

1. Developer pushes code to GitHub
2. GitHub Actions workflow triggers automatically
3. Docker image is built
4. Image is pushed to Docker Hub
5. EC2 server pulls and runs the image

### Technologies Used

- GitHub Actions
- Docker Hub
- AWS EC2
- Docker

### Workflow File Location

```text
devops-bootcamp/.github/workflows/docker.yml
```

--- 

## Docker Hub

Docker image is automatically published through GitHub Actions CI pipeline.

Image:

```text
docker pull yasmin478/weather-cli:latest
```

---

## Deployment on AWS EC2

The application was deployed on an AWS EC2 Ubuntu instance using Docker.

### Deployment Steps

1. Launch Ubuntu EC2 instance
2. Connect using SSH
3. Install Docker on EC2
4. Pull image from Docker Hub
5. Run container on EC2

### Run on EC2

```bash
docker pull yasmin478/weather-cli:latest

docker run --rm yasmin478/weather-cli guwahati
```

---

## Project Structure

```text
project-07-weather-cli-tool/
│
├── weather.sh
├── Dockerfile
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

## Run with Docker

### Build image

```
docker build -t yasmin478/weather-cli .
```
### Run container

```
docker run --rm yasmin478/weather-cli delhi
```
### Run temperature only

```
docker run --rm yasmin478/weather-cli delhi --temp
```
> Note: `--rm` automatically removes the container after execution.

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

### Workflow File

```text
.github/workflows/docker.yml
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

Production-style DevOps project demonstrating Docker, CI/CD automation, and AWS deployment.