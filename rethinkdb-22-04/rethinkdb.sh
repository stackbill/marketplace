#!/bin/bash

mkdir -p {/usr/local/src/rethinkdb-22-04/opt/cloudstack/,/usr/local/src/rethinkdb-22-04/}

cd /usr/local/src/rethinkdb-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/rethinkdb-cleanup.sh

cd /usr/local/src/rethinkdb-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/rethinkdb-22-04/rethinkdb.yaml