#!/bin/sh
# Soal 5 - uji konektivitas: ping ke satu IP dari setiap 38 node + internet
ok=0; gagal=0
for t in \
  Cyberia:10.72.32.1 \
  Wired:10.72.32.130 \
  Psyche:10.72.12.2 \
  Copland:10.72.12.3 \
  Schumann:10.72.12.4 \
  Accela:10.72.28.10 \
  Navi:10.72.12.10 \
  Tachibana:10.72.12.14 \
  Deus:10.72.6.2 \
  Protocol7:10.72.2.130 \
  Knights:10.72.1.66 \
  Phantoma:10.72.0.138 \
  Shibuya:10.72.0.98 \
  JJ:10.72.32.2 \
  MyuMyu:10.72.32.3 \
  Karl:10.72.8.2 \
  Lin:10.72.8.3 \
  Juri:10.72.18.2 \
  Masayuki:10.72.16.2 \
  Akashic:10.72.28.2 \
  Omnipresence:10.72.24.2 \
  Denpa:10.72.24.3 \
  Alice:10.72.20.2 \
  Reika:10.72.20.3 \
  Taro:10.72.21.2 \
  Yasuo:10.72.22.2 \
  Miho:10.72.22.3 \
  Kuma:10.72.22.4 \
  Collective:10.72.4.2 \
  Ghost:10.72.4.3 \
  Lilith:10.72.2.2 \
  Specter:10.72.2.3 \
  Chisa:10.72.1.2 \
  Hodgeson:10.72.1.3 \
  Eiri:10.72.0.130 \
  Semi:10.72.0.66 \
  Lain:10.72.0.2 \
  Mika:10.72.0.3 \
  Internet:8.8.8.8; do
  nama=${t%%:*}; ip=${t#*:}
  if ping -c 1 -W 2 "$ip" >/dev/null 2>&1; then echo "OK    $nama ($ip)"; ok=$((ok+1));
  else echo "GAGAL $nama ($ip)"; gagal=$((gagal+1)); fi
done
echo "--- $ok berhasil, $gagal gagal ---"
