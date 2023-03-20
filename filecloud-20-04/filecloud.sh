#!/bin/bash

mkdir -p {/usr/local/src/filecloud-20-04/opt/cloudstack/,/usr/local/src/filecloud-20-04/}

cd /usr/local/src/filecloud-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/filecloud-cleanup.sh

cd /usr/local/src/filecloud-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/filecloud-20-04/filecloud.yaml