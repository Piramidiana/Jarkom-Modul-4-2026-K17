#!/bin/bash
# Soal 5 - static routing (CIDR) Shibuya
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.0.97
ip route
