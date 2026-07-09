#!/bin/bash
# Verify Full Prerendered Content
# This script verifies that dist/ HTML files contain FULL content for crawlers

set -e

echo "=========================================="
echo "FULL PRERENDER CONTENT VERIFICATION"
echo "=========================================="
echo ""

STATE_FILE="dist/marketing-agencies-in-new-jersey-united-states.html"

if [ ! -f "$STATE_FILE" ]; then
    echo "❌ ERROR: $STATE_FILE not found!"
    echo "   Run 'npm run build' first"
    exit 1
fi

echo "Testing: $STATE_FILE"
echo ""

# Test 1: PRERENDER_OK marker
echo "1️⃣  Checking for PRERENDER_OK marker..."
if grep -q "PRERENDER_OK" "$STATE_FILE"; then
    echo "   ✅ PRERENDER_OK found"
else
    echo "   ❌ PRERENDER_OK NOT found"
    exit 1
fi

# Test 2: H1 tag
echo ""
echo "2️⃣  Checking for H1 tag..."
if grep -q "<h1[^>]*>Top 25 Marketing Agencies in New Jersey" "$STATE_FILE"; then
    echo "   ✅ H1 tag found"
else
    echo "   ❌ H1 tag NOT found"
    exit 1
fi

# Test 3: Full intro text (check for known phrase)
echo ""
echo "3️⃣  Checking for full intro text..."
if grep -q "Garden State" "$STATE_FILE"; then
    echo "   ✅ Full intro text found (contains 'Garden State')"
else
    echo "   ❌ Full intro text NOT found"
    exit 1
fi

# Test 4: Agency list (25 items)
echo ""
echo "4️⃣  Checking for Top 25 agencies list..."
AGENCY_COUNT=$(grep -o "<li style=\"margin-bottom: 1.5rem;\">" "$STATE_FILE" | wc -l)
if [ "$AGENCY_COUNT" -eq 25 ]; then
    echo "   ✅ Found 25 agency list items"
else
    echo "   ❌ Found only $AGENCY_COUNT agency list items (expected 25)"
    exit 1
fi

# Test 5: Known agency name (Vazagency)
echo ""
echo "5️⃣  Checking for known agency name..."
if grep -q "Vazagency" "$STATE_FILE"; then
    echo "   ✅ Agency name 'Vazagency' found"
else
    echo "   ❌ Agency name 'Vazagency' NOT found"
    exit 1
fi

# Test 6: FAQ section
echo ""
echo "6️⃣  Checking for FAQ section..."
if grep -q "Frequently Asked Questions" "$STATE_FILE"; then
    echo "   ✅ FAQ section found"
else
    echo "   ❌ FAQ section NOT found"
    exit 1
fi

# Test 7: FAQPage JSON-LD schema
echo ""
echo "7️⃣  Checking for FAQPage JSON-LD schema..."
if grep -q '"@type": "FAQPage"' "$STATE_FILE"; then
    echo "   ✅ FAQPage schema found"
else
    echo "   ❌ FAQPage schema NOT found"
    exit 1
fi

# Test 8: No "Loading" text
echo ""
echo "8️⃣  Checking for absence of SPA loader text..."
if ! grep -qi "Loading .* data" "$STATE_FILE"; then
    echo "   ✅ No SPA loader text found"
else
    echo "   ❌ SPA loader text FOUND (should not be present)"
    exit 1
fi

# Test 9: <ol> list for agencies
echo ""
echo "9️⃣  Checking for ordered list (<ol>) for agencies..."
if grep -q '<ol style="list-style: decimal' "$STATE_FILE"; then
    echo "   ✅ <ol> list found"
else
    echo "   ❌ <ol> list NOT found"
    exit 1
fi

# Test 10: <details> elements for FAQs
echo ""
echo "🔟 Checking for <details> elements for FAQs..."
DETAILS_COUNT=$(grep -o "<details" "$STATE_FILE" | wc -l)
if [ "$DETAILS_COUNT" -ge 1 ]; then
    echo "   ✅ Found $DETAILS_COUNT <details> elements (FAQs)"
else
    echo "   ❌ No <details> elements found"
    exit 1
fi

echo ""
echo "=========================================="
echo "✅ ALL CHECKS PASSED!"
echo "=========================================="
echo ""
echo "Summary:"
echo "  ✅ PRERENDER_OK marker present"
echo "  ✅ H1 tag with state name"
echo "  ✅ Full multi-paragraph intro text"
echo "  ✅ 25 agency list items in <ol>"
echo "  ✅ Known agency names present"
echo "  ✅ FAQ section with questions"
echo "  ✅ FAQPage JSON-LD schema"
echo "  ✅ No SPA loader text"
echo ""
echo "The prerendered HTML contains FULL content for crawlers!"
echo ""
echo "Next step: Deploy to production and verify with:"
echo "  curl -sL https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ | grep 'Vazagency'"
