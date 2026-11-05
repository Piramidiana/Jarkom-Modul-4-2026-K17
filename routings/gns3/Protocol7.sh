#!/bin/bash
# Router Protocol7 (image ardhptr21/debinet) - GNS3, CIDR, kelompok K17
#
# eth0 -> Deus: A18 (10.72.2.128/30)
# eth1 -> Switch11 (Chisa, Hodgeson): A19 (10.72.1.0/26)
# eth2 -> Knights: A20 (10.72.1.64/30)
#
# Cara pakai: isi network config lewat Configure > Edit config (node mati),
# atau jalankan seluruh file ini di console node, lalu Stop -> Start node.
# Script routing disimpan di /root (persisten) dan dijalankan saat boot
# oleh baris "up bash /root/startup.sh" di network config.

# 1. Network config
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.2.130
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.1.1
	netmask 255.255.255.192

auto eth2
iface eth2 inet static
	address 10.72.1.65
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

# 2. Static routing (soal 5)
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Protocol7
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.2.129
ip route replace 10.72.0.0/24 via 10.72.1.66
ip route
EOF

# 3. Autostart
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

bash /root/startup.sh
tail -n 20 /root/startup.log
