#!/bin/bash

set -e

mkdir -p /usr/local/src/pritunl
cd /usr/local/src/pritunl

wget -O /usr/local/src/pritunl/cleanup.sh https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/pritunl/pritunul-cleanup.sh
chmod +x /usr/local/src/pritunl/cleanup.sh

wget -O /usr/local/src/pritunl/pritunul-install.yaml https://raw.githubusercontent.com/stackbill/marketplace/refs/heads/main/pritunl/pritunul-install.yaml
