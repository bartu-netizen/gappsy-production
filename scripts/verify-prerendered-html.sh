#!/bin/bash

################################################################################
# Verify Prerendered HTML - SEO Metadata Checker
################################################################################
# This script verifies that state pages have correct SEO metadata baked into
# the raw HTML files (not just runtime JS injection).
#
# Usage:
#   ./scripts/verify-prerendered-html.sh
#
# Checks:
#   - Title includes (YEAR) | Gappsy
#   - Description includes "Updated for YEAR"
#   - SEO proof tag is present: state:{slug}:{year}
#   - Canonical URL has trailing slash
#   - OG image metadata (width/height/type)
################################################################################

DIST_DIR="dist"
CURRENT_YEAR=$(date +%Y)

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo "================================================================================"
echo "  PRERENDERED HTML VERIFICATION"
echo "================================================================================"
echo ""

# Check if dist directory exists
if [ ! -d "$DIST_DIR" ]; then
  echo -e "${RED}❌ Error: $DIST_DIR directory not found${NC}"
  echo "   Run 'npm run build' or 'npx vite build' first"
  exit 1
fi

# Test states (covering different regions and name patterns)
TEST_STATES=("vermont" "new-jersey" "alaska" "north-dakota" "wyoming")

PASS_COUNT=0
FAIL_COUNT=0

for state in "${TEST_STATES[@]}"; do
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BLUE}Testing: $state${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

  # Check both folder-based and flat file
  HTML_FILE_DIR="$DIST_DIR/marketing-agencies-in-$state-united-states/index.html"
  HTML_FILE_FLAT="$DIST_DIR/marketing-agencies-in-$state-united-states.html"

  HTML_FILE=""
  if [ -f "$HTML_FILE_DIR" ]; then
    HTML_FILE="$HTML_FILE_DIR"
    echo -e "${GREEN}✓${NC} Found folder-based: $HTML_FILE_DIR"
  elif [ -f "$HTML_FILE_FLAT" ]; then
    HTML_FILE="$HTML_FILE_FLAT"
    echo -e "${YELLOW}⚠${NC} Using flat file: $HTML_FILE_FLAT (folder-based preferred)"
  else
    echo -e "${RED}✗ HTML file not found for $state${NC}"
    echo "   Expected: $HTML_FILE_DIR or $HTML_FILE_FLAT"
    FAIL_COUNT=$((FAIL_COUNT + 1))
    echo ""
    continue
  fi

  STATE_PASS=true

  # Test 1: Title includes (YEAR) | Gappsy
  echo ""
  echo "1. Title Check:"
  TITLE=$(grep -o '<title>[^<]*</title>' "$HTML_FILE" | head -1)
  if echo "$TITLE" | grep -q "($CURRENT_YEAR) | Gappsy"; then
    echo -e "   ${GREEN}✓${NC} $TITLE"
  else
    echo -e "   ${RED}✗${NC} $TITLE"
    echo -e "   ${RED}  Expected: ... ($CURRENT_YEAR) | Gappsy${NC}"
    STATE_PASS=false
  fi

  # Test 2: Description includes "Updated for YEAR"
  echo ""
  echo "2. Description Check:"
  DESCRIPTION=$(grep 'name="description"' "$HTML_FILE" | head -1)
  if echo "$DESCRIPTION" | grep -q "Updated for $CURRENT_YEAR"; then
    echo -e "   ${GREEN}✓${NC} Contains 'Updated for $CURRENT_YEAR'"
  else
    echo -e "   ${RED}✗${NC} Missing 'Updated for $CURRENT_YEAR'"
    echo "   $DESCRIPTION"
    STATE_PASS=false
  fi

  # Test 3: SEO Proof Tag
  echo ""
  echo "3. SEO Proof Tag:"
  PROOF_TAG=$(grep 'name="seo-proof"' "$HTML_FILE")
  if echo "$PROOF_TAG" | grep -q "state:$state:$CURRENT_YEAR"; then
    echo -e "   ${GREEN}✓${NC} $PROOF_TAG"
  else
    echo -e "   ${RED}✗${NC} $PROOF_TAG"
    echo -e "   ${RED}  Expected: state:$state:$CURRENT_YEAR${NC}"
    STATE_PASS=false
  fi

  # Test 4: Canonical URL
  echo ""
  echo "4. Canonical URL:"
  CANONICAL=$(grep 'rel="canonical"' "$HTML_FILE")
  if echo "$CANONICAL" | grep -q "https://www.gappsy.com/marketing-agencies-in-$state-united-states/\""; then
    echo -e "   ${GREEN}✓${NC} Has trailing slash"
  else
    echo -e "   ${RED}✗${NC} $CANONICAL"
    echo -e "   ${RED}  Expected trailing slash${NC}"
    STATE_PASS=false
  fi

  # Test 5: OG Image Metadata
  echo ""
  echo "5. OG Image Metadata:"
  OG_IMAGE=$(grep 'property="og:image"' "$HTML_FILE" | grep -v "width\|height\|type")
  OG_WIDTH=$(grep 'property="og:image:width"' "$HTML_FILE")
  OG_HEIGHT=$(grep 'property="og:image:height"' "$HTML_FILE")
  OG_TYPE=$(grep 'property="og:image:type"' "$HTML_FILE")

  if [ -n "$OG_IMAGE" ] && [ -n "$OG_WIDTH" ] && [ -n "$OG_HEIGHT" ] && [ -n "$OG_TYPE" ]; then
    echo -e "   ${GREEN}✓${NC} OG image with width/height/type"
    if echo "$OG_WIDTH" | grep -q '1200'; then
      echo -e "   ${GREEN}✓${NC} Width: 1200"
    else
      echo -e "   ${RED}✗${NC} Width not 1200: $OG_WIDTH"
      STATE_PASS=false
    fi
    if echo "$OG_HEIGHT" | grep -q '630'; then
      echo -e "   ${GREEN}✓${NC} Height: 630"
    else
      echo -e "   ${RED}✗${NC} Height not 630: $OG_HEIGHT"
      STATE_PASS=false
    fi
  else
    echo -e "   ${RED}✗${NC} Missing OG image metadata"
    STATE_PASS=false
  fi

  # Summary for this state
  echo ""
  if [ "$STATE_PASS" = true ]; then
    echo -e "${GREEN}✓ $state: ALL CHECKS PASSED${NC}"
    PASS_COUNT=$((PASS_COUNT + 1))
  else
    echo -e "${RED}✗ $state: SOME CHECKS FAILED${NC}"
    FAIL_COUNT=$((FAIL_COUNT + 1))
  fi
  echo ""
done

# Final Summary
echo ""
echo "================================================================================"
echo "  SUMMARY"
echo "================================================================================"
echo ""
echo "Total States Tested: ${#TEST_STATES[@]}"
echo -e "${GREEN}Passed: $PASS_COUNT${NC}"
if [ $FAIL_COUNT -gt 0 ]; then
  echo -e "${RED}Failed: $FAIL_COUNT${NC}"
else
  echo "Failed: 0"
fi
echo ""

if [ $FAIL_COUNT -eq 0 ]; then
  echo -e "${GREEN}✓ All prerendered HTML files have correct SEO metadata!${NC}"
  echo ""
  echo "Ready for deployment. Googlebot and social scrapers will see correct metadata."
  echo ""
  exit 0
else
  echo -e "${RED}✗ Some HTML files have incorrect SEO metadata${NC}"
  echo ""
  echo "Fix required before deployment."
  echo ""
  exit 1
fi
