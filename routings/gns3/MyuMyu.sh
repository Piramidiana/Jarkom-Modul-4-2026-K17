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
