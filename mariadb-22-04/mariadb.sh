#!/bin/bash

mkdir -p {/usr/local/src/mariadb-22-04/opt/cloudstack/,/usr/local/src/mariadb-22-04/}

cd /usr/local/src/mariadb-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/mariadb-cleanup.sh

cd /usr/local/src/mariadb-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/mariadb-22-04/mariadb.yaml