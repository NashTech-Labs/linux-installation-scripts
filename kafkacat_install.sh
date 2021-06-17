#!/bin/bash
echo "deb [trusted=yes] http://deb.debian.org/debian unstable main" | sudo tee -a /etc/apt/sources.list.d/kafkacat.list
sudo apt-get install -y apt-transport-https ca-certificates gnupg
sudo apt-get -y update && sudo apt-get install -y kafkacat
echo "=======INSTALLED KAFKACAT============"
sudo rm /etc/apt/sources.list.d/kafkacat.list
