# Demo DevOps Project (PHP, Docker, Kubernetes, Jenkins CI/CD, ArgoCD)

This project demonstrates a complete end-to-end GitOps workflow, utilizing Jenkins for Continuous Integration (CI) and ArgoCD for Continuous Delivery (CD) to deploy a simple PHP application onto a Minikube Kubernetes cluster.

## 🚀 Project Architecture Overview

The solution follows a modern GitOps pattern:

1.  **CI (Jenkins):** Watches for code changes, builds the Docker image, and pushes it to Docker Hub.
2.  **CD (ArgoCD):** Monitors the GitHub repository for changes in the Helm chart. It ensures the running state of the Kubernetes cluster (the *actual* state) always matches the configuration in the Git repository (the *desired* state).
3.  **Deployment:** The application is deployed via a **Helm Chart** using a `ClusterIP` Service, which is the most stable method for local development.



## 🛠️ Prerequisites

Before starting, ensure you have the following tools installed and configured:

1.  **Docker Desktop** (with WSL 2 integration enabled)
2.  **Minikube** (configured to use the Docker driver)
3.  **kubectl** (Kubernetes command-line tool)
4.  **Helm** (Kubernetes package manager)

## 📦 Local Setup and Deployment

Follow these steps to deploy the application on your local Minikube cluster:

### Step 1: Start Minikube

Ensure your Minikube cluster is running using the Docker driver.

```bash
minikube start --driver=docker

# Example: Check ArgoCD pod status
kubectl get pods -n argocd

# This command finds the ClusterIP service and port-forwards it to your host machine.
minikube service demo-devops --url -n default

[http://127.0.0.1:38627](http://127.0.0.1:38627)
❗ Because you are using a Docker driver on linux, the terminal needs to be open to run it.

View the Application
Open your web browser and navigate to the exact URL provided by the command above (e.g., http://127.0.0.1:38627).

You should see the application output:

Welcome to Demo DevOps Project 🚀 This is running on Docker + Kubernetes + Jenkins CI/CD + Minikube

Helm Chart ConfigurationThe deployment is managed by the Helm chart located in helm/demo-devops/.FilePurposeKey Settingvalues.yamlConfiguration valuesservice.type: ClusterIP (Ensures compatibility with minikube service)deployment.yamlDefines the PodsUses consistent {{ include "demo-devops.fullname" . }} for labels.service.yamlExposes the Podsselector: app: {{ include "demo-devops.fullname" . }} (Links the service to the deployment).
