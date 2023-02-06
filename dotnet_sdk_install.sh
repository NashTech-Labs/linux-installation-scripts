echo "================Downloading Packages=========================="
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
echo "================Checking Updates============================="
sudo apt update
echo "================Installing https============================="
sudo apt install -y apt-transport-https
echo "================Installing Dotnet============================="
sudo apt install dotnet-sdk-6.0 
echo "====================Installed================================="
