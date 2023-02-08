#!/bin/bash

#Generate Openlitespeed admin Password:

lswsadmin=$(openssl rand -hex 24)
echo "Username = admin
Password = \"$lswsadmin\"" > /root/.Litespeed_Admin_Password
ENCRYPT_PASS=`/usr/local/lsws/admin/fcgi-bin/admin_php -q /usr/local/lsws/admin/misc/htpasswd.php $lswsadmin`
echo "admin:$ENCRYPT_PASS" > /usr/local/lsws/admin/conf/htpasswd

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
echo -e "${RED}Use the Below Password for logging into MariaDB${NC}"
echo
cat /root/.mariadb_root_password
echo
echo -e "${RED}Refer to the below Joomla database login details to setup joomla in the web Interface${NC}"
echo
cat /root/.joomla_database_details
echo
echo -e "${RED}Refer to the below Openlitespeed Admin login details${NC}"
echo
cat /root/.Litespeed_Admin_Password
echo

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
 echo -e "${RED}Enter the domain name for your new Joomla site:${NC}"
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

#Configuring new host
ssli=ssl
echo "
virtualhost joomla {
  vhRoot                  /var/www/html
  configFile              /usr/local/lsws/conf/vhosts/joomla/vhconf.conf
  allowSymbolLink         1
  enableScript            1
  restrained              0
  setUIDMode              2
}

listener joomla {
  address                 *:80
  secure                  0
  map                     joomla *, $dom, www.$dom
}

listener joomlassl {
  address                 *:443
  secure                  1
  keyFile /etc/letsencrypt/live/$dom/privkey.pem
  certFile /etc/letsencrypt/live/$dom/cert.pem
  map                     joomla *, $dom, www.$dom
}" | tee -a /usr/local/lsws/conf/httpd_config.conf >/dev/null

#Adding Virtual host Entry
echo "docRoot                   /var/www/html

index  {
  useServer               0
  indexFiles              index.php index.html
}

context /phpmyadmin/ {
  location                /var/www/phpmyadmin
  allowBrowse             1
  indexFiles              index.php

  accessControl  {
    allow                 *
  }

  rewrite  {
    enable                0
    inherit               0

  }
  addDefaultCharset       off

  phpIniOverride  {

  }
}

rewrite  {
  enable                  1
  autoLoadHtaccess        1

}" | tee -a /usr/local/lsws/conf/vhosts/joomla/vhconf.conf >/dev/null

sed -i 's/map                      Example \*/map joomla *, '$dom', www.'$dom'/g' /usr/local/lsws/conf/httpd_config.conf >/dev/null

systemctl restart lsws

chown www-data. /tmp/lshttpd/ -R

/usr/local/lsws/bin/lswsctrl fullrestart

rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root
