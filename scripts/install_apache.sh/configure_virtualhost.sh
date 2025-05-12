#!/data/data/com.termux/files/usr/bin/bash

# For simple setups, add ServerName to suppress warning
echo 'ServerName localhost' >> $PREFIX/etc/apache2/httpd.conf

apachectl restart

echo "Apache configured with ServerName."