#!/bin/bash

mkdir -p {/usr/local/src/cloudpanel-24-04/opt/cloudstack/,/usr/local/src/cloudpanel-24-04/}

cd /usr/local/src/cloudpanel-24-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/cloudpanel-24-04/cleanup.sh

cd /usr/local/src/cloudpanel-24-04/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/cloudpanel-24-04/cloudpanel.yaml