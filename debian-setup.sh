#!/bin/bash

echo "=== Updating Debian packages ==="
apt update && apt upgrade -y

echo "=== Installing Apache, PHP, MariaDB, Git ==="
apt install apache2 php php-mysql mariadb-server git unzip curl -y

echo "=== Cloning IANSEO ==="
cd /var/www/html
git clone https://github.com/brian-nelson/ianseo.git

echo "=== Setting ownership for Apache ==="
chown -R www-data:www-data /var/www/html/ianseo

echo "=== Installation complete ==="
echo "You can now start services manually:"
echo "  service apache2 start"
echo "  service mysql start"
echo "Then open: http://localhost or 127.0.0.1 from browser"
