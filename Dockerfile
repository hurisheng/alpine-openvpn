FROM debian:stretch-slim

LABEL author="hurisheng"

# only openvpn package is required, bash is for cloud service only
RUN apt-get update && apt-get install -y \
  bash \
  openvpn \
  iptables \
  libpam-mysql \
  && rm -rf /var/lib/apt/lists/*

# copy openvpn-start.sh script
COPY ./openvpn-start.sh /usr/local/bin/
COPY ./openvpn /etc/pam.d

ENV VPN_NETWORK_ADDRESS="172.88.0.0"
ENV VPN_NETWORK_MASK="255.255.0.0"
EXPOSE 1194/UDP
VOLUME [ "/etc/openvpn" ]

CMD [ "openvpn-start.sh" ]