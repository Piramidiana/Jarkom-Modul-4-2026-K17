#!/bin/bash
# Soal 5 - static routing (CIDR) Psyche
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.1
ip route
