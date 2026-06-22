# Docker Compose Learning Lab

## Overview

A hands-on Docker Compose learning environment used to understand multi-container applications, networking, environment variables, persistent storage, and service orchestration concepts.

This directory serves as a practical lab for experimenting with Docker Compose features and building production-style containerized applications.

---

## Concepts Learned

* Docker Compose fundamentals
* Multi-container applications
* Docker Compose services
* Environment variables and `.env` files
* Custom Docker networks
* Service discovery using container names
* Docker volumes and persistent storage
* Startup ordering using `depends_on`
* Container inspection and debugging
* Declarative infrastructure using YAML

---

## Project Structure

```text
docker-compose-lab/
│
├── compose-nginx/
│   └── compose.yml
│
├── compose-redis/
│   └── compose.yml
│
├── env-var/
│   ├── .env
│   └── compose.yml
│
├── volumes/
│   └── compose.yml
│
├── docker-compose-project/
│   ├── .env
│   ├── app.py
│   ├── compose.yml
│   ├── Dockerfile
│   ├── requirements.txt
│   └── README.md
│
└── README.md
```

---

## Labs Performed

### Compose Nginx

* Created and managed an Nginx container using Docker Compose
* Practiced container lifecycle commands
* Exposed services using port mappings

### Compose Redis

* Created and managed a Redis container
* Inspected containers and logs
* Explored Docker networking basics

### Environment Variables

* Created and used `.env` files
* Injected configuration into containers
* Verified environment variables inside containers

### Volumes

* Created Docker volumes
* Stored persistent Redis data
* Verified data persistence across container recreation

### Multi-Container Project

* Built a custom Flask application image
* Deployed Flask and Redis together
* Used custom networks and volumes
* Practiced multi-container orchestration using Docker Compose

---

## Commands Practiced

```bash
docker compose up -d
docker compose up -d --build
docker compose ps
docker compose logs
docker compose down
docker exec -it <container-name> sh
docker exec -it <container-name> redis-cli
docker network ls
docker network inspect <network-name>
docker volume ls
docker volume inspect <volume-name>
docker inspect <container-name>
```

---

## Key Learnings

* Containers are temporary and replaceable.
* Docker Compose allows applications to be defined declaratively using YAML.
* Environment variables separate configuration from application code.
* Volumes provide persistent storage independent of containers.
* Containers on the same network can communicate using service names.
* Multi-container applications can be managed as a single unit.

---

## DevOps Concepts Demonstrated

* Infrastructure as Code (IaC)
* Configuration management
* Service networking
* Persistent storage management
* Container orchestration fundamentals
* Declarative deployments
* Multi-service application architecture
* Observability and debugging practices
