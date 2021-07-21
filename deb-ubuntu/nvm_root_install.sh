#!/bin/bash
echo "Installing most recent nvm from github repository"

sudo git clone https://github.com/creationix/nvm.git /opt/nvm

sudo mkdir /usr/local/nvm

sudo echo "export NVM_DIR=/usr/local/nvm
source /opt/nvm/nvm.sh" | sudo tee ~/.bashrc -a

sudo source ~/.bashrc

sudo echo '#!/bin/bash
VERSION=`cat /usr/local/nvm/alias/default`
export PATH="/usr/local/nvm/versions/node/v$VERSION/bin:$PATH"' | sudo tee /etc/profile.d/nvm.sh

sudo chmod +x /etc/profile.d/nvm.sh

read -p "nvm successfully installed as root"