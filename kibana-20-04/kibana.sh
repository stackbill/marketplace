#!/bin/bash

mkdir -p /usr/local/src/kibana

cd /usr/local/src/kibana && wget https://raw.githubusercontent.com/stackbill/marketplace/main/kibana/kibana-cleanup.sh

cd /usr/local/src/kibana && wget https://raw.githubusercontent.com/stackbill/marketplace/main/kibana/kibana.yml

cd /usr/local/src/kibana && wget https://raw.githubusercontent.com/stackbill/marketplace/main/kibana/30-elasticsearch-output.conf

cd /usr/local/src/kibana && wget https://raw.githubusercontent.com/stackbill/marketplace/main/kibana/kibana