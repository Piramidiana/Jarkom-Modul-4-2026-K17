#!/bin/sh
# ============================================================
# Kumpulan script Cyberia + Wired (B10 10.72.32.0/24, A3-A5)
# Salin bagian node yang sesuai ke console node itu. Jangan jalankan utuh di satu node.
# ============================================================


# ------------------------------------------------------------
# File: Cyberia.sh
# ------------------------------------------------------------
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


# ------------------------------------------------------------
# File: Wired.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Wired (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Cyberia: A2 (10.72.32.128/30)
# eth1 -> Switch2 (Psyche, Copland, Schumann): A3 (10.72.12.0/29)
# eth2 -> Navi: A4 (10.72.12.8/30)
# eth3 -> Tachibana: A5 (10.72.12.12/30)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.32.130
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.12.1
	netmask 255.255.255.248

auto eth2
iface eth2 inet static
	address 10.72.12.9
	netmask 255.255.255.252

auto eth3
iface eth3 inet static
	address 10.72.12.13
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
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
EOF

# 3. Autostart
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

bash /root/startup.sh
tail -n 20 /root/startup.log


# ------------------------------------------------------------
# File: JJ.sh
# ------------------------------------------------------------
#!/bin/sh
# Host JJ (image ardhptr21/alpinet) - subnet A1 (10.72.32.0/25)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.32.2
	netmask 255.255.255.128
	gateway 10.72.32.1
EOF


# ------------------------------------------------------------
# File: MyuMyu.sh
# ------------------------------------------------------------
#!/bin/sh
# Host MyuMyu (image ardhptr21/alpinet) - subnet A1 (10.72.32.0/25)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.32.3
	netmask 255.255.255.128
	gateway 10.72.32.1
EOF
