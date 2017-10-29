# alpine-openvpn
Reference: http://web.jellyade.org/posts/minivpn.html

docker run -d -v /PATH/TO/OPENVPN:/etc/openvpn -p 1194:1194/udp -e "VPN_NETWORK=172.88.0.0/16" --cap-add=NET_ADMIN alpine-openvpn

VPN_NETWORK environment variable can be defined as your network required, default is 172.88.0.0/16. This envitonment variable will be used in the openvpn startup script
