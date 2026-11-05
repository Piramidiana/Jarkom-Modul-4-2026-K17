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
