#!/bin/bash

# Define required tools
tools=("kubectl" "minikube" "docker" "helm" "tar" "jq")

# Check if required tools are installed
echo "Checking required tools..."
for tool in "${tools[@]}"; do
    if ! command -v $tool &> /dev/null; then
        echo "[ERROR] $tool is not installed."
        exit 1
    else
        echo "[OK] $tool is installed."
    fi
done

echo "Checking Minikube status..."
if command -v minikube &> /dev/null; then
    if minikube status | grep -q "Running"; then
        echo "[OK] Minikube is running."
    else
        echo "[ERROR] Minikube is not running. Run 'minikube start'."
        exit 1
    fi
fi

echo "Checking Kubernetes cluster connection..."
if command -v kubectl &> /dev/null; then
    if kubectl cluster-info &> /dev/null; then
        echo "[OK] Kubernetes cluster is accessible."
    else
        echo "[ERROR] Kubernetes cluster is not accessible. Check your Minikube setup."
        exit 1
    fi
fi

echo "Environment check completed."
