#!/bin/bash
# Router Cyberia (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> NAT1: DHCP dari NAT1
# eth1 -> Wired: A2 (10.72.32.128/30)
# eth2 -> Switch1 (JJ, MyuMyu): A1 (10.72.32.0/25)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.72.32.129
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 10.72.32.1
	netmask 255.255.255.128
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Cyberia
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace 10.72.0.0/19 via 10.72.32.130
ip route
EOF

# 3. NAT ke NAT1 (soal 7)
cat > /root/soal_7.sh <<'EOF'
#!/bin/bash
# Soal 7 - hanya Cyberia yang terhubung ke NAT: MASQUERADE seluruh blok K-17
iptables -t nat -C POSTROUTING -s 10.72.0.0/18 -o eth0 -j MASQUERADE 2>/dev/null \
  || iptables -t nat -A POSTROUTING -s 10.72.0.0/18 -o eth0 -j MASQUERADE
iptables -t nat -S POSTROUTING
EOF

# 4. Autostart
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
bash /root/soal_7.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

bash /root/startup.sh
tail -n 20 /root/startup.log
