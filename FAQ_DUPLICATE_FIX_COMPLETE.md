# FAQ Duplicate Fix - Complete Implementation

**Date:** 2026-02-13
**Status:** ✅ COMPLETE - Ready for Production Deploy
**Issue:** Google Search Console "Duplicate field 'FAQPage'" error
**Impact:** Invalid FAQ structured data enhancements

---

## Problem Summary

### Root Cause
FAQPage JSON-LD was being injected **twice** into state pages:

1. **Build-time injection** (scripts/prerender.js):
   - Generated FAQPage schema without a stable ID
   - Injected into prerendered HTML

2. **Client-time injection** (src/NewJerseyFAQ.tsx):
   - Created new FAQPage schema with `id="faq-schema"`
   - Appended to DOM on client hydration

**Result:** Two FAQPage schemas in final DOM → Google Search Console error

### Google Search Console Error
```
Duplicate field 'FAQPage'
Invalid FAQ structured data
```

This prevented proper FAQ rich snippets in Google Search results.

---

## Solution Implemented

### Strategy
Ensure **EXACTLY ONE** FAQPage JSON-LD script exists by:
1. Adding stable IDs to all JSON-LD schemas at build time
2. Cleaning up any legacy/duplicate schemas before injection
3. Making client-side code reuse/update existing schema instead of duplicating
4. Adding build verification to catch duplicates

### Changes Made

#### 1. ✅ scripts/prerender.js - Added Stable IDs

**Modified Functions:**
- `generateFAQPageSchema()` - Added `id="faq-schema"`
- `generateItemListSchema()` - Added `id="itemlist-schema"`
- `generateBreadcrumbSchema()` - Added `id="breadcrumb-schema"`

**Before:**
```javascript
return `    <script type="application/ld+json">
${JSON.stringify(schema, null, 2)}
    </script>`;
```

**After:**
```javascript
return `    <script type="application/ld+json" id="faq-schema">
${JSON.stringify(schema, null, 2)}
    </script>`;
```

#### 2. ✅ scripts/prerender.js - Added Cleanup Logic

**Location:** `injectSEOTags()` function (lines 397-418)

**Cleanup Steps:**
1. Remove any existing JSON-LD scripts with our controlled IDs (prevents duplicate on reruns)
2. Remove any legacy FAQPage scripts without IDs (prevents client-side duplicates)

**Code Added:**
```javascript
// Remove any existing JSON-LD schema scripts we control (safety for reruns)
modifiedHtml = modifiedHtml.replace(
  /<script[^>]*type=["']application\/ld\+json["'][^>]*id=["'](?:itemlist-schema|faq-schema|breadcrumb-schema)["'][^>]*>[\s\S]*?<\/script>\s*/gi,
  ''
);

// ALSO remove any legacy FAQPage JSON-LD scripts that might exist without an id
const faqPageRegex = /<script[^>]*type=["']application\/ld\+json["'][^>]*>([\s\S]*?)<\/script>/gi;
modifiedHtml = modifiedHtml.replace(faqPageRegex, (match, content) => {
  if (/"@type"\s*:\s*"FAQPage"/.test(content)) {
    if (/id=["']faq-schema["']/i.test(match)) return match;
    return ''; // Remove legacy FAQPage scripts without proper ID
  }
  return match;
});
```

#### 3. ✅ src/NewJerseyFAQ.tsx - Bulletproof Client Injection

**Location:** useEffect hook (lines 166-211)

**Strategy:** Replace/update instead of duplicate

**Key Changes:**
1. Remove **ANY** FAQPage scripts without `id="faq-schema"`
2. Reuse existing `#faq-schema` element if present
3. Only create new script if none exists
4. Update `textContent` instead of creating duplicate

**Before:**
```javascript
useEffect(() => {
  const schema = { /* ... */ };

  const script = document.createElement('script');
  script.type = 'application/ld+json';
  script.text = JSON.stringify(schema);
  script.id = 'faq-schema';
  document.head.appendChild(script); // Always creates new

  return () => {
    const existingScript = document.getElementById('faq-schema');
    if (existingScript) document.head.removeChild(existingScript);
  };
}, [faqData]);
```

