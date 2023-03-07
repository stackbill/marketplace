#!/bin/bash

mkdir -p {/usr/local/src/laravel-22-04/etc/nginx/sites-available/,/usr/local/src/laravel-22-04/var/www/html/,/usr/local/src/laravel-22-04/opt/cloudstack/,/usr/local/src/laravel-22-04/}

cd /usr/local/src/laravel-22-04/etc/nginx/sites-available/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/nginx/sites-available/laravel

cd /usr/local/src/laravel-22-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/laravel-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/laravel-cleanup.sh

cd /usr/local/src/laravel-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/laravel-22-04/composer.sh

cd /usr/local/src/laravel-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/laravel-22-04/laravel.yaml