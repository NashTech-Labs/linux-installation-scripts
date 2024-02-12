#!/bin/bash

sudo apt update

echo "Downloading the Komiser binary..............................................."
wget https://cli.komiser.io/latest/komiser_Linux_x86_64 -O komiser

# Make the downloaded file executable
chmod +x komiser

echo "Moving the Komiser binary to a directory included in your PATH..............................................."
sudo mv komiser /usr/local/bin/

echo "Adding Komiser alias to .bashrc for easy access..............................................."
echo 'alias komiser="/usr/local/bin/komiser"' >> ~/.bashrc

# Apply changes to the current shell session
source ~/.bashrc

echo "chechking komiser version..............................................."
komiser --version
