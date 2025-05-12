#!/bin/bash

# AndroIanseo: Install and configure IANSEO on Termux (Android)
# Repo: https://github.com/blurenciel/AndroIanseo

echo "Starting AndroIanseo installation..."

# --- Update and Install Packages ---
pkg update && pkg upgrade -y
pkg install -y apache2 mariadb php php-mysqli php-curl php-gd php-json php-xml php-mbstring php-zip git unzip wget

# --- MariaDB Init ---
if [ ! -d "$PREFIX/var/lib/mysql/mysql" ]; then
  echo "Initializing MariaDB..."
  mysql_install_db
fi

# --- Start Services ---
echo "Starting Apache and MariaDB..."
apachectl start
mysqld_safe --datadir=$PREFIX/var/lib/mysql &

# --- Wait for MariaDB to initialize ---
sleep 10

# --- Create IANSEO Database and User ---
echo "Configuring MySQL database..."
DB_NAME="ianseo"
DB_USER="ianseo_user"
DB_PASS="ianseo_pass"

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

# --- Download and Extract IANSEO ---
cd $HOME
wget https://www.ianseo.net/Release/Ianseo_20250210.zip -O ianseo.zip
unzip -q ianseo.zip -d ianseo

echo "Deploying IANSEO to Apache web root..."
rm -rf $PREFIX/share/apache2/default-site/htdocs/*
cp -r ianseo/* $PREFIX/share/apache2/default-site/htdocs/
chmod -R 755 $PREFIX/share/apache2/default-site/htdocs

# --- Restart Apache ---
apachectl restart

# --- Final Message ---
echo ""
echo "✅ AndroIanseo installation complete!"
echo "📂 Access via: http://127.0.0.1"
echo "🛠️  MySQL Database: $DB_NAME"
echo "👤 User: $DB_USER"
echo "🔑 Password: $DB_PASS"
