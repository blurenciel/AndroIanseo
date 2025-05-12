#!/data/data/com.termux/files/usr/bin/bash

pkg install mariadb -y
mysql_install_db
mysqld_safe &

echo "MariaDB installed and started."