#!/bin/bash

#1.9 via apt-get
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-get update
#apt-get purge lxc-docker*
sudo apt-get install docker-engine

#Install using docker ppa
#wget -qO- https://get.docker.com/ | sh

sudo usermod -aG docker vagrant

# get rid of 'sudo'
#sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
newgrp docker


