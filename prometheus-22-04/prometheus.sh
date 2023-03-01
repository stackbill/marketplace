#!/bin/bash

mkdir -p {/usr/local/src/prometheus-22-04/etc/prometheus/,/usr/local/src/prometheus-22-04/etc/systemd/system/,/usr/local/src/prometheus-22-04/opt/cloudstack/,/usr/local/src/prometheus-22-04/}

cd /usr/local/src/prometheus-22-04/etc/prometheus/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/etc/prometheus/prometheus.yml

cd /usr/local/src/prometheus-22-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/etc/systemd/system/prometheus.service

cd /usr/local/src/prometheus-22-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/etc/systemd/system/node_exporter.service

cd /usr/local/src/prometheus-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/cleanup.sh

cd /usr/local/src/prometheus-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/prometheus-22-04/prometheus.yaml
