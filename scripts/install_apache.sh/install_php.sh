#!/data/data/com.termux/files/usr/bin/bash

pkg install php php-apache -y

# Edit apache config to include PHP module if needed
echo 'LoadModule php_module /data/data/com.termux/files/usr/libexec/apache2/libphp.so' >> $PREFIX/etc/apache2/httpd.conf
echo 'AddHandler php-script .php' >> $PREFIX/etc/apache2/httpd.conf
echo 'DirectoryIndex index.php index.html' >> $PREFIX/etc/apache2/httpd.conf

apachectl restart

echo "PHP installed and configured for Apache."