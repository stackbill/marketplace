#!/bin/bash

RED='\033[1;31m'
NC='\033[0m'

echo -e "${RED}
################################################################################################################
#                              Your MarketPlace App has been deployed Successfully!                            #
################################################################################################################
${NC}"

IP_ADDRESS=$(curl -s ifconfig.me)

echo
echo -e "${RED}This message will be removed in the next login!${NC}"
echo
echo
echo
echo -e "${RED}http://${IP_ADDRESS}:3000${NC}"
echo
echo -e "${RED}Username : admin${NC}"
echo
echo -e "${RED}Password: admin${NC}"
echo
sleep 5 



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
cat /dev/null > /root/.bash_history
unset HISTFILE
history -c

rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root
rm -rf /opt/genie-acs