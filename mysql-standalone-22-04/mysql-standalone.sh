#!/bin/bash

mkdir -p {/usr/local/src/mysql-standalone-22-04/opt/cloudstack/,/usr/local/src/mysql-standalone-22-04/}

cd /usr/local/src/mysql-standalone-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/mysql-standalone-cleanup.sh

cd /usr/local/src/mysql-standalone-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/mysql-standalone-22-04/mysql-standalone.yaml