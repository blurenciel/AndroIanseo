#!/data/data/com.termux/files/usr/bin/bash

# Clone IANSEO (you may need a fork or download link)
git clone https://github.com/ianseo/ianseo.git
mv ianseo $PREFIX/share/apache2/default-site/htdocs/

# Set permissions
chmod -R 755 $PREFIX/share/apache2/default-site/htdocs/ianseo

echo "IANSEO installed in Apache web root."