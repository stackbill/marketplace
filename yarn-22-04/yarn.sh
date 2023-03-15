#!/bin/bash

mkdir -p {/usr/local/src/yarn-22-04/opt/cloudstack/,/usr/local/src/yarn-22-04/}

cd /usr/local/src/yarn-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/cleanup.sh

cd /usr/local/src/yarn-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/yarn-22-04/yarn.yaml