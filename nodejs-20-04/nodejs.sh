#!/bin/bash

mkdir -p {/usr/local/src/nodejs-20-04/etc/nginx/sites-available/nodejs/,/usr/local/src/nodejs-20-04/var/www/html/,/usr/local/src/nodejs-20-04/opt/cloudstack/,/usr/local/src/nodejs-20-04/}

cd /usr/local/src/nodejs-20-04/etc/nginx/sites-available/nodejs/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/etc/nginx/sites-available/nodejs/default

cd /usr/local/src/nodejs-20-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/var/www/html/hello.js

cd /usr/local/src/nodejs-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/nodejscleanup.sh

cd /usr/local/src/nodejs-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/nodejs-20-04/nodejs.yaml
