#!/bin/bash

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found. Please install kubectl first."
    exit 1
fi

# Check if Helm is installed
if ! command -v helm &> /dev/null
then
    echo "Helm could not be found. Please install Helm first."
    exit 1
fi

# Step 1: Install FluxCD via Helm
echo "Installing FluxCD using Helm..."

# Add FluxCD's Helm repository
helm repo add fluxcd https://charts.fluxcd.io

# Update Helm repositories
helm repo update

# Install FluxCD in the 'flux-system' namespace
kubectl create namespace flux-system
helm install flux fluxcd/flux --namespace flux-system

# Step 2: Install FluxCD's Helm Operator (optional for Helm-based deployments)
echo "Installing Helm Operator..."

helm install flux-helm-operator fluxcd/helm-operator --namespace flux-system

# Step 3: Install FluxCD's Source Controller (optional for GitOps workflows)
echo "Installing FluxCD Source Controller..."

helm install flux-source-controller fluxcd/source-controller --namespace flux-system

# Step 4: Install FluxCD's Kustomize Controller (optional for Kustomize workflows)
echo "Installing FluxCD Kustomize Controller..."

helm install flux-kustomize-controller fluxcd/kustomize-controller --namespace flux-system

# Step 5: Install FluxCD’s Notification Controller (optional)
echo "Installing FluxCD Notification Controller..."

helm install flux-notification-controller fluxcd/notification-controller --namespace flux-system

# Step 6: Wait for FluxCD components to be installed
echo "Waiting for FluxCD components to be installed..."
kubectl wait --for=condition=available --timeout=600s deployment/flux -n flux-system

# Step 7: Verify the FluxCD installation
echo "Verifying FluxCD installation..."
kubectl get pods -n flux-system

echo "FluxCD installation completed successfully!"
