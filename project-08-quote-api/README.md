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
  "status": "healthy"
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
docker run -p 5000:5000 quote-api
```

Access application:

```text
http://localhost:5000
```

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

---

## Future Improvements

* Add quote categories
* Add CI/CD pipeline using GitHub Actions
* Deploy container on AWS EC2
* Add API logging and monitoring
* Rate limiting
* Caching
* Kubernetes deployment

---

## Author

**Yasmin Ara Islam**

Production-style DevOps project demonstrating Flask APIs, Docker containerization, and web service deployment.
