#!/bin/bash
# Soal 4 & 5 - Static routing seefisien mungkin (CIDR, 24 rute) + autostart, kelompok K17
# Jalankan blok router yang sesuai di console router itu. Script tersimpan di /root (persisten),
# dan dipanggil saat boot lewat baris "up bash /root/startup.sh" di network config.
# Jangan jalankan file ini utuh di satu node.

### Cyberia
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Cyberia
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace 10.72.0.0/19 via 10.72.32.130
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
bash /root/soal_7.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Wired
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Wired
sysctl -w net.ipv4.ip_forward=1 >/dev/null
# Matikan ICMP redirect: Psyche, Copland, Schumann berbagi segmen A3 dengan Wired
sysctl -w net.ipv4.conf.all.send_redirects=0 >/dev/null
sysctl -w net.ipv4.conf.eth1.send_redirects=0 >/dev/null
ip route replace default via 10.72.32.129
ip route replace 10.72.8.0/22 via 10.72.12.2
ip route replace 10.72.16.0/22 via 10.72.12.3
ip route replace 10.72.24.0/21 via 10.72.12.4
ip route replace 10.72.20.0/22 via 10.72.12.10
ip route replace 10.72.0.0/21 via 10.72.12.14
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Psyche
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Psyche
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.1
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Copland
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Copland
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.1
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Schumann
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Schumann
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.1
ip route replace 10.72.24.0/22 via 10.72.28.10
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Accela
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Accela
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.28.9
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Navi
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Navi
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.9
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Tachibana
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Tachibana
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.12.13
ip route replace 10.72.0.0/22 via 10.72.6.2
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Deus
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Deus
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.6.1
ip route replace 10.72.0.0/23 via 10.72.2.130
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Protocol7
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Protocol7
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.2.129
ip route replace 10.72.0.0/24 via 10.72.1.66
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Knights
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Knights
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.1.65
ip route replace 10.72.0.0/25 via 10.72.0.138
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Phantoma
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Phantoma
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.0.137
ip route replace 10.72.0.0/26 via 10.72.0.98
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF

### Shibuya
cat > /root/soal_5.sh <<'EOF'
#!/bin/bash
# Soal 5 - static routing (CIDR) Shibuya
sysctl -w net.ipv4.ip_forward=1 >/dev/null
ip route replace default via 10.72.0.97
ip route
EOF
cat > /root/startup.sh <<'EOF'
#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
EOF
