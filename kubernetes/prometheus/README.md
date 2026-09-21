# Prometheus Monitoring & Observability

A hands-on Kubernetes observability project focused on **Prometheus, PromQL, metrics analysis, and production-style troubleshooting**.

The goal was to go beyond deploying Prometheus and learn how to use metrics as evidence when investigating system behavior — including scrape health, CPU usage, HTTP traffic, errors, latency, and Kubernetes workload health.

> **Core principle:** Use multiple signals as evidence instead of relying on a single metric.

---

## Project Overview

In this lab, I deployed the **kube-prometheus-stack** to a local **k3s Kubernetes cluster** using Helm and investigated Kubernetes and Prometheus metrics using PromQL.

The project focused on questions such as:

* Is Prometheus successfully scraping its targets?
* Is an application actually healthy, or is only its metrics endpoint healthy?
* How much CPU is a workload consuming?
* Is HTTP traffic increasing?
* Which endpoints are returning errors?
* Is latency increasing?
* Which handler is contributing most to the latency?
* How can multiple signals be correlated during an incident?

The emphasis was on **investigating system behavior from observable evidence**, rather than assuming a root cause from a single metric.

---

## Environment

| Component           | Details                         |
| ------------------- | ------------------------------- |
| Kubernetes          | k3s `v1.35.5+k3s1`              |
| Deployment          | Helm                            |
| Prometheus Stack    | `kube-prometheus-stack`         |
| Helm Repository     | `prometheus-community`          |
| Prometheus Operator | Enabled through the stack       |
| kube-state-metrics  | Kubernetes object/state metrics |
| Node Exporter       | Node-level metrics              |
| kubelet / cAdvisor  | Container and node metrics      |
| Grafana             | Disabled for this phase         |

Grafana was intentionally kept separate so this phase could focus on understanding **Prometheus and PromQL fundamentals** before moving to visualization.

---

## Architecture

```text
                    Kubernetes Cluster
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
      Workloads      kube-state-metrics  Node Exporter
          │
          │
          ▼
     kubelet / cAdvisor
          │
          │
          └───────────────┐
                          ▼
                     Prometheus
                          │
                   ┌──────┴──────┐
                   │             │
                  TSDB         PromQL
                                  │
                                  ▼
                           Investigation
                           & Troubleshooting
```

Prometheus uses a **pull-based monitoring model**, periodically scraping HTTP endpoints that expose metrics, commonly `/metrics`.

The stack also provides Kubernetes-focused metrics through components such as **kube-state-metrics**, **Node Exporter**, and **kubelet/cAdvisor**.

---

## Repository Structure

```text
kubernetes/
└── prometheus/
    ├── README.md
    └── values.yaml
```

### Configuration File

**`values.yaml`**

Custom Helm values used for the Prometheus deployment.

Grafana is explicitly disabled in this phase.

---

# PromQL Investigation

## Scrape Health

Prometheus exposes the `up` metric to indicate whether a target was successfully scraped.

```promql
up
```

```text
up == 1  → scrape succeeded
up == 0  → scrape failed
```

However:

> `up == 1` does **not** mean that the application itself is healthy.

For example, Prometheus may successfully scrape an application's metrics endpoint while another application endpoint is returning HTTP 503 responses.

This means **scrape health must be correlated with application and workload health**.

---

## Labels and Time Series

Prometheus identifies individual time series using their metric name and label set.

Example:

```promql
up{job="prometheus"}
```

Regular-expression matching can also be used:

```promql
up{job=~"prometheus|kubernetes"}
```

Labels allow metrics to be filtered, grouped, and investigated across different dimensions such as:

* pod
* namespace
* handler
* HTTP status code
* job
* instance

---

## Aggregation

Common PromQL aggregation operators used in the lab include:

```text
sum()
avg()
count()
max()
min()
topk()
bottomk()
```

Example:

```promql
sum by (code) (
  rate(prometheus_http_requests_total[5m])
)
```

This calculates HTTP request rate grouped by response code.

---

# CPU Monitoring

`container_cpu_usage_seconds_total` is a cumulative CPU-time counter.

To calculate CPU consumption over time:

```promql
rate(container_cpu_usage_seconds_total[5m])
```

For pod-level CPU usage:

```promql
sum by (pod) (
  rate(container_cpu_usage_seconds_total[5m])
)
```

The result represents approximately the number of **CPU cores being consumed**.

For example:

```text
0.5
```

represents approximately half a CPU core.

It should not automatically be interpreted as **50% CPU** because CPU percentage depends on the reference capacity being used.

---

# HTTP Request Monitoring

Prometheus exposes HTTP request metrics for its own HTTP server.

## Request Rate

```promql
sum(
  rate(prometheus_http_requests_total[5m])
)
```

This converts the cumulative request counter into an approximate requests-per-second rate over the selected window.

## HTTP 5xx Errors

```promql
sum by (code) (
  rate(
    prometheus_http_requests_total{
      code=~"5.."
    }[5m])
)
```

## Errors by Handler

```promql
sum by (handler, code) (
  rate(
    prometheus_http_requests_total{
      code=~"5.."
    }[5m])
)
```

This allows an investigation to move from:

```text
5xx errors
    ↓
specific status code
    ↓
specific handler
```

Breaking a metric down by labels can turn a broad symptom into a much narrower investigation.

---

# Latency & Histograms

Prometheus HTTP request duration is represented using histogram metrics such as:

```text
prometheus_http_request_duration_seconds_bucket
prometheus_http_request_duration_seconds_sum
prometheus_http_request_duration_seconds_count
```

