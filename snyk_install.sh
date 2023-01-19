#!/bin/bash
npm cache clean -f
echo "=====NPM Cache Cleaned=========="
sudo npm install -g n
sudo n stable
npm install -g npm
echo "=====Installing Snyk=========="
sudo npm install -g snyk
echo "=====Installed Snyk=========="
