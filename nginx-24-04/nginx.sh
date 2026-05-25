#!/bin/bash

mkdir -p {/usr/local/src/nginx-24-04/etc/nginx/sites-available/,/usr/local/src/nginx-24-04/var/www/html/,/usr/local/src/nginx-24-04/opt/cloudstack/,/usr/local/src/nginx-24-04/}

cd /usr/local/src/nginx-24-04/etc/nginx/sites-available/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/nginx/sites-available/Cloudstack

cd /usr/local/src/nginx-24-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/nginx-24-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/nginx-24-04/nginx-cleanup.sh

cd /usr/local/src/nginx-24-04/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/nginx-24-04/nginx-24-04.yaml