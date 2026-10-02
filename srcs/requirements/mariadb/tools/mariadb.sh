#!/bin/bash
service mariadb start
sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS $NAME_DB"
mysql -e "CREATE USER '$NAME_USER_DB'@'%' IDENTIFIED BY '$PSW_USER_DB'"
mysql -e "GRANT ALL PRIVILEGES ON $NAME_DB.* TO '$NAME_USER_DB'@'%'"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$PSW_ROOT_DB'"
mysql -e "FLUSH PRIVILEGES"

mysqladmin -u root -p$PSW_ROOT_DB shutdown
mysqld_safe