#!/bin/bash

mkdir -p {/usr/local/src/django-22-04/etc/nginx/sites-available/django/,/usr/local/src/django-22-04/var/www/html/,/usr/local/src/django-22-04/etc/gunicorn.d/,/usr/local/src/django-22-04/etc/systemd/system/,/usr/local/src/django-22-04/home/django/django_project/django_project/,/usr/local/src/django-22-04/opt/cloudstack/,/usr/local/src/django-22-04/}

cd /usr/local/src/django-22-04/etc/nginx/sites-available/django/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/nginx/sites-available/django/default

cd /usr/local/src/django-22-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/var/www/html/index.html

cd /usr/local/src/django-22-04/etc/gunicorn.d/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/gunicorn.d/gunicorn.py

cd /usr/local/src/django-22-04/etc/systemd/system/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/etc/systemd/system/gunicorn.service

cd /usr/local/src/django-22-04/home/django/django_project/django_project/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/home/django/django_project/django_project/settings.py

cd /usr/local/src/django-22-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/_common-files/opt/cloudstack/djangocleanup.sh

cd /usr/local/src/django-22-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/django-22-04/django.yaml
