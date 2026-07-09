#!/bin/bash
#
# Verify SEO Boost Prerender in Production
# Tests Googlebot user agent against all 52 state pages
#

echo "================================================================================"
echo "SEO BOOST PRODUCTION VERIFICATION"
echo "================================================================================"
echo ""
echo "Testing state pages with Googlebot user agent..."
echo "Expected: All titles should include '(2026) | Gappsy'"
echo ""

# Test 5 critical states (including Vermont which was broken)
STATES="vermont wyoming alaska north-dakota new-jersey"

for state in $STATES; do
  echo "========================================"
  echo "STATE: $state"
  echo "========================================"

  url="https://www.gappsy.com/marketing-agencies-in-$state-united-states/"

  echo "1. Title:"
  title=$(curl -A "Googlebot" -sL "$url" 2>/dev/null | grep -i "<title>" | head -n 1 | sed 's/^[[:space:]]*//')
  echo "   $title"

  # Check for success (should contain 2026 and Gappsy)
  if echo "$title" | grep -q "2026" && echo "$title" | grep -q "Gappsy"; then
    echo "   ✅ PASS - Contains year + brand"
  else
    echo "   ❌ FAIL - Missing year or brand"
  fi

  echo ""
  echo "2. Meta Description:"
  desc=$(curl -A "Googlebot" -sL "$url" 2>/dev/null | grep -i 'name="description"' | head -n 1 | sed 's/^[[:space:]]*//')
  echo "   $desc"

  # Check for success (should contain "Updated for 2026")
  if echo "$desc" | grep -q "Updated for 2026"; then
    echo "   ✅ PASS - Contains year"
  else
    echo "   ❌ FAIL - Missing year"
  fi

  echo ""
  echo "3. Canonical:"
  canonical=$(curl -A "Googlebot" -sL "$url" 2>/dev/null | grep -i 'rel="canonical"' | head -n 1 | sed 's/^[[:space:]]*//')
  echo "   $canonical"

  # Check for www and trailing slash
  if echo "$canonical" | grep -q "www.gappsy.com" && echo "$canonical" | grep -q "/$"; then
    echo "   ✅ PASS - Uses www + trailing slash"
  else
    echo "   ❌ FAIL - Wrong domain or missing slash"
  fi

  echo ""
  echo ""
done

echo "================================================================================"
echo "QUICK TEST: All 52 States Title Check"
echo "================================================================================"
echo ""
echo "Checking if all states have year in title..."
echo ""

ALL_STATES="alabama alaska arizona arkansas california colorado connecticut delaware district-of-columbia florida georgia hawaii idaho illinois indiana iowa kansas kentucky louisiana maine maryland massachusetts michigan minnesota mississippi missouri montana nebraska nevada new-hampshire new-jersey new-mexico new-york north-carolina north-dakota ohio oklahoma oregon pennsylvania puerto-rico rhode-island south-carolina south-dakota tennessee texas utah vermont virginia washington west-virginia wisconsin wyoming"

pass_count=0
fail_count=0

for state in $ALL_STATES; do
  url="https://www.gappsy.com/marketing-agencies-in-$state-united-states/"
  title=$(curl -A "Googlebot" -sL "$url" 2>/dev/null | grep -i "<title>" | head -n 1)

  if echo "$title" | grep -q "2026" && echo "$title" | grep -q "Gappsy"; then
    echo "✅ $state"
    ((pass_count++))
  else
    echo "❌ $state - FAILED"
    echo "   Got: $title"
    ((fail_count++))
  fi
done

echo ""
echo "================================================================================"
echo "RESULTS: $pass_count passed, $fail_count failed (out of 52 states)"
echo "================================================================================"

if [ $fail_count -eq 0 ]; then
  echo "✅ ALL TESTS PASSED - SEO Boost is working correctly!"
  exit 0
else
  echo "❌ SOME TESTS FAILED - Review output above"
  exit 1
fi
