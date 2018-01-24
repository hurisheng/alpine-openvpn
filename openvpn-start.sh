#!/bin/sh

if [ ! -d /dev/net ]; then
    mkdir -p /dev/net
fi
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
    chmod 0666 /dev/net/tun
fi

iptables -t nat -A POSTROUTING -s ${VPN_NETWORK} -j MASQUERADE

openvpn --cd /etc/openvpn --config server.conf --server ${SERVER_NETWORK}