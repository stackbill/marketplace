#!/bin/bash

mkdir -p {/usr/local/src/prometheus-24-04/etc/prometheus/,/usr/local/src/prometheus-24-04/etc/systemd/system/,/usr/local/src/prometheus-24-04/opt/cloudstack/,/usr/local/src/prometheus-24-04/}

cd /usr/local/src/prometheus-24-04/etc/prometheus/ && wget https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/prometheus-24-04/configuration.yaml

cd /usr/local/src/prometheus-24-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/prometheus-24-04/prometheus.service

cd /usr/local/src/prometheus-24-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/prometheus-24-04/node_exporter.service

cd /usr/local/src/prometheus-24-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/cleanup.sh

cd /usr/local/src/prometheus-24-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/prometheus-24-04/prometheus.yaml