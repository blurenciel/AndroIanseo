#!/bin/bash

# This script installs all necessary packages and sets up IANSEO in Termux

echo "Starting installation..."

# Update Termux packages
pkg update && pkg upgrade -y

# Install essential packages
pkg install -y apache2 mariadb php php-mysqli php-curl php-gd php-json php-xml php-mbstring php-zip git unzip

# Install additional dependencies
pkg install -y wget

# Start Apache and MariaDB services
echo "Starting Apache and MariaDB..."
apachectl start
mysqld_safe --datadir=/data/data/com.termux/files/usr/var/lib/mysql &

# Clone IANSEO from GitHub
echo "Cloning IANSEO repository..."
cd $HOME
git clone https://github.com/brian-nelson/ianseo
cd ianseo

# Configure IANSEO settings (Optional: You can add specific setup here)
# You can set up configuration or permissions if needed

# Set permissions
echo "Setting up permissions..."
chmod -R 755 $HOME/ianseo
chown -R www-data:www-data $HOME/ianseo

# Create necessary directories
mkdir -p /data/data/com.termux/files/usr/share/ianseo

# Move IANSEO files into Apache web directory
echo "Setting up IANSEO in Apache htdocs..."
mv $HOME/ianseo /data/data/com.termux/files/usr/share/ianseo
ln -s /data/data/com.termux/files/usr/share/ianseo /data/data/com.termux/files/usr/share/apache2/default-site/htdocs

# Restart Apache to apply changes
echo "Restarting Apache..."
apachectl restart

# Display final instructions
echo "Installation completed!"
echo "You can access IANSEO by visiting http://127.0.0.1 or http://localhost in your browser."