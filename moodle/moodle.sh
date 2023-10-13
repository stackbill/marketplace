#!/bin/bash

mkdir -p /usr/local/src/moodle

cd /usr/local/src/moodle && wget https://raw.githubusercontent.com/stackbill/marketplace/main/moodle/moodle-cleanup.sh

cd /usr/local/src/moodle && wget https://raw.githubusercontent.com/stackbill/marketplace/main/moodle/moodle.yaml

cd /usr/local/src/moodle && wget https://raw.githubusercontent.com/stackbill/marketplace/main/moodle/moodle.conf