#!/bin/bash

read -p "Input node version to install (e.g. 14): " version 

cd ~

curl -sL "https://deb.nodesource.com/setup_$version.x" -o nodesource_setup.sh

nano nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt install nodejs

read -p "nodejs successfully installed from repository"