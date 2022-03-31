#!/bin/bash

sudo apt -y update
sudo apt -y upgrade

echo "===="
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -

echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list

sudo apt -y update
sudo apt install -y anydesk
