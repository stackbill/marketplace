#!/bin/bash

mkdir -p {/usr/local/src/mongodb-20-04/opt/cloudstack/,/usr/local/src/mongodb-20-04/}

cd /usr/local/src/mongodb-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/cleanup.sh

cd /usr/local/src/mongodb-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/mongodb-20-04/mongodb.yaml