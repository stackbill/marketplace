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
echo -e "${RED}Refer to the below Kafka shell login credentials${NC}"
echo
cat /root/.shell_user_passwords
echo

echo -e "
********************************************************************************
Welcome to Kafka/ZooKeeper Instance.
Kafka is running as a systemd service (kafka.service).

To get started on this server:

 1. Create a topic

    /opt/kafka/bin/kafka-topics.sh --create --topic quickstart --bootstrap-server localhost:9092

 2. Produce your first event

    echo 'Hello, CloudPortal!' | /opt/kafka/bin/kafka-console-producer.sh --topic quickstart --bootstrap-server localhost:9092

 3. Consume the event

    /opt/kafka/bin/kafka-console-consumer.sh --from-beginning --max-messages 1 --topic quickstart --bootstrap-server localhost:9092

********************************************************************************
"

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