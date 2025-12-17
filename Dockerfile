FROM alpine:3.23

LABEL maintainer "zyclonite"
LABEL version "0.4.8.21"
LABEL description "Tor as Docker Image"

ARG version="0.4.8.21-r0"

RUN apk add --no-cache --purge --clean-protected -u ca-certificates tor=$version \
 && chmod -R 700 /var/lib/tor \
 && rm -rf /var/cache/apk/*

ADD torrc /usr/share/tor/docker-default-torrc

EXPOSE 9050

VOLUME /etc/tor
VOLUME /var/lib/tor

ENTRYPOINT [ "/usr/bin/tor", "--defaults-torrc", "/usr/share/tor/docker-default-torrc" ]
CMD [ "-f", "/etc/tor/torrc" ]
