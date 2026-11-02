#!/bin/bash
# Soal 5 - static routing (CIDR) Tachibana
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.13
ip route replace 10.72.0.0/22 via 10.72.6.2
ip route
