#!/bin/bash
# Soal 1 & 3 - Pembagian IP CIDR (prefix 10.72) di GNS3, kelompok K17
# Isi network config setiap node. Di GNS3: klik kanan node > Edit config (node mati),
# atau jalankan blok node yang sesuai di console node itu lalu restart node.
# Jangan jalankan file ini utuh di satu node.

### Cyberia
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.72.32.129
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 10.72.32.1
	netmask 255.255.255.128
	up bash /root/startup.sh
EOF

### Wired
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.32.130
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.12.1
	netmask 255.255.255.248

auto eth2
iface eth2 inet static
	address 10.72.12.9
	netmask 255.255.255.252

auto eth3
iface eth3 inet static
	address 10.72.12.13
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

### Psyche
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.2
	netmask 255.255.255.248

auto eth1
iface eth1 inet static
	address 10.72.8.1
	netmask 255.255.252.0
	up bash /root/startup.sh
EOF

### Copland
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.3
	netmask 255.255.255.248

auto eth1
iface eth1 inet static
	address 10.72.18.1
	netmask 255.255.255.192

auto eth2
iface eth2 inet static
	address 10.72.16.1
	netmask 255.255.254.0
	up bash /root/startup.sh
EOF

### Schumann
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.4
	netmask 255.255.255.248

auto eth1
iface eth1 inet static
	address 10.72.28.1
	netmask 255.255.255.248

auto eth2
iface eth2 inet static
	address 10.72.28.9
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

### Accela
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.28.10
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.24.1
	netmask 255.255.252.0
	up bash /root/startup.sh
EOF

### Navi
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.10
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.20.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.72.21.1
	netmask 255.255.255.192

auto eth3
iface eth3 inet static
	address 10.72.22.1
	netmask 255.255.255.0
	up bash /root/startup.sh
EOF

### Tachibana
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.12.14
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.4.1
	netmask 255.255.254.0

auto eth2
iface eth2 inet static
	address 10.72.6.1
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

### Deus
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.6.2
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.2.1
	netmask 255.255.255.128

auto eth2
iface eth2 inet static
	address 10.72.2.129
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

### Protocol7
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

### Knights
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.1.66
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.0.129
	netmask 255.255.255.248

auto eth2
iface eth2 inet static
	address 10.72.0.137
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

### Phantoma
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.138
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.0.65
	netmask 255.255.255.224

auto eth2
iface eth2 inet static
	address 10.72.0.97
	netmask 255.255.255.252
	up bash /root/startup.sh
EOF

### Shibuya
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.98
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.72.0.1
	netmask 255.255.255.192
	up bash /root/startup.sh
EOF

### JJ
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.32.2
	netmask 255.255.255.128
	gateway 10.72.32.1
EOF

### MyuMyu
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.32.3
	netmask 255.255.255.128
	gateway 10.72.32.1
EOF

### Karl
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.8.2
	netmask 255.255.252.0
	gateway 10.72.8.1
EOF

### Lin
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.8.3
	netmask 255.255.252.0
	gateway 10.72.8.1
EOF

### Juri
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.18.2
	netmask 255.255.255.192
	gateway 10.72.18.1
EOF

### Masayuki
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.16.2
	netmask 255.255.254.0
	gateway 10.72.16.1
EOF

### Akashic
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.28.2
	netmask 255.255.255.248
	gateway 10.72.28.1
EOF

### Omnipresence
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.24.2
	netmask 255.255.252.0
	gateway 10.72.24.1
EOF

### Denpa
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.24.3
	netmask 255.255.252.0
	gateway 10.72.24.1
EOF

### Alice
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.20.2
	netmask 255.255.255.0
	gateway 10.72.20.1
EOF

### Reika
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.20.3
	netmask 255.255.255.0
	gateway 10.72.20.1
EOF

### Taro
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.21.2
	netmask 255.255.255.192
	gateway 10.72.21.1
EOF

### Yasuo
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.22.2
	netmask 255.255.255.0
	gateway 10.72.22.1
EOF

### Miho
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.22.3
	netmask 255.255.255.0
	gateway 10.72.22.1
EOF

### Kuma
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.22.4
	netmask 255.255.255.0
	gateway 10.72.22.1
EOF

### Collective
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.4.2
	netmask 255.255.254.0
	gateway 10.72.4.1
EOF

### Ghost
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.4.3
	netmask 255.255.254.0
	gateway 10.72.4.1
EOF

### Lilith
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.2.2
	netmask 255.255.255.128
	gateway 10.72.2.1
EOF

### Specter
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.2.3
	netmask 255.255.255.128
	gateway 10.72.2.1
EOF

### Chisa
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.1.2
	netmask 255.255.255.192
	gateway 10.72.1.1
EOF

### Hodgeson
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.1.3
	netmask 255.255.255.192
	gateway 10.72.1.1
EOF

### Eiri
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.130
	netmask 255.255.255.248
	gateway 10.72.0.129
EOF

### Semi
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.66
	netmask 255.255.255.224
	gateway 10.72.0.65
EOF

### Lain
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.2
	netmask 255.255.255.192
	gateway 10.72.0.1
EOF

### Mika
cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet static
	address 10.72.0.3
	netmask 255.255.255.192
	gateway 10.72.0.1
EOF
