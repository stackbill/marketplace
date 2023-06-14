#!/bin/bash

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


#SSL configuration
echo "Configuring LetsEncrypt to secure your new site."
echo "Before doing this, be sure that you have pointed your domain or subdomain to this server's IP address."
systemctl stop apache2;
certbot certonly --standalone --preferred-challenges http --http-01-port 8080 -d "$dom";
systemctl start apache2;
cd /etc/apache2/sites-available/
a2ensite default-ssl.conf
sed -i "s/\$domain/$dom/g"  /etc/apache2/sites-available/default-ssl.conf
a2enmod ssl
systemctl reload apache2
echo "Magento has been enabled at https://$dom/  Please open this URL in a browser after installation process.";
