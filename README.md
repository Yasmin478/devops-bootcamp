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

## Highlights

- 9 hands-on DevOps, backend, and Kubernetes projects completed
- Production-style Bash scripting and backend API deployment
- Docker containerization and Docker Hub workflows
- GitHub Actions CI/CD automation and Kubernetes manifest validation
- AWS EC2 deployment experience
- Practical Kubernetes orchestration, scaling, and service networking experience
- Strong focus on observability, networking, debugging, and automation

---

## Tech Stack

- Linux
- Bash Scripting
- Python
- Flask
- Git & GitHub
- Docker
- Kubernetes
- YAML
- kubectl
- GitHub Actions
- Docker Hub
- AWS EC2
- REST APIs
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
project-06-backup-automation/
project-07-weather-cli-tool/
project-08-quote-api/
kubernetes/
```
---

## Key DevOps Concepts Demonstrated

- Automation using Bash scripting
- System monitoring and alerting
- Log analysis and debugging
- Service management with systemd
- Observability (logging, metrics)
- Idempotent scripting practices
- Cron-based job scheduling
- Error handling and script reliability
- Docker containerization
- CI/CD automation using GitHub Actions
- Cloud deployment using AWS EC2
- Container networking and debugging
- Infrastructure troubleshooting
- Kubernetes Pods and Deployments
- ReplicaSets and desired state reconciliation
- Self-healing and scaling applications
- Service discovery using Labels and Selectors
- ClusterIP and NodePort networking
- Kubernetes YAML validation using GitHub Actions

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

### ⭐ Project 06: Backup Automation System (Production-Style) (Advanced)

[View Project](./project-06-backup-automation)

A production-ready backup automation system that simulates real-world DevOps workflows with logging, retention, and scheduling.

**Features:**

- Directory backup with tar.gz compression
- Timestamp-based file naming (prevents overwrite)
- Logging system with levels (`INFO`, `ERROR`)
- Retention policy (automatically retains latest backups and deletes older ones)
- Input validation for safe backup operations
- Config file support (`config.conf`)
- Portable script using `SCRIPT_DIR`
- Cron-based scheduling for automation


**Skills:**

- File system automation
- Observability (logging)
- Safe scripting (`set -euo pipefail`)
- Retention strategies
- Idempotent backup handling
- Config-driven design
- Cron job scheduling

---

## ⭐ Project 07: Weather CLI Tool (Dockerized + CI/CD + AWS Deployment)

[View Project](./project-07-weather-cli-tool)

A production-style Bash CLI application that fetches real-time weather data using an external API.

This project demonstrates real-world DevOps practices including:

- Docker containerization
- GitHub Actions CI/CD automation
- Docker Hub image publishing
- AWS EC2 deployment
- API integration and reliability handling

### Features

- Fetch weather for any location
- Temperature-only mode (`--temp`)
- Case-insensitive argument handling
- Built-in help menu (`--help`)
- Automatic detection of current location
- Clean CLI output with colors
- Spinner-based loading indicator
- JSON parsing using `jq`
- HTTP status validation
- Retry mechanism for temporary API failures
- Robust error handling

### Technologies Used

- Bash
- Docker
- GitHub Actions
- Docker Hub
- AWS EC2
- Linux
- `curl`
- `jq`

### DevOps Workflow

```text
GitHub
   ↓
GitHub Actions CI Pipeline
   ↓
Docker Image Build
   ↓
Push to Docker Hub
   ↓
Deploy on AWS EC2
```

---

## ⭐ Project 08: Quote API (Flask + Docker + CI/CD + AWS Deployment)

[View Project](./project-08-quote-api)

A lightweight REST API built with Flask and Docker that serves random motivational quotes through HTTP endpoints.

This project focuses on backend API development, Dockerized deployments, CI/CD automation, cloud deployment, networking, and debugging workflows.

### Features

- REST API built with Flask
- Random quote endpoint
- Health check endpoint
- JSON API responses
- External API integration
- Dockerized backend service
- GitHub Actions CI/CD pipeline
- Docker Hub image publishing
- AWS EC2 deployment
- Networking and deployment debugging

### Technologies Used

- Python
- Flask
- Docker
- GitHub Actions
- Docker Hub
- AWS EC2
- REST APIs
- Linux
- curl

### DevOps Workflow

```text
GitHub
   ↓
GitHub Actions CI Pipeline
   ↓
Docker Image Build
   ↓
Push to Docker Hub
   ↓
Deploy on AWS EC2
```

---

---

## ⭐ Kubernetes Learning Lab (Pods, Deployments & Services)

[View Project](./kubernetes)

A hands-on Kubernetes lab focused on understanding container orchestration, self-healing systems, scaling, and Kubernetes networking.

### Features

- Create and manage Pods
- Create Deployments and ReplicaSets
- Practice desired state reconciliation
- Observe self-healing by deleting Pods
- Scale applications dynamically
- Create ClusterIP and NodePort Services
- Explore Labels and Selectors
- Inspect Endpoints and EndpointSlices
- Troubleshoot image pull failures
- Validate Kubernetes manifests using GitHub Actions

### Technologies Used

- Kubernetes
- kubectl
- YAML
- GitHub Actions
- Linux

### Concepts Practiced

Deployment
↓
ReplicaSet
↓
Pods
↓
Services
↓
Endpoints
↓
EndpointSlices

---

## Current Progress

## Current Progress

- 9 hands-on DevOps and Kubernetes projects completed
- Built production-style Bash automation and monitoring tools
- Built and deployed Flask backend APIs
- Dockerized applications using Docker containers and Dockerfiles
- Implemented CI/CD pipelines using GitHub Actions
- Automated Docker image publishing to Docker Hub
- Deployed containerized applications on AWS EC2
- Practiced Docker networking and deployment debugging
- Practiced Kubernetes Pods, Deployments, ReplicaSets, and Services
- Implemented application scaling and self-healing workflows
- Practiced Kubernetes networking using ClusterIP and NodePort Services
- Built GitHub Actions workflows for Kubernetes manifest linting and validation
- Strengthening Linux, networking, debugging, and container orchestration skills
- Building operational confidence with real-world deployment workflows


---

## Learning Approach

- Hands-on project building
- Real-world problem solving
- Writing clean, maintainable scripts
- Focus on production-style practices

---

## Future Projects

- ConfigMaps and Secrets
- Multi-container Pods
- Kubernetes Ingress and Reverse Proxy
- Deploying Quote API on Kubernetes
- Helm basics
- Monitoring and observability with Prometheus and Grafana
- End-to-end Kubernetes deployment pipelines

---

## Currently Working On

- Deepening Kubernetes fundamentals
- Practicing Kubernetes networking and service discovery
- Learning ConfigMaps, Secrets, and application deployments
- Building operational confidence with container orchestration workflows

---

## Note

This repository is actively being improved to reflect **real DevOps practices** and production-level scripting standards.

---

## Author

**Yasmin Ara Islam**  

DevOps Learner | Aspiring DevOps & Cloud Engineer