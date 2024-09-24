#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating package list..."
sudo apt update
echo "Installing MySQL Server..."
sudo apt install mysql-server -y

echo "Checking MySQL status..."
sudo systemctl status mysql

echo "Checking MySQL status again..."
sudo systemctl status mysql

echo "Securing MySQL installation..."
# This command will prompt you for input during execution.
sudo mysql_secure_installation
