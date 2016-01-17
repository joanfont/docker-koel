#!/bin/bash

# replace variables for upstream's ips and ports
sed -i "s/%fpm-ip%/$PHP_PORT_9000_TCP_ADDR/" /etc/nginx/nginx.conf
sed -i "s/%fpm-port%/$PHP_PORT_9000_TCP_PORT/" /etc/nginx/nginx.conf

nginx -g "daemon off;"