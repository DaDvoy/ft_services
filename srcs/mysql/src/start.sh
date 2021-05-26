#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root mysql < mybase
#mysql -u root wordpress < wordpress.sql
rc-service mariadb stop
/usr/bin/supervisord -c /etc/supervisord.conf



##!/bin/sh
#
#rc default
#./etc/init.d/mariadb setup
#openrc-service
#./etc/init.d/mariadb start

#Создание базы данных для WordPress
#mysql -u root -e "CREATE DATABASE wordpress;"

#Создание нового пользователя "root" с паролем "pass" и предоставьте разрешения.
#mysql -u root -e "CREATE USER 'user'@'%' IDENTIFIED BY 'user';"
#mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%' IDENTIFIED BY 'user';"
#mysql -u root -e "FLUSH PRIVILEGES;"
#mysql -u root -e "USE wordpress;"

#Импорт ранее созданной резервной копии базы данных на сервер
#mysql -u root wordpress < wp.sql
#mysql -u root mysql < mybase

#./etc/init.d/mariadb stop
#/usr/bin/mysqld --user=root --datadir=/var/lib/mysql

#supervisord
#/usr/bin/supervisord -c /etc/supervisord.conf
#mysqld -uroot