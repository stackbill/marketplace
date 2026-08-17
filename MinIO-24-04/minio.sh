#!/bin/bash

mkdir -p {/usr/local/src/minio-24-04/opt/cloudstack/,/usr/local/src/minio-24-04/}

cd /usr/local/src/minio-24-04/opt/cloudstack/ && \
wget -O /usr/local/src/minio-24-04/opt/cloudstack/minio-cleanup.sh \
https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/MinIO-24-04/minio-cleanup.sh

cd /usr/local/src/minio-24-04/ && \
wget -O /usr/local/src/minio-24-04/minio-install.yaml \
https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/MinIO-24-04/minio-install.yaml