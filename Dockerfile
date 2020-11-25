FROM debian:9-slim

LABEL author="hurisheng"

# only openvpn package is required, bash is for cloud service only
RUN apt-get update && apt-get install -y \
  bash \
  openvpn \
  openvpn-auth-ldap \
  iptables \
  && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && dpkg-reconfigure -f noninteractive tzdata \
  && rm -rf /var/lib/apt/lists/*

# copy openvpn-start.sh script
COPY ./openvpn-start.sh /usr/local/bin/

ENV VPN_NETWORK_ADDRESS="172.88.0.0"
ENV VPN_NETWORK_MASK="255.255.0.0"
EXPOSE 1194/UDP
VOLUME [ "/etc/openvpn" ]

CMD [ "openvpn-start.sh" ]