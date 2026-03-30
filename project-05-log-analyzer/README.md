# Project 05: Log Analyzer

## Overview

The **Log Analyzer** is a Bash-based CLI tool designed to analyze log files and extract useful insights for debugging and monitoring.

It simulates real-world DevOps workflows by filtering logs, identifying errors, and summarizing issues.

---

## Features

- Analyze log files
- Count INFO, WARN, ERROR entries
- Display recent errors
- Identify top recurring errors
- Keyword-based filtering
- Date-based filtering
- CLI support using flags (`-f`, `-k`, `-d`, `-h`)
- Clean and structured output

---

## Project Structure
project-05-log-analyzer/
├── log_analyzer.sh
├── sample.log
├── screenshots/
│ ├── normal.png
│ ├── filter.png
│ └── help.png
└── README.md


---

##  Usage

### Default run
```bash
./log_analyzer.sh

### Custom file
./log_analyzer.sh -f sample.log

### Filter by keyword
./log_analyzer.sh -k ERROR

### Filter by keyword + date
./log_analyzer.sh -k ERROR -d "2026-03-28"

### Help
./log_analyzer.sh -h

## Sample Output
- Normal Run

- Filtered Run

- Help Menu

## DevOps Concepts Used
- Log analysis & debugging
- Text processing (grep, awk, sort, uniq)
- CLI argument parsing (getopts)
- Data filtering and summarization
- Automation scripting


## Use Cases
- Debug application errors
- Analyze system logs
- Identify recurring issues
- Investigate production incidents


## Author

Yasmin Ara Islam
DevOps Bootcamp Project