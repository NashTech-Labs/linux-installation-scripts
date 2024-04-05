#!/bin/bash

# Variables
NAMESPACE="argocd"

# Create namespace
kubectl create namespace $NAMESPACE

# Install Argo CD
kubectl apply -n $NAMESPACE -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for Argo CD to be ready
kubectl wait --namespace $NAMESPACE --for=condition=available --timeout=600s deployment/argocd-server

# Check if installed
argocd version
