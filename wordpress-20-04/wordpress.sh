#!/bin/bash

mkdir -p {/usr/local/src/wordpress-20-04/etc/apache2/sites-available/,/usr/local/src/wordpress-20-04/var/www/html/,/usr/local/src/wordpress-20-04/etc/apache2/conf-available/,/usr/local/src/wordpress-20-04/etc/fail2ban/jail.d/,/usr/local/src/wordpress-20-04/etc/apache2/conf-enabled/,/usr/local/src/wordpress-20-04/usr/share/phpmyadmin/,/usr/local/src/wordpress-20-04/opt/cloudstack/,/usr/local/src/wordpress-20-04/}

/usr/local/src/wordpress-20-04/etc/apache2/sites-available/ && wget https://github.com/stackbill/marketplace/tree/main/common-files/etc/apache2/sites-available/001-default.conf

/usr/local/src/wordpress-20-04/var/www/html/ && wget https://github.com/stackbill/marketplace/tree/main/common-files/var/www/html/index.html

/usr/local/src/wordpress-20-04/etc/apache2/conf-available/ && wget https://github.com/stackbill/marketplace/tree/main/common-files/etc/apache2/conf-available/block-xmlrpc.conf

/usr/local/src/wordpress-20-04/etc/fail2ban/jail.d/ && wget https://github.com/stackbill/marketplace/tree/main/common-files/etc/fail2ban/jail.d/wordpress-cloudstack.conf

/usr/local/src/wordpress-20-04/etc/apache2/conf-enabled/ && wget https://github.com/stackbill/marketplace/tree/main/common-files/etc/apache2/conf-enabled/phpmyadmin.conf

/usr/local/src/wordpress-20-04/usr/share/phpmyadmin/ && wget https://github.com/stackbill/marketplace/tree/main/common-files/usr/share/phpmyadmin/.htaccess

/usr/local/src/wordpress-20-04/opt/cloudstack/ && wget https://github.com/stackbill/marketplace/tree/main/common-files/opt/cloudstack/wp-setup.sh

/usr/local/src/wordpress-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/wordpress-20-04/wordpress.yaml