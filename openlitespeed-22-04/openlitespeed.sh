#!/bin/bash

mkdir -p {/usr/local/src/openlitespeed-22-04/var/www/html/,/usr/local/src/openlitespeed-22-04/opt/cloudstack/,/usr/local/src/openlitespeed-22-04/}

cd /usr/local/src/openlitespeed-22-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/openlitespeed-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/openlitespeed-cleanup.sh

cd /usr/local/src/openlitespeed-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/openlitespeed-22-04/openlitespeed.yaml