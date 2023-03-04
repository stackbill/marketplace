#!/bin/bash

mkdir -p {/usr/local/src/gitlab-20-04/opt/cloudstack/,/usr/local/src/gitlab-20-04/}

cd /usr/local/src/gitlab-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/gitlab-cleanup.sh

cd /usr/local/src/gitlab-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/gitlab-20-04/gitlab.yaml