**After:**
```javascript
useEffect(() => {
  if (!faqData || faqData.length === 0) return;

  // Remove any stray FAQPage JSON-LD scripts (with or without id)
  const allLd = Array.from(document.querySelectorAll('script[type="application/ld+json"]'));
  for (const s of allLd) {
    const txt = (s.textContent || '').replace(/\s+/g, ' ');
    const isFaq = txt.includes('"@type":"FAQPage"') ||
                  txt.includes('"@type": "FAQPage"') ||
                  txt.includes('"@type" : "FAQPage"');
    if (isFaq && (s as HTMLScriptElement).id !== 'faq-schema') {
      s.remove(); // Remove duplicates
    }
  }

  const faqSchema = { /* ... */ };

  // Reuse or create the single canonical FAQ schema script
  let script = document.getElementById('faq-schema') as HTMLScriptElement | null;
  if (!script) {
    script = document.createElement('script');
    script.id = 'faq-schema';
    script.type = 'application/ld+json';
    document.head.appendChild(script);
  } else {
    // Ensure correct type even if prerender created it
    script.type = 'application/ld+json';
  }

  script.textContent = JSON.stringify(faqSchema); // Update content

  return () => {
    const s = document.getElementById('faq-schema');
    if (s) s.remove();
  };
}, [faqData]);
```

#### 4. ✅ scripts/verify-prerendered-files.sh - Build Verification

**Location:** Per-state verification loop (lines 85-105)

**Added Checks:**
1. Count FAQPage schemas (must be 0 or 1, never 2+)
2. If FAQPage exists, verify `id="faq-schema"` present
3. If FAQPage exists, verify `"mainEntity"` present

**Code Added:**
```bash
# Ensure FAQPage JSON-LD appears at most once
FAQ_COUNT=$(grep -o '"@type"[[:space:]]*:[[:space:]]*"FAQPage"' "$FILE" | wc -l | tr -d ' ')
if [ "$FAQ_COUNT" -gt 1 ]; then
    echo "✗ $state: Duplicate FAQPage schema detected ($FAQ_COUNT occurrences)"
    ((FAIL++))
    continue
fi

# If FAQPage exists, ensure it has id="faq-schema" (so hydration can replace it cleanly)
if [ "$FAQ_COUNT" -eq 1 ] && ! grep -q 'id="faq-schema"' "$FILE"; then
    echo "✗ $state: FAQPage schema missing id=\"faq-schema\""
    ((FAIL++))
    continue
fi

# If FAQPage exists, ensure it has mainEntity
if [ "$FAQ_COUNT" -eq 1 ] && ! grep -q '"mainEntity"' "$FILE"; then
    echo "✗ $state: FAQPage schema missing mainEntity"
    ((FAIL++))
    continue
fi
```

---

## Verification Results

### Build Verification ✅
```bash
$ scripts/verify-prerendered-files.sh

==========================================
PRERENDERED FILES VERIFICATION
==========================================

Verifying 52 prerendered HTML files...

==========================================
RESULTS
==========================================
Passed: 52/52
Failed: 0/52

✓ _redirects file verified
✓ ALL VERIFICATION CHECKS PASSED
```

### Sample State Checks ✅

**New Jersey:**
```bash
$ grep -o '"@type".*"FAQPage"' dist/marketing-agencies-in-new-jersey-united-states.html | wc -l
1

$ grep -o 'id="[^"]*-schema"' dist/marketing-agencies-in-new-jersey-united-states.html
id="itemlist-schema"
id="faq-schema"
id="breadcrumb-schema"
```

**Illinois, Texas, California:**
```
=== illinois ===
FAQPage count: 1
Has faq-schema ID: YES
Has mainEntity: YES

=== texas ===
FAQPage count: 1
Has faq-schema ID: YES
Has mainEntity: YES

=== california ===
FAQPage count: 1
Has faq-schema ID: YES
Has mainEntity: YES
```

**All 52 States:** ✅ Verified single FAQPage with correct ID

---

## Production Verification Commands

### After Deploy

#### 1. Quick Test - Single State
```bash
UA_GOOGLEBOT='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'
URL='https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/'

# Check HTTP status and crawler headers
curl -Is -A "$UA_GOOGLEBOT" "$URL" | egrep -i '^(HTTP|x-gappsy-crawler-)'

# Expected:
# HTTP/2 200
# x-gappsy-crawler-static: rewritten
# x-gappsy-crawler-target: /marketing-agencies-in-new-jersey-united-states.html

# Check FAQPage count (MUST be 1)
curl -Ls -A "$UA_GOOGLEBOT" "$URL" | grep -o '"@type"[[:space:]]*:[[:space:]]*"FAQPage"' | wc -l

# Expected: 1
```

