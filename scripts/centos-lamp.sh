#!/bin/bash

rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

#install apache

yum --enablerepo=epel,remi install -y httpd
systemctl enable httpd.service

# sudo apt-get install -y nano git unzip screen apache2
# sudo systemctl stop apache2
rm -rf /var/www/html
ln -s /vagrant /var/www/html
systemctl start httpd.service
# sudo systemctl start apache2
# sudo apt-mark unhold linux-image-generic linux-headers-generic

# install php
yum --enablerepo=epel,remi-php74 install -y php
yum --enablerepo=remi-php74 list php-*
yum --enablerepo=remi-php74 install -y php-mysql php-xml php-xmlrpc php-soap php-gd
# sudo apt install -y php libapache2-mod-php php-mysql

#install mysql
rpm -Uvh  https://repo.mysql.com/mysql80-community-release-el7-1.noarch.rpm
yum install -y mysql-server
# sudo apt install -y mysql-server
systemctl enable mysql
systemctl start mysqld.service
#Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/Surikesh/vagrant/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/Surikesh/vagrant/main/files/info.php
sudo systemctl restart httpd
