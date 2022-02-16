#!/bin/sh

lsb_release -a

# How To Install And Run Docker On Ubuntu 20.04 LTS
sudo apt update

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo usermod -a -G docker ubuntu

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker -v
docker-compose -v

sudo mkdir ./docker_data/jenkins_home
sudo chown 1000:1000 ./docker_data/ -R
