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

#Configuring new host
echo "
virtualhost openlitespeed {
  vhRoot                  /var/www/html
  configFile              /usr/local/lsws/conf/vhosts/openlitespeed/vhconf.conf
  allowSymbolLink         1
  enableScript            1
  restrained              0
  setUIDMode              2
}
listener openlitespeed {
  address                 *:80
  secure                  0
  map                     openlitespeed *
}" | tee -a /usr/local/lsws/conf/httpd_config.conf >/dev/null

#Adding Virtual host Entry
echo "docRoot                   /var/www/html
index  {
  useServer               0
  indexFiles              index.php index.html
}" | tee -a /usr/local/lsws/conf/vhosts/openlitespeed/vhconf.conf >/dev/null

sed -i 's/map                      Example \*/map openlitespeed */g' /usr/local/lsws/conf/httpd_config.conf >/dev/null

systemctl restart lsws

chown www-data. /tmp/lshttpd/ -R

/usr/local/lsws/bin/lswsctrl fullrestart

rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root