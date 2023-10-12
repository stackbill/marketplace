#!/bin/bash

mkdir -p /usr/local/src/odoo

cd /usr/local/src/odoo && wget https://raw.githubusercontent.com/stackbill/marketplace/main/odoo/odoo-cleanup.sh

cd /usr/local/src/odoo && wget https://raw.githubusercontent.com/stackbill/marketplace/main/odoo/odoo.yaml

cd /usr/local/src/odoo && wget https://raw.githubusercontent.com/stackbill/marketplace/main/odoo/odoo.conf
