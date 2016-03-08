FROM chambana/base:latest

MAINTAINER Josh King <jking@chambana.net>

ENV SUPERMASTERS ""

RUN apt-get -qq update && \
	apt-get install -y --no-install-recommends pdns-server && \
	apt-get clean

EXPOSE 53

ADD files/bindbackend.conf /etc/powerdns/bindbackend.conf

## Add startup script.
ADD bin/init.sh /opt/chambana/bin/init.sh
RUN chmod 0755 /opt/chambana/bin/init.sh

CMD ["/opt/chambana/bin/init.sh"]
