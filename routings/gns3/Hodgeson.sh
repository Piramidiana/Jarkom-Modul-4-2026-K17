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
