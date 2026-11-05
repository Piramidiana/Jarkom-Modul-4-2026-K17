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
