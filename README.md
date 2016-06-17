docker-pdns
===========
A Docker container for a PowerDNS superslave.

Usage
-----
This container runs PowerDNS in superslave mode with the BIND backend. It exposes port 53 by default and takes the `PDNS_SUPERMASTERS` environment variable for configuration on container start. `PDNS_SUPERMASTERS` holds a space-separated list of DNS master servers, where each is in the format `<IP Address>:<Server name>`.
