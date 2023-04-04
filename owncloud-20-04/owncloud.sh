#!/bin/bash

mkdir -p {/usr/local/src/owncloud-20-04/etc/apache2/sites-available/,/usr/local/src/owncloud-20-04/var/www/html/,/usr/local/src/owncloud-20-04/opt/cloudstack/,/usr/local/src/owncloud-20-04/}

cd /usr/local/src/owncloud-20-04/etc/apache2/sites-available/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/apache2/sites-available/owncloud.conf

cd /usr/local/src/owncloud-20-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/owncloud-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/owncloud_cleanup.sh

cd /usr/local/src/owncloud-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/owncloud-20-04/occ.sh

cd /usr/local/src/owncloud-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/owncloud-20-04/owncloud.yaml 

