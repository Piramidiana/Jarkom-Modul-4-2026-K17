#!/bin/sh
# ============================================================
# Kumpulan script Sayap Navi: C2 10.72.20.0/22
# Salin bagian node yang sesuai ke console node itu. Jangan jalankan utuh di satu node.
# ============================================================


# ------------------------------------------------------------
# File: Navi.sh
# ------------------------------------------------------------
#!/bin/bash
# Router Navi (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Wired: A4 (10.72.12.8/30)
# eth1 -> Switch6 (Alice, Reika): A12 (10.72.20.0/24)
# eth2 -> Switch7 (Taro): A13 (10.72.21.0/26)
# eth3 -> Switch8 (Yasuo, Miho, Kuma): A14 (10.72.22.0/24)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.10
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.20.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.72.21.1
	netmask 255.255.255.192

auto eth3
iface eth3 inet static
	address 10.72.22.1
	netmask 255.255.255.0
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Navi
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.9
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
# File: Alice.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Alice (image ardhptr21/alpinet) - subnet A12 (10.72.20.0/24)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.20.2
	netmask 255.255.255.0
	gateway 10.72.20.1
EOF


# ------------------------------------------------------------
# File: Reika.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Reika (image ardhptr21/alpinet) - subnet A12 (10.72.20.0/24)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.20.3
	netmask 255.255.255.0
	gateway 10.72.20.1
EOF


# ------------------------------------------------------------
# File: Taro.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Taro (image ardhptr21/alpinet) - subnet A13 (10.72.21.0/26)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.21.2
	netmask 255.255.255.192
	gateway 10.72.21.1
EOF


# ------------------------------------------------------------
# File: Yasuo.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Yasuo (image ardhptr21/alpinet) - subnet A14 (10.72.22.0/24)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.22.2
	netmask 255.255.255.0
	gateway 10.72.22.1
EOF


# ------------------------------------------------------------
# File: Miho.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Miho (image ardhptr21/alpinet) - subnet A14 (10.72.22.0/24)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.22.3
	netmask 255.255.255.0
	gateway 10.72.22.1
EOF


# ------------------------------------------------------------
# File: Kuma.sh
# ------------------------------------------------------------
#!/bin/sh
# Host Kuma (image ardhptr21/alpinet) - subnet A14 (10.72.22.0/24)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.22.4
	netmask 255.255.255.0
	gateway 10.72.22.1
EOF
