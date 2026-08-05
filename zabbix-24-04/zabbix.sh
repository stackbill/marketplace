#!/bin/bash

mkdir -p {/usr/local/src/zabbix-24-04/etc/apache2/sites-available/,/usr/local/src/zabbix-24-04/var/www/html/,/usr/local/src/zabbix-24-04/opt/cloudstack/,/usr/local/src/zabbix-24-04/}

cd /usr/local/src/zabbix-24-04/etc/apache2/sites-available/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/zabbix-24-04/000-default.conf

cd /usr/local/src/zabbix-24-04/var/www/html/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/zabbix-24-04/index.html

cd /usr/local/src/zabbix-24-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/zabbix-24-04/zabbix_cleanup.sh

cd /usr/local/src/zabbix-24-04/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/zabbix-24-04/zabbix.yaml