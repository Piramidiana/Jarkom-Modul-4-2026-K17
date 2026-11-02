#!/bin/bash
# Soal 5 - static routing (CIDR) Deus
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.6.1
ip route replace 10.72.0.0/23 via 10.72.2.130
ip route
