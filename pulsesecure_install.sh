#!/bin/bash
sudo apt -y install apt-utils
sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu bionic main universe' -y
sudo apt -y install -t bionic libwebkitgtk-1.0-0
sudo apt-get -y install libenchant1c2a
sudo apt install -y ./deb_files/ps-pulse-linux-9.1r5.0-b151-ubuntu-debian-64-bit-installer.deb
