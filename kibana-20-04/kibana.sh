#!/bin/bash

mkdir -p /usr/local/src/kibana

cd /usr/local/src/kibana && wget https://raw.githubusercontent.com/stackbill/marketplace/main/kibana-20-04/kibana-cleanup.sh

cd /usr/local/src/kibana && wget https://raw.githubusercontent.com/stackbill/marketplace/main/kibana-20-04/kibana.yml

cd /usr/local/src/kibana && wget https://raw.githubusercontent.com/stackbill/marketplace/main/kibana-20-04/30-elasticsearch-output.conf

cd /usr/local/src/kibana && wget https://raw.githubusercontent.com/stackbill/marketplace/main/kibana-20-04/kibana