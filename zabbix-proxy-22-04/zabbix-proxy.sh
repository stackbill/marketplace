#!/bin/bash

mkdir -p {/usr/local/src/zabbix-proxy-22-04/opt/cloudstack/,/usr/local/src/zabbix-proxy-22-04/}

cd /usr/local/src/zabbix-proxy-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/zabbix_proxy_cleanup.sh

cd /usr/local/src/zabbix-proxy-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/zabbix-proxy-22-04/zabbix-proxy.yaml 
