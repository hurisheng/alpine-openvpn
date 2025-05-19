FROM alpine:latest

LABEL author="hurisheng"

# only openvpn package is required, bash is for cloud service only
RUN apk add --no-cache openvpn iptables

# copy openvpn-start.sh script
COPY ./openvpn-start.sh /usr/local/bin/

ENV VPN_NETWORK_ADDRESS="172.88.0.0"
ENV VPN_NETWORK_MASK="255.255.0.0"
EXPOSE 1194/UDP
VOLUME [ "/etc/openvpn" ]

USER nobody:nobody

CMD [ "openvpn-start.sh" ]
