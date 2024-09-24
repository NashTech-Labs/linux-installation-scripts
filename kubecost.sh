#!/bin/bash

# Add the Kubecost Helm repository
echo "Adding Kubecost Helm repository..."
helm repo add kubecost https://kubecost.github.io/cost-analyzer/

# Update Helm repositories
echo "Updating Helm repositories..."
helm repo update

# Create a namespace for Kubecost
echo "Creating a namespace for Kubecost..."
kubectl create namespace kubecost

# Install Kubecost using Helm
echo "Installing Kubecost..."
helm install kubecost kubecost/cost-analyzer --namespace kubecost

# Display installation status
echo "Kubecost installation complete!"
echo "To access Kubecost, you can port-forward the service using the following command:"
echo "kubectl port-forward --namespace kubecost deployment/kubecost-cost-analyzer 9090"

# Display further instructions
echo "Access Kubecost at: http://localhost:9090"
