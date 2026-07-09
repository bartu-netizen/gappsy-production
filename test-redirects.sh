#!/bin/bash

# Redirect Verification Test Script
# Tests all 4 URL variants to ensure they redirect to canonical URL

echo "🔍 Testing Canonical Redirect Rules"
echo "===================================="
echo ""

# Test state: New Jersey
STATE="new-jersey"
BASE_PATH="/marketing-agencies-in-${STATE}-united-states"
CANONICAL="https://www.gappsy.com${BASE_PATH}/"

echo "📍 Testing State: New Jersey"
echo "Canonical URL: $CANONICAL"
echo ""

# Test 1: Non-www, no trailing slash
echo "Test 1: Non-www + No trailing slash"
echo "Input: https://gappsy.com${BASE_PATH}"
echo "Expected: 301 → www, then 301 → trailing slash, then 200"
curl -I -L -s "https://gappsy.com${BASE_PATH}" | grep -E "(HTTP|location)" | head -6
echo ""

# Test 2: Non-www, has trailing slash
echo "Test 2: Non-www + Has trailing slash"
echo "Input: https://gappsy.com${BASE_PATH}/"
echo "Expected: 301 → www, then 200"
curl -I -L -s "https://gappsy.com${BASE_PATH}/" | grep -E "(HTTP|location)" | head -4
echo ""

# Test 3: Has www, no trailing slash
echo "Test 3: Has www + No trailing slash"
echo "Input: https://www.gappsy.com${BASE_PATH}"
echo "Expected: 301 → trailing slash, then 200"
curl -I -L -s "https://www.gappsy.com${BASE_PATH}" | grep -E "(HTTP|location)" | head -4
echo ""

# Test 4: Canonical URL (www + trailing slash)
echo "Test 4: Canonical URL (www + trailing slash)"
echo "Input: https://www.gappsy.com${BASE_PATH}/"
echo "Expected: 200 (no redirects)"
curl -I -s "https://www.gappsy.com${BASE_PATH}/" | grep -E "(HTTP)" | head -1
echo ""

# Test 5: Verify canonical tag in HTML
echo "Test 5: Canonical tag in HTML"
echo "Expected: <link rel=\"canonical\" href=\"$CANONICAL\" />"
curl -s "https://www.gappsy.com${BASE_PATH}/" | grep -o '<link rel="canonical"[^>]*>' | head -1
echo ""

# Test 6: Verify og:url matches canonical
echo "Test 6: OG URL matches canonical"
echo "Expected: <meta property=\"og:url\" content=\"$CANONICAL\" />"
curl -s "https://www.gappsy.com${BASE_PATH}/" | grep -o '<meta property="og:url"[^>]*>' | head -1
echo ""

# Test 7: Static asset (should not get trailing slash)
echo "Test 7: Static asset (no trailing slash)"
echo "Input: https://gappsy.com/favicon.png"
echo "Expected: 301 → www, then 200 (no trailing slash)"
curl -I -L -s "https://gappsy.com/favicon.png" | grep -E "(HTTP|location)" | head -4
echo ""

# Test multiple states
echo "📍 Quick test of other states:"
echo ""

for state in "california" "texas" "new-york" "florida"; do
    echo "Testing: $state"
    STATUS=$(curl -I -L -s -o /dev/null -w "%{http_code}" "https://www.gappsy.com/marketing-agencies-in-${state}-united-states/")
    if [ "$STATUS" = "200" ]; then
        echo "  ✅ Status: $STATUS (canonical URL works)"
    else
        echo "  ❌ Status: $STATUS (unexpected)"
    fi
done

echo ""
echo "✅ Redirect verification complete!"
echo ""
echo "Expected behavior:"
echo "  - All non-www URLs redirect to www"
echo "  - All URLs without trailing slash get one added"
echo "  - Canonical URLs (www + slash) serve immediately (200)"
echo "  - Canonical tag matches final URL"
echo "  - Files with extensions don't get trailing slash"
