FROM docker.gillsoft.org/ubuntu-base

MAINTAINER Ronan Gill <ronan@gillsoft.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends squid-deb-proxy squid-deb-proxy-client avahi-daemon avahi-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD squid-deb-proxy.conf /etc/squid-deb-proxy/squid-deb-proxy.conf

ADD start.sh /start.sh
RUN chmod +x /start.sh


VOLUME ["/var/cache/squid-deb-proxy", "/var/log/squid-deb-proxy"]

EXPOSE 8000
EXPOSE 5353/udp

CMD ["/start.sh"]
