#!/bin/bash

# Install Keptn CLI
echo "Installing Keptn CLI..."
curl -sL https://get.keptn.sh | sudo -E bash

# Verify Keptn CLI installation
echo "Verifying Keptn CLI installation..."
keptn version

# Install Keptn on Kubernetes
echo "Installing Keptn on Kubernetes..."
keptn install --platform=kubernetes

# Expose Keptn Bridge
echo "Exposing Keptn Bridge..."
kubectl port-forward svc/keptn-bridge -n keptn 8080:8080 &

# Display instructions to access Keptn Bridge
echo "Keptn installation complete!"
echo "Access the Keptn Bridge at: http://localhost:8080"

# Verify Keptn status
echo "Verifying Keptn installation..."
keptn status
