# Kubernetes Learning Lab

## Overview

A hands-on Kubernetes learning environment used to understand container orchestration concepts including Pods, Deployments, ReplicaSets, Services, scaling, and self-healing.

This directory serves as a practical lab for experimenting with Kubernetes resources, intentionally breaking configurations, observing Kubernetes reconciliation in real time, and learning troubleshooting techniques.

---

## Features

* Creating and managing Pods
* Creating Deployments and ReplicaSets
* Declarative configuration using YAML manifests
* Scaling applications horizontally
* Self-healing and automatic Pod replacement
* Troubleshooting failed Pods and image pull errors
* Creating Services using labels and selectors
* Internal service discovery using ClusterIP
* External application exposure using NodePort
* Load balancing across multiple Pods

---

## Concepts Learned

* Kubernetes architecture
* Pods
* Deployments
* ReplicaSets
* Desired State and reconciliation loop
* Self-Healing
* Scaling applications
* Declarative configuration using YAML
* Troubleshooting failed Pods and image pull errors
* Labels and Selectors
* Kubernetes Services
* ClusterIP Services
* NodePort Services
* Service discovery
* Endpoints and EndpointSlices
* Stable Service IP vs dynamic Pod IPs
* Internal vs external cluster networking

---

## Project Structure

```text
kubernetes/
│
├── README.md
├── first-pod.yaml
├── first-deployment.yaml
└── first-service.yaml
```

---

## Commands Practiced

### Create resources

```bash
kubectl apply -f <file>
```

### View resources

```bash
kubectl get pods
kubectl get deployments
kubectl get replicasets
kubectl get svc
kubectl get endpoints
kubectl get endpointslices
```

### Inspect resources

```bash
kubectl describe pod <pod-name>
kubectl describe deployment <deployment-name>
kubectl describe replicaset <replicaset-name>
kubectl describe svc <service-name>
```

### View logs

```bash
kubectl logs <pod-name>
```

### Delete resources

```bash
kubectl delete pod <pod-name>
kubectl delete deployment <deployment-name>
kubectl delete svc <service-name>
```

---

## Experiments Performed

### First Pod

* Created an Nginx Pod
* Inspected Pod details
* Viewed logs
* Deleted the Pod

### Broken Image Testing

* Used invalid image names and tags
* Observed ErrImagePull
* Observed ImagePullBackOff
* Investigated Events using kubectl describe

### Deployment Testing

* Created an Nginx Deployment
* Observed Deployment → ReplicaSet → Pod relationship
* Deleted Pods and watched Kubernetes recreate them
* Practiced self-healing and reconciliation
* Scaled Deployments from one replica to multiple replicas

### Service Testing

* Created a ClusterIP Service
* Observed Service selectors matching Pod labels
* Inspected Endpoints and EndpointSlices
* Verified automatic endpoint updates when Pods changed
* Converted the Service to NodePort
* Accessed the application externally through browser and mobile devices

---

## Networking Architecture Practiced

```text
Browser
   ↓
Node IP:30080
   ↓
NodePort Service
   ↓
ClusterIP Service
   ↓
Endpoints
   ↓
Nginx Pods
```

---

## Key Learnings

* Pods are disposable and replaceable.
* Kubernetes manages desired state declaratively.
* Deployments manage ReplicaSets.
* ReplicaSets manage Pods.
* New Pods receive new names and IP addresses.
* Kubernetes replaces failed Pods rather than repairing them.
* Services provide a stable network identity for temporary Pods.
* Labels and selectors enable Services to discover Pods dynamically.
* ClusterIP is accessible only inside the cluster.
* NodePort exposes applications outside the cluster.
* Endpoints automatically update as Pods are created or deleted.

---

## Covered So Far

- Pods
- Deployments
- ReplicaSets
- Scaling
- Self-Healing
- ClusterIP Services
- NodePort Services
- EndpointSlices
- ConfigMaps
- Environment Variables

## ConfigMap Demo

Created a ConfigMap and injected values into a Pod using environment variables.

Learned:
- ConfigMaps store non-sensitive configuration.
- Pods can consume ConfigMap values as environment variables.
- Environment variables are loaded when containers start.
- Updating a ConfigMap does not automatically update running containers.
- Pods must be restarted/recreated to pick up updated values.

---

## Future Topics

* ConfigMaps and Environment Variables
* Secrets
* Persistent Volumes
* Nginx Reverse Proxy and Ingress
* Deploying the Quote API on Kubernetes
* Kubernetes manifests for production deployments

---

## Author

**Yasmin Ara Islam**

Hands-on Kubernetes learning project focused on container orchestration, networking, scaling, self-healing, and troubleshooting using real Kubernetes workloads.
