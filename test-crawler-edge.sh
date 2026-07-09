#!/usr/bin/env bash
set -euo pipefail

UA_BROWSER='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
UA_GOOGLEBOT='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

URLS=(
  "https://www.gappsy.com/"
  "https://www.gappsy.com/marketing-agencies-in-illinois-united-states/"
  "https://www.gappsy.com/marketing-agencies-in-new-york-united-states/"
  "https://www.gappsy.com/marketing-agencies-in-florida-united-states/"
  "https://www.gappsy.com/marketing-agencies-in-texas-united-states/"
  "https://www.gappsy.com/marketing-agencies-in-california-united-states/"
)

echo "== Browser UA (should be 200, likely no x-gappsy headers) =="
for u in "${URLS[@]}"; do
  code=$(curl -s -o /dev/null -w '%{http_code}' -A "$UA_BROWSER" "$u")
  echo "BROWSER $code $u"
done

echo ""
echo "== Googlebot UA (should be 200 + x-gappsy-crawler-static: rewritten) =="
for u in "${URLS[@]}"; do
  code=$(curl -s -o /dev/null -w '%{http_code}' -A "$UA_GOOGLEBOT" "$u")
  echo "GOOGLEBOT $code $u"
  curl -s -I -A "$UA_GOOGLEBOT" "$u" \
    | egrep -i '^(HTTP|x-gappsy-crawler-static:|x-gappsy-crawler-target:|x-nf-request-id:|server:|date:|cache-status:)' \
    || true
  echo "----"
done
