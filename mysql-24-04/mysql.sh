#!/bin/bash

mkdir -p {/usr/local/src/mysql-24-04/opt/cloudstack/,/usr/local/src/mysql-24-04/}
cd /usr/local/src/mysql-24-04/opt/cloudstack/ && wget https://github.com/kanagarajb0720/marketplace/blob/main/mysql-24-04/mysql-cleanup.sh
cd /usr/local/src/mysql-24-04/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/mysql-24-04/mysql-install.yaml