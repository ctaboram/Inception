#!/bin/bash
mkdir /var/www/wordpress
cd /var/www/wordpress

#Esto es para descargar wp-cli que es para conseguir el comando wp
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
#Con el comando wp, podemos descargar wordpress
wp core download --allow-root
wp config create --dbname=$NAME_DB --dbuser=$NAME_USER_DB --dbpass=$PSW_USER_DB --dbhost=mariadb --allow-root
wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$NAME_ROOT_DB --admin_password=$PSW_ROOT_DB --admin_email=admin@ctaboada.42.fr --allow-root

wp user create $NAME_USER_DB usuario@ctaboada.42.fr --role=author --user_pass=$PSW_USER_DB --allow-root

php-fpm7.4 -F