#!/bin/bash - 

. /opt/chambana/lib/common.sh

CHECK_BIN "pdns_server"
CHECK_BIN "pdnssec"

MSG "Configuring PowerDNS..."

# Make sure config file exists.
touch /etc/powerdns/superslave-config.conf

# Create zones directory if it doesn't exist.
[[ -d /etc/powerdns/zones ]] || mkdir -p /etc/powerdns/zones

# Recreate list of Supermasters.
[[ -e /etc/powerdns/supermasters.conf ]] && rm -f /etc/powerdns/supermasters.conf
for i in $SUPERMASTERS; do
  echo ${i/:/ }\n >> /etc/powerdns/supermasters.conf
done

MSG "Starting PowerDNS."
pdns_server --daemon=no
