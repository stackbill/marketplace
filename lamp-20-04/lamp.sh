#!/bin/bash/

mkdir -p {/usr/local/src/lamp-20-04/etc/apache2/sites-available/,/usr/local/src/lamp-20-04/var/www/html/,/usr/local/src/lamp-20-04/opt/cloudstack/,/usr/local/src/lamp-20-04/}

cd /usr/local/src/lamp-20-04/etc/apache2/sites-available/ && wget https://github.com/stackbill/marketplace/raw/main/common-files/etc/apache2/sites-available/000-default.conf

cd /usr/local/src/lamp-20-04/var/www/html/ && wget https://github.com/stackbill/marketplace/raw/main/common-files/var/www/html/index.html

cd /usr/local/src/lamp-20-04/opt/cloudstack/ && wget https://github.com/stackbill/marketplace/raw/main/common-files/opt/cloudstack/lamp_cleanup.sh

cd /usr/local/src/lamp-20-04/ && wget https://github.com/stackbill/marketplace/raw/main/common-files/lamp.yaml 
