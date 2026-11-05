#!/bin/sh
# ============================================================
# Kumpulan script Jalur dalam: G1 10.72.0.0/21
# Salin bagian node yang sesuai ke console node itu. Jangan jalankan utuh di satu node.
# ============================================================


# ------------------------------------------------------------
# File: Tachibana.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Tachibana (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Wired: A5 (10.72.12.12/30)
# eth1 -> Switch9 (Collective, Ghost): A15 (10.72.4.0/23)
# eth2 -> Deus: A16 (10.72.6.0/30)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.14
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.4.1
	netmask 255.255.254.0

auto eth2
iface eth2 inet static
	address 10.72.6.1
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Tachibana
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.13
ip route replace 10.72.0.0/22 via 10.72.6.2
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
# File: Deus.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Deus (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Tachibana: A16 (10.72.6.0/30)
# eth1 -> Switch10 (Lilith, Specter): A17 (10.72.2.0/25)
# eth2 -> Protocol7: A18 (10.72.2.128/30)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.6.2
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.2.1
	netmask 255.255.255.128

auto eth2
iface eth2 inet static
	address 10.72.2.129
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Deus
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.6.1
ip route replace 10.72.0.0/23 via 10.72.2.130
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
# File: Protocol7.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Protocol7 (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Deus: A18 (10.72.2.128/30)
# eth1 -> Switch11 (Chisa, Hodgeson): A19 (10.72.1.0/26)
# eth2 -> Knights: A20 (10.72.1.64/30)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.2.130
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.1.1
	netmask 255.255.255.192

auto eth2
iface eth2 inet static
	address 10.72.1.65
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Protocol7
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.2.129
ip route replace 10.72.0.0/24 via 10.72.1.66
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
# File: Knights.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Knights (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Protocol7: A20 (10.72.1.64/30)
# eth1 -> Eiri: A21 (10.72.0.128/29)
# eth2 -> Phantoma: A22 (10.72.0.136/30)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.1.66
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.0.129
	netmask 255.255.255.248

auto eth2
iface eth2 inet static
	address 10.72.0.137
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Knights
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.1.65
ip route replace 10.72.0.0/25 via 10.72.0.138
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
# File: Phantoma.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Phantoma (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Knights: A22 (10.72.0.136/30)
# eth1 -> Switch12 (Semi): A23 (10.72.0.64/27)
# eth2 -> Shibuya: A24 (10.72.0.96/30)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.138
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.0.65
	netmask 255.255.255.224

auto eth2
iface eth2 inet static
	address 10.72.0.97
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Phantoma
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.0.137
ip route replace 10.72.0.0/26 via 10.72.0.98
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
# File: Shibuya.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Shibuya (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Phantoma: A24 (10.72.0.96/30)
# eth1 -> Switch13 (Lain, Mika): A25 (10.72.0.0/26)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.98
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.0.1
	netmask 255.255.255.192
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Shibuya
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.0.97
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
# File: Collective.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Collective (image ardhptr21/alpinet) - subnet A15 (10.72.4.0/23)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.4.2
	netmask 255.255.254.0
	gateway 10.72.4.1
EOF


# ------------------------------------------------------------
# File: Ghost.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Ghost (image ardhptr21/alpinet) - subnet A15 (10.72.4.0/23)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.4.3
	netmask 255.255.254.0
	gateway 10.72.4.1
EOF


# ------------------------------------------------------------
# File: Lilith.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Lilith (image ardhptr21/alpinet) - subnet A17 (10.72.2.0/25)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.2.2
	netmask 255.255.255.128
	gateway 10.72.2.1
EOF


# ------------------------------------------------------------
# File: Specter.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Specter (image ardhptr21/alpinet) - subnet A17 (10.72.2.0/25)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.2.3
	netmask 255.255.255.128
	gateway 10.72.2.1
EOF


# ------------------------------------------------------------
# File: Chisa.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Chisa (image ardhptr21/alpinet) - subnet A19 (10.72.1.0/26)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.1.2
	netmask 255.255.255.192
	gateway 10.72.1.1
EOF


# ------------------------------------------------------------
# File: Hodgeson.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Hodgeson (image ardhptr21/alpinet) - subnet A19 (10.72.1.0/26)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.1.3
	netmask 255.255.255.192
	gateway 10.72.1.1
EOF


# ------------------------------------------------------------
# File: Eiri.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Eiri (image ardhptr21/alpinet) - subnet A21 (10.72.0.128/29)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.130
	netmask 255.255.255.248
	gateway 10.72.0.129
EOF


# ------------------------------------------------------------
# File: Semi.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Semi (image ardhptr21/alpinet) - subnet A23 (10.72.0.64/27)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.66
	netmask 255.255.255.224
	gateway 10.72.0.65
EOF


# ------------------------------------------------------------
# File: Lain.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Lain (image ardhptr21/alpinet) - subnet A25 (10.72.0.0/26)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.2
	netmask 255.255.255.192
	gateway 10.72.0.1
EOF


# ------------------------------------------------------------
# File: Mika.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Mika (image ardhptr21/alpinet) - subnet A25 (10.72.0.0/26)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.3
	netmask 255.255.255.192
	gateway 10.72.0.1
EOF
