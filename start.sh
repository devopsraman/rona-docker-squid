#!/bin/sh

avahi-daemon -D

chown -R proxy\: /var/cache/squid-deb-proxy
chown -R proxy\: /var/log/squid-deb-proxy

. /usr/share/squid-deb-proxy/init-common.sh
pre_start
post_start
/usr/sbin/squid3 -N -d 1 -f /etc/squid-deb-proxy/squid-deb-proxy.conf