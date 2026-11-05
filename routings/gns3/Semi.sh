#!/bin/sh
# Host Semi (image ardhptr21/alpinet) - subnet A23 (10.72.0.64/27)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.66
	netmask 255.255.255.224
	gateway 10.72.0.65
EOF
