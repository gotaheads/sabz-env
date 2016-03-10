#!/bin/bash

#https://github.com/aglover/ubuntu-equip
wget --no-check-certificate https://github.com/SpatialVision/ubuntu-equip/raw/master/equip_git.sh && bash equip_git.sh
wget --no-check-certificate https://github.com/SpatialVision/ubuntu-equip/raw/master/equip_nginx.sh && bash equip_nginx.sh


ANDROID_SDK_FILENAME=android-sdk_r24-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME
#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y npm git openjdk-7-jdk ant expect
npm install -g n
n stable

curl -O $ANDROID_SDK
tar -xzvf $ANDROID_SDK_FILENAME
sudo chown -R vagrant android-sdk-linux/
PROFILE=/home/vagrant/.profile
echo "export ANDROID_HOME=~/android-sdk-linux" >> $PROFILE
echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> $PROFILE
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> $PROFILE

npm install -g cordova
npm install -g plugman
npm install -g ionic
expect -c '
set timeout -1;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-19,build-tools-19.1.0
expect {
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'

sudo apt-get install -y ruby1.9.1-dev

sudo gem install sass
sudo gem install compass
sudo npm install -g gulp


sudo timedatectl set-timezone Australia/Melbourne
#sudo timedatectl set-timezone Australia/Perth
