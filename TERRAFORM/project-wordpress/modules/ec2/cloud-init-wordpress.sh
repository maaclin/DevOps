#!/bin/bash

# Variables passed from Terraform
VAULT_ADDR="${vault_addr}"

# Update and install required packages
apt update -y
apt install apache2 php php-mysql mysql-server wget unzip curl jq -y

# Enable Apache to start on boot and start it now
systemctl enable apache2
systemctl start apache2

# Wait for Vault to be available
echo "Waiting for Vault server to be ready..."
sleep 30

# Retrieve database credentials from Vault
echo "Retrieving database credentials from Vault..."
DB_USERNAME=$(curl -s -H "X-Vault-Token: root" http://$VAULT_ADDR:8200/v1/secret/data/mysql | jq -r '.data.data.username')
DB_PASSWORD=$(curl -s -H "X-Vault-Token: root" http://$VAULT_ADDR:8200/v1/secret/data/mysql | jq -r '.data.data.password')

echo "Retrieved credentials: Username=$DB_USERNAME"

# Configure MySQL
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER '$DB_USERNAME'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USERNAME'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Download and install WordPress
cd /var/www/html
rm -f index.html
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz

# Create WordPress configuration
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/wordpress/" wp-config.php
sed -i "s/username_here/$DB_USERNAME/" wp-config.php
sed -i "s/password_here/$DB_PASSWORD/" wp-config.php
sed -i "s/localhost/localhost/" wp-config.php

# Set correct permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Restart Apache to apply changes
systemctl restart apache2

echo "WordPress setup complete!"