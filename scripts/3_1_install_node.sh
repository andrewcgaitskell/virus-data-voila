wget https://nodejs.org/dist//v12.19.0/node-v12.19.0-linux-x64.tar.gz
VERSION=v12.19.0
DISTRO=linux-x64
sudo mkdir -p /usr/local/lib/nodejs
tar -xzvf node-$VERSION-$DISTRO.tar.gz -C /usr/local/lib/nodejs 

source 3_2_setpath.sh
