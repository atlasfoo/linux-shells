#!/bin/bash

echo "Run PHP MULTI INSTALL first for dependency install"

read -p "Input version to disable: " oldver

sudo a2dismod "php$oldver"

clear

read -p "Input version to install: " version

echo "Installing PHP$version for Apache (non FPM)"

sudo apt-get install "php$version" "php$version-cli" "php$version-xml" "php$version-mysql"

echo "Setting new PHP version as default"

sudo a2enmod "php$version"

sudo update-alternatives --set php "/usr/bin/php$version"

read -p "PHP successfully installed and configured."