#!/bin/bash
# Production Prerender Verification Script
# Run this AFTER deploying to production

set -e

DOMAIN="https://www.gappsy.com"
UA='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

echo "=========================================="
echo "PRODUCTION PRERENDER VERIFICATION"
echo "Domain: $DOMAIN"
echo "=========================================="
echo ""

# 1. Check marker file
echo "1️⃣  Checking marker file..."
MARKER=$(curl -sL "$DOMAIN/__prerendered.txt")
if echo "$MARKER" | grep -q "Prerender completed successfully"; then
    echo "   ✅ Marker file exists"
    echo "$MARKER" | head -4 | sed 's/^/   /'
else
    echo "   ❌ Marker file missing or invalid"
    echo "$MARKER" | head -5 | sed 's/^/   /'
fi
echo ""

# 2. Check build ID
echo "2️⃣  Checking build ID..."
BUILD_ID=$(curl -sL "$DOMAIN/build-id.txt")
if echo "$BUILD_ID" | grep -q "DEPLOY:"; then
    echo "   ✅ Build ID: $BUILD_ID"
else
    echo "   ⚠️  Build ID not found or invalid"
fi
echo ""

# 3. Check New Jersey page (primary test)
echo "3️⃣  Checking New Jersey page (Googlebot UA)..."
NJ_HTML=$(curl -sL -A "$UA" "$DOMAIN/marketing-agencies-in-new-jersey-united-states/")

if echo "$NJ_HTML" | grep -q "PRERENDER_OK"; then
    echo "   ✅ PRERENDER_OK found"
else
    echo "   ❌ PRERENDER_OK NOT found"
fi

if echo "$NJ_HTML" | grep -q "<h1"; then
    H1=$(echo "$NJ_HTML" | grep -o "<h1[^>]*>[^<]*</h1>" | head -1)
    echo "   ✅ H1 tag found: ${H1:0:80}..."
else
    echo "   ❌ H1 tag NOT found"
fi

if echo "$NJ_HTML" | grep -qi "Loading .* data"; then
    echo "   ❌ CRITICAL: Still showing SPA loader!"
else
    echo "   ✅ No SPA loader detected"
fi
echo ""

# 4. Test multiple states
echo "4️⃣  Testing multiple states..."
STATES=("alabama" "california" "texas" "idaho")
PASS=0
FAIL=0

for state in "${STATES[@]}"; do
    URL="$DOMAIN/marketing-agencies-in-$state-united-states/"
    RESPONSE=$(curl -sL -A "$UA" "$URL")

    if echo "$RESPONSE" | grep -q "PRERENDER_OK"; then
        echo "   ✅ $state"
        ((PASS++))
    else
        echo "   ❌ $state - NO PRERENDER_OK"
        ((FAIL++))
    fi
done

echo ""
echo "   Summary: $PASS passed, $FAIL failed"
echo ""

# 5. Check _redirects order
echo "5️⃣  Checking _redirects configuration..."
REDIRECTS=$(curl -sL "$DOMAIN/_redirects")
if echo "$REDIRECTS" | grep -q "marketing-agencies-in-:state"; then
    echo "   ✅ State route redirects found in _redirects"
else
    echo "   ⚠️  State route redirects NOT found (may not be publicly accessible)"
fi
echo ""

# Final verdict
echo "=========================================="
if echo "$NJ_HTML" | grep -q "PRERENDER_OK" && ! echo "$NJ_HTML" | grep -qi "Loading .* data"; then
    echo "✅ SUCCESS: Prerendered HTML is live!"
    echo "=========================================="
    exit 0
else
    echo "❌ FAILURE: Prerendered HTML NOT working"
    echo "=========================================="
    echo ""
    echo "Troubleshooting:"
    echo "1. Check Netlify deploy log for build errors"
    echo "2. Verify publish directory is 'dist'"
    echo "3. Verify build command is 'npm run build'"
    echo "4. Check if dist/_redirects has state routes ABOVE SPA fallback"
    echo "5. Clear Netlify CDN cache"
    exit 1
fi
