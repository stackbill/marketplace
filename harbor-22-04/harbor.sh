#!/bin/bash

mkdir -p {/usr/local/src/harbor/opt/cloudstack/,/usr/local/src/harbor}

wget -O /usr/local/src/harbor/opt/cloudstack/cleanup.sh https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/harbor-22-04/cleanup.sh

chmod +x /usr/local/src/harbor/opt/cloudstack/cleanup.sh

cd /usr/local/src/harbor/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/harbor-22-04/harbor-install.yml
