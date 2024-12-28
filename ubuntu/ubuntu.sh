#!/bin/bash

# install chrome
# Git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update; apt install git

# Git Setup

git config --global init.defaultBranch main
git config --global user.email "phelipercorrea@gmail.com"
git config --global user.name "Phelipe Correa"

# Git SSH Setup

# ssh-keygen -t rsa -b 4096 -C "phelipercorrea@gmail.com"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/phcorrea\@github.com

# Common Lib
sudo apt install -y curl ca-certificates htop gnupg2 bison

# NodeJS 23

curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs

# Docker
# https://docs.docker.com/engine/install/ubuntu/
# https://docs.docker.com/engine/install/linux-postinstall/

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# NVM
# https://github.com/nvm-sh/nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc

# NodeJS

nvm install 23.5

# RVM
# https://github.com/nvm-sh/nvm

gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

# GVM
# https://github.com/moovweb/gvm

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm

# Go

gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
#gvm install go1.7
#gvm use go1.7
gvm install go1.17.13
gvm use go1.17.13
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.23.4
gvm use go1.23.4




