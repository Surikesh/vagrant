#!/bin/bash

sudo apt-mark hold linux-image-generic linux-headers-generic
sudo apt-get update -y

sudo apt-get install -y nano git unzip screen apache2
sudo systemctl stop apache2
rm -rf /var/www/html
ln -s /vagrant /var/www/html
sudo systemctl start apache2
sudo apt-mark unhold linux-image-generic linux-headers-generic

#install php

sudo apt install -y php libapache2-mod-php php-mysql

#install mysql

sudo apt install -y mysql-server
sudo systemctl enable mysql

#Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/Surikesh/vagrant/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/Surikesh/vagrant/main/files/info.php
sudo systemctl restart apache2
