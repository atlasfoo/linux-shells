#!/bin/bash
echo "Installing most recent nvm from github repository"

sudo -s

git clone https://github.com/creationix/nvm.git /opt/nvm

mkdir /usr/local/nvm

echo "export NVM_DIR=/usr/local/nvm
source /opt/nvm/nvm.sh" | sudo tee ~/.bashrc -a

source ~/.bashrc

echo '#!/bin/bash
VERSION=`cat /usr/local/nvm/alias/default`
export PATH="/usr/local/nvm/versions/node/v$VERSION/bin:$PATH"' | sudo tee /etc/profile.d/nvm.sh

chmod +x /etc/profile.d/nvm.sh

read -p "nvm successfully installed as root"