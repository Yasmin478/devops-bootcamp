# DevOps Bootcamp

![Linux](https://img.shields.io/badge/Linux-Ubuntu-E95420?logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?logo=gnubash&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?logo=kubernetes&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=github-actions&logoColor=white)
![AWS](https://img.shields.io/badge/AWS_EC2-FF9900?logo=amazonaws&logoColor=white)

> Building production-ready DevOps skills through hands-on projects, debugging, and continuous learning.

> A structured, hands-on portfolio documenting my journey toward becoming a **Junior DevOps & Cloud Engineer** through real-world projects focused on Linux, automation, containers, cloud infrastructure, CI/CD, and Kubernetes.

---

## Table of Contents

- [Professional Objective](#professional-objective)
- [Highlights](#highlights)
- [Repository Statistics](#repository-statistics)
- [Technology Stack](#technology-stack)
- [Repository Structure](#repository-structure)
- [DevOps Skills Demonstrated](#devops-skills-demonstrated)
- [CI/CD Workflow](#cicd-workflow)
- [Kubernetes Learning Lab](#-kubernetes-learning-lab)
- [Troubleshooting Experience](#troubleshooting-experience)
- [Learning Philosophy](#learning-philosophy)
- [Projects](#projects)
- [Current Progress](#current-progress)
- [Author](#author)

---

## Professional Objective

This repository showcases my hands-on DevOps learning journey through progressively challenging projects that emphasize **building, debugging, and understanding production-style systems**.

Rather than collecting isolated code snippets, each project focuses on solving practical operational problems while strengthening core DevOps skills such as automation, observability, containerization, cloud deployment, Kubernetes orchestration, and troubleshooting.

The objective of this repository is to demonstrate practical experience with modern DevOps tools and workflows while preparing for a Junior DevOps / Cloud Engineer role.

---

## Highlights

- 9 hands-on DevOps, backend, and Kubernetes projects
- Production-style Bash automation and Linux administration
- Docker containerization and Docker Hub image publishing
- CI/CD automation using GitHub Actions
- AWS EC2 deployment experience
- Practical Kubernetes orchestration, networking, storage, and traffic routing
- Extensive troubleshooting through intentionally broken environments
- Strong emphasis on production-oriented workflows and operational thinking

---

## Repository Statistics

|          Metric           |      Details       |
|---------------------------|--------------------|
| Projects Completed        |         9          |
| Linux Automation Projects |         6          |
| Backend Applications      |         2          |
| Kubernetes Learning Lab   |         1          |
| Technologies Used         |        15+         |
| CI/CD Workflows           |         3          |
| Cloud Platform            |      AWS EC2       |
| Container Technologies    | Docker, Kubernetes |

---

## Technology Stack

### Operating Systems

- Linux (Ubuntu)

### Scripting & Programming

- Bash
- Python

### Backend Development

- Flask
- REST APIs

### Version Control

- Git
- GitHub

### Containers

- Docker
- Docker Compose
- Docker Hub

### CI/CD

- GitHub Actions

### Cloud

- AWS EC2

### Container Orchestration

- Kubernetes
- kubectl

### Configuration

- YAML

### Command Line Tools

- curl
- jq
- systemctl
- cron

### Web Server

- Nginx

---

## Repository Structure

```text
devops-bootcamp/
│
├── project-01-system-info/
├── project-02-service-manager/
├── project-03-git-clone-manager/
├── project-04-server-monitor/
├── project-05-log-analyzer/
├── project-06-backup-automation/
├── project-07-weather-cli-tool/
├── project-08-quote-api/
└── kubernetes/
```

---

## DevOps Skills Demonstrated

### Linux Administration

- File systems
- Users and Groups
- File permissions
- Process management
- Networking basics
- SSH
- Package management
- Service management using systemd

---

### Automation

- Bash scripting
- Functions
- Arrays
- Loops
- Conditional logic
- Argument parsing
- Error handling
- Logging
- Idempotent scripting
- Cron job automation

---

### Observability & Troubleshooting

- Log analysis
- System monitoring
- CPU, memory and disk monitoring
- Process inspection
- Application debugging
- Infrastructure troubleshooting
- Root cause analysis

---

### Containers

- Docker images
- Docker containers
- Dockerfiles
- Docker Compose
- Docker networking
- Container lifecycle
- Docker Hub image publishing

---

### CI/CD

Implemented GitHub Actions workflows for:

- Docker image building
- Docker Hub authentication
- Docker image publishing
- Kubernetes YAML validation
- Manifest linting

---

### Cloud

Hands-on experience with:

- AWS EC2
- Remote application deployment
- Security Groups
- Docker deployment on cloud servers
- Remote troubleshooting

---

## Kubernetes Skills

Hands-on experience with:

### Workloads

- Pods
- Deployments
- ReplicaSets
- Scaling
- Self-Healing

### Networking

- Labels and Selectors
- ClusterIP Services
- NodePort Services
- EndpointSlices
- Ingress
- Host-based Routing
- Path-based Routing

### Configuration Management

- ConfigMaps
- Secrets

### Resource Management

- Namespaces
- Resource Requests
- Resource Limits
- QoS Classes

### Health Checks

- Exec Liveness Probes
- HTTP Liveness Probes
- Readiness Probes

### Storage

- emptyDir
- hostPath
- Persistent Volumes (PV)
- Persistent Volume Claims (PVC)
- Static Provisioning
- Dynamic Provisioning
- StorageClasses

---

## CI/CD Workflow

```text
GitHub
   │
   ▼
GitHub Actions
   │
   ▼
Docker Build
   │
   ▼
Docker Hub
   │
   ▼
AWS EC2 Deployment
```

---

## Troubleshooting Experience

Throughout these projects, I intentionally reproduced and debugged common DevOps and Kubernetes issues, including:

- ErrImagePull
- ImagePullBackOff
- CrashLoopBackOff
- Failed Liveness Probes
- Failed Readiness Probes
- YAML syntax and indentation errors
- GitHub Actions workflow failures
- Docker build failures
- Container networking issues
- Incorrect Service selectors
- StorageClass mismatch
- Pending PersistentVolumeClaims
- Incorrect Ingress backend configuration
- Host-based routing issues
- Path-based routing issues
- Application-generated HTTP 404 errors

---

## Learning Philosophy

Every topic in this repository is learned through a consistent hands-on workflow:

1. Understand the problem
2. Learn the underlying concept
3. Build a working solution
4. Observe Kubernetes or system behavior
5. Intentionally break the configuration
6. Debug the issue
7. Understand the production use case
8. Document the learning

This approach emphasizes practical experience, operational thinking, and problem-solving over memorizing commands.

---

## Projects

## 🔹 Project 01: System Information Script

[View Project](./project-01-system-info)

A Bash utility that gathers and displays essential Linux system information from the command line.

### Features

- Display operating system information
- CPU and memory details
- Disk usage
- System uptime
- Host information

### Skills Demonstrated

- Bash scripting
- Linux system commands
- Command substitution
- Variables
- Formatted terminal output

---

## 🔹 Project 02: Service Manager

[View Project](./project-02-service-manager)

A command-line utility for managing Linux services using `systemctl`, providing a simple interface for common administrative tasks.

### Features

- Start services
- Stop services
- Restart services
- Check service status
- Timestamped logging
- Case-insensitive input handling

### Skills Demonstrated

- Bash functions
- Conditional statements
- Argument parsing
- Exit codes
- Linux service management
- Logging practices

---

## 🔹 Project 03: Git Clone Manager

[View Project](./project-03-git-clone-manager)

A Bash automation tool that efficiently clones multiple Git repositories while avoiding duplicate downloads.

### Features

- Clone multiple repositories
- Skip repositories that already exist
- Logging system
- Success and failure counters
- Safe execution using `set -euo pipefail`

### Skills Demonstrated

- Arrays
- Loops
- Functions
- Defensive scripting
- Idempotent automation
- Git automation

---

## ⭐ Project 04: Server Health Monitor

[View Project](./project-04-server-monitor)

A production-style Linux monitoring solution that continuously reports system health and provides structured operational logs.

### Features

- CPU utilization monitoring
- Memory utilization monitoring
- Disk usage monitoring
- System uptime reporting
- Running process inspection
- Threshold-based alerts
- Timestamped logging
- Log rotation support
- Cron job automation

### Skills Demonstrated

- Linux monitoring tools (`top`, `ps`, `df`, `free`)
- Observability fundamentals
- Automation
- Logging strategies
- Production-oriented scripting
- Preventive monitoring

---

## ⭐ Project 05: Log Analyzer

[View Project](./project-05-log-analyzer)

A production-oriented log analysis tool built with Bash to simulate real-world troubleshooting and operational workflows.

### Features

- Analyze application and system log files
- Count INFO, WARN, and ERROR messages
- Display recent error logs
- Identify frequently occurring errors
- Keyword-based filtering
- Date-based log filtering

### Skills Demonstrated

- Log parsing using `grep`, `awk`, `sort`, and `uniq`
- Data extraction and summarization
- Linux troubleshooting
- Production log analysis
- Script flexibility using command-line arguments

---

## ⭐ Project 06: Backup Automation System

[View Project](./project-06-backup-automation)

A production-style backup solution that automates compressed backups, logging, retention management, and scheduled execution.

### Features

- Directory backup using compressed archives
- Timestamp-based backup naming
- Configurable backup locations
- Logging with INFO and ERROR levels
- Backup retention policy
- Input validation
- Cron-based scheduling

### Skills Demonstrated

- File system automation
- Backup strategies
- Logging and observability
- Safe Bash scripting
- Configuration-driven design
- Cron automation

---

## ⭐ Project 07: Weather CLI Tool

[View Project](./project-07-weather-cli-tool)

A Dockerized Bash application that retrieves real-time weather information from an external API and demonstrates a complete CI/CD workflow.

### Features

- Retrieve weather for any city
- Current location detection
- Temperature-only mode
- JSON parsing using `jq`
- Spinner-based loading indicator
- HTTP status validation
- Retry mechanism
- Docker containerization
- GitHub Actions CI/CD
- Docker Hub publishing
- AWS EC2 deployment

### Skills Demonstrated

- Docker
- GitHub Actions
- Docker Hub
- AWS EC2
- REST API integration
- Shell scripting
- Networking
- Deployment debugging

### Deployment Workflow

```text
GitHub
   │
   ▼
GitHub Actions
   │
   ▼
Docker Build
   │
   ▼
Docker Hub
   │
   ▼
AWS EC2
```

---

## ⭐ Project 08: Quote API

[View Project](./project-08-quote-api)

A lightweight REST API built with Flask, containerized with Docker, automatically deployed using GitHub Actions, and hosted on AWS EC2.

### Features

- Flask REST API
- Random quote endpoint
- Health endpoint
- JSON responses
- Docker containerization
- GitHub Actions CI/CD
- Docker Hub publishing
- AWS deployment

### Skills Demonstrated

- Python
- Flask
- Docker
- REST APIs
- GitHub Actions
- AWS EC2
- Networking
- Deployment troubleshooting

---

## Kubernetes Learning Lab

[View Project](./kubernetes)

A comprehensive hands-on Kubernetes learning environment built around real-world experimentation, debugging, and production-style deployments.

Instead of only deploying applications, this lab focuses on understanding **how Kubernetes behaves internally**, observing resource relationships, intentionally creating failures, and debugging them using Kubernetes tools.

### Kubernetes Concepts Covered

#### Core Workloads

- Pods
- Deployments
- ReplicaSets
- Scaling
- Rolling Updates
- Self-Healing

#### Networking

- Labels & Selectors
- ClusterIP Services
- NodePort Services
- EndpointSlices
- Internal Service Discovery
- Ingress
- Host-based Routing
- Path-based Routing

#### Configuration

- ConfigMaps
- Secrets
- Environment Variables

#### Namespaces

- Namespace isolation
- Namespace-scoped resources
- Cluster-scoped resources

#### Resource Management

- Resource Requests
- Resource Limits
- Quality of Service (QoS)

#### Health Checks

- Exec Liveness Probes
- HTTP Liveness Probes
- Readiness Probes

#### Storage

- emptyDir
- hostPath
- Persistent Volumes (PV)
- Persistent Volume Claims (PVC)
- Static Provisioning
- Dynamic Provisioning
- StorageClasses

### Kubernetes Tools Used

- kubectl
- YAML
- k3s
- Docker Hub
- Traefik Ingress Controller

### Practical Experience

Built and debugged:

- Pod lifecycle
- Deployment updates
- Service networking
- Endpoint discovery
- Configuration management
- Secret management
- Storage provisioning
- Dynamic volume creation
- Ingress traffic routing

### Troubleshooting Performed

- ErrImagePull
- ImagePullBackOff
- CrashLoopBackOff
- Failed probes
- Pending PVCs
- StorageClass mismatch
- Incorrect Service selectors
- Ingress backend configuration errors
- Host-based routing issues
- Path-based routing issues

### Kubernetes Architecture Practiced

```text
Internet / Browser
        │
        ▼
     Ingress
        │
 ┌──────┴──────┐
 │             │
 ▼             ▼
Nginx      Flask API
 │             │
 ▼             ▼
ClusterIP Services
 │             │
 └──────┬──────┘
        ▼
     Kubernetes Pods
```

---

## Current Progress

### Completed

- Linux Administration
- Bash Scripting
- Git & GitHub
- Docker
- GitHub Actions
- AWS EC2
- Kubernetes Fundamentals (through Ingress)

### Currently Learning

- Helm
- Prometheus
- Grafana

### Next Goals

- Deploy production-ready applications using Helm
- Monitor Kubernetes clusters with Prometheus
- Build dashboards with Grafana
- Strengthen CI/CD and cloud-native skills
- Begin applying for Junior DevOps and Cloud Engineer roles

---

## Author

**Yasmin Ara Islam**

Aspiring **DevOps & Cloud Engineer**

Focused on Linux, Docker, Kubernetes, AWS, CI/CD, automation, troubleshooting, and cloud-native technologies.

Building production-oriented projects while continuously expanding cloud-native and platform engineering skills.