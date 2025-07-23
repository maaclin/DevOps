#!/bin/bash

# Update system
dnf update -y

# Install Apache, PHP, MariaDB, wget
dnf install -y httpd php php-mysql mariadb105-server wget

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Start and enable MariaDB
systemctl start mariadb
systemctl enable mariadb

# Create database and user for WordPress
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'StrongPassword123';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Download and install WordPress
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz

# Configure WordPress
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/wordpress/" wp-config.php
sed -i "s/username_here/wpuser/" wp-config.php
sed -i "s/password_here/StrongPassword123/" wp-config.php

# Set permissions
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

# Restart Apache to apply everything
systemctl restart httpd