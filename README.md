# alpine-openvpn

TODO: due to ldap plugin issue, change base image to debian temporarily, in future will change back.

Reference: http://web.jellyade.org/posts/minivpn.html

docker run -d -v /PATH/TO/OPENVPN:/etc/openvpn -p 1194:1194/udp -e "VPN_NETWORK_ADDRESS=172.88.0.0" -e "VPN_NETWORK_MAST=255.255.0.0" --cap-add=NET_ADMIN alpine-openvpn

VPN_NETWORK_* environment variable can be defined as your network required, default is 172.88.0.0 and 255.255.0.0. This envitonment variable will be used in the openvpn startup script to set iptables and --server parameter.
