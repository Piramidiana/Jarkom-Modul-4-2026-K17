#!/bin/sh
# Host Akashic (image ardhptr21/alpinet) - subnet A9 (10.72.28.0/29)
# Isi lewat Configure > Edit config, atau jalankan di console lalu Stop -> Start node.

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.28.2
	netmask 255.255.255.248
	gateway 10.72.28.1
EOF
