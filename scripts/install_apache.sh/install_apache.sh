#!/data/data/com.termux/files/usr/bin/bash

pkg update -y && pkg upgrade -y
pkg install apache2 -y

# Start Apache and enable on boot
apachectl start

echo "Apache installed and started."