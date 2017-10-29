FROM alpine:latest

LABEL author="hurisheng"

# only openvpn package is required, bach is for cloud service only
RUN apk update && apk add openvpn bash

# copy openvpn-start.sh script
COPY ./openvpn-start.sh /usr/local/bin

ENV VPN_NETWORK="172.88.0.0/16"
EXPOSE 1194/UDP
VOLUME [ "/etc/openvpn" ]

CMD [ "openvpn-start.sh" ]