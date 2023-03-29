#!/bin/bash

mkdir -p {/usr/local/src/wordpress-woocommerce-20-04/etc/apache2/sites-available/,/usr/local/src/wordpress-woocommerce-20-04/var/www/html/,/usr/local/src/wordpress-woocommerce-20-04/etc/apache2/conf-available/,/usr/local/src/wordpress-woocommerce-20-04/etc/fail2ban/jail.d/,/usr/local/src/wordpress-woocommerce-20-04/etc/apache2/conf-enabled/,/usr/local/src/wordpress-woocommerce-20-04/usr/share/phpmyadmin/,/usr/local/src/wordpress-woocommerce-20-04/opt/cloudstack/,/usr/local/src/wordpress-woocommerce-20-04/}

cd /usr/local/src/wordpress-woocommerce-20-04/etc/apache2/sites-available/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/apache2/sites-available/001-default.conf

cd /usr/local/src/wordpress-woocommerce-20-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/wordpress-woocommerce-20-04/etc/apache2/conf-available/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/apache2/conf-available/block-xmlrpc.conf

cd /usr/local/src/wordpress-woocommerce-20-04/etc/fail2ban/jail.d/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/fail2ban/jail.d/wordpress-cloudstack.conf

cd /usr/local/src/wordpress-woocommerce-20-04/etc/apache2/conf-enabled/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/apache2/conf-enabled/phpmyadmin.conf

cd /usr/local/src/wordpress-woocommerce-20-04/usr/share/phpmyadmin/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/usr/share/phpmyadmin/.htaccess

cd /usr/local/src/wordpress-woocommerce-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/woocommerce-cleanup.sh

cd /usr/local/src/wordpress-woocommerce-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/wordpress-woocommerce-20-04/woocommerce.yaml