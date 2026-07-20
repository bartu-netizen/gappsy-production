#!/bin/bash
set -e

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

DOMAIN="${TEST_DOMAIN:-https://gappsy.com}"

echo "=========================================="
echo "CRAWLER ACCESS VERIFICATION"
echo "Domain: $DOMAIN"
echo "=========================================="
echo ""

# Test states
TEST_STATES=("texas" "california" "new-jersey" "florida" "new-york")

# User agents to test
UA_BROWSER="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
UA_GOOGLEBOT="Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
UA_INSPECTION="Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/W.X.Y.Z Mobile Safari/537.36 (compatible; Google-InspectionTool/1.0;)"
UA_BINGBOT="Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)"

BROWSER_PASS=0
BROWSER_FAIL=0
GOOGLEBOT_PASS=0
GOOGLEBOT_FAIL=0
INSPECTION_PASS=0
INSPECTION_FAIL=0
BINGBOT_PASS=0
BINGBOT_FAIL=0

test_url() {
    local state=$1
    local ua_name=$2
    local ua_string=$3
    local url="${DOMAIN}/marketing-agencies-in-${state}-united-states/"

    # Test HEAD request for status code
    status=$(curl -s -o /dev/null -w "%{http_code}" -A "$ua_string" "$url" 2>&1 || echo "000")

    if [ "$status" != "200" ]; then
        echo -e "${RED}✗${NC} ${state} [${ua_name}]: HTTP $status"
        return 1
    fi

    # Test GET request for content
    content=$(curl -s -A "$ua_string" "$url" 2>&1 || echo "")

    # Check for 502 error page
    if echo "$content" | grep -qi "502 Bad Gateway\|502 Gateway\|502.*error"; then
        echo -e "${RED}✗${NC} ${state} [${ua_name}]: Got 502 error page"
        return 1
    fi

    # Check for H1 tag
    if ! echo "$content" | grep -qi '<h1'; then
        echo -e "${RED}✗${NC} ${state} [${ua_name}]: Missing H1 tag"
        return 1
    fi

    # Check for state-specific content
    if ! echo "$content" | grep -qi "marketing.*agenc"; then
        echo -e "${RED}✗${NC} ${state} [${ua_name}]: Missing expected content"
        return 1
    fi

    echo -e "${GREEN}✓${NC} ${state} [${ua_name}]: 200 + H1 present"
    return 0
}

echo "Testing Browser UA..."
echo "----------------------------"
for state in "${TEST_STATES[@]}"; do
    if test_url "$state" "Browser" "$UA_BROWSER"; then
        ((BROWSER_PASS++))
    else
        ((BROWSER_FAIL++))
    fi
done
echo ""

echo "Testing Googlebot UA..."
echo "----------------------------"
for state in "${TEST_STATES[@]}"; do
    if test_url "$state" "Googlebot" "$UA_GOOGLEBOT"; then
        ((GOOGLEBOT_PASS++))
    else
        ((GOOGLEBOT_FAIL++))
    fi
done
echo ""

echo "Testing Google-InspectionTool UA..."
echo "----------------------------"
for state in "${TEST_STATES[@]}"; do
    if test_url "$state" "InspectionTool" "$UA_INSPECTION"; then
        ((INSPECTION_PASS++))
    else
        ((INSPECTION_FAIL++))
    fi
done
echo ""

echo "Testing Bingbot UA..."
echo "----------------------------"
for state in "${TEST_STATES[@]}"; do
    if test_url "$state" "Bingbot" "$UA_BINGBOT"; then
        ((BINGBOT_PASS++))
    else
        ((BINGBOT_FAIL++))
    fi
done
echo ""

echo "=========================================="
echo "VERIFICATION SUMMARY"
echo "=========================================="
echo "Browser:        $BROWSER_PASS passed, $BROWSER_FAIL failed"
echo "Googlebot:      $GOOGLEBOT_PASS passed, $GOOGLEBOT_FAIL failed"
echo "InspectionTool: $INSPECTION_PASS passed, $INSPECTION_FAIL failed"
echo "Bingbot:        $BINGBOT_PASS passed, $BINGBOT_FAIL failed"
echo ""

TOTAL_TESTS=$((BROWSER_PASS + GOOGLEBOT_PASS + INSPECTION_PASS + BINGBOT_PASS))
TOTAL_FAIL=$((BROWSER_FAIL + GOOGLEBOT_FAIL + INSPECTION_FAIL + BINGBOT_FAIL))

if [ $TOTAL_FAIL -gt 0 ]; then
    echo -e "${RED}✗ FAILED: $TOTAL_FAIL test(s) failed${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Check Netlify deploy logs for errors"
    echo "2. Verify _redirects file is deployed correctly"
    echo "3. Check Netlify Edge Functions (if any)"
    echo "4. Contact Netlify support if issue persists"
    exit 1
else
    echo -e "${GREEN}✓ ALL TESTS PASSED: $TOTAL_TESTS/${TOTAL_TESTS}${NC}"
fi