#### 2. Verify FAQ Schema ID Present
```bash
curl -Ls -A "$UA_GOOGLEBOT" "$URL" | grep 'id="faq-schema"'

# Expected: Should find the script tag with id="faq-schema"
```

#### 3. Verify mainEntity Present
```bash
curl -Ls -A "$UA_GOOGLEBOT" "$URL" | grep '"mainEntity"'

# Expected: Should find mainEntity in FAQ schema
```

#### 4. Multi-State Verification
```bash
for state in new-jersey illinois texas california florida new-york; do
  echo "=== $state ==="
  URL="https://www.gappsy.com/marketing-agencies-in-${state}-united-states/"
  COUNT=$(curl -Ls -A "$UA_GOOGLEBOT" "$URL" | grep -o '"@type"[[:space:]]*:[[:space:]]*"FAQPage"' | wc -l)
  echo "FAQPage count: $COUNT"
  if [ "$COUNT" -ne 1 ]; then
    echo "❌ FAIL: Expected 1, got $COUNT"
  else
    echo "✅ PASS"
  fi
  echo ""
done
```

### Google Search Console Verification

**Timeline:** 1-7 days after deploy

1. Open Google Search Console
2. Navigate to "Enhancements" → "FAQ"
3. Use URL Inspection Tool on a state page
4. Click "Test Live URL"

**Expected Results:**
- ✅ No "Duplicate field 'FAQPage'" error
- ✅ Valid FAQ structured data detected
- ✅ FAQ rich snippet preview available
- ✅ "Valid" status in FAQ enhancements report

**If Issues Persist:**
- Request reindexing via URL Inspection Tool
- Wait 2-3 days for Google to recrawl
- Check for other structured data errors

---

## Technical Details

### Request Flow After Fix

#### Build Time
1. Prerender script fetches state data from Supabase
2. Generates FAQPage schema with `id="faq-schema"`
3. Cleans up any existing schemas before injection
4. Injects single FAQPage into HTML head
5. Writes to `dist/marketing-agencies-in-{state}-united-states.html`

#### Client Hydration
1. React app loads in browser
2. NewJerseyFAQ component mounts
3. useEffect runs FAQ schema logic:
   - Scans for any FAQPage scripts without ID → removes them
   - Checks if `#faq-schema` exists
   - If exists: updates textContent
   - If not exists: creates new script with ID
4. **Result:** Single FAQPage schema remains in DOM

#### SPA Navigation
1. User navigates to different state page
2. NewJerseyFAQ unmounts
3. Cleanup function removes `#faq-schema`
4. New state's FAQ component mounts
5. Creates/updates `#faq-schema` with new state's data

### Schema Structure

**FAQPage Schema:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "Question text...",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Answer text..."
      }
    }
  ]
}
```

**HTML Output:**
```html
<script type="application/ld+json" id="faq-schema">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [...]
}
</script>
```

---

## Files Modified

### Created
- `FAQ_DUPLICATE_FIX_COMPLETE.md` - This comprehensive guide

### Modified
1. **scripts/prerender.js**
   - Lines 219-221: Added `id="faq-schema"` to FAQPage
   - Lines 265-267: Added `id="itemlist-schema"` to ItemList
   - Lines 298-300: Added `id="breadcrumb-schema"` to Breadcrumb
   - Lines 397-418: Added cleanup logic to remove duplicates

2. **src/NewJerseyFAQ.tsx**
   - Lines 166-211: Updated useEffect to replace/update instead of duplicate
   - Added stray FAQPage removal logic
   - Added reuse of existing `#faq-schema` element

3. **scripts/verify-prerendered-files.sh**
   - Lines 85-105: Added FAQPage duplicate detection
   - Added ID verification for FAQ schema
   - Added mainEntity presence check

### Unchanged
- ✅ No visible UI changes
- ✅ No content changes
- ✅ No FAQ section layout changes
- ✅ Crawler Edge Function unchanged
- ✅ All other components unchanged

---

## Success Criteria

After deployment, verify ALL of these:

### Immediate (Build Time)
- ✅ Build completes successfully
- ✅ All 52 states pass verification script
- ✅ Each state has exactly 1 FAQPage schema
- ✅ Each FAQPage has `id="faq-schema"`
- ✅ Each FAQPage has `"mainEntity"`

