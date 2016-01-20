#!/bin/bash

cp -r /etc/nginx/sites-available /etc/nginx/sites-enabled

sed -i "s/%fpm-ip%/$PHP_PORT_9000_TCP_ADDR/" /etc/nginx/nginx.conf
sed -i "s/%fpm-port%/$PHP_PORT_9000_TCP_PORT/" /etc/nginx/nginx.conf

chown -R www-data:www-data /app
nginx -g "daemon off;"
