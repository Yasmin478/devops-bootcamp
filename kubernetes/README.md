# Kubernetes Learning Lab

## Overview

This directory contains my hands-on Kubernetes learning journey covering application deployment, networking, configuration management, health checks, storage, and traffic routing.

Every topic was learned by building real workloads, intentionally breaking configurations, debugging failures, and observing Kubernetes behavior in real time.

The goal of this project is to develop production-oriented Kubernetes skills through practical experience rather than simply learning commands.

---

# Topics Covered

## Workloads

- Pods
- Deployments
- ReplicaSets
- Scaling Applications
- Self-Healing
- Desired State and Reconciliation

## Networking

- Labels and Selectors
- ClusterIP Services
- NodePort Services
- EndpointSlices
- Service Discovery
- Ingress
- Host-based Routing
- Path-based Routing
- Reverse Proxy Concepts

## Configuration Management

- ConfigMaps
- Environment Variables
- Secrets

## Namespaces

- Namespace Isolation
- Resource Separation

## Resource Management

- Resource Requests
- Resource Limits
- Kubernetes QoS Classes

## Health Checks

- Exec Liveness Probes
- HTTP Liveness Probes
- Readiness Probes

## Storage

- emptyDir
- hostPath
- Persistent Volumes (PV)
- Persistent Volume Claims (PVC)
- Static Provisioning
- Dynamic Provisioning
- StorageClasses

---

# Hands-on Labs Performed

- Created and managed Pods
- Built Deployments and ReplicaSets
- Scaled applications horizontally
- Practiced Kubernetes self-healing
- Exposed applications using ClusterIP and NodePort Services
- Configured ConfigMaps and Secrets
- Worked with multiple namespaces
- Tested Liveness and Readiness Probes
- Explored emptyDir and hostPath volumes
- Configured Persistent Volumes and Persistent Volume Claims
- Implemented Static and Dynamic Storage Provisioning
- Created Ingress resources for host-based and path-based routing
- Debugged multiple Kubernetes failures and networking issues

---

# Troubleshooting Experience

During these labs, I intentionally reproduced and debugged common Kubernetes issues including:

- ErrImagePull
- ImagePullBackOff
- CrashLoopBackOff
- Failed Liveness Probes
- Failed Readiness Probes
- Incorrect Service Selectors
- StorageClass Mismatch
- Pending PersistentVolumeClaims
- Incorrect Ingress Backend
- Host-based Routing Issues
- Path-based Routing Issues
- Application-generated 404 Errors

---

# Project Structure

```text
kubernetes/
│
├── README.md
├── pods/
├── deployments/
├── services/
├── configmaps/
├── secrets/
├── namespaces/
├── resources/
├── probes/
├── storage/
└── ingress/
```

---

# Commands Practiced

## Resource Management

```bash
kubectl apply -f <file>
kubectl delete -f <file>
kubectl get pods
kubectl get deployments
kubectl get replicasets
kubectl get svc
kubectl get ingress
kubectl get pv
kubectl get pvc
kubectl get storageclass
```

## Namespace Management

```bash
kubectl get namespaces
kubectl create namespace <namespace-name>
kubectl config set-context --current --namespace=<namespace-name>
kubectl config view
kubectl get pods -n <namespace-name>
kubectl describe pod <pod-name> -n <namespace-name>
```

## Inspection

```bash
kubectl describe pod <pod-name>
kubectl describe deployment <deployment-name>
kubectl describe replicaset <replicaset-name>
kubectl describe service <service-name>
kubectl describe ingress <ingress-name>
kubectl describe pvc <pvc-name>
kubectl describe pv <pv-name>
```

## Debugging

```bash
kubectl logs <pod-name>
kubectl exec -it <pod-name> -- sh
kubectl get endpointslices
```

---

# Architecture Practiced

## Kubernetes Networking

```text
Client
   │
   ▼
Ingress (Traefik)
   │
   ▼
Service
   │
   ▼
Pods
```

## Kubernetes Storage

```text
Pod
   │
   ▼
PersistentVolumeClaim
   │
   ▼
PersistentVolume
   │
   ▼
Storage
```

---

# Key Learnings

- Kubernetes manages infrastructure declaratively.
- Deployments maintain the desired state of applications.
- ReplicaSets automatically replace failed Pods.
- Services provide stable networking for temporary Pods.
- ConfigMaps and Secrets separate configuration from application code.
- Namespaces isolate resources within a cluster.
- Resource Requests and Limits help manage CPU and memory usage.
- Liveness and Readiness Probes solve different operational problems.
- Persistent storage should be accessed through PersistentVolumeClaims.
- StorageClasses enable automatic storage provisioning.
- Ingress provides external access using host-based and path-based routing.
- Debugging Kubernetes requires observing resources, events, logs, and application behavior together.

---

# Author

**Yasmin Ara Islam**

Hands-on DevOps and Kubernetes learning project focused on production-oriented infrastructure, troubleshooting, automation, and cloud-native technologies.