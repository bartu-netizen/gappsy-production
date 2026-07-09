#!/bin/bash

# Redirect Loop Diagnostic Script
# Tests production site to identify which layer is causing the redirect loop

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         REDIRECT LOOP DIAGNOSTIC - Production Test          ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

SITE_URL="gappsy.com"
TEST_PATH="/marketing-agencies-in-new-jersey-united-states"
MAX_REDIRECTS=10

echo "🎯 Testing URL: $SITE_URL$TEST_PATH"
echo ""
echo "══════════════════════════════════════════════════════════════"
echo "TEST 1: Canonical URL (should return 200 with no redirects)"
echo "══════════════════════════════════════════════════════════════"
echo ""
echo "URL: https://www.$SITE_URL$TEST_PATH/"
echo ""

RESPONSE=$(curl -sI "https://www.$SITE_URL$TEST_PATH/" 2>&1)
STATUS=$(echo "$RESPONSE" | grep -E "^HTTP" | tail -1 | awk '{print $2}')
LOCATION=$(echo "$RESPONSE" | grep -i "^Location:" | awk '{print $2}' | tr -d '\r')

echo "Status: $STATUS"
if [ -n "$LOCATION" ]; then
    echo "Location: $LOCATION"
    echo ""
    echo "❌ PROBLEM: Canonical URL is redirecting!"
    echo "   Expected: 200 OK with no Location header"
    echo "   Actual: $STATUS redirect to $LOCATION"
    echo ""
    echo "   This indicates Netlify is applying redirects at domain level"
    echo "   Check: Netlify → Domain Settings → Primary Domain"
else
    echo "Location: (none)"
    echo ""
    echo "✅ GOOD: Canonical URL serves directly without redirect"
fi

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "TEST 2: Non-WWW URL (should redirect to www + trailing slash)"
echo "══════════════════════════════════════════════════════════════"
echo ""
echo "URL: https://$SITE_URL$TEST_PATH"
echo ""

# Follow redirects and show each step
REDIRECT_CHAIN=$(curl -sIL -w "\nFINAL_STATUS:%{http_code}" "https://$SITE_URL$TEST_PATH" 2>&1)
echo "$REDIRECT_CHAIN" | grep -E "(HTTP|Location)" | head -20

REDIRECT_COUNT=$(echo "$REDIRECT_CHAIN" | grep -c "HTTP")
FINAL_STATUS=$(echo "$REDIRECT_CHAIN" | grep "FINAL_STATUS" | cut -d: -f2)

echo ""
echo "Total HTTP responses: $REDIRECT_COUNT"
echo "Final status: $FINAL_STATUS"
echo ""

if [ "$REDIRECT_COUNT" -gt 10 ]; then
    echo "❌ REDIRECT LOOP DETECTED!"
    echo "   More than 10 redirects occurred"
    echo ""
    echo "🔍 Analyzing redirect pattern..."
    echo ""

    # Show the redirect pattern
    LOCATIONS=$(echo "$REDIRECT_CHAIN" | grep -i "Location:" | head -10)
    echo "$LOCATIONS"
    echo ""

    # Check if ping-ponging between www and non-www
    if echo "$LOCATIONS" | grep -q "https://$SITE_URL" && echo "$LOCATIONS" | grep -q "https://www.$SITE_URL"; then
        echo "❌ PING-PONG DETECTED: www ↔ non-www"
        echo ""
        echo "   Root Cause: Netlify domain settings conflict with _redirects"
        echo ""
        echo "   Fix: Go to Netlify Dashboard"
        echo "        → Domain Management → Domains"
        echo "        → DISABLE 'Redirect to primary domain'"
    fi

elif [ "$REDIRECT_COUNT" -eq 3 ] && [ "$FINAL_STATUS" = "200" ]; then
    echo "✅ GOOD: Correct redirect chain"
    echo "   Expected: 2-3 redirects to reach canonical URL"

else
    echo "⚠️  UNEXPECTED: $REDIRECT_COUNT redirects with final status $FINAL_STATUS"
fi

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "TEST 3: Missing Trailing Slash (should redirect to add slash)"
echo "══════════════════════════════════════════════════════════════"
echo ""
echo "URL: https://www.$SITE_URL$TEST_PATH"
echo ""

RESPONSE=$(curl -sI "https://www.$SITE_URL$TEST_PATH" 2>&1)
STATUS=$(echo "$RESPONSE" | grep -E "^HTTP" | tail -1 | awk '{print $2}')
LOCATION=$(echo "$RESPONSE" | grep -i "^Location:" | awk '{print $2}' | tr -d '\r')

echo "Status: $STATUS"
echo "Location: $LOCATION"
echo ""

if [ "$STATUS" = "301" ] && [ "$LOCATION" = "https://www.$SITE_URL$TEST_PATH/" ]; then
    echo "✅ GOOD: Correctly redirects to add trailing slash"
elif [ "$STATUS" = "301" ]; then
    echo "⚠️  Redirects, but to unexpected location"
    echo "   Expected: https://www.$SITE_URL$TEST_PATH/"
    echo "   Actual: $LOCATION"
else
    echo "⚠️  Expected 301 redirect, got $STATUS"
fi

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "TEST 4: Netlify Header Check"
echo "══════════════════════════════════════════════════════════════"
echo ""

HEADERS=$(curl -sI "https://www.$SITE_URL/" 2>&1)
echo "Checking for Netlify-specific headers..."
echo ""

if echo "$HEADERS" | grep -qi "x-nf-request-id"; then
    echo "✅ Site is hosted on Netlify"
    NF_REQUEST_ID=$(echo "$HEADERS" | grep -i "x-nf-request-id" | awk '{print $2}' | tr -d '\r')
    echo "   Request ID: $NF_REQUEST_ID"
else
    echo "⚠️  No Netlify headers detected"
    echo "   Site might be behind proxy (Cloudflare, etc.)"
fi

if echo "$HEADERS" | grep -qi "x-nf-redirect"; then
    echo "⚠️  Netlify redirect header detected"
    echo "   This confirms Netlify is applying domain-level redirects"
fi

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "TEST 5: DNS Configuration Check"
echo "══════════════════════════════════════════════════════════════"
echo ""

echo "Checking DNS records for $SITE_URL..."
echo ""

if command -v dig &> /dev/null; then
    echo "A record for @:"
    dig +short "$SITE_URL" A | head -3
    echo ""
    echo "CNAME record for www:"
    dig +short "www.$SITE_URL" CNAME | head -3
    echo ""

    # Check if both point to Netlify
    A_RECORD=$(dig +short "$SITE_URL" A | head -1)
    CNAME_RECORD=$(dig +short "www.$SITE_URL" CNAME | head -1)

    if echo "$CNAME_RECORD" | grep -q "netlify"; then
        echo "✅ www subdomain points to Netlify"
    else
        echo "⚠️  www subdomain does not point to Netlify"
    fi

else
    echo "⚠️  'dig' command not available, skipping DNS check"
    echo "   Install dnsutils package to enable DNS diagnostics"
fi

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "SUMMARY & RECOMMENDATIONS"
echo "══════════════════════════════════════════════════════════════"
echo ""

# Determine if there's a redirect loop
if [ "$REDIRECT_COUNT" -gt 10 ]; then
    echo "🚨 REDIRECT LOOP CONFIRMED"
    echo ""
    echo "Root Cause: Netlify domain settings are conflicting with _redirects file"
    echo ""
    echo "Fix Steps:"
    echo "  1. Go to: https://app.netlify.com/"
    echo "  2. Select site: $SITE_URL"
    echo "  3. Go to: Site Settings → Domain Management → Domains"
    echo "  4. Click on your domain → Options"
    echo "  5. DISABLE: 'Redirect automatically to primary domain'"
    echo "  6. Save and wait 1-2 minutes for propagation"
    echo "  7. Re-run this script to verify fix"
    echo ""
    echo "Alternative Check:"
    echo "  - Check if DNS provider (Cloudflare) has page rules"
    echo "  - Check if there's a CDN proxy adding redirects"
    echo ""

elif [ -n "$LOCATION" ] && [ "$STATUS" = "200" ]; then
    echo "✅ NO REDIRECT LOOP DETECTED"
    echo ""
    echo "All tests passed. Redirects are working correctly."
    echo ""

else
    echo "⚠️  PARTIAL ISSUES DETECTED"
    echo ""
    echo "Some redirects are not working as expected."
    echo "Review the test results above for specific issues."
    echo ""
fi

echo "══════════════════════════════════════════════════════════════"
echo "TEST COMPLETE"
echo "══════════════════════════════════════════════════════════════"
echo ""
echo "For detailed fix instructions, see:"
echo "  NETLIFY_REDIRECT_CONFLICT_FIX.md"
echo ""
