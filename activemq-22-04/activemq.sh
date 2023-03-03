#!/bin/bash

mkdir -p {/usr/local/src/activemq-22-04/etc/systemd/system/,/usr/local/src/activemq-22-04/opt/cloudstack/,/usr/local/src/activemq-22-04/}

cd /usr/local/src/activemq-22-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/etc/systemd/system/activemq.service

cd /usr/local/src/activemq-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/activemq-cleanup.sh

cd /usr/local/src/activemq-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/activemq-22-04/activemq.yaml
