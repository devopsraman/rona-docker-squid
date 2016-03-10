FROM ubuntu:15.10

MAINTAINER Ronan Gill <ronan@gillsoft.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends squid-deb-proxy squid-deb-proxy-client avahi-daemon avahi-utils \
 && mv /etc/squid3/squid.conf /etc/squid3/squid.conf.dist \
 && rm -rf /var/lib/apt/lists/*

ADD extra-sources.acl /etc/squid-deb-proxy/mirror-dstdomain.acl.d/20-extra-sources.acl

ADD start.sh /start.sh
RUN chmod +x /start.sh


VOLUME ["/var/cache/squid-deb-proxy"]
VOLUME ["/var/log/squid-deb-proxy"]

EXPOSE 8000
EXPOSE 5353/udp

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENTRYPOINT ["/start.sh"]


