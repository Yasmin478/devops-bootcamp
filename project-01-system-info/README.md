# Project 01: System Information & Monitoring Bash Script


## Overview

A lightweight Bash script that collects system information, performs basic health checks, and logs detailed diagnostics.

This project is part of my DevOps learning journey, focusing on system monitoring, alerting, and automation.

---

## Features

🔹 System Summary (Terminal Output)
- Hostname
- Operating System & Kernel Version
- CPU Architecture
- Current User
- Logged-in Users
- IP Address
- System Uptime
- CPU Load Average
- Memory Usage (%)
- Disk Usage (%)

---

🔹 Alert System

- Triggers warning if:
     -Disk usage > 80%
     -Memory usage > 70%
     
- Returns non-zero exit status for monitoring integration

---

🔹 Detailed Logging

- Saves system diagnostics to `system_info.log`
- Includes:
    - Full uptime details
    - Memory breakdown (`free -h`)
    - Disk usage (`df -h`)
    - Top processes snapshot (`top`)

---  

## Technologies Used

- Bash Scripting
- Linux CLI Tools: `hostname`, `uname`, `free`, `df`, `uptime`, `who`, `top`
- Text Processing: `awk`, `sed`

---

## How to Run

```
    git clone <your-repo-link>
    cd <repo-name>
    chmod +x script.sh
    ./script.sh
```

---

## Sample Output

------------------------------------------
System Summary - Tue Mar 26
------------------------------------------
Hostname: ubuntu
Operating System: GNU/Linux
Kernel Version: 5.x.x
CPU Architecture: x86_64
Current User: ubuntu
Logged-in Users: 1
IP Address: 192.168.x.x
Uptime: up 2 hours
CPU Load: 0.15, 0.10, 0.05
Memory Usage: 45%
Disk Usage (/): 60%
------------------------------------------

## Log File

Detailed logs are stored in:
    `system_info.log`


--- 

## Exit Codes

    `0` → System healthy
    `1` → Warning triggered (high memory/disk usage)


## Future Improvements

- Add email/Slack alerts
- Integrate with cron for scheduling
- Add CPU usage threshold alerts
- Convert into monitoring tool for servers

## Author

**Yasmin Ara Islam**

DevOps Bootcamp Project
