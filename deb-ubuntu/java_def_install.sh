#!/bin/bash

echo "Installing java default"

sudo apt-get update

sudo apt-get install -y default-jre default-jdk

read -p "Java default successfully installed"
