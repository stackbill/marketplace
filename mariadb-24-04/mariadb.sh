#!/bin/bash

mkdir -p {/usr/local/src/mariadb-24-04/opt/cloudstack/,/usr/local/src/mariadb-24-04/}

cd /usr/local/src/mariadb-24-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/mariadb-24-04/mariadb-cleanup.sh

cd /usr/local/src/mariadb-24-04/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/mariadb-24-04/mariadb-24-04.yaml