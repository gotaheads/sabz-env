#!/bin/bash
#https://github.com/aglover/ubuntu-equip
wget --no-check-certificate https://github.com/gotaheads/ubuntu-equip/raw/master/equip_git.sh && bash equip_git.sh
wget --no-check-certificate https://github.com/gotaheads/ubuntu-equip/raw/master/equip_nginx.sh && bash equip_nginx.sh
wget --no-check-certificate https://github.com/gotaheads/ubuntu-equip/raw/master/equip_java8.sh && bash equip_redis.sh
wget --no-check-certificate https://github.com/gotaheads/ubuntu-equip/raw/master/equip_redis.sh && bash equip_redis.sh
wget --no-check-certificate -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

sudo apt-get update
sudo apt-get -y install zip

sudo timedatectl set-timezone Australia/Melbourne

