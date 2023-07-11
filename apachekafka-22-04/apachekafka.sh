#!/bin/bash

mkdir -p {/usr/local/src/apachekafka-22-04/opt/cloudstack/,/usr/local/src/apachekafka-22-04/,/usr/local/src/apachekafka-22-04/opt/kafka/config/,/usr/local/src/apachekafka-22-04/etc/systemd/system/}

cd /usr/local/src/apachekafka-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/apachekafka-cleanup.sh

cd /usr/local/src/apachekafka-22-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/systemd/system/zookeeper.service

cd /usr/local/src/apachekafka-22-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/systemd/system/kafka.service

cd /usr/local/src/apachekafka-22-04/opt/kafka/config/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/kafka/config/server.properties

cd /usr/local/src/apachekafka-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/apachekafka-22-04/apachekafka.yaml