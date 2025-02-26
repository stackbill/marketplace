#!/bin/bash

mkdir -p {/usr/local/src/harbor/opt/cloudstack/,/usr/local/src/harbor}

wget -O /usr/local/src/harbor/opt/cloudstack/cleanup.sh https://raw.githubusercontent.com/kanagarajb0720/marketplace/main/harbor-22-04/cleanup.sh

wget -O /usr/local/src/harbor/harbor-install.yml https://raw.githubusercontent.com/kanagarajb0720/marketplace/main/harbor-22-04/harbor-install.yml
