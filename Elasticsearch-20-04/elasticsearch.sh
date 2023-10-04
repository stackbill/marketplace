#!/bin/bash

mkdir -p /usr/local/src/elasticsearch

cd /usr/local/src/elasticsearch && wget https://raw.githubusercontent.com/stackbill/marketplace/main/Elasticsearch-20-04/elasticsearch-cleanup.sh

cd /usr/local/src/elasticsearch && wget https://raw.githubusercontent.com/stackbill/marketplace/main/Elasticsearch-20-04/elasticsearch.yml