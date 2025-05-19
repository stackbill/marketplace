#!/bin/bash

mkdir -p /usr/local/src/nextcloud

cd /usr/local/src/nextcloud && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/nextcloud/nextcloud.yaml
cd /usr/local/src/nextcloud && wget https://raw.githubusercontent.com/stackbill/marketplace/main/nextcloud/nextcloud.conf
cd /usr/local/src/nextcloud && wget https://raw.githubusercontent.com/stackbill/marketplace/main/nextcloud/nextcloud-cleanup.sh