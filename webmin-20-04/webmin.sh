#!/bin/bash

mkdir -p {/usr/local/src/webmin-20-04/opt/cloudstack/,/usr/local/src/webmin-20-04/}

cd /usr/local/src/webmin-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/webmin.sh

cd /usr/local/src/webmin-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/webmin-20-04/webmin.yaml