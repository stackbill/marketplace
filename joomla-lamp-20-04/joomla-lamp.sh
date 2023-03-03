#!/bin/bash

mkdir -p {/usr/local/src/joomla-lamp-20-04/etc/apache2/sites-available/,/usr/local/src/joomla-lamp-20-04/var/www/html/,/usr/local/src/joomla-lamp-20-04/etc/apache2/conf-enabled/,/usr/local/src/joomla-lamp-20-04/usr/share/phpmyadmin/,/usr/local/src/joomla-lamp-20-04/opt/cloudstack/,/usr/local/src/joomla-lamp-20-04/}

cd /usr/local/src/joomla-lamp-20-04/etc/apache2/sites-available/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/apache2/sites-available/001-default.conf

cd /usr/local/src/joomla-lamp-20-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/joomla-lamp-20-04/etc/apache2/conf-enabled/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/apache2/conf-enabled/phpmyadmin.conf

cd /usr/local/src/joomla-lamp-20-04/usr/share/phpmyadmin/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/usr/share/phpmyadmin/.htaccess

cd /usr/local/src/joomla-lamp-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/joomla-setup.sh

cd /usr/local/src/joomla-lamp-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/joomla-lamp-20-04/joomla-lamp.yaml