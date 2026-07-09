#!/bin/bash

# Verify All 52 States in Production
# Run this AFTER deployment to confirm all states are working

echo "🚀 Verifying all 52 state pages in production..."
echo ""

STATES=(
  "alabama" "alaska" "arizona" "arkansas" "california" "colorado"
  "connecticut" "delaware" "district-of-columbia" "florida" "georgia"
  "hawaii" "idaho" "illinois" "indiana" "iowa" "kansas" "kentucky"
  "louisiana" "maine" "maryland" "massachusetts" "michigan" "minnesota"
  "mississippi" "missouri" "montana" "nebraska" "nevada" "new-hampshire"
  "new-jersey" "new-mexico" "new-york" "north-carolina" "north-dakota"
  "ohio" "oklahoma" "oregon" "pennsylvania" "puerto-rico" "rhode-island"
  "south-carolina" "south-dakota" "tennessee" "texas" "utah" "vermont"
  "virginia" "washington" "west-virginia" "wisconsin" "wyoming"
)

SUCCESS=0
FAILED=0
MISSING_PROOF=0
MISSING_OG=0

for state in "${STATES[@]}"; do
  URL="https://gappsy.bolt.host/marketing-agencies-in-${state}-united-states/"
  OG_URL="https://gappsy.bolt.host/og/marketing-agencies-in-${state}-united-states.svg"

  # Check for proof tag
  PROOF=$(curl -sL "$URL" | grep -o "STATE_SEO_OK_${state}_[0-9]*" | head -1)

  # Check OG image
  OG_STATUS=$(curl -sI "$OG_URL" 2>&1 | grep "HTTP/2" | awk '{print $2}')

  if [[ -n "$PROOF" ]] && [[ "$OG_STATUS" == "200" ]]; then
    echo "✅ ${state}"
    SUCCESS=$((SUCCESS + 1))
  else
    echo "❌ ${state}"
    FAILED=$((FAILED + 1))

    if [[ -z "$PROOF" ]]; then
      echo "   ⚠️  Missing proof tag"
      MISSING_PROOF=$((MISSING_PROOF + 1))
    fi

    if [[ "$OG_STATUS" != "200" ]]; then
      echo "   ⚠️  OG image not accessible (HTTP ${OG_STATUS})"
      MISSING_OG=$((MISSING_OG + 1))
    fi
  fi
done

echo ""
echo "📊 VERIFICATION RESULTS:"
echo "   ✅ Success: ${SUCCESS}/52"
echo "   ❌ Failed: ${FAILED}/52"

if [[ $MISSING_PROOF -gt 0 ]]; then
  echo "   ⚠️  Missing proof tags: ${MISSING_PROOF}"
fi

if [[ $MISSING_OG -gt 0 ]]; then
  echo "   ⚠️  Missing OG images: ${MISSING_OG}"
fi

echo ""

if [[ $FAILED -eq 0 ]]; then
  echo "🎉 ALL 52 STATES VERIFIED SUCCESSFULLY!"
  exit 0
else
  echo "⚠️  Some states failed verification. See above for details."
  echo ""
  echo "If proof tags are missing:"
  echo "  1. Old build still deployed"
  echo "  2. Trigger 'Clear cache and deploy site' in Netlify"
  echo "  3. Wait 2-3 minutes and re-run this script"
  exit 1
fi
