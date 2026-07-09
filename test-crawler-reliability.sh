#!/usr/bin/env bash
set -euo pipefail

UA_GOOGLEBOT='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

check () {
  name="$1"
  url="$2"
  ok=0; fail=0
  for i in $(seq 1 30); do
    code=$(curl -s -o /dev/null -w '%{http_code}' -A "$UA_GOOGLEBOT" "$url")
    if [ "$code" = "200" ]; then ok=$((ok+1)); else fail=$((fail+1)); fi
    echo "$name $i code=$code"
    sleep 2
  done
  echo "$name SUMMARY ok=$ok fail=$fail url=$url"
}

check "HOME_GOOGLEBOT" "https://www.gappsy.com/"
check "IL_GOOGLEBOT" "https://www.gappsy.com/marketing-agencies-in-illinois-united-states/"
