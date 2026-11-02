#!/bin/bash
# Soal 7 - Hanya Cyberia yang terhubung ke NAT1 (eth0, DHCP). Jalankan di console Cyberia.
cat > /root/soal_7.sh <<'EOF'
#!/bin/bash
# Soal 7 - hanya Cyberia yang terhubung ke NAT: MASQUERADE seluruh blok K-17
iptables -t nat -C POSTROUTING -s 10.72.0.0/18 -o eth0 -j MASQUERADE 2>/dev/null \
  || iptables -t nat -A POSTROUTING -s 10.72.0.0/18 -o eth0 -j MASQUERADE
iptables -t nat -S POSTROUTING
EOF
bash /root/soal_7.sh
