#!/bin/ash

# Ensure correct ownership
chown -R root:named /etc/bind /var/bind /var/run/named
chmod -R 770 /var/bind /var/run/named
chmod -R 750 /etc/bind

# Run in foreground
/usr/sbin/named -c /etc/bind/named.conf -g -u named