### Production (After Deploy)
- ✅ Crawler requests return HTTP 200
- ✅ Crawler headers show `x-gappsy-crawler-static: rewritten`
- ✅ Each state page has exactly 1 FAQPage in HTML
- ✅ FAQ schema has proper ID attribute
- ✅ Browser experience unchanged

### Google Search Console (1-7 Days)
- ✅ "Duplicate field 'FAQPage'" error removed
- ✅ Valid FAQ structured data detected
- ✅ FAQ rich snippets preview available
- ✅ No other FAQ enhancement errors

---

## Rollback Plan

If issues occur after deployment:

### Option 1: Revert FAQ Schema Changes Only
```bash
git revert <commit-hash> --no-commit
git checkout HEAD -- scripts/prerender.js
git checkout HEAD -- src/NewJerseyFAQ.tsx
git checkout HEAD -- scripts/verify-prerendered-files.sh
git commit -m "Revert FAQ duplicate fix"
git push
```

### Option 2: Full Rollback
```bash
git revert HEAD
git push
```

**Note:** Rollback will restore duplicate FAQPage behavior, but site functionality remains intact.

---

## Monitoring Recommendations

### First 24 Hours
1. Run production verification commands hourly
2. Check for any build failures
3. Monitor Google Search Console for new errors
4. Verify FAQ sections render correctly on all devices

### First Week
1. Daily check of Google Search Console FAQ enhancements
2. Monitor for "Duplicate field 'FAQPage'" errors
3. Track valid FAQ structured data count
4. Verify FAQ rich snippets appear in search results

### Ongoing
1. Include FAQ duplicate check in CI/CD pipeline
2. Alert if verification script fails
3. Monthly review of Google Search Console FAQ enhancements
4. Track FAQ rich snippet click-through rates

---

## Expected Outcomes

### Timeline

**Immediate (0-1 hour):**
- Build passes with single FAQPage per state
- Production verification confirms single schema
- No visible changes to user experience

**24-48 Hours:**
- Google begins recrawling state pages
- New FAQ structured data detected
- "Duplicate field 'FAQPage'" errors start clearing

**1-2 Weeks:**
- All state pages show valid FAQ structured data
- FAQ rich snippets appear in search results
- Google Search Console shows 0 FAQ enhancement errors

**Long-term:**
- Improved SEO with proper FAQ rich snippets
- Higher click-through rates from search results
- Better user experience with enhanced search listings

---

## Related Documentation

- **CRAWLER_FIX_COMPLETE_GUIDE.md** - Crawler reliability Edge Function
- **SEO_OG_IMPLEMENTATION_COMPLETE.md** - SEO and OG tags implementation
- **PRERENDER_IMPLEMENTATION_SUMMARY.md** - Prerender system overview

---

## Support & Troubleshooting

### Common Issues

**Issue:** Build still shows duplicate FAQPage
- **Check:** Run `grep -c FAQPage dist/marketing-agencies-in-new-jersey-united-states.html`
- **Fix:** Clear dist/ and rebuild: `rm -rf dist && npm run build`

**Issue:** FAQ section not visible
- **Check:** Verify state has FAQs in database
- **Fix:** Component returns `null` if no FAQs (expected behavior)

**Issue:** Client-side still creates duplicate
- **Check:** Browser DevTools → Elements → Search for `faq-schema`
- **Fix:** Hard refresh (Ctrl+Shift+R) to clear cache

**Issue:** Google Search Console still shows error
- **Check:** Request reindexing via URL Inspection Tool
- **Fix:** Wait 2-3 days for Google to recrawl and reprocess

### Debug Commands

**Check prerendered HTML:**
```bash
grep -B2 -A10 'id="faq-schema"' dist/marketing-agencies-in-new-jersey-united-states.html
```

**Check all schema IDs:**
```bash
grep -o 'id="[^"]*-schema"' dist/marketing-agencies-in-new-jersey-united-states.html
```

**Count all JSON-LD scripts:**
```bash
grep -c 'type="application/ld+json"' dist/marketing-agencies-in-new-jersey-united-states.html
```

**Verify mainEntity structure:**
```bash
grep -A20 '"mainEntity"' dist/marketing-agencies-in-new-jersey-united-states.html | head -25
```

---

**Status:** ✅ COMPLETE - Ready for Production Deploy
**Last Updated:** 2026-02-13
**Risk Level:** Low (no UI changes, backward compatible)
**Expected Impact:** Fixes Google Search Console FAQ duplicate error
