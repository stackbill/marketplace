#!/bin/bash

mkdir -p {/usr/local/src/opensearch-20-04/var/www/html/,/usr/local/src/opensearch-20-04/etc/systemd/system/,/usr/local/src/opensearch-20-04/opt/cloudstack/,/usr/local/src/opensearch-20-04/}

cd /usr/local/src/opensearch-20-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/opensearch-20-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/systemd/system/opensearch.service

cd /usr/local/src/opensearch-20-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/systemd/system/opensearch-dashboards.service

cd /usr/local/src/opensearch-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/opensearch-cleanup.sh

cd /usr/local/src/opensearch-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/opensearch-20-04/opensearch.yaml

cd /usr/local/src/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/usr/local/src/add.sh
