#!/bin/bash

mkdir -p {/usr/local/src/rocket-chat-20-04/opt/cloudstack/,/usr/local/src/rocket-chat-20-04/}

cd /usr/local/src/rocket-chat-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/rocket-chat-cleanup.sh

cd /usr/local/src/rocket-chat-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/rocket-chat-20-04/rocket-chat.yaml