#!/bin/bash
echo "deb [signed-by=/usr/share/keyrings/unstable.gpg] http://deb.debian.org/debian unstable main" | sudo tee -a /etc/apt/sources.list.d/kafkacat.list
sudo apt-get install -y apt-transport-https ca-certificates gnupg
curl http://ftp.debian.org/debian/dists/unstable/Release.gpg | sudo apt-key --keyring /usr/share/keyrings/unstable.gpg add -
sudo apt-get -y update && sudo apt-get install -y kafkacat
echo "=======INSTALLED KAFKACAT============"
sudo rm /etc/apt/sources.list.d/kafkacat.list