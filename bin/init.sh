#!/bin/bash - 

. /opt/chambana/lib/common.sh

CHECK_BIN "pdns_server"
CHECK_BIN "pdnssec"

MSG "Configuring PowerDNS..."

# Create zones directory if it doesn't exist.
[[ -d /zones ]] || mkdir -p /zones
chown -R pdns:pdns /zones
touch /zones/named.conf

# Recreate list of Supermasters.
[[ -e /etc/powerdns/supermasters.conf ]] && rm -f /etc/powerdns/supermasters.conf
for i in $SUPERMASTERS; do
  echo -e "${i/:/ }\n" >> /etc/powerdns/supermasters.conf
done

MSG "Starting PowerDNS."
pdns_server --daemon=no
