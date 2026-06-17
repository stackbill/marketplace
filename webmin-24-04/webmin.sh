#!/bin/bash

mkdir -p {/usr/local/src/webmin-24-04/opt/cloudstack/,/usr/local/src/webmin-24-04/}

cd /usr/local/src/webmin-24-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/webmin-24-04/cleanup.sh

cd /usr/local/src/webmin-24-04/ && wget https://raw.githubusercontent.com/kanagarajb0720/marketplace/refs/heads/main/webmin-24-04/webmin.yaml