#!/bin/sh
# ============================================================
# Kumpulan script Sayap barat: A6 10.72.8.0/22, B1 10.72.16.0/22, C1 10.72.24.0/21
# Salin bagian node yang sesuai ke console node itu. Jangan jalankan utuh di satu node.
# ============================================================


# ------------------------------------------------------------
# File: Psyche.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Psyche (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Switch2: A3 (10.72.12.0/29)
# eth1 -> Switch3 (Karl, Lin): A6 (10.72.8.0/22)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.2
	netmask 255.255.255.248

auto eth1
iface eth1 inet static
	address 10.72.8.1
	netmask 255.255.252.0
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Psyche
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.1
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
# File: Copland.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Copland (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Switch2: A3 (10.72.12.0/29)
# eth1 -> Juri: A7 (10.72.18.0/26)
# eth2 -> Switch4 (Masayuki): A8 (10.72.16.0/23)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.3
	netmask 255.255.255.248

auto eth1
iface eth1 inet static
	address 10.72.18.1
	netmask 255.255.255.192

auto eth2
iface eth2 inet static
	address 10.72.16.1
	netmask 255.255.254.0
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Copland
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.1
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
# File: Schumann.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Schumann (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Switch2: A3 (10.72.12.0/29)
# eth1 -> Akashic: A9 (10.72.28.0/29)
# eth2 -> Accela: A10 (10.72.28.8/30)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.4
	netmask 255.255.255.248

auto eth1
iface eth1 inet static
	address 10.72.28.1
	netmask 255.255.255.248

auto eth2
iface eth2 inet static
	address 10.72.28.9
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Schumann
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.1
ip route replace 10.72.24.0/22 via 10.72.28.10
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
# File: Accela.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Accela (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Schumann: A10 (10.72.28.8/30)
# eth1 -> Switch5 (Omnipresence, Denpa): A11 (10.72.24.0/22)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.28.10
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.24.1
	netmask 255.255.252.0
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Accela
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.28.9
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
# File: Karl.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Karl (image ardhptr21/alpinet) - subnet A6 (10.72.8.0/22)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.8.2
	netmask 255.255.252.0
	gateway 10.72.8.1
EOF


# ------------------------------------------------------------
# File: Lin.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Lin (image ardhptr21/alpinet) - subnet A6 (10.72.8.0/22)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.8.3
	netmask 255.255.252.0
	gateway 10.72.8.1
EOF


# ------------------------------------------------------------
# File: Juri.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Juri (image ardhptr21/alpinet) - subnet A7 (10.72.18.0/26)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.18.2
	netmask 255.255.255.192
	gateway 10.72.18.1
EOF


# ------------------------------------------------------------
# File: Masayuki.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Masayuki (image ardhptr21/alpinet) - subnet A8 (10.72.16.0/23)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.16.2
	netmask 255.255.254.0
	gateway 10.72.16.1
EOF


# ------------------------------------------------------------
# File: Akashic.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Akashic (image ardhptr21/alpinet) - subnet A9 (10.72.28.0/29)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.28.2
	netmask 255.255.255.248
	gateway 10.72.28.1
EOF


# ------------------------------------------------------------
# File: Omnipresence.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Omnipresence (image ardhptr21/alpinet) - subnet A11 (10.72.24.0/22)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.24.2
	netmask 255.255.252.0
	gateway 10.72.24.1
EOF


# ------------------------------------------------------------
# File: Denpa.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Denpa (image ardhptr21/alpinet) - subnet A11 (10.72.24.0/22)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.24.3
	netmask 255.255.252.0
	gateway 10.72.24.1
EOF
