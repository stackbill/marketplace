mkdir -p {/usr/local/src/nginx-20-04/etc/nginx/sites-available/,/usr/local/src/nginx-20-04/var/www/html/,/usr/local/src/nginx-20-04/opt/cloudstack/,/usr/local/src/nginx-20-04/}

cd /usr/local/src/nginx-20-04/etc/nginx/sites-available/ && https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/etc/nginx/sites-available/Cloudstack

cd /usr/local/src/nginx-20-04/var/www/html/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/var/www/html/index.html

cd /usr/local/src/nginx-20-04/opt/cloudstack/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/common-files/opt/cloudstack/cleanup.sh

cd /usr/local/src/nginx-20-04/ && wget https://raw.githubusercontent.com/stackbill/marketplace/main/nginx-20-04/nginx.yaml