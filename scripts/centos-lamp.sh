#!/bin/bash
yum update -y --exclude=kernel
yum install -y epel-release 

#install apache

yum install -y httpd
systemctl enable httpd.service

yum install -y nano git unzip screen wget
# sudo systemctl stop httpd
rm -rf /var/www/html
ln -s /vagrant /var/www/html
systemctl start httpd.service
# sudo systemctl start httpd
# sudo apt-mark unhold linux-image-generic linux-headers-generic

# install php
yum install -y php
yum list php-*
yum install -y php-mysql php-xml php-xmlrpc php-soap php-gd
# sudo apt install -y php libhttpd-mod-php php-mysql
#install mysql
yum install -y https://dev.mysql.com/get/yum/mysql80-community-release-el7-4.noarch.rpm

yum install -y mysql-server
# sudo apt install -y mysql-server
systemctl enable mysqld
systemctl start mysqld.service
#Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/Surikesh/vagrant/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/Surikesh/vagrant/main/files/info.php
sudo systemctl restart httpd
