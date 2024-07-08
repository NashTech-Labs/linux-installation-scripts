#!/bin/bash

# Function to fetch the latest version from GitHub releases
get_latest_version() {
    # Use the GitHub API to get the latest release tag name
    curl -s https://api.github.com/repos/derailed/k9s/releases/latest | grep -Po '"tag_name": "\K.*?(?=")'
}

# Ask the user for the version they want to install
read -p "Enter the K9s version you want to install (leave empty to install the latest version): " VERSION

# If no version is provided, use the latest version
if [ -z "$VERSION" ]; then
    VERSION=$(get_latest_version)
fi

# Define the download URL and the installation directory
URL="https://github.com/derailed/k9s/releases/download/$VERSION/k9s_Linux_amd64.tar.gz"
INSTALL_DIR="/usr/local/bin"

# Download and install K9s
echo "Downloading K9s version $VERSION..."
curl -Lo k9s.tar.gz $URL

echo "Extracting K9s..."
tar -zxvf k9s.tar.gz

echo "Installing K9s to $INSTALL_DIR..."
sudo mv k9s $INSTALL_DIR/k9s

# Clean up
echo "Cleaning up..."
rm k9s.tar.gz

# Verify installation
echo "K9s installed successfully!"
$INSTALL_DIR/k9s version
