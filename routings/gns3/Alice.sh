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
