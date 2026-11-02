#!/bin/bash
# Soal 7 - hanya Cyberia yang terhubung ke NAT: MASQUERADE seluruh blok K-17
iptables -t nat -C POSTROUTING -s 10.72.0.0/18 -o eth0 -j MASQUERADE 2>/dev/null \
  || iptables -t nat -A POSTROUTING -s 10.72.0.0/18 -o eth0 -j MASQUERADE
iptables -t nat -S POSTROUTING
