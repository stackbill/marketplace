#!/bin/bash

mkdir -p {/usr/local/src/harbor/opt/cloudstack/,/usr/local/src/harbor}

wget -O /usr/local/src/harbor/condition.sh https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/harbor-ssl-22-04/condition.sh

chmod +x /usr/local/src/harbor/condition.sh

wget -O /usr/local/src/harbor/opt/cloudstack/harbor-cleanup.sh https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/harbor-ssl-22-04/cleanup.sh

chmod +x /usr/local/src/harbor/opt/cloudstack/cleanup.sh

wget -O /usr/local/src/harbor/harbor-install.yml https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/harbor-ssl-22-04/harbor-install.yml
