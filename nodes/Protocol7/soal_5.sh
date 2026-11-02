#!/bin/bash
# Soal 5 - static routing (CIDR) Protocol7
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.2.129
ip route replace 10.72.0.0/24 via 10.72.1.66
ip route
