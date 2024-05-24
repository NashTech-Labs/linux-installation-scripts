#!/bin/bash

# Fetch the latest release version from GitHub API
LATEST_VERSION=$(curl --silent "https://api.github.com/repos/kubeshop/botkube/releases/latest" | jq -r .tag_name)

# Check if jq is installed, if not install it
if ! command -v jq &> /dev/null
then
    echo "jq could not be found, installing jq..."
    sudo apt-get update
    sudo apt-get install -y jq
fi

# Download the correct binary for your architecture
wget "https://github.com/kubeshop/botkube/releases/download/${LATEST_VERSION}/botkube-linux-amd64" -O /usr/local/bin/botkube

# Make the binary executable
chmod +x /usr/local/bin/botkube

# Verify installation
/usr/local/bin/botkube version

# Install Botkube with the desired configuration
/usr/local/bin/botkube install --version="${LATEST_VERSION}" \
  --set config.provider.endpoint=https://api.botkube.io/graphql \
  --set config.provider.identifier=3de39d0c-8649-42dd-a5a4-b866ce5a1a9e \
  --set config.provider.apiKey=key:f5f293b2-2b63-45d9-86ef-b7921b0baac2
