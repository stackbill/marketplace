#!/bin/bash

mkdir -p {/usr/local/src/postgresql-22-04/opt/cloudstack/,/usr/local/src/postgresql-22-04/}

cd /usr/local/src/postgresql-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/cleanup.sh

cd /usr/local/src/postgresql-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/postgresql-22-04/postgresql.yaml