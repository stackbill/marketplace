#!/bin/bash

mkdir -p {/usr/local/src/nodejs-22-04/etc/nginx/sites-available/nodejs/,/usr/local/src/nodejs-22-04/var/www/html/,/usr/local/src/nodejs-22-04/opt/cloudstack/,/usr/local/src/nodejs-22-04/}

cd /usr/local/src/nodejs-22-04/etc/nginx/sites-available/nodejs/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/nginx/sites-available/nodejs/default

cd /usr/local/src/nodejs-22-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/hello.js

cd /usr/local/src/nodejs-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/nodejscleanup.sh

cd /usr/local/src/nodejs-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/nodejs-22-04/nodejs.yaml
