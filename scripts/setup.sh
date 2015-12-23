#!/bin/bash
set -e

apt-get update

apt-get install -y cowsay curl git

apt-get install -y \
    python-dev \
    python-pip

pip install pytest testinfra==1.0a3 cram

apt-get install -y \
    ruby2.0-dev \
    rubygems-integration

gem2.0 install serverspec

git clone https://github.com/sstephenson/bats.git
cd bats && ./install.sh /usr/local

cowsay "All setup!"
