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
