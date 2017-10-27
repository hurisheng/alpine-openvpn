FROM alpine:latest

LABEL author="hurisheng"

# modify below sed line to change the mirror
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update && apk add openvpn

# copy openvpn-start.sh script
COPY ./openvpn-start.sh /usr/local/bin
CMD [ "openvpn-start.sh" ]

EXPOSE 1194/UDP

VOLUME [ "/etc/openvpn" ]