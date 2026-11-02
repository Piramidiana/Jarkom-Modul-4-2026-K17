#!/bin/bash
# Dipanggil saat boot lewat "up bash /root/startup.sh" di network config
{
echo "=== boot $(date) ==="
bash /root/soal_5.sh
bash /root/soal_7.sh
echo "=== selesai ==="
} >> /root/startup.log 2>&1
