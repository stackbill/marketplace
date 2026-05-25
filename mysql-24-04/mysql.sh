#!/bin/bash

mkdir -p {/usr/local/src/mysql-24-04/opt/cloudstack/,/usr/local/src/mysql-24-04/}
cd /usr/local/src/mysql-24-04/opt/cloudstack/ && wget -O /usr/local/src/mysql-24-04/opt/cloudstack/mysql-cleanup.sh https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/mysql-24-04/mysql-cleanup.sh
cd /usr/local/src/mysql-24-04/ && wget -O /usr/local/src/mysql-24-04/mysql-install.yaml https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/mysql-24-04/mysql-install.yaml