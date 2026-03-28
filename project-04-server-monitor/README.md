# 🖥️ Project 04: Server Health Monitor

## Overview

The **Server Health Monitor** is a production-style Bash automation script designed to monitor system health metrics such as CPU, memory, disk usage, uptime, and active processes.

It simulates real-world DevOps monitoring workflows by incorporating logging, alerting, configuration management, and log rotation.

---

## Features

- Monitor CPU, memory, and disk usage
- Track system uptime
- Display top processes by CPU usage
- External configuration using `config.conf`
- Threshold-based alerting (CPU, Memory, Disk)
- Structured logging with levels (INFO, WARN, ERROR)
- Log rotation to prevent log overflow
- Modular Bash functions
- CLI flag support (`--no-output` for silent mode)
- Graceful handling of script interruption (SIGINT, SIGTERM)
- Automation using cron jobs
- Safe scripting using `set -euo pipefail`

---

## Project Structure
project-04-server-monitor/
│
├── monitor.sh
├── config.conf
├── logs/
│ └── system.log
├── screenshots/
│ ├── Normal.png
│ ├── Alert.png
│ └── Sigint.png
└── README.md


---

## Configuration

All thresholds and log settings are defined in:

config.conf

Example:

```bash
CPU_THRESHOLD=80
MEM_THRESHOLD=75
DISK_THRESHOLD=90

MAX_LOG_SIZE=1000000
MAX_LOG_FILES=5

## How It Works

1. The script loads configuration from config.conf

2. Collects system metrics using:
      - top → CPU usage
      - free → memory usage
      - df → disk usage
      - uptime → system uptime
      - ps → process monitoring

3. Outputs:
- Clean formatted report in terminal
- Structured logs with timestamps

4. Performs:
- Log rotation when file exceeds size limit
- Alerting when thresholds are crossed

5. Handles interruptions using signal traps


## Usage
1. Make script executable
chmod +x monitor.sh
2. Run normally
./monitor.sh
3. Run in silent mode (for cron)
./monitor.sh --no-output


## Sample Output
- Normal Execution
- Alert Trigger
- Interrupted Execution (SIGINT)

## Logging

Logs are stored in:
   logs/system.log

Each log entry includes:

- Timestamp
- Log level (INFO, WARN, ERROR)
- System metrics
- Alerts (if triggered)


## Log Rotation
- Automatically rotates logs when size exceeds limit
- Maintains a fixed number of log files
- Prevents uncontrolled log growth


## Automation with Cron

Run every 5 minutes:
   crontab -e
Add:

   */5 * * * * /bin/bash /home/yasmin/devops-bootcamp/project-04-server-monitor/monitor.sh --no-output


## DevOps Concepts Used
- System monitoring
- Bash automation
- Logging and observability
- Alerting systems
- Config-driven scripting
- Process management
- Cron scheduling
- Error handling (set -euo pipefail)
- Signal handling (SIGINT, SIGTERM)


## Debugging & Fixes
- Fixed unbound variable issues (set -u)
- Corrected log rotation variable handling
- Resolved duplicate process header issue
- Improved cross-platform compatibility for stat
- Enhanced output formatting

## Future Improvements
- Email/Slack alert integration
- Centralized logging (ELK stack)
- Systemd service integration
- Historical metrics tracking
- Dashboard visualization (Grafana)


## Author

Yasmin Ara Islam
DevOps Bootcamp Project 🚀