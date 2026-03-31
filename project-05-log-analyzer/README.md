# Project 05: Log Analyzer

## Overview

The **Log Analyzer** is a Bash-based CLI tool designed to analyze log files and extract useful insights for debugging and monitoring.

It simulates real-world DevOps workflows by filtering logs, identifying errors, and summarizing issues.

---

## Features

- Analyze log files with flexible filtering
- Count INFO, WARN, ERROR entries
- Display recent error logs
- Identify top recurring error messages
- Keyword-based filtering
- Date-based filtering
- CLI support using flags (`-f`, `-k`, `-d`, `-h`)
- Uses temporary files (mktemp) for safe filtering
- Handles empty results gracefully
- Cleans up temporary files automatically
- Clean and structured output

---

## Project Structure

project-05-log-analyzer/
│
├── log_analyzer.sh
├── sample.log
├── screenshots/
│   ├── normal.png
│   ├── filter.png
│   └── help.png
└── README.md

---

##  Usage

- Default run
```bash
./log_analyzer.sh 
```

- Custom file
```
./log_analyzer.sh -f sample.log
```

- Filter by keyword
```
./log_analyzer.sh -k ERROR
```

- Filter by keyword + date
```
./log_analyzer.sh -k ERROR -d "2026-03-28"
```

- Help
```
./log_analyzer.sh -h
```

---

## Sample Output

- Normal Run

- Filtered Run

- Help Menu

---

## Error Handling

- Uses strict Bash mode (`set -euo pipefail`)
- Handles missing files gracefully
- Prevents script failure on empty grep results using `|| true`
- Ensures safe execution in automated environments

---

## Temporary File Handling

- Uses `mktemp` to create secure temporary files for filtering
- Avoids overwriting original logs
- Automatically cleans up temporary files after execution

---

## DevOps Concepts Used
- Log analysis & debugging
- Text processing (grep, awk, sort, uniq)
- CLI argument parsing (getopts)
- Data filtering and summarization
- Automation scripting

---

## Use Cases
- Debug application errors
- Analyze system logs
- Identify recurring issues
- Investigate production incidents

---

## Why This Project Matters

This project simulates real-world log analysis performed by DevOps and SRE engineers.

It demonstrates:
- Debugging production issues using logs
- Extracting actionable insights from raw data
- Building CLI tools for automation
- Handling large log files efficiently

---

## Author

**Yasmin Ara Islam**

DevOps Bootcamp Project