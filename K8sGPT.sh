#!/bin/bash

echo "Enter the version of K8sGPT you want to install (e.g., 0.2.7):"
read version

# Define the URL template for the K8sGPT binary
URL_TEMPLATE="https://github.com/k8sgpt-ai/k8sgpt/releases/download/v${version}/k8sgpt_386.deb"

# Check if the version exists by attempting to download it
if ! wget -q --spider "${URL_TEMPLATE}"; then
    echo "Version $version does not exist. Installing default version 0.2.7."
    version="0.2.7"
    URL_TEMPLATE="https://github.com/k8sgpt-ai/k8sgpt/releases/download/v${version}/k8sgpt_386.deb"
fi

# Download the K8sGPT Debian package
wget "${URL_TEMPLATE}" -O k8sgpt_386.deb

# Use de-package tool to install K8sGPT
sudo dpkg -i k8sgpt_386.deb

# Verify the installation
k8sgpt version
