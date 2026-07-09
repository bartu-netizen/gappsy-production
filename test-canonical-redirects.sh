#!/bin/bash

# Test script for canonical URL redirects
# Expected behavior: https://www.gappsy.com/<path>/ is the ONLY canonical form

echo "=========================================="
echo "Canonical URL Redirect Test"
echo "=========================================="
echo ""
echo "✅ EXPECTED CANONICAL FORMAT:"
echo "   https://www.gappsy.com/<path>/"
echo ""
echo "=========================================="
echo "REDIRECT RULES VERIFICATION"
echo "=========================================="
echo ""

# Check redirect rules exist in correct order
echo "📋 Checking _redirects file structure..."
echo ""

if grep -q "http://gappsy.com/\*.*https://www.gappsy.com/:splat 301!" /tmp/cc-agent/62327431/project/public/_redirects; then
    echo "✅ Rule 1: http://gappsy.com/* → https://www.gappsy.com/:splat"
else
    echo "❌ Rule 1: MISSING"
fi

if grep -q "http://www.gappsy.com/\*.*https://www.gappsy.com/:splat 301!" /tmp/cc-agent/62327431/project/public/_redirects; then
    echo "✅ Rule 2: http://www.gappsy.com/* → https://www.gappsy.com/:splat"
else
    echo "❌ Rule 2: MISSING"
fi

if grep -q "https://gappsy.com/\*.*https://www.gappsy.com/:splat 301!" /tmp/cc-agent/62327431/project/public/_redirects; then
    echo "✅ Rule 3: https://gappsy.com/* → https://www.gappsy.com/:splat"
else
    echo "❌ Rule 3: MISSING"
fi

if grep -q "^\^/(\[^\.\?\]\+\[^/\])$ /\$1/ 301!" /tmp/cc-agent/62327431/project/public/_redirects; then
    echo "✅ Rule 4: Force trailing slash (regex)"
else
    echo "❌ Rule 4: MISSING"
fi

echo ""
echo "=========================================="
echo "PRE-RENDERED HTML VERIFICATION"
echo "=========================================="
echo ""

# Check New Jersey page (the problematic one mentioned)
NJ_FILE="/tmp/cc-agent/62327431/project/dist/marketing-agencies-in-new-jersey-united-states.html"

if [ -f "$NJ_FILE" ]; then
    echo "📄 Checking: marketing-agencies-in-new-jersey-united-states.html"
    echo ""

    CANONICAL=$(grep -o 'rel="canonical" href="[^"]*"' "$NJ_FILE" | cut -d'"' -f4)
    OG_URL=$(grep -o 'property="og:url" content="[^"]*"' "$NJ_FILE" | cut -d'"' -f4)

    echo "   Canonical: $CANONICAL"
    echo "   OG URL:    $OG_URL"
    echo ""

    if [[ "$CANONICAL" == "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" ]]; then
        echo "   ✅ Canonical URL is correct"
    else
        echo "   ❌ Canonical URL is incorrect"
    fi

    if [[ "$OG_URL" == "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" ]]; then
        echo "   ✅ OG URL is correct"
    else
        echo "   ❌ OG URL is incorrect"
    fi
else
    echo "❌ Pre-rendered HTML not found"
fi

echo ""
echo "=========================================="
echo "NON-WWW URL CHECK"
echo "=========================================="
echo ""

NON_WWW_COUNT=$(grep -r 'https://gappsy.com' /tmp/cc-agent/62327431/project/dist/*.html 2>/dev/null | grep -v 'www.gappsy.com' | wc -l)

if [ "$NON_WWW_COUNT" -eq 0 ]; then
    echo "✅ No non-www URLs found in HTML ($NON_WWW_COUNT occurrences)"
else
    echo "❌ Found $NON_WWW_COUNT non-www URLs in HTML"
fi

echo ""
echo "=========================================="
echo "REDIRECT LOGIC SIMULATION"
echo "=========================================="
echo ""
echo "Testing URL variations for: /marketing-agencies-in-new-jersey-united-states"
echo ""

echo "1. https://gappsy.com/marketing-agencies-in-new-jersey-united-states"
echo "   → 301 → https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states (Rule 3)"
echo "   → 301 → https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ (Rule 4)"
echo "   ✅ Final: CANONICAL (2 redirects)"
echo ""

echo "2. https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states"
echo "   → 301 → https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ (Rule 4)"
echo "   ✅ Final: CANONICAL (1 redirect)"
echo ""

echo "3. https://gappsy.com/marketing-agencies-in-new-jersey-united-states/"
echo "   → 301 → https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ (Rule 3)"
echo "   ✅ Final: CANONICAL (1 redirect)"
echo ""

echo "4. https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/"
echo "   ✅ Final: CANONICAL (0 redirects) - SERVES IMMEDIATELY"
echo ""

echo "=========================================="
echo "DEPLOYMENT CHECKLIST"
echo "=========================================="
echo ""
echo "Before deploying, ensure:"
echo "  ✅ public/_redirects has all 4 canonical rules"
echo "  ✅ All HTML files use https://www.gappsy.com/.../"
echo "  ✅ No non-www URLs in any HTML"
echo "  ✅ Pre-rendered HTML exists for all 52 states"
echo ""
echo "After deploying, test:"
echo "  1. https://gappsy.com/page → should redirect to https://www.gappsy.com/page/"
echo "  2. https://www.gappsy.com/page → should redirect to https://www.gappsy.com/page/"
echo "  3. https://www.gappsy.com/page/ → should serve immediately (no redirect)"
echo "  4. No ERR_TOO_MANY_REDIRECTS errors"
echo ""
echo "=========================================="
echo "BUILD INFO"
echo "=========================================="
echo ""

if [ -f "/tmp/cc-agent/62327431/project/dist/build-id.txt" ]; then
    echo "Build ID: $(cat /tmp/cc-agent/62327431/project/dist/build-id.txt)"
else
    echo "Build ID: Not found"
fi

echo ""
echo "State pages pre-rendered: $(ls -1 /tmp/cc-agent/62327431/project/dist/marketing-agencies-in-*-united-states.html 2>/dev/null | wc -l)"
echo ""
echo "=========================================="
echo "TEST COMPLETE"
echo "=========================================="
