# Kubernetes Learning Lab

## Overview

A hands-on Kubernetes learning environment used to understand container orchestration concepts including Pods, Deployments, ReplicaSets, scaling, and self-healing.

This directory serves as a practical lab for experimenting with Kubernetes resources, intentionally breaking configurations, and learning troubleshooting techniques.

---

## Concepts Learned

* Kubernetes architecture
* Pods
* Deployments
* ReplicaSets
* Desired State
* Self-Healing
* Scaling applications
* Declarative configuration using YAML
* Troubleshooting failed Pods and image pull errors

---

## Project Structure

kubernetes/
│
├── README.md
├── first-pod.yaml
└── first-deployment.yaml

---

## Commands Practiced

Create resources:

kubectl apply -f <file>

View resources:

kubectl get pods
kubectl get deployments
kubectl get replicasets

Inspect resources:

kubectl describe pod <pod-name>
kubectl describe deployment <deployment-name>
kubectl describe replicaset <replicaset-name>

View logs:

kubectl logs <pod-name>

Delete resources:

kubectl delete pod <pod-name>
kubectl delete deployment <deployment-name>

---

## Experiments Performed

### First Pod

* Created an Nginx Pod
* Inspected Pod details
* Viewed logs
* Deleted the Pod

### Broken Image Testing

* Used invalid image names
* Observed ErrImagePull
* Observed ImagePullBackOff
* Investigated Events using kubectl describe

### Deployment Testing

* Created an Nginx Deployment
* Observed Deployment → ReplicaSet → Pod relationship
* Deleted Pods and watched Kubernetes recreate them
* Practiced self-healing and reconciliation

---

## Key Learnings

* Pods are disposable.
* Kubernetes manages desired state declaratively.
* Deployments manage ReplicaSets.
* ReplicaSets manage Pods.
* Deleting Pods does not affect Deployments or ReplicaSets.
* New Pods receive new names and IP addresses.
* Kubernetes replaces failed Pods rather than repairing them.

---

## Next Topics

* Services
* Environment Variables
* Secrets
* Nginx Reverse Proxy
* Deploying Quote API on Kubernetes
