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
echo -e "${RED}You can the elastic search using the command below ${NC}"
echo
echo
echo -e "${RED}curl -X GET "localhost:9200"${NC}"
echo
echo
echo -e "${RED}The Kibanaadmin Password is $(cat /root/.kibanaadmin)"
echo
echo
echo -e "${RED} Allow the ports 5601 and 9200 in the security group to access the Kibana UI and Elastic Search${NC}"

#To replace the Domain Name in the apache configuration 
a=0
while [ $a -eq 0 ]
do
 echo -e "${RED}To cancel setup, press Ctrl+C.  This script will run again on your next login:${NC}"
 echo -e "${RED}Enter the domain name for your new Kibana site:${NC}"
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

sed -i "s/domain/$dom/g"  /etc/nginx/sites-enabled/kibana

nginx -s reload >/dev/null 2>&1

# Ask the user if they need SSL for the domain
read -p "Do you want to install SSL for the domain? (yes/no): " install_ssl

if [[ "$install_ssl" =~ ^[Yy]$ ]]; then
  # Obtain SSL certificate with Certbot
  sudo certbot --nginx -d "$dom"
else
  echo "SSL installation is skipped. You can install it later using Certbot."
fi


echo
echo
echo -en "${RED}Please take sometime to complete the Kibana Setup.${NC}"

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

rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root
rm -rf /opt/cloudstack