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
