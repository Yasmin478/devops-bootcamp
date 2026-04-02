# DevOps Bootcamp

A structured, hands-on journey to becoming a **job-ready DevOps Engineer**, focused on building real-world automation, monitoring, and debugging tools using Linux and Bash.

This repository emphasizes **production-style scripting, observability, and system reliability practices** used in modern DevOps environments.

---

## Overview

This repository contains **project-based learning modules** designed to simulate real DevOps tasks such as:

- System monitoring
- Service management
- Automation scripting
- Logging and observability

Each project builds practical skills required in real production environments.

---

## Tech Stack

- Linux
- Bash Scripting
- Git & GitHub
- System Monitoring Tools
- Cron Jobs & Automation

---

## Repository Structure

```
project-01-system-info/
project-02-service-manager/
project-03-git-clone-manager/
project-04-server-monitor/
project-05-log-analyzer/
project-06-backup-automation
```
---

## 🔧 Key DevOps Concepts Demonstrated

- Automation using Bash scripting
- System monitoring and alerting
- Log analysis and debugging
- Service management with systemd
- Observability (logging, metrics)
- Idempotent scripting practices
- Cron-based job scheduling
- Error handling and script reliability

---

## Projects

---

### 🔹 Project 01: System Info Script

[View Project](./project-01-system-info)

A simple Bash script to display system information.

**Features:**

- OS details
- CPU and memory info
- Uptime tracking

**Skills:**

- Basic scripting
- Linux commands

---

### 🔹 Project 02: Service Manager

[View Project](./project-02-service-manager)

A CLI tool to manage system services using `systemctl`.

**Features:**

- Start / Stop / Restart / Status
- Argument parsing
- Case-insensitive input
- Logging with timestamps

**Skills:**

- Functions
- Exit codes
- Service management

---

### 🔹 Project 03: Git Clone Manager

[View Project](./project-03-git-clone-manager)

Automates cloning multiple repositories efficiently.

**Features:**

- Clone multiple repos
- Skip already cloned repos
- Logging system
- Counters (success/failure)
- Safe scripting (`set -euo pipefail`)

**Skills:**

- Arrays and loops
- Idempotency
- Automation design

---

### ⭐ Project 04: Server Health Monitor (Featured)

[View Project](./project-04-server-monitor)

A production-style monitoring script that tracks system health.

**Features:**

- CPU, Memory, Disk monitoring
- System uptime
- Top processes tracking
- Structured logging
- Cron automation
- Alert system (threshold-based)
- Log rotation
- Enhanced output formatting

**Skills:**

- System monitoring tools (`ps`, `top`, `df`, `free`)
- Logging strategies
- Observability basics

---

### ⭐ Project 05: Log Analyzer (Featured)

[View Project](./project-05-log-analyzer)

A practical log analysis tool built using Bash to simulate real-world debugging and troubleshooting workflows.

**Features:**

- Analyze log files for insights
- Count INFO, WARN, and ERROR entries
- Display recent error logs
- Identify top recurring error messages
- Keyword-based filtering
- Date-based log filtering

**Skills:**

- Log parsing using `grep`, `awk`, `sort`, `uniq`
- Data extraction and summarization
- Debugging real-world issues
- Script flexibility with arguments

---

## ⭐ Project 06: Backup Automation (In Progress)

A production-style backup system built using Bash.

**Current Features:**
- Directory backup
- Compression (tar.gz)
- Timestamp-based naming

**Upcoming:**
- Logging system
- Retention policy
- Automation using cron

---

## Current Progress

-  5 Projects Completed
-  Building real-world debugging and log analysis skills
-  Enhancing scripts to production-level quality
-  Preparing for CI/CD and containerization

---

## Learning Approach

- Hands-on project building
- Real-world problem solving
- Writing clean, maintainable scripts
- Focus on production-style practices

---

## Roadmap

- **March–April:** Linux, Bash, Automation  
- **May:** Git + CI/CD  
- **June:** Docker  
- **July:** Kubernetes + AWS  
- **August:** Final prep + interviews  

---

## Future Projects

- Backup Automation
- CI/CD Pipeline
- Dockerized Applications

---

## Currently Working On

- CI/CD pipeline implementation (GitHub Actions)
- Containerization using Docker
- Enhancing existing scripts with production-grade features

---

## Note

This repository is actively being improved to reflect **real DevOps practices** and production-level scripting standards.

---

## Author

**Yasmin Ara Islam**  

DevOps Learner | Aspiring DevOps & Cloud Engineer