#!/bin/bash

mkdir -p {/usr/local/src/drupal-lomp-22-04/,/usr/local/src/drupal-lomp-22-04/opt/cloudstack/,/usr/local/src/drupal-lomp-22-04/var/www/html/}

cd /usr/local/src/drupal-lomp-22-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/drupal-lomp-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/drupal-cleanup.sh

cd /usr/local/src/drupal-lomp-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/drupal-lomp-22-04/composer.sh

cd /usr/local/src/drupal-lomp-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/drupal-lomp-22-04/drupal-lomp.yaml