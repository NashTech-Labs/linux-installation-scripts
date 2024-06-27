#!/bin/bash

# Function to print messages
print_message() {
    echo "=> $1"
}

# Function to install dependencies
install_dependencies() {
    print_message "Updating package lists..."
    sudo apt-get update -y

    print_message "Installing required packages..."
    sudo apt-get install -y curl git
}

# Function to download and install OpenTofu
install_opentofu() {
    print_message "Downloading OpenTofu..."
    curl -Lo opentofu.tar.gz https://github.com/opentofu/cli/releases/latest/download/opentofu-linux-amd64.tar.gz

    print_message "Extracting OpenTofu..."
    tar -xzf opentofu.tar.gz

    print_message "Installing OpenTofu..."
    sudo mv opentofu /usr/local/bin/opentofu

    print_message "Cleaning up..."
    rm opentofu.tar.gz
}

# Function to verify installation
verify_installation() {
    print_message "Verifying OpenTofu installation..."
    if command -v opentofu > /dev/null 2>&1; then
        print_message "OpenTofu installed successfully!"
        opentofu version
    else
        print_message "OpenTofu installation failed."
    fi
}

# Main script execution
print_message "Starting OpenTofu installation script..."
install_dependencies
install_opentofu
verify_installation
print_message "OpenTofu installation script completed."

