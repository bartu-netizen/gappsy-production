#!/bin/bash

# Test if platform-level redirects are active (causing loop)
# vs. only _redirects file controlling canonicalization

DOMAIN="gappsy.com"
TEST_PATH="/marketing-agencies-in-new-jersey-united-states"

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║     Platform Redirect Detection - Bolt Hosting Test         ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test 1: Canonical URL (should NOT redirect)
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "TEST 1: Canonical URL (https://www.$DOMAIN$TEST_PATH/)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

RESPONSE=$(curl -sI "https://www.$DOMAIN$TEST_PATH/" 2>&1)
STATUS=$(echo "$RESPONSE" | grep -E "^HTTP" | tail -1 | awk '{print $2}')
LOCATION=$(echo "$RESPONSE" | grep -i "^Location:" | awk '{print $2}' | tr -d '\r')

echo "Status: $STATUS"
if [ -n "$LOCATION" ]; then
    echo -e "${RED}Location: $LOCATION${NC}"
    echo ""
    echo -e "${RED}❌ FAIL: Canonical URL is redirecting!${NC}"
    echo "   This indicates platform-level redirect is active."
    echo ""
    echo "   Expected: 200 OK with no Location header"
    echo "   Actual: $STATUS redirect to $LOCATION"
    echo ""

    # Check if redirecting to non-www
    if echo "$LOCATION" | grep -q "https://$DOMAIN"; then
        echo -e "${RED}🔍 DETECTED: Platform forcing non-www redirect${NC}"
        echo "   Platform rule: www.$DOMAIN → $DOMAIN"
        echo "   This conflicts with _redirects: $DOMAIN → www.$DOMAIN"
        echo "   Result: INFINITE LOOP"
    fi

    PLATFORM_REDIRECT_DETECTED=true
else
    echo "Location: (none)"
    echo ""
    echo -e "${GREEN}✅ PASS: Canonical URL serves directly${NC}"
    PLATFORM_REDIRECT_DETECTED=false
fi

echo ""

# Test 2: Non-WWW URL (should redirect via _redirects)
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "TEST 2: Non-WWW URL (https://$DOMAIN$TEST_PATH)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Follow redirects and count them
REDIRECT_CHAIN=$(curl -sIL "https://$DOMAIN$TEST_PATH" 2>&1)
REDIRECT_COUNT=$(echo "$REDIRECT_CHAIN" | grep -c "HTTP")
FINAL_STATUS=$(echo "$REDIRECT_CHAIN" | grep "HTTP" | tail -1 | awk '{print $2}')

echo "Redirect chain:"
echo "$REDIRECT_CHAIN" | grep -E "(HTTP|Location)" | head -30
echo ""
echo "Total HTTP responses: $REDIRECT_COUNT"
echo "Final status: $FINAL_STATUS"
echo ""

if [ "$REDIRECT_COUNT" -gt 10 ]; then
    echo -e "${RED}❌ REDIRECT LOOP DETECTED!${NC}"
    echo "   More than 10 redirects occurred"
    echo ""
    echo "🔍 Analyzing pattern..."
    echo ""

    # Show first 6 redirects to identify pattern
    echo "$REDIRECT_CHAIN" | grep -i "Location:" | head -6 | while read -r line; do
        if echo "$line" | grep -q "https://www.$DOMAIN"; then
            echo -e "   ${GREEN}→ www.$DOMAIN (via _redirects)${NC}"
        elif echo "$line" | grep -q "https://$DOMAIN"; then
            echo -e "   ${RED}→ $DOMAIN (via PLATFORM)${NC}"
        fi
    done

    echo ""
    echo -e "${RED}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║               PLATFORM-LEVEL REDIRECT DETECTED               ║${NC}"
    echo -e "${RED}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Root Cause: Netlify (Bolt hosting) is applying domain redirect"
    echo "            BEFORE _redirects file is processed"
    echo ""
    echo "Pattern:"
    echo "  1. User requests: www.$DOMAIN"
    echo "  2. Platform redirects: www.$DOMAIN → $DOMAIN (non-www)"
    echo "  3. _redirects rule: $DOMAIN → www.$DOMAIN (www)"
    echo "  4. Platform redirects: www.$DOMAIN → $DOMAIN (non-www)"
    echo "  5. ... INFINITE LOOP"
    echo ""

elif [ "$REDIRECT_COUNT" -le 3 ] && [ "$FINAL_STATUS" = "200" ]; then
    echo -e "${GREEN}✅ PASS: Correct redirect chain${NC}"
    echo "   Non-WWW correctly redirects to canonical format"

else
    echo -e "${YELLOW}⚠️  UNEXPECTED: $REDIRECT_COUNT redirects with status $FINAL_STATUS${NC}"
fi

echo ""

# Test 3: Check Netlify headers for evidence
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "TEST 3: Netlify Platform Headers"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

HEADERS=$(curl -sI "https://www.$DOMAIN/" 2>&1)

if echo "$HEADERS" | grep -qi "x-nf-request-id"; then
    echo -e "${GREEN}✅ Site is hosted on Netlify${NC}"
    NF_REQUEST_ID=$(echo "$HEADERS" | grep -i "x-nf-request-id" | awk '{print $2}' | tr -d '\r')
    echo "   Request ID: $NF_REQUEST_ID"
else
    echo "⚠️  No Netlify headers detected"
fi

echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SUMMARY"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ "$PLATFORM_REDIRECT_DETECTED" = true ]; then
    echo -e "${RED}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║  PLATFORM-LEVEL REDIRECT IS ACTIVE - BOLT ACTION REQUIRED   ║${NC}"
    echo -e "${RED}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Issue: Netlify/Bolt is applying domain redirects at edge level"
    echo "       BEFORE the _redirects file is processed."
    echo ""
    echo "Fix Required:"
    echo "  1. Bolt must disable 'primary domain' auto-redirect"
    echo "  2. Or remove primary domain configuration entirely"
    echo "  3. Let ONLY public/_redirects control canonicalization"
    echo ""
    echo "See: BOLT_HOSTING_REDIRECT_FIX.md for implementation details"
    echo ""

elif [ "$REDIRECT_COUNT" -gt 10 ]; then
    echo -e "${RED}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║           REDIRECT LOOP CONFIRMED - BOLT FIX NEEDED         ║${NC}"
    echo -e "${RED}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "The redirect loop is caused by platform-level configuration."
    echo ""
    echo "Bolt Deployment Team:"
    echo "  → Check Netlify API domain configuration"
    echo "  → Disable 'redirect_to_primary_domain' setting"
    echo "  → Ensure no domain has 'redirect_to' property set"
    echo ""
    echo "See: BOLT_HOSTING_REDIRECT_FIX.md"
    echo ""

else
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║              NO PLATFORM REDIRECT DETECTED ✅                ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Canonical URL serves directly (200 OK)"
    echo "Non-WWW redirects correctly to canonical"
    echo ""
    echo "Redirects are controlled ONLY by public/_redirects ✅"
    echo ""
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
