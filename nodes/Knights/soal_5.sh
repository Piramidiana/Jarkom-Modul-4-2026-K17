#!/bin/bash
# Soal 5 - static routing (CIDR) Knights
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.1.65
ip route replace 10.72.0.0/25 via 10.72.0.138
ip route
