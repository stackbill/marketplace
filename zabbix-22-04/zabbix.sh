#!/bin/bash

mkdir -p {/usr/local/src/zabbix-22-04/etc/apache2/sites-available/,/usr/local/src/zabbix-22-04/var/www/html/,/usr/local/src/zabbix-22-04/opt/cloudstack/,/usr/local/src/zabbix-22-04/}

cd /usr/local/src/zabbix-22-04/etc/apache2/sites-available/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/apache2/sites-available/000-default.conf

cd /usr/local/src/zabbix-22-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/zabbix-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/zabbix_cleanup.sh

cd /usr/local/src/zabbix-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/zabbix-22-04/zabbix.yaml 
