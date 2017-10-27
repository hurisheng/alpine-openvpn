FROM alpine:latest

LABEL author="hurisheng"

# modify below sed line to change the mirror
RUN apk update && apk add openvpn

# copy openvpn-start.sh script
COPY ./openvpn-start.sh /usr/local/bin
CMD [ "openvpn-start.sh" ]

EXPOSE 1194/UDP

VOLUME [ "/etc/openvpn" ]