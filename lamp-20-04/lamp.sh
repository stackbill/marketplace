#!/bin/bash

mkdir -p {/usr/local/src/lamp-20-04/etc/apache2/sites-available/,/usr/local/src/lamp-20-04/var/www/html/,/usr/local/src/lamp-20-04/opt/cloudstack/,/usr/local/src/lamp-20-04/}

cd /usr/local/src/lamp-20-04/etc/apache2/sites-available/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/etc/apache2/sites-available/000-default.conf

cd /usr/local/src/lamp-20-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/var/www/html/index.html

cd /usr/local/src/lamp-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/lamp_cleanup.sh

cd /usr/local/src/lamp-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/lamp-20-04/lamp.yaml 
