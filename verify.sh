#!/bin/bash

echo "=== EXPLICIT RUNTIME VERIFICATION ==="
echo ""
echo "Checking 10 critical source paths:"
echo ""

for source in /listing /pricing /login /contact-us /about-us /home /refund /refund/61 /marketing-agency-web-rocket-media-reviews /product/deal-1-special; do
  rule=$(grep "^${source} " public/_redirects | head -1)
  if [ -n "$rule" ]; then
    dest=$(echo "$rule" | awk '{print $2}')
    status=$(echo "$rule" | awk '{print $3}')
    printf "%-45s -> %-35s -> %s\n" "$source" "$dest" "$status"
  else
    echo "$source -> NOT FOUND"
  fi
done

echo ""
echo "=== RULE ORDER VERIFICATION ==="
echo ""
echo "First 10 lines (should be 200 rewrites for state pages):"
head -10 public/_redirects
echo ""
echo "Lines 94-100 (transition from rewrites to redirects):"
sed -n '94,100p' public/_redirects
