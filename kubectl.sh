#!/bin/bash

# Function to fetch the latest kubectl version
get_latest_version() {
    curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt
}

# Function to install kubectl
install_kubectl() {
    local version=$1

    echo "Downloading kubectl version $version..."
    curl -LO "https://dl.k8s.io/release/${version}/bin/linux/amd64/kubectl"
    
    echo "Verifying kubectl checksum..."
    curl -LO "https://dl.k8s.io/${version}/bin/linux/amd64/kubectl.sha256"
    echo "$(<kubectl.sha256) kubectl" | sha256sum --check

    if [ $? -ne 0 ]; then
        echo "Checksum verification failed!"
        exit 1
    fi

    echo "Installing kubectl..."
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    echo "Cleaning up..."
    rm kubectl kubectl.sha256

    echo "kubectl version $version installed successfully."
}

# Main script
echo "Enter the version of kubectl you want to install (e.g., v1.25.0):"
read -r kubectl_version

# Check if a version was provided
if [ -z "$kubectl_version" ]; then
    echo "No version provided. Fetching the latest version..."
    kubectl_version=$(get_latest_version)
fi

echo "Preparing to install kubectl version $kubectl_version..."
install_kubectl "$kubectl_version"
