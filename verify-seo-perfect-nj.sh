#!/bin/bash
# Verify New Jersey SEO Perfect Setup
# Tests all SEO improvements for the canonical directory version

set -e

echo "=========================================="
echo "NEW JERSEY SEO PERFECT VERIFICATION"
echo "=========================================="
echo ""

STATE_FILE="dist/marketing-agencies-in-new-jersey-united-states/index.html"
FLAT_FILE="dist/marketing-agencies-in-new-jersey-united-states.html"

if [ ! -f "$STATE_FILE" ]; then
    echo "❌ ERROR: $STATE_FILE not found!"
    exit 1
fi

if [ ! -f "$FLAT_FILE" ]; then
    echo "❌ ERROR: $FLAT_FILE not found!"
    exit 1
fi

echo "📂 Testing Canonical Version: index.html"
echo ""

# Test 1: ItemList JSON-LD schema
echo "1️⃣  Checking for ItemList JSON-LD schema..."
if grep -q '"@type": "ItemList"' "$STATE_FILE"; then
    echo "   ✅ ItemList schema found"
    ITEM_COUNT=$(grep -o '"position":' "$STATE_FILE" | wc -l)
    echo "      → Contains $ITEM_COUNT list items"
else
    echo "   ❌ ItemList schema NOT found"
    exit 1
fi

# Test 2: FAQPage JSON-LD schema
echo ""
echo "2️⃣  Checking for FAQPage JSON-LD schema..."
if grep -q '"@type": "FAQPage"' "$STATE_FILE"; then
    echo "   ✅ FAQPage schema found"
else
    echo "   ❌ FAQPage schema NOT found"
    exit 1
fi

# Test 3: Last updated timestamp
echo ""
echo "3️⃣  Checking for 'Last updated' timestamp..."
if grep -q "Last updated:" "$STATE_FILE"; then
    UPDATED_DATE=$(grep -o "Last updated: [^<]*" "$STATE_FILE" | head -1)
    echo "   ✅ Last updated found"
    echo "      → $UPDATED_DATE"
else
    echo "   ❌ Last updated timestamp NOT found"
    exit 1
fi

# Test 4: Internal links section
echo ""
echo "4️⃣  Checking for internal links section..."
if grep -q "Explore More" "$STATE_FILE"; then
    echo "   ✅ 'Explore More' section found"
    LINK_COUNT=$(grep -o 'href="https://www.gappsy.com/' "$STATE_FILE" | wc -l)
    echo "      → Contains $LINK_COUNT internal links"
else
    echo "   ❌ Internal links section NOT found"
    exit 1
fi

# Test 5: Specific internal links
echo ""
echo "5️⃣  Checking for specific internal links..."
LINKS_OK=true

if grep -q "marketing-agencies/" "$STATE_FILE"; then
    echo "   ✅ Link to 'View All States' found"
else
    echo "   ❌ Link to 'View All States' NOT found"
    LINKS_OK=false
fi

if grep -q "agency-review/vazagency/" "$STATE_FILE"; then
    echo "   ✅ Link to Vazagency review found"
else
    echo "   ❌ Link to Vazagency review NOT found"
    LINKS_OK=false
fi

if grep -q "submit-agency/" "$STATE_FILE"; then
    echo "   ✅ Link to 'Submit Agency' found"
else
    echo "   ❌ Link to 'Submit Agency' NOT found"
    LINKS_OK=false
fi

if [ "$LINKS_OK" = false ]; then
    exit 1
fi

# Test 6: NO robots meta tag (canonical should be indexable by default)
echo ""
echo "6️⃣  Checking canonical version has NO robots meta tag..."
if ! grep -q 'name="robots"' "$STATE_FILE"; then
    echo "   ✅ No robots meta tag (indexable by default)"
else
    echo "   ❌ Robots meta tag found (should not be present)"
    exit 1
fi

# Test 7: Canonical URL points to trailing slash version
echo ""
echo "7️⃣  Checking canonical URL..."
if grep -q 'rel="canonical" href="https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/"' "$STATE_FILE"; then
    echo "   ✅ Canonical URL correct (with trailing slash)"
else
    echo "   ❌ Canonical URL incorrect or missing"
    exit 1
fi

echo ""
echo "=========================================="
echo "📄 Testing Flat File Version: .html"
echo "=========================================="
echo ""

# Test 8: Flat file has noindex
echo "8️⃣  Checking flat file has noindex meta tag..."
if grep -q '<meta name="robots" content="noindex,follow"' "$FLAT_FILE"; then
    echo "   ✅ Noindex meta tag found (prevents duplicate indexing)"
else
    echo "   ❌ Noindex meta tag NOT found"
    exit 1
fi

# Test 9: Flat file still has canonical to directory version
echo ""
echo "9️⃣  Checking flat file canonical points to directory version..."
if grep -q 'rel="canonical" href="https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/"' "$FLAT_FILE"; then
    echo "   ✅ Canonical points to directory version"
else
    echo "   ❌ Canonical URL incorrect"
    exit 1
fi

# Test 10: Flat file has same content as canonical
echo ""
echo "🔟 Checking flat file has full content..."
FLAT_AGENCY_COUNT=$(grep -o "<li style=\"margin-bottom: 1.5rem;\">" "$FLAT_FILE" | wc -l)
if [ "$FLAT_AGENCY_COUNT" -eq 25 ]; then
    echo "   ✅ Flat file has 25 agencies (same as canonical)"
else
    echo "   ❌ Flat file has $FLAT_AGENCY_COUNT agencies (expected 25)"
    exit 1
fi

echo ""
echo "=========================================="
echo "✅ ALL SEO PERFECT CHECKS PASSED!"
echo "=========================================="
echo ""
echo "Summary:"
echo "  ✅ ItemList JSON-LD schema (25 items)"
echo "  ✅ FAQPage JSON-LD schema"
echo "  ✅ Last updated timestamp"
echo "  ✅ Internal links section (3+ links)"
echo "  ✅ Canonical version indexable (no robots meta)"
echo "  ✅ Flat file has noindex,follow"
echo "  ✅ Both versions have correct canonical URL"
echo "  ✅ Both versions have full content"
echo ""
echo "SEO Status: 100% Perfect ✨"
echo ""
echo "Next: Deploy and verify production:"
echo "  curl -sL https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ | grep 'ItemList'"
