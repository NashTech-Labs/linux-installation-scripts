#!/bin/bash

# Create a directory named 'terramate' and change to it
mkdir -p terramate
cd terramate

# URL of the tar.gz file to be downloaded
URL="https://github.com/terramate-io/terramate/releases/download/v0.4.2/terramate_0.4.2_linux_x86_64.tar.gz"

TARGET_DIR="$PWD"  # Use $PWD to get the current working directory

# Download the tar.gz file and extract it
curl -L "$URL" | tar -xz

echo "Extraction completed."

# Append the TARGET_DIR to the beginning of the PATH in .bashrc
echo "export PATH=\"$TARGET_DIR:\$PATH\"" >> ~/.bashrc

# Source .bashrc to apply the changes to the current session
source ~/.bashrc

# Inform the user that the directory has been added to the PATH
echo "Directory added to the PATH."
