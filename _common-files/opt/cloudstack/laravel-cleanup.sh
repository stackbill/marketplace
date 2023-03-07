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
echo -e "${RED}Refer to the below MySQL root password${NC}"
echo
cat /root/.mysql_root_password
echo
echo -e "${RED}Refer to the below Laravel Database Credentials${NC}"
echo
cat /root/.laravel_database_details
echo
echo -e "${RED}Refer to the below Laravel Shell Login Credentials${NC}"
echo
cat /root/.shell_user_passwords
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

usermod -a -G laravel www-data

chmod -R 775 /var/www/laravel/storage

# Setup Laravel on firstlogin
echo "--------------------------------------------------"
echo "This setup requires a domain name.  If you do not have one yet, you may"
echo "cancel this setup, press Ctrl+C.  This script will run again on your next login"
echo "--------------------------------------------------"
echo "Enter the domain name for your new Laravel site."
echo "(ex. example.org or test.example.org) do not include www or http/s"
echo "--------------------------------------------------"

a=0
while [ $a -eq 0 ]
do
 read -p "Domain/Subdomain name: " dom
 if [ -z "$dom" ]
 then
  a=0
  echo "Please provide a valid domain or subdomain name to continue to press Ctrl+C to cancel"
 else
  a=1
fi
done

sed -i "s/DOMAIN/$dom/g"  /etc/nginx/sites-enabled/laravel

systemctl restart nginx.service php8.2-fpm.service

# Set default PHP version
update-alternatives --set php /usr/bin/php8.2

rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root