#!/bin/bash

# AndroIanseo Minimal Setup for Termux + PRoot
# Repo: https://github.com/blurenciel/AndroIanseo

echo "\ud83d\udce6 Installing proot-distro and dependencies..."
pkg update && pkg upgrade -y
pkg install -y proot-distro wget git

echo "\ud83d\udcc2 Installing Debian (minimal)..."
proot-distro install debian

echo "\ud83d\udcdd Creating IANSEO setup script inside Debian..."

cat > $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/androianseo-setup.sh << 'EOL'
#!/bin/bash

echo "\ud83d\udce6 Updating and installing packages..."
apt update && apt upgrade -y
apt install -y apache2 mariadb-server php php-mysql php-curl php-gd php-json php-xml php-mbstring php-zip wget unzip

echo "\u2699\ufe0f Setting up MariaDB..."
service mysql start

DB_NAME="ianseo"
DB_USER="ianseo_user"
DB_PASS="ianseo_pass"

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "\ud83c\udf10 Downloading IANSEO..."
cd /var/www/html
wget https://www.ianseo.net/Release/Ianseo_20250210.zip -O ianseo.zip
unzip -q ianseo.zip
rm ianseo.zip
chmod -R 755 /var/www/html

echo "\ud83d\udd04 Restarting Apache..."
service apache2 restart

echo "\u2705 IANSEO setup complete!"
echo "\u27a1\ufe0f Access it inside Termux browser at http://localhost:8080 (use port forwarding if needed)"
EOL

chmod +x $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/androianseo-setup.sh

# Optional wrapper
cat > $PREFIX/bin/androianseo << 'EOF'
#!/bin/bash
proot-distro login debian
EOF
chmod +x $PREFIX/bin/androianseo

echo "\u2705 Done. To finish setup, run:"
echo ""
echo "    androianseo"
echo "    ./androianseo-setup.sh"
echo ""
echo "Then open http://localhost:8080 in your Android browser."

