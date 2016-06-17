FROM chambana/base:latest

MAINTAINER Josh King <jking@chambana.net>

ENV SUPERMASTERS ""

RUN apt-get -qq update && \
	apt-get install -y --no-install-recommends pdns-server && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 53

ADD files/bindbackend.conf /etc/powerdns/bindbackend.conf
ADD files/pdns.local.conf /etc/powerdns/pdns.d/pdns.local.conf

VOLUME ["/zones"]

## Add startup script.
ADD bin/init.sh /app/bin/init.sh
RUN chmod 0755 /app/bin/init.sh

CMD ["/app/bin/init.sh"]
