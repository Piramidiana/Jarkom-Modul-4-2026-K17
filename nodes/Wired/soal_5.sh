#!/bin/bash
# Soal 5 - static routing (CIDR) Wired
sysctl -w net.ipv4.ip_forward=1 >/dev/null
# Matikan ICMP redirect: Psyche, Copland, Schumann berbagi segmen A3 dengan Wired
sysctl -w net.ipv4.conf.all.send_redirects=0 >/dev/null
sysctl -w net.ipv4.conf.eth1.send_redirects=0 >/dev/null
ip route replace default via 10.72.32.129
ip route replace 10.72.8.0/22 via 10.72.12.2
ip route replace 10.72.16.0/22 via 10.72.12.3
ip route replace 10.72.24.0/21 via 10.72.12.4
ip route replace 10.72.20.0/22 via 10.72.12.10
ip route replace 10.72.0.0/21 via 10.72.12.14
ip route
