#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if pack-cli is already installed
if command_exists pack; then
    echo "pack-cli is already installed. Exiting."
    exit 0
fi

# Add the repository
echo "Adding the pack-cli repository..."
sudo add-apt-repository ppa:cncf-buildpacks/pack-cli

# Update package list
echo "Updating package list..."
sudo apt-get update

# Install pack-cli
echo "Installing pack-cli..."
sudo apt-get install -y pack-cli

# Check if installation was successful
if command_exists pack; then
    echo "pack-cli has been successfully installed."
else
    echo "Error: pack-cli installation failed. Please check for errors above."
fi

# End of the script
exit 0
