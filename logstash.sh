#!/bin/bash

# Switch to superuser
sudo su

# Update package index
apt update

# Install Java Development Kit (JDK)
apt install -y default-jdk

# Download and install Logstash
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
apt update
apt install -y logstash

# Start Logstash service
systemctl start logstash

# Enable Logstash service to start on system boot
systemctl enable logstash

# Verify Logstash installation
systemctl status logstash
