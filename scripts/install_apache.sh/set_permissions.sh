#!/data/data/com.termux/files/usr/bin/bash

chmod -R 755 $PREFIX/share/apache2/default-site/htdocs/ianseo
chown -R u0_a$(id -u):u0_a$(id -u) $PREFIX/share/apache2/default-site/htdocs/ianseo

echo "Permissions set."