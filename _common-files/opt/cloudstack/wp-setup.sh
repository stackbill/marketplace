#!/bin/bash

RED='\033[1;31m'
NC='\033[0m'

echo -e "${RED}
################################################################################################################
#                              Your MarketPlace App has been deployed successfully!                            #
#                                 Passwords are stored under /root/                                            #
#                                 Please spend 2 minutes for configuration                                     #
#                              Kindly update the below configuration to complete the setup                     #
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
echo -e "${RED}Use the Below Password for logging into Phpmyadmin${NC}"
echo
cat /root/.phpmyadmin_password
echo
echo -e "${RED}Refer to the below wordpress database login details${NC}"
echo
cat /root/.wordpress_database_details
echo

# WordPress Salts
for i in `seq 1 8`
do
    wp_salt=$(</dev/urandom tr -dc 'a-zA-Z0-9!@#$%^&*()\-_ []{}<>~`+=,.;:/?|' | head -c 64 | sed -e 's/[\/&]/\\&/g')
    sed -e "0,/put your unique phrase here/s/put your unique phrase here/${wp_salt}/" \
        -i /var/www/html/wp-config.php;
done

#Cleanup script
rm -rf /usr/local/src/
mkdir -p /usr/local/src/
rm -rf /var/lib/cloud/instances/*
rm -rf /var/lib/cloud/data/*
find /var/log -mtime -1 -type f -exec truncate -s 0 {} \;
rm -rf /var/log/*.gz /var/log/*.[0-9] /var/log/*-????????
cat /dev/null > /var/log/lastlog; cat /dev/null > /var/log/wtmp
apt-get -y autoremove >/dev/null 2>&1
apt-get -y autoclean >/dev/null 2>&1
history -c
cat /dev/null > /root/.bash_history
unset HISTFILE

#To replace the Domain Name in the apache configuration 
a=0
while [ $a -eq 0 ]
do
 echo -e "${RED}To cancel setup, press Ctrl+C.  This script will run again on your next login:${NC}"
 echo -e "${RED}Enter the domain name for your new WordPress site:${NC}"
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

sed -i "s/\$domain/$dom/g"  /etc/apache2/sites-available/001-default.conf

a2enconf block-xmlrpc >/dev/null 2>&1

systemctl restart apache2

rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root
