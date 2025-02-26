#!/bin/bash

# Cleanup script

# Remove and recreate /usr/local/src/
rm -rf /usr/local/src/
mkdir -p /usr/local/src/

# Remove cloud-init instance data
rm -rf /var/lib/cloud/instances/*
rm -rf /var/lib/cloud/data/*

# Truncate logs older than a day
find /var/log -mtime -1 -type f -exec truncate -s 0 {} \; >/dev/null 2>&1

# Remove old logs and compressed log files
rm -rf /var/log/*.gz /var/log/*.[0-9] /var/log/*-????????

# Clear lastlog and wtmp logs
cat /dev/null > /var/log/lastlog
cat /dev/null > /var/log/wtmp

# Run system cleanup
apt-get -y autoremove >/dev/null 2>&1
apt-get -y autoclean >/dev/null 2>&1

# Clear command history
history -c
cat /dev/null > /root/.bash_history
unset HISTFILE

# Reset root .bashrc file
rm -rf /root/.bashrc
cp /etc/skel/.bashrc /root

# Ensure proper permissions
chmod 700 /root/.bash_history

echo "Cleanup completed."