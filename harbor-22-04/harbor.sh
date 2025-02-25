#!/bin/bash

mkdir -p {/usr/local/src/harbor/opt/cloudstack/,/usr/local/src/harbor}

cd /usr/local/src/harbor/opt/cloudstack/ && wget https://github.com/kanagarajb0720/marketplace/blob/main/harbor-22-04/cleanup.sh

cd /usr/local/src/harbor  && wget https://github.com/kanagarajb0720/marketplace/blob/main/harbor-22-04/harbor-install.yml