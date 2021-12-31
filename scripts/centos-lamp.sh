#!/bin/bash

sudo yum install -y epel-release 

#install apache

yum install -y httpd
systemctl enable httpd.service

# sudo apt-get install -y nano git unzip screen apache2
# sudo systemctl stop apache2
rm -rf /var/www/html
ln -s /vagrant /var/www/html
systemctl start httpd.service
# sudo systemctl start apache2
# sudo apt-mark unhold linux-image-generic linux-headers-generic

# install php
yum install -y php
yum list php-*
yum install -y php-mysql php-xml php-xmlrpc php-soap php-gd
# sudo apt install -y php libapache2-mod-php php-mysql

#install mysql
yum install -y mysql-server
# sudo apt install -y mysql-server
systemctl enable mysql
systemctl start mysqld.service
#Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/Surikesh/vagrant/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/Surikesh/vagrant/main/files/info.php
sudo systemctl restart httpd
