#!/bin/bash

# sed -i 's/#Match User anoncvs/ForceCommand echo Please wait until the installation is completed..../g' /etc/ssh/sshd_config && systemctl restart sshd

ACCEPT_EULA=Y  apt-get install filecloud -y

sed -i 's/ForceCommand echo Please wait until the installation is completed..../#Match User anoncvs/g' /etc/ssh/sshd_config && systemctl restart sshd