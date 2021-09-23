#!/bin/bash
#Download the latest version
sudo wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz
#ext, extract the tarball to /usr/local directory.
sudo tar -C /usr/local -xzf go1.15.5.linux-amd64.tar.gz
#Add the go binary path to .bashrc file /etc/profile (for a system-wide installation).
export PATH=$PATH:/usr/local/go/bin
#After adding the PATH environment variable, you need to apply changes immediately by running the following command.
source ~/.bashrc
#Now verify the installation by simply running the go version in the terminal.
echo "=======INSTALLED GO==========="
go version
