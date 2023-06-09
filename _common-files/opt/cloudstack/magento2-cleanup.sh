#!/bin/bash

RED='\033[1;31m'
NC='\033[0m'

echo -e "${RED}
################################################################################################################
#                              Your MarketPlace App has been deployed successfully!                            #
#                                 Passwords are stored under /root/                                            #
################################################################################################################
${NC}"

echo
echo -e "${RED}This message will be removed in the next login!${NC}"
echo
echo
echo -e "${RED}Use the Below Password for logging into MySQL${NC}"
echo
cat /root/.mysql_root_password
echo
echo -e "${RED}Refer to the below magento database login details${NC}"
echo
cat /root/.magento_database_details
echo


#Cleanup script
rm -rf /usr/local/src/
mkdir -p /usr/local/src/
rm -rf /var/lib/cloud/instances/*
rm -rf /var/lib/cloud/data/*
find /var/log -mtime -1 -type f -exec truncate -s 0 {} \; >/dev/null 2>&1
rm -rf /var/log/*.gz /var/log/*.[0-9] /var/log/*-????????
cat /dev/null > /var/log/lastlog; cat /dev/null > /var/log/wtmp
apt-get -y autoremove >/dev/null 2>&1
apt-get -y autoclean >/dev/null 2>&1
history -c
cat /dev/null > /root/.bash_history
unset HISTFILE

magento_mysql_pass=$(cat /root/.magento_database_details | grep password -i | cut -d '"' -f 2)




#To replace the Domain Name in the apache configuration 
a=0
while [ $a -eq 0 ]
do
 echo -e "${RED}To cancel setup, press Ctrl+C.  This script will run again on your next login:${NC}"
 echo -e "${RED}Enter the domain name for your new Magento2 site:${NC}"
 echo -e "${RED}(ex. example.org or test.example.org) do not include www or http/s:${NC}"
 read -p "Domain/Subdomain name: " dom
 if [ -z "$dom" ]
 then
  a=0
  echo -e "${RED}Please provide a valid domain or subdomain name to continue to press Ctrl+C to cancel${NC}"
 else
  a=1
fi
done

sed -i "s/\$domain/$dom/g"  /etc/apache2/sites-available/000-default.conf

systemctl restart apache2

# workarround to make sure elasticsearch enabled and started
/lib/systemd/systemd-sysv-install enable elasticsearch
service elasticsearch start

# Set some default zero values
email="0"
adminUsername="0"
adminPass="0"
secure="0"

echo -en "\n\n"
echo -en "Creating Magento admin login credentials."

while [ $email == "0" ]
do
        echo -en "\n\n"
        read -p "Enter your Email Address: " email
done

echo -en "\n"
echo "Please enter your admin username."
while [ $adminUsername == "0" ]
do
        read -p  "Username: " adminUsername
done

echo -en "\n"
echo "Please enter your password."
echo "*Note: Password should be at least 6 characters long with one digit and one Upper case Alphabet."

flag=false
while [[ "$flag" = false ]]; do
        read -s -p "Password: " adminPass

        if [[ ${#adminPass} -ge 6 && "$adminPass" == *[[:lower:]]* && "$adminPass" == *[[:upper:]]* && "$adminPass" == *[0-9]* ]]; then
            flag=true
            echo -en "\n"
            echo "Password criteria is correct."
        else
            echo -en "\n"
            echo "Password criteria: Password should be at least 6 characters long with one digit and one Upper case Alphabet"
            echo "Try again..."
            echo -en "\n"
        fi
done

echo -en "\n\n\n"

#SSL configuration
echo -en "\n\n\n"
echo "Next, you have the option of configuring LetsEncrypt to secure your new site."
echo "Before doing this, be sure that you have pointed your domain or subdomain to this server's IP address."
echo "You can also run LetsEncrypt certbot later with the command 'certbot'"
echo -en "\n\n"
 read -p "Would you like to use LetsEncrypt (certbot) to configure SSL(https) for your new site? (y/n): " yn
    case $yn in
        [Yy]* )
                systemctl stop apache2;
                certbot certonly --standalone --preferred-challenges http --http-01-port 8080 -d "$dom";
                systemctl start apache2;

                cd /etc/apache2/sites-available/
                a2ensite default-ssl.conf
                sed -i "s/\$domain/$dom/g"  /etc/apache2/sites-available/default-ssl.conf
                systemctl reload apache2
                cd ~

                secure="1";
                echo "Magento has been enabled at https://$dom/  Please open this URL in a browser after installation process.";;
        [Nn]* )
                a2dismod ssl;
                cp /etc/varnish/default.vcl.original /etc/varnish/default.vcl
                systemctl restart varnish

                echo "Skipping LetsEncrypt certificate generation";;
        * ) echo "Please answer y or n.";;
    esac

# Configure SMTP messages to Magento 2 admin email
cat > /etc/aliases <<EOM
postmaster:    root
root:          $email
EOM
sudo newaliases

cd /var/www

echo "Download Magento 2..."

sudo -u www-data composer create-project --prefer-dist --no-dev --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.* magento2

#Config Magento for access
if [ -d "magento2" ]; then
  mv /var/www/html /var/www/html.old
  sudo -u www-data mv magento2 html
fi

cd /var/www/html

echo -en "Installing Magento 2 patches..."
sudo -u www-data composer require magento/quality-patches
patches=$(sudo -u www-data php vendor/bin/magento-patches status | awk '{print $2}' | grep "MDVA" | tr '\n' ' '  || true)
sudo -u www-data php vendor/bin/magento-patches apply $patches || true

echo -en "Completing the configuration of Magento 2."

sudo -u www-data composer install

sudo -u www-data php bin/magento setup:install \
        --admin-firstname="Magento" \
        --admin-lastname="User" \
        --admin-email="$email" \
        --admin-user="$adminUsername" \
        --admin-password="$adminPass" \
        --base-url=http://"$dom" \
        --base-url-secure=https://"$dom" \
        --use-secure="$secure" \
        --use-secure-admin="$secure" \
        --db-host="localhost" \
        --db-name="magento_db" \
        --db-user="magento_user" \
        --db-password="$magento_mysql_pass" \
        --currency="USD" \
        --backend-frontname="admin" \
        --language="en_US" \
        --use-rewrites="1" \
        --session-save="redis" \
        --session-save-redis-host="127.0.0.1" \
        --session-save-redis-port="6379" \
        --session-save-redis-timeout="5" \
        --session-save-redis-persistent-id="" \
        --session-save-redis-db="10" \
        --session-save-redis-max-concurrency="30" \
        --session-save-redis-break-after-frontend="10" \
        --session-save-redis-break-after-adminhtml="30" \
        --session-save-redis-disable-locking="1" \
        --cache-backend="redis" \
        --cache-backend-redis-server="127.0.0.1" \
        --cache-backend-redis-db="0" \
        --cache-backend-redis-port="6379" \
        --page-cache="redis" \
        --page-cache-redis-server="127.0.0.1" \
        --page-cache-redis-db="1" \
        --page-cache-redis-port="6379"

echo -en "\n"
 read -p "Would you like to install Magento 2 Sample Data? (y/n): " yn
    case $yn in
        [Yy]* ) sudo -u www-data php bin/magento sampledata:deploy --no-update && sudo -u www-data composer update && sudo -u www-data php bin/magento setup:upgrade && echo "Magento Sample Data was installed successfully";;
        [Nn]* ) echo "Skipping Magento 2 Sample Data installing.";;
        * ) echo "Please answer y or n.";;
    esac

sudo -u www-data php bin/magento module:disable Magento_AdminAdobeImsTwoFactorAuth Magento_TwoFactorAuth

sudo -u www-data php bin/magento cache:clean
rm -rf /var/www/html/generated
sudo -u www-data php bin/magento deploy:mode:set production

sudo -u www-data php bin/magento config:set system/full_page_cache/caching_application 2
sudo -u www-data php bin/magento config:set web/unsecure/base_media_url "http://$dom/media/"
sudo -u www-data php bin/magento config:set web/secure/base_media_url "https://$dom/media/"

sudo -u www-data php bin/magento setup:config:set --http-cache-hosts="127.0.0.1:80"

sudo -u www-data php /opt/cloudstack/update_config.php
sudo -u www-data php bin/magento cron:install --force

rm -rf /var/www/.config/composer/auth.json

cp /opt/cloudstack/auth.json-def /var/www/.config/composer/auth.json

chown -Rf www-data:www-data /var/www/

sleep 5

echo "Installation complete. Access your new Magento site http://$dom/ in a browser to continue."

rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root
rm -rf /opt/cloudstack