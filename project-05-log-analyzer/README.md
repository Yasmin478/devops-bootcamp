# Project 05: Log Analyzer

## Overview

The **Log Analyzer** is a Bash-based tool designed to analyze log files and extract meaningful insights.

It simulates real-world DevOps debugging scenarios by identifying errors, summarizing logs, and filtering data based on keywords and timestamps.

---

## Features

- Analyze log files
- Count total log entries
- Count INFO, WARN, ERROR logs
- Display recent error messages
- Identify top recurring errors
- Keyword-based filtering
- Date-based filtering
- Argument-based input handling

---

## Project Structure
project-05-log-analyzer/
├── log_analyzer.sh
├── sample.log
└── README.md


---

## How It Works

1. Accepts a log file as input
2. Optionally filters logs using:
   - Keyword
   - Date
3. Performs analysis:
   - Counts log levels
   - Extracts recent errors
   - Identifies most frequent issues

---

##  Usage

### Run with default log file:

```bash
./log_analyzer.sh

### Run with custom log file:

./log_analyzer.sh sample.log

### Filter by keyword:
./log_analyzer.sh sample.log ERROR

### Filter by keyword and date:
./log_analyzer.sh sample.log ERROR "2026-03-28"



## DevOps Concepts Used
- Log analysis and debugging
- Text processing (grep, awk, sort, uniq)
- Data filtering and summarization
- Argument handling in Bash
- Automation scripting


## Example Use Case
- Identify frequent application errors
- Debug failed API calls
- Monitor system/application logs
- Investigate production incidents



## Future Improvements
- Support for multiple log formats
- JSON log parsing
- Export summary reports
- Integration with monitoring tools


## Author

### Yasmin Ara Islam
DevOps Bootcamp Project


---
