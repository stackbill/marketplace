#!/bin/bash

mkdir -p {/usr/local/src/influxdb-22-04/opt/cloudstack/,/usr/local/src/influxdb-22-04/}

cd /usr/local/src/influxdb-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/cleanup.sh

cd /usr/local/src/influxdb-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/influxdb-22-04/influxdb.yaml