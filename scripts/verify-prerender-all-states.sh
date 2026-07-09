#!/bin/bash
# Verify All 52 States Have Full Prerendered Content
# Tests that every state page has: intro (200+ chars), 25 agencies, FAQs, schemas

set -e

echo "=========================================="
echo "VERIFY ALL 52 STATES - FULL CONTENT"
echo "=========================================="
echo ""

DIST_DIR="dist"
TOTAL_STATES=0
PASSED_STATES=0
FAILED_STATES=0
FAILURES=()

# All 52 US states + territories
STATES=(
  "alabama"
  "alaska"
  "arizona"
  "arkansas"
  "california"
  "colorado"
  "connecticut"
  "delaware"
  "district-of-columbia"
  "florida"
  "georgia"
  "hawaii"
  "idaho"
  "illinois"
  "indiana"
  "iowa"
  "kansas"
  "kentucky"
  "louisiana"
  "maine"
  "maryland"
  "massachusetts"
  "michigan"
  "minnesota"
  "mississippi"
  "missouri"
  "montana"
  "nebraska"
  "nevada"
  "new-hampshire"
  "new-jersey"
  "new-mexico"
  "new-york"
  "north-carolina"
  "north-dakota"
  "ohio"
  "oklahoma"
  "oregon"
  "pennsylvania"
  "puerto-rico"
  "rhode-island"
  "south-carolina"
  "south-dakota"
  "tennessee"
  "texas"
  "utah"
  "vermont"
  "virginia"
  "washington"
  "west-virginia"
  "wisconsin"
  "wyoming"
)

verify_state() {
  local state_slug=$1
  local state_file="$DIST_DIR/marketing-agencies-in-${state_slug}-united-states/index.html"

  if [ ! -f "$state_file" ]; then
    echo "   ❌ File not found"
    return 1
  fi

  local errors=0

  # Test 1: Intro length (must be 200+ chars, not generic 1-liner)
  local intro_section=$(sed -n '/<div style="font-size: 1.125rem; color: #4B5563/,/<\/div>/p' "$state_file" | head -20)
  local intro_length=${#intro_section}

  if [ $intro_length -lt 200 ]; then
    echo "   ❌ Intro too short: ${intro_length} chars (need 200+)"
    errors=$((errors + 1))
  fi

  # Test 2: Must have exactly 25 <li> items (agencies)
  local li_count=$(grep -o '<li style="margin-bottom: 1.5rem;">' "$state_file" | wc -l)

  if [ $li_count -ne 25 ]; then
    echo "   ❌ Only $li_count agencies (need 25)"
    errors=$((errors + 1))
  fi

  # Test 3: Must have FAQ section
  if ! grep -q "Frequently Asked Questions" "$state_file"; then
    echo "   ❌ No FAQ section found"
    errors=$((errors + 1))
  fi

  # Test 4: Must have FAQPage JSON-LD schema
  if ! grep -q '"@type": "FAQPage"' "$state_file"; then
    echo "   ❌ No FAQPage schema found"
    errors=$((errors + 1))
  fi

  # Test 5: Must have ItemList JSON-LD schema
  if ! grep -q '"@type": "ItemList"' "$state_file"; then
    echo "   ❌ No ItemList schema found"
    errors=$((errors + 1))
  fi

  # Test 6: Must NOT contain "Loading" text
  if grep -q "Loading" "$state_file"; then
    echo "   ❌ Contains 'Loading' text (not prerendered)"
    errors=$((errors + 1))
  fi

  # Test 7: Must have canonical URL
  if ! grep -q "rel=\"canonical\"" "$state_file"; then
    echo "   ❌ No canonical URL found"
    errors=$((errors + 1))
  fi

  # Test 8: Must NOT have noindex (risky for canonical)
  if grep -q '<meta name="robots" content="noindex' "$state_file"; then
    echo "   ❌ Contains noindex meta (unsafe for canonical)"
    errors=$((errors + 1))
  fi

  # Test 9: Must NOT have "Last updated" text (not WordPress-parity)
  if grep -q "Last updated:" "$state_file"; then
    echo "   ❌ Contains 'Last updated' text (not in original)"
    errors=$((errors + 1))
  fi

  # Test 10: Must NOT have "Explore More" section (not WordPress-parity)
  if grep -q "Explore More" "$state_file"; then
    echo "   ❌ Contains 'Explore More' section (not in original)"
    errors=$((errors + 1))
  fi

  # Test 11: Flat file must also NOT have noindex
  local flat_file="$DIST_DIR/marketing-agencies-in-${state_slug}-united-states.html"
  if [ -f "$flat_file" ]; then
    if grep -q '<meta name="robots" content="noindex' "$flat_file"; then
      echo "   ❌ Flat file has noindex (unsafe if canonical routes to .html)"
      errors=$((errors + 1))
    fi
  fi

  return $errors
}

echo "Checking $DIST_DIR for prerendered state pages..."
echo ""

for state in "${STATES[@]}"; do
  TOTAL_STATES=$((TOTAL_STATES + 1))

  # Format state name for display
  state_name=$(echo "$state" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2));}1')

  printf "%-30s → " "$state_name"

  if verify_state "$state"; then
    echo "✅ PASS"
    PASSED_STATES=$((PASSED_STATES + 1))
  else
    FAILED_STATES=$((FAILED_STATES + 1))
    FAILURES+=("$state_name")
  fi
done

echo ""
echo "=========================================="
echo "VERIFICATION SUMMARY"
echo "=========================================="
echo ""
echo "Total States:  $TOTAL_STATES"
echo "✅ Passed:      $PASSED_STATES"
echo "❌ Failed:      $FAILED_STATES"
echo ""

if [ $FAILED_STATES -gt 0 ]; then
  echo "Failed States:"
  for failed_state in "${FAILURES[@]}"; do
    echo "  • $failed_state"
  done
  echo ""
  echo "❌ VERIFICATION FAILED"
  echo ""
  echo "All states must have:"
  echo "  • Multi-paragraph intro (200+ chars)"
  echo "  • Exactly 25 agencies"
  echo "  • FAQ section"
  echo "  • FAQPage + ItemList schemas"
  echo "  • No 'Loading' text"
  echo "  • Canonical URL"
  echo "  • NO noindex meta tags (risky for canonical)"
  echo "  • NO 'Last updated' text (not WordPress-parity)"
  echo "  • NO 'Explore More' section (not WordPress-parity)"
  echo ""
  exit 1
else
  echo "=========================================="
  echo "✅ ALL $TOTAL_STATES STATES VERIFIED!"
  echo "=========================================="
  echo ""
  echo "Sample verification (CA, TX, FL):"
  echo ""

  for sample in "california" "texas" "florida"; do
    sample_file="$DIST_DIR/marketing-agencies-in-${sample}-united-states/index.html"
    if [ -f "$sample_file" ]; then
      sample_name=$(echo "$sample" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2));}1')
      agencies=$(grep -o '<li style="margin-bottom: 1.5rem;">' "$sample_file" | wc -l)
      faqs=$(grep -o '"@type": "Question"' "$sample_file" | wc -l)
      has_itemlist=$(grep -q '"@type": "ItemList"' "$sample_file" && echo "✅" || echo "❌")
      echo "$sample_name: $agencies agencies, $faqs FAQs, ItemList: $has_itemlist"
    fi
  done

  echo ""
  echo "Deploy with confidence!"
  echo ""
  exit 0
fi
