#!/bin/bash

echo "Installing docker from origin repository"

read -p "Input current ubuntu version alias: " version

cd ~

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $version stable"

sudo apt-get update

apt-cache policy docker-ce

sudo apt install -y docker-ce

sudo systemctl status docker

read -p "Docker successfully installed"

echo "Setting docker use without root"

sudo usermod -aG docker ${USER}

su - ${USER}

id -nG

read -p "Docker successfully configured"