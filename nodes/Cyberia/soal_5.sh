#!/bin/bash
# Soal 5 - static routing (CIDR) Cyberia
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace 10.72.0.0/19 via 10.72.32.130
ip route
