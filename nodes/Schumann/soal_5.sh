#!/bin/bash
# Soal 5 - static routing (CIDR) Schumann
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.1
ip route replace 10.72.24.0/22 via 10.72.28.10
ip route
