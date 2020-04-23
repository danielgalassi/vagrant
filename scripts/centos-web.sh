#!/bin/bash

yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

yum install -y php php-devel php-cli php-common php-mysql

# download starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/danielgalassi/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/danielgalassi/vagrant/master/files/info.php

service httpd restart
