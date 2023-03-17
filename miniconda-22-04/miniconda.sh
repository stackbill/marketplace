#!/bin/bash

mkdir -p {/usr/local/src/miniconda-22-04/opt/cloudstack/,/usr/local/src/miniconda-22-04/}

cd /usr/local/src/miniconda-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/miniconda-cleanup.sh

cd /usr/local/src/miniconda-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/miniconda-22-04/miniconda.yaml