echo "=========Checking for Updates========="
sudo apt-get update
echo "=========Checking Go========="
apt search golang-go
echo "=========Installing Go========="
sudo apt install golang-go
echo "=========Check Go========="
go version
