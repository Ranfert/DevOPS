#!/bin/bash
#
# Install wordpress mysql nginx apache on CentOS, tested on centOS 8

sudo yum install -y epel-release 
sudo dnf install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo firewall-cmd --add-service=http
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

# Copy predefined nginx.config file
sudo mv -f /tmp/nginx.conf /etc/nginx/nginx.conf

sudo mkdir -p /var/www
sudo cp -r /usr/share/nginx/html /var/www
sudo chown -R nginx:nginx /var/www/html
sudo chmod -R 775 /var/www/html

#!!!#
#setendorce Permissive
#systemctl restart nginx

# Php-fpm install
sudo dnf install -y php-fpm
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

# Wordpress install
sudo yum install -y wget
sudo wget -P /tmp  https://wordpress.org/latest.tar.gz
sudo tar -xvzf /tmp/latest.tar.gz -C /var/www/html
sudo cd /var/www/html/wordpress
sudo mv -r * /var/www/html
sudo rm -f /tmp/latest.tar.gz

# Apache install
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo dnf install -y php php-cli php-mysqlnd php-json php-gd php-ldap php-odbc php-pdo php-opcache php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap php-zip
sudo yum install -y @mysql

# Mysql install
sudo systemctl start mysqld
sudo systemctl enable --now mysqld
sudo mysqladmin -u root create wordpress

sudo echo "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON wordpress.* to 'wordpress'@'localhost';" > ~/script.sql
sudo mysql < ~/script.sql
sudo rm -f ~/script.sql
sudo cd /var/www/html
sudo mv /tmp/wp-config.php /var/www/html/wp-config.php
