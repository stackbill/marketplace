#!/bin/bash

mkdir -p {/usr/local/src/varnish-20-04/etc/systemd/system/,/usr/local/src/varnish-20-04/etc/varnish/,/usr/local/src/varnish-20-04/opt/cloudstack/,/usr/local/src/varnish-20-04/}

cd /usr/local/src/varnish-20-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/systemd/system/override.conf

cd /usr/local/src/varnish-20-04/etc/varnish/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/varnish/welcome.html

cd /usr/local/src/varnish-20-04/etc/varnish/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/varnish/default.vcl

cd /usr/local/src/varnish-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/varnish-cleanup.sh

cd /usr/local/src/varnish-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/varnish-20-04/varnish.yaml