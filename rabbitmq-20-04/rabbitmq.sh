#!/bin/bash

mkdir -p {/usr/local/src/rabbitmq-20-04/opt/cloudstack/,/usr/local/src/rabbitmq-20-04/}

cd /usr/local/src/rabbitmq-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/rabbitmq-cleanup.sh

cd /usr/local/src/rabbitmq-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/rabbitmq-20-04/rabbitmq.yaml