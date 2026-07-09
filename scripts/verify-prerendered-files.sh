#!/bin/bash

# Verify prerendered HTML files exist and contain proper content
# This runs at build time to catch issues before deployment
# Note: Not using set -e to allow test failures to be counted

echo "=========================================="
echo "PRERENDERED FILES VERIFICATION"
echo "=========================================="
echo ""

DIST_DIR="dist"
PASS=0
FAIL=0

# Load all 52 states
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

echo "Verifying ${#STATES[@]} prerendered HTML files..."
echo ""

for state in "${STATES[@]}"; do
    # Check both flat file and directory-based prerender
    FILE_FLAT="${DIST_DIR}/marketing-agencies-in-${state}-united-states.html"
    FILE_DIR="${DIST_DIR}/marketing-agencies-in-${state}-united-states/index.html"

    # Prefer directory-based (current prerender strategy)
    if [ -f "$FILE_DIR" ]; then
        FILE="$FILE_DIR"
    elif [ -f "$FILE_FLAT" ]; then
        FILE="$FILE_FLAT"
    else
        echo "✗ $state: File missing (checked both .html and /index.html)"
        ((FAIL++))
        continue
    fi

    # Check file is not empty
    if [ ! -s "$FILE" ]; then
        echo "✗ $state: File is empty"
        ((FAIL++))
        continue
    fi

    # Quick checks using grep (faster than loading full content)
    if ! grep -q '<h1' "$FILE"; then
        echo "✗ $state: Missing H1 tag"
        ((FAIL++))
        continue
    fi

    if ! grep -q '<title>' "$FILE"; then
        echo "✗ $state: Missing title tag"
        ((FAIL++))
        continue
    fi

    if ! grep -q '<link rel="canonical"' "$FILE"; then
        echo "✗ $state: Missing canonical tag"
        ((FAIL++))
        continue
    fi

    if ! grep -q 'property="og:' "$FILE"; then
        echo "✗ $state: Missing OG tags"
        ((FAIL++))
        continue
    fi

    if grep -qi "Loading\.\.\." "$FILE"; then
        echo "✗ $state: Contains 'Loading...' text"
        ((FAIL++))
        continue
    fi

    if ! grep -qi "marketing.*agenc\|digital.*agenc" "$FILE"; then
        echo "✗ $state: Missing agency content"
        ((FAIL++))
        continue
    fi

    # Check for unified schema (should have exactly 1 unified-jsonld-schema)
    if ! grep -q 'id="unified-jsonld-schema"' "$FILE"; then
        echo "✗ $state: Missing unified-jsonld-schema ID"
        ((FAIL++))
        continue
    fi

    # Count total JSON-LD scripts (should be exactly 1)
    JSONLD_COUNT=$(grep -o 'type="application/ld+json"' "$FILE" | wc -l | tr -d ' ')
    if [ "$JSONLD_COUNT" -ne 1 ]; then
        echo "✗ $state: Expected 1 JSON-LD script, found $JSONLD_COUNT"
        ((FAIL++))
        continue
    fi

    ((PASS++))
done

echo ""
echo "=========================================="
echo "RESULTS"
echo "=========================================="
echo "Passed: $PASS/${#STATES[@]}"
echo "Failed: $FAIL/${#STATES[@]}"
echo ""

# Check _redirects exists
if [ ! -f "${DIST_DIR}/_redirects" ]; then
    echo "✗ ERROR: _redirects file missing in dist/"
    exit 1
fi

# Verify _redirects has correct pattern
if ! grep -q "marketing-agencies-in-\*-united-states" "${DIST_DIR}/_redirects"; then
    echo "✗ ERROR: _redirects missing splat pattern for state pages"
    exit 1
fi

echo "✓ _redirects file verified"
echo ""

if [ $FAIL -gt 0 ]; then
    echo "✗ BUILD VERIFICATION FAILED"
    exit 1
fi

echo "✓ BASIC VERIFICATION CHECKS PASSED"
echo ""

# Run detailed structured data verification
echo "=========================================="
echo "STRUCTURED DATA VERIFICATION"
echo "=========================================="
echo ""

node scripts/verify-structured-data.js

if [ $? -ne 0 ]; then
    echo ""
    echo "✗ STRUCTURED DATA VERIFICATION FAILED"
    exit 1
fi

echo ""
echo "✓ ALL VERIFICATION CHECKS PASSED"
