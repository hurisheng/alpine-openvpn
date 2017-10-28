# alpine-openvpn
Reference: http://web.jellyade.org/posts/minivpn.html

docker run -d -v /PATH/TO/OPENVPN:/etc/openvpn -p 1194:1194/udp --cap-add=NET_ADMIN alpine-openvpn