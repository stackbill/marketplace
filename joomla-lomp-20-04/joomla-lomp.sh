#!/bin/bash

mkdir -p {/usr/local/src/joomla-lomp-20-04/,/usr/local/src/joomla-lomp-20-04/opt/cloudstack/,/usr/local/src/joomla-lomp-20-04/var/www/html/}

cd /usr/local/src/joomla-lomp-20-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/var/www/html/index.html

cd /usr/local/src/joomla-lomp-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/joomla-lomp.sh

cd /usr/local/src/joomla-lomp-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/joomla-lomp-20-04/joomla-lomp.yaml