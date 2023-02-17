#!/bin/bash

mkdir -p {/usr/local/src/lemp-20-04/etc/nginx/sites-available/,/usr/local/src/lemp-20-04/var/www/html/,/usr/local/src/lemp-20-04/opt/cloudstack/,/usr/local/src/lemp-20-04/}

cd /usr/local/src/lemp-20-04/etc/nginx/sites-available/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/etc/nginx/sites-available/Cloudstack

cd /usr/local/src/lemp-20-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/var/www/html/index.html

cd /usr/local/src/lemp-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/lamp_cleanup.sh

cd /usr/local/src/lemp-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/lemp-20-04/lemp.yaml