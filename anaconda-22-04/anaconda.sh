#!/bin/bash

mkdir -p {/usr/local/src/anaconda-22-04/opt/cloudstack/,/usr/local/src/anaconda-22-04/}

cd /usr/local/src/anaconda-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/anaconda-cleanup.sh

cd /usr/local/src/anaconda-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/anaconda-22-04/anaconda.yaml