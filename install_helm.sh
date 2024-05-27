#!/bin/bash

# Update apt package index
sudo apt update

# Install dependencies
sudo apt install -y apt-transport-https gnupg curl

# Add the Helm GPG key
curl -fsSL https://baltocdn.com/helm/signing.asc | sudo apt-key add -

# Add the Helm stable repository
sudo apt-add-repository "deb https://baltocdn.com/helm/stable/debian/ all main"

# Update apt package index again
sudo apt update

# Install Helm
sudo apt install -y helm
