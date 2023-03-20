#!/bin/bash

RED='\033[1;31m'
NC='\033[0m'

echo -e "${RED}You will be logged out until the filecloud installation is completed. Please be patience${NC}"

pkill -HUP -u root

sed -i 's/#Match User anoncvs/ForceCommand echo Please wait until the installation is completed..../g' /etc/ssh/sshd_config && systemctl restart sshd

ACCEPT_EULA=Y  apt-get install filecloud -y

rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root

echo "chmod +x /opt/cloudstack/cleanup.sh && /opt/cloudstack/cleanup.sh" >> /root/.bashrc

sed -i 's/ForceCommand echo Please wait until the installation is completed..../#Match User anoncvs/g' /etc/ssh/sshd_config && systemctl restart sshd




