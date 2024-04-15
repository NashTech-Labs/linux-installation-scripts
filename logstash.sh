#!/bin/bash

# Update package index
sudo apt update

# Install Java Development Kit (JDK)
sudo apt install -y default-jdk

# Download and install Logstash
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
sudo apt update
sudo apt install -y logstash

# Start Logstash service
sudo systemctl start logstash

# Enable Logstash service to start on system boot
sudo systemctl enable logstash

# Verify Logstash installation
sudo systemctl status logstash
