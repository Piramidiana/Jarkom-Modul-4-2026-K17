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
