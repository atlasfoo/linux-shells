#!/bin/bash

echo "PHP MULTI INSTALL"

echo "Installing apache2"

sudo apt-get update && sudo apt-get install apache2

echo "Verifying apache installation"

sudo ufw show app list

echo "Installing PHP repository"

sudo apt-get update && sudo apt install software-properties-common

sudo add-apt-repository ppa:ondrej/php

sudo apt-get update

clear

read -p "Input version to install: " version

echo "Installing PHP$version for Apache (non FPM)"

sudo apt-get install "php$version" "php$version-cli" "php$version-xml" "php$version-mysql"

echo "Setting new PHP version as default"

sudo a2enmod "php$version"

sudo update-alternatives --set php "/usr/bin/php$version"

echo "Configuring apache for PHP"

echo "<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" | sudo tee /etc/apache2/mods-enabled/dir.conf

echo "<?php
    phpinfo();
?>" | sudo tee /var/www/html/info.php

read -p "PHP successfully installed and configured."
