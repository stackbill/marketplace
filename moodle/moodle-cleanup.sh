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
echo -e "${RED}The Mariadb root Password is $(cat /root/.mariadb_root_password)${NC}"
echo
echo
echo -e "${RED}The Moodleadmin user Password is $(cat /root/.mariadb_moodleadmin_password)${NC}"
echo
echo

#To replace the Domain Name in the apache configuration 
a=0
while [ $a -eq 0 ]
do
 echo -e "${RED}To cancel setup, press Ctrl+C.  This script will run again on your next login:${NC}"
 echo -e "${RED}Enter the domain name for your new Moodle site:${NC}"
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

sed -i "s/learning.testprojects.me/$dom/g"  /etc/apache2/conf-enabled/moodle.conf
sed -i "s|example.com/moodle|$dom|g" /var/www/html/config.php



# restart apache2 service
systemctl restart apache2


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
rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root
# rm -rf /opt/moodle
cat /dev/null > /root/.bash_history
unset HISTFILE
history -c