wget https://nodejs.org/dist//v12.19.0/node-v12.19.0-linux-x64.tar.gz
VERSION=v12.19.0
DISTRO=linux-x64
sudo mkdir -p /usr/local/lib/nodejs
tar -xzvf node-$VERSION-$DISTRO.tar.gz -C /usr/local/lib/nodejs 
# Set the environment variable ~/.profile, add below to the end
# Nodejs
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
# Refresh profile
. ~/.profile
# Test installation using
# node -v

##npm version

##npx -v

####sudo apt install nodejs npm

##sudo npm install -g configurable-http-proxy

