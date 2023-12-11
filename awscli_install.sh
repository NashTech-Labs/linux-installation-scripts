#!/bin/bash

# Default AWS CLI version
DEFAULT_AWS_CLI_VERSION="2.2.10"

# Ask user for AWS CLI version
read -p "Enter AWS CLI version to install (default is $DEFAULT_AWS_CLI_VERSION): " AWS_CLI_VERSION
AWS_CLI_VERSION="${AWS_CLI_VERSION:-$DEFAULT_AWS_CLI_VERSION}"

# Download AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" -o "/tmp/awscliv2.zip" || error_exit "Failed to download AWS CLI."

# Unzip and install AWS CLI
unzip -q "/tmp/awscliv2.zip" -d "/tmp" || error_exit "Failed to unzip AWS CLI."
sudo "/tmp/aws/install" || error_exit "Failed to install AWS CLI."

# Clean up
rm -rf "/tmp/aws" "/tmp/awscliv2.zip"
