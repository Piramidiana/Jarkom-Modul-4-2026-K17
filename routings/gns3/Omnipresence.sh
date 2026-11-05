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
