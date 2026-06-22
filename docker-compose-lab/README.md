# Docker Compose Project

## Overview

A hands-on multi-container application built using Docker Compose to understand how multiple services work together using containers, networks, environment variables, and persistent storage.

This project demonstrates production-style container orchestration concepts commonly used in real-world DevOps environments.

---

## Architecture

```text
Browser
    ↓
Flask Application Container
    ↓
Docker Network
    ↓
Redis Container
    ↓
Docker Volume
```

---

## Concepts Learned

* Multi-container applications with Docker Compose
* Building custom images using Dockerfiles
* Docker Compose services
* Environment variables and `.env` files
* Custom Docker networks
* Service discovery using container names
* Docker volumes and persistent storage
* Startup ordering using `depends_on`
* Container logs and debugging
* Container inspection and networking fundamentals

---

## Project Structure

```text
docker-compose-project/
│
├── .env
├── app.py
├── compose.yml
├── Dockerfile
├── requirements.txt
└── README.md
```

---

## Technologies Used

* Docker
* Docker Compose
* Python
* Flask
* Redis
* Linux

---

## Configuration

### `.env`

```env
APP_ENV=development
APP_NAME=docker-compose-final
HOST_PORT=8080
```

The `.env` file externalizes configuration values so the application can be configured without modifying source code.

---

## Docker Compose Configuration

The project consists of two services:

### Application Service

* Built from a custom Dockerfile
* Exposes Flask on port 5000
* Receives configuration through environment variables
* Connected to the backend network

### Redis Service

* Uses the official Redis image
* Stores data using Docker volumes
* Connected to the backend network
* Starts before the application container

---

## Commands Practiced

Build and start containers:

```bash
docker compose up -d --build
```

View running services:

```bash
docker compose ps
```

View logs:

```bash
docker compose logs
docker compose logs app
docker compose logs redis
```

Stop and remove containers:

```bash
docker compose down
```

Inspect networks:

```bash
docker network ls
docker network inspect <network-name>
```

Inspect volumes:

```bash
docker volume ls
docker volume inspect <volume-name>
```

Execute commands inside containers:

```bash
docker exec -it <container-name> sh
docker exec -it <container-name> redis-cli
```

Inspect containers:

```bash
docker inspect <container-name>
```

---

## Experiments Performed

### Environment Variables

* Created a `.env` file
* Injected configuration into containers
* Verified variables using `printenv`

### Docker Networking

* Created a custom backend network
* Verified container connectivity
* Inspected networks and attached containers

### Persistent Storage

* Created a Docker volume for Redis
* Stored data inside Redis
* Removed containers and verified that data persisted

### Multi-Container Deployment

* Built and deployed multiple containers together
* Observed service startup ordering using `depends_on`
* Managed containers using Docker Compose commands

---

## Key Learnings

* Containers are temporary and replaceable.
* Volumes provide persistent storage independent of containers.
* Environment variables separate configuration from application code.
* Docker Compose simplifies management of multi-container applications.
* Containers on the same Docker network can communicate using service names.
* Custom networks improve service isolation and organization.
* Multi-container applications can be managed declaratively using a single YAML file.

---

## DevOps Concepts Demonstrated

* Infrastructure as Code (IaC)
* Configuration management
* Service networking
* Persistent storage management
* Container orchestration fundamentals
* Declarative application deployment
* Multi-service application architecture
* Observability and debugging practices

---