#!/bin/bash
# Soal 5 - static routing (CIDR) Phantoma
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.0.137
ip route replace 10.72.0.0/26 via 10.72.0.98
ip route
