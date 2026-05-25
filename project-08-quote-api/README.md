# Project 08: Quote API (Flask + Docker)

## Overview

> A lightweight REST API built with Flask and Docker, designed to serve random motivational quotes through HTTP endpoints.

This project introduces backend API development concepts such as routing, JSON responses, containerization, and service deployment using Docker.

---

## Features

* REST API built with Flask
* Random quote generation
* Health check endpoint
* JSON API responses
* Dockerized application
* Lightweight Python container image
* Runs as a persistent web service
* Accessible through browser and `curl`

---

## Tech Stack

* Python
* Flask
* Docker
* HTTP / REST APIs

---

## API Routes

### 🔹 Home Route

```text
GET /
```

Returns API information and available routes.

---

### 🔹 Random Quote

```text
GET /random
```

Returns a random motivational quote.

Example response:

```json
{
  "author": "Albert Einstein",
  "quote": "The person who never made a mistake never tried anything new."
}
```

---

### 🔹 Health Check

```text
GET /health
```

Returns application health status.

Example response:

```json
{
  "status": "healthy and running"
}
```

---

## Project Structure

```text
project-08-quote-api/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
├── README.md
└── venv/
```

> Note: `venv/` is ignored using `.gitignore`.

---

## Run Locally

### Activate virtual environment

```bash
source venv/bin/activate
```

### Run Flask application

```bash
python3 app.py
```

Application runs on:

```text
http://localhost:5000
```

---

## Run with Docker

### Build Docker image

```bash
docker build -t quote-api .
```

### Run container

```bash
docker run -d -p 5000:5000 --name quote-api yasmin478/quote-api:latest
```

Access application:

```text
http://localhost:5000
```

Test API:

``` curl http://localhost:5000/random
```

---

## Docker Hub

Docker image is published on Docker Hub for deployment and reuse.

Image:

```yasmin478/quote-api:latest
```

---

## CI/CD Pipeline

This project uses GitHub Actions for automated CI/CD.

### Workflow automation includes:

- Building Docker images automatically
- Logging into Docker Hub securely using GitHub Secrets
- Automatically pushing updated images to Docker Hub on every push to the main branch

### Pipeline Flow:

GitHub Push
↓
GitHub Actions
↓
Docker Build
↓
Docker Hub Push

---

## AWS EC2 Deployment

The application was deployed on an AWS EC2 Ubuntu instance using Docker.

Deployment process included:

- Launching EC2 instance
- Configuring Security Groups
- Installing Docker on EC2
- Pulling Docker image from Docker Hub
- Running the containerized application publicly

The API was tested using both browser requests and curl commands.

---

## Docker Concepts Used

* Dockerfile
* Base images
* Containerized web services
* Port mapping (`-p 5000:5000`)
* Image building
* Running containers
* `.dockerignore`

---

## External API

This project fetches live quotes from the ZenQuotes API:

https://zenquotes.io/api/random

---

## How It Works

1. Flask starts an HTTP server
2. API routes handle incoming requests
3. Flask sends a request to the external ZenQuotes API
4. Quote data is processed and returned as JSON
5. Docker container exposes application on port 5000

---

## Networking & Debugging Concepts Practiced

- localhost vs 0.0.0.0
- Docker port mapping
- Container networking
- EC2 security groups
- Public vs internal network access
- Debugging failed external connections
- Using curl for API testing
- Inspecting containers using docker ps and docker logs

---

## Key Learnings

* Building REST APIs using Flask
* Creating HTTP routes
* Returning JSON responses
* Dockerizing Python applications
* Container networking and port mapping
* Python virtual environments (`venv`)
* API integration using `requests`
* Debugging container networking 
* Handling external API failures/timeouts
* GitHub Actions CI/CD workflows
* Docker Hub automation
* AWS EC2 deployment
* Cloud networking basics
* Debugging deployment/networking issues

---

## Future Improvements

- Add quote categories
- Add structured logging
- Add monitoring and metrics
- Add reverse proxy using Nginx
- Add API authentication
- Kubernetes deployment
- Automated production deployment

---

## Author

**Yasmin Ara Islam**

Production-style DevOps project demonstrating Flask APIs, Docker containerization, and web service deployment.
