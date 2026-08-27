#!/usr/bin/env bash
# Télécharge toutes les images du CDN dans public/images/ en gardant le nom de fichier.
set -u
mkdir -p public/images
ok=0; fail=0
while IFS= read -r url; do
  [ -z "$url" ] && continue
  name="${url##*/}"
  out="public/images/$name"
  if [ -s "$out" ]; then ok=$((ok+1)); continue; fi
  if curl -fsSL --retry 3 --retry-delay 2 --max-time 60 -o "$out" "$url"; then
    ok=$((ok+1))
  else
    rm -f "$out"; fail=$((fail+1)); echo "ECHEC: $url" >&2
  fi
done < temoignages-urls.txt
echo "OK: $ok  ECHECS: $fail"
