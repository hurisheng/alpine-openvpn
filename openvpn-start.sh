#!/bin/sh

mkdir -p /dev/net
mknod /dev/net/tun c 10 200

openvpn --cd /etc/openvpn --config /etc/openvpn/server.conf