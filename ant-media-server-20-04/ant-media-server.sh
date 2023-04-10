#!/bin/bash

mkdir -p {/usr/local/src/ant-media-server-20-04/opt/cloudstack/,/usr/local/src/ant-media-server-20-04/}

cd /usr/local/src/ant-media-server-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/cleanup.sh

cd /usr/local/src/ant-media-server-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/ant-media-server-20-04/ant-media-server.yaml