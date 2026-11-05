#!/bin/sh
# Host Eiri (image ardhptr21/alpinet) - subnet A21 (10.72.0.128/29)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.130
	netmask 255.255.255.248
	gateway 10.72.0.129
EOF
