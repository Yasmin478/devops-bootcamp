# Project 04: Server Health Monitor

## Overview

The **Server Health Monitor** is a Bash-based automation script that monitors key system metrics such as CPU usage, memory usage, disk usage, uptime, and top resource-consuming processes.

It is designed to simulate real-world DevOps monitoring tasks and can be automated using cron jobs for continuous system observation.

---

## Features

* Monitor CPU usage
* Monitor memory usage
* Monitor disk usage
* Track system uptime
* Display top 5 processes by:

  * Memory usage
  * CPU usage
* Structured and formatted output
* Logging with timestamps
* Automated execution using cron
* Safe scripting using:

  * `set -euo pipefail`

---

## Project Structure

```id="xw8b9p"
project-04-server-monitor/
│
├── monitor.sh
├── logs/
│   └── monitor.log
└── README.md
```

---

## How It Works

1. The script collects system metrics using Linux commands:

   * `top` for CPU usage
   * `free` for memory usage
   * `df` for disk usage
   * `uptime` for system uptime
   * `ps` for process monitoring

2. Outputs are:

   * Displayed in a structured format on the terminal
   * Logged into a file with timestamps

3. Top processes are sorted and displayed using:

   * `--sort=-%mem`
   * `--sort=-%cpu`

---

## Prerequisites

* Linux environment (Ubuntu recommended)
* Bash shell
* Basic system utilities (`top`, `ps`, `df`, `free`)

---

##  Usage

### 1. Make script executable

```bash id="j7k0wo"
chmod +x monitor.sh
```

### 2. Run manually

```bash id="h9ozak"
./monitor.sh
```

---

## Example Output

```id="n4u6y1"
===== SERVER HEALTH REPORT =====

CPU Usage     : 12.5%
Memory Usage  : 43.21%
Disk Usage    : 62%
Uptime        : up 2 hours, 10 minutes

Top 5 Processes (by Memory):
PID      USER       %CPU   %MEM   COMMAND
-------------------------------------------------------------
1234     root       2.3    5.1    nginx
...

================================
```

---

## Logging

Logs are stored in:

```id="v1l8gm"
logs/monitor.log
```

Each log entry includes:

* Timestamp
* System metrics
* Process details
* Execution status

---

## Automation with Cron

To run the script every 5 minutes:

```bash id="0f9xqz"
crontab -e
```

Add:

```bash id="b3p1zt"
*/5 * * * * /bin/bash /home/yasmin/devops-bootcamp/project-04-server-monitor/monitor.sh
```

---

## DevOps Concepts Used

* System monitoring
* Bash scripting automation
* Logging and observability
* Process management
* Cron job scheduling
* Structured output formatting

---

## Future Improvements

* Add alert system (CPU/Memory thresholds)
* Send notifications (email/Slack)
* Store logs in centralized logging system
* Integrate with monitoring tools (Prometheus, Grafana)
* Convert script into a systemd service

---

## Author

Yasmin Islam
DevOps Bootcamp Project
