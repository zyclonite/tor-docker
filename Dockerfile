FROM alpine:3.22

LABEL maintainer "zyclonite"
LABEL version "0.4.8.16"
LABEL description "Tor as Docker Image"

ARG version="0.4.8.16-r0"

RUN apk add --no-cache --purge --clean-protected -u ca-certificates tor=$version \
 && chmod -R 700 /var/lib/tor \
 && rm -rf /var/cache/apk/*

ADD torrc /etc/tor/torrc

EXPOSE 9050

VOLUME /etc/tor
VOLUME /var/lib/tor

ENTRYPOINT [ "/usr/bin/tor" ]
CMD [ "-f", "/etc/tor/torrc" ]
