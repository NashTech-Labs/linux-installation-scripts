#!/bin/bash

# Update package index
apt-get update

# Install necessary packages
 apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Create directory for keyrings
 mkdir -p /etc/apt/keyrings

# Download Microsoft GPG key and add it to keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
  sudo gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

# Get distribution codename
AZ_DIST=$(lsb_release -cs)

# Add Azure CLI repository to sources list
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

# Update package index again
 apt-get update

# Install Azure CLI
 apt-get install -y azure-cli