Histograms allow latency distributions to be analyzed rather than looking only at an average.

## p95 Latency

```promql
histogram_quantile(
  0.95,
  sum by (le) (
    rate(prometheus_http_request_duration_seconds_bucket[5m])
  )
)
```

A p95 value represents the latency threshold at or below which approximately **95% of observed requests** completed.

Common latency percentiles include:

```text
p50 → median latency
p95 → tail latency
p99 → more extreme tail latency
```

## Average Latency

```promql
rate(prometheus_http_request_duration_seconds_sum[5m])
/
rate(prometheus_http_request_duration_seconds_count[5m])
```

### Important distinction

These metrics measure the latency of **Prometheus' own HTTP requests**.

They should not automatically be interpreted as the latency of a monitored application.

---

## Handler-Level Latency

Latency can also be broken down by handler:

```promql
histogram_quantile(
  0.95,
  sum by (le, handler) (
    rate(prometheus_http_request_duration_seconds_bucket[5m])
  )
)
```

This makes it possible to determine whether a general latency increase is concentrated around a particular endpoint.

---

# Production-Style Incident Investigation

## Incident: Increased Prometheus HTTP Latency

One of the main investigations in this lab involved an increase in **Prometheus HTTP request latency**.

Rather than immediately assuming a root cause, I investigated multiple signals:

```text
                    Latency increased
                           │
                           ▼
                  ┌─────────────────┐
                  │ Request volume  │
                  └────────┬────────┘
                           ▼
                  ┌─────────────────┐
                  │   CPU usage     │
                  └────────┬────────┘
                           ▼
                  ┌─────────────────┐
                  │  Memory usage   │
                  └────────┬────────┘
                           ▼
                  ┌─────────────────┐
                  │ Handler-level   │
                  │    latency      │
                  └────────┬────────┘
                           ▼
                    Narrow hypothesis
```

### Signals Investigated

* HTTP request rate
* CPU consumption
* Memory usage
* HTTP status codes
* Request latency
* Handler-specific latency

### Investigation Findings

During the observed period, the latency increase was most strongly **concentrated around**:

```text
/api/v1/query
```

Request rate did not show a corresponding traffic surge, and CPU did not show a matching major increase.

Memory increased during the same period, but that correlation alone was not sufficient to establish memory as the root cause.

The investigation therefore narrowed the problem from:

```text
Prometheus HTTP latency increased
```

to:

```text
The Query API showed the strongest observed latency increase.
```

This was a narrowing of the investigation, **not a confirmed root cause**.

### Key Lesson

> **Correlation helps narrow an investigation; it does not automatically prove root cause.**

This is an important principle when using observability data to troubleshoot production systems.

---

# Application Health vs Scrape Health

Different observability signals answer different questions:

| Signal           | What it tells us                               |
| ---------------- | ---------------------------------------------- |
| `up`             | Did Prometheus successfully scrape the target? |
| Kubernetes Ready | Is the Pod currently considered ready?         |
| HTTP 2xx         | Did an HTTP request succeed?                   |
| HTTP 5xx         | Did the server return an error?                |
| CPU metrics      | How much CPU is being consumed?                |
| Memory metrics   | How much memory is being used?                 |
| Request rate     | How much traffic is being handled?             |
| Latency          | How long requests are taking?                  |

For example:

```text
up == 1
   │
   ├── metrics endpoint is reachable
   │
   └── application endpoint may still return 503
```

This distinction is important because **monitoring health and application health are different signals**.

A successful metrics scrape only establishes that Prometheus was able to collect metrics from the target at that point in time.

---

# CI Validation

The rendered Kubernetes manifests can be validated without deploying them:

```bash
kubectl apply --dry-run=client \
  -f kubernetes/prometheus/rendered.yaml
```

This performs client-side validation without creating or modifying the resources in the Kubernetes cluster.

The repository's GitHub Actions workflow also validates:

* Kubernetes YAML
* Helm charts
* Rendered Kubernetes manifests

This provides an additional validation layer before changes are merged into the repository.

---

# Key Production Concepts Demonstrated

### Scrape health ≠ application health

`up == 1` confirms successful scraping, not overall application health.

### Counters require rate calculations

Metrics ending in:

```text
_total
```

are generally cumulative counters and can be converted into rates using functions such as:

```promql
rate(...)
```

### CPU requires correct interpretation

CPU usage derived from:

```text
container_cpu_usage_seconds_total
```

represents CPU cores consumed after applying `rate()`.

### Histograms reveal latency distributions

Histogram buckets can be used with:

```text
histogram_quantile()
```

to investigate p50, p95, and p99 latency.

### Labels enable deeper investigation

Breaking metrics down by labels can reveal which pod, endpoint, handler, status code, or other dimension is associated with a problem.

### Correlation is not causation

Two metrics changing at the same time does not automatically establish a root cause.

### Production troubleshooting requires multiple signals

A useful investigation combines:

```text
traffic
  + errors
  + latency
  + CPU
  + memory
  + workload health
  + scrape health
```

rather than relying on a single metric.

---

# Skills Demonstrated

```text
Kubernetes
Helm
Prometheus
PromQL
Metrics & Time Series
Kubernetes Observability
Incident Investigation
Performance Troubleshooting
GitHub Actions / CI Validation
Linux
```

---

# Next Step

The next observability phase is **Grafana**, where Prometheus metrics will be visualized through dashboards for easier monitoring and incident investigation.

---

## Author

**Yasmin Ara Islam**

DevOps / Cloud Engineering Learning Portfolio
