#!/bin/bash

echo "Setting up python 3"

sudo apt-get update

sudo apt-get install -y python-is-python3 python3 pip

python -m pip install pipenv pylint autopep8 ipython

read -p "Python 3 successfully set up"