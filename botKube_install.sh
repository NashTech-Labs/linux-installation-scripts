# Download the correct binary for your architecture
wget https://github.com/kubeshop/botkube/releases/download/v1.11.0/botkube-linux-amd64 -O /usr/local/bin/botkube

# Make the binary executable
chmod +x /usr/local/bin/botkube

#verify installation
/usr/local/bin/botkube version

# Install Botkube with the desired configuration
/usr/local/bin/botkube install --version=v1.11.0 \
  --set config.provider.endpoint=https://api.botkube.io/graphql \
  --set config.provider.identifier=3de39d0c-8649-42dd-a5a4-b866ce5a1a9e \
  --set config.provider.apiKey=key:f5f293b2-2b63-45d9-86ef-b7921b0baac2
