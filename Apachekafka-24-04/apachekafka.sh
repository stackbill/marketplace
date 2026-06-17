#!/bin/bash

mkdir -p {/usr/local/src/apachekafka-24-04/opt/cloudstack/,/usr/local/src/apachekafka-24-04/,/usr/local/src/apachekafka-24-04/opt/kafka/config/,/usr/local/src/apachekafka-24-04/etc/systemd/system/}

cd /usr/local/src/apachekafka-24-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/Apachekafka-24-04/apachekafka-cleanup.sh

cd /usr/local/src/apachekafka-24-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/Apachekafka-24-04/zookeeper.service

cd /usr/local/src/apachekafka-24-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/Apachekafka-24-04/kafka.service

cd /usr/local/src/apachekafka-24-04/opt/kafka/config/ && wget https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/Apachekafka-24-04/server.properties

cd /usr/local/src/apachekafka-24-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/Apachekafka-24-04/apachekafka.yaml