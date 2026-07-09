# Production SEO Testing Commands

After deploying to production, run these commands to verify SEO metadata is working correctly.

## Quick 5-State Test

Test 5 diverse states (small, large, hyphenated names):

```bash
for state in vermont wyoming alaska north-dakota new-jersey; do
  echo "";
  echo "========================================";
  echo "Testing: $state";
  echo "========================================";

  echo "";
  echo "1. Title:";
  curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-$state-united-states/" | grep -o '<title>[^<]*</title>' | head -n 1;

  echo "";
  echo "2. Description:";
  curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-$state-united-states/" | grep 'name="description"' | head -n 1 | sed 's/^[[:space:]]*//';

  echo "";
  echo "3. SEO Proof:";
  curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-$state-united-states/" | grep 'name="seo-proof"' | head -n 1 | sed 's/^[[:space:]]*//';

  echo "";
done
```

**Expected Results:**
```
Testing: vermont
1. Title:
<title>Top 25 Marketing Agencies in Vermont (2026) | Gappsy</title>

2. Description:
<meta name="description" content="Browse the top marketing agencies in Vermont. Compare services, locations, and reviews. Updated for 2026." />

3. SEO Proof:
<meta name="seo-proof" content="state:vermont:2026" />
```

## Individual State Tests

### Test Title

```bash
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" | grep -o '<title>[^<]*</title>' | head -n 1
```

**Expected:**
```html
<title>Top 25 Marketing Agencies in New Jersey (2026) | Gappsy</title>
```

### Test Description

```bash
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" | grep 'name="description"' | head -n 1
```

**Expected:**
```html
<meta name="description" content="Browse the top marketing agencies in New Jersey. Compare services, locations, and reviews. Updated for 2026." />
```

### Test SEO Proof Tag

```bash
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" | grep 'name="seo-proof"' | head -n 1
```

**Expected:**
```html
<meta name="seo-proof" content="state:new-jersey:2026" />
```

### Test Canonical URL

```bash
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" | grep 'rel="canonical"' | head -n 1
```

**Expected:**
```html
<link rel="canonical" href="https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" />
```

### Test OG Tags

```bash
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" | grep -E 'property="og:(title|description|image|url)"' | head -4
```

**Expected:**
```html
<meta property="og:title" content="Top 25 Marketing Agencies in New Jersey (2026) | Gappsy" />
<meta property="og:description" content="Browse the top marketing agencies in New Jersey. Compare services, locations, and reviews. Updated for 2026." />
<meta property="og:url" content="https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" />
<meta property="og:image" content="https://www.gappsy.com/og/marketing-agencies-in-new-jersey-united-states.svg" />
```

### Test OG Image Metadata

```bash
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" | grep -E 'property="og:image' | head -4
```

**Expected:**
```html
<meta property="og:image" content="https://www.gappsy.com/og/marketing-agencies-in-new-jersey-united-states.svg" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />
<meta property="og:image:type" content="image/svg+xml" />
```

### Test Twitter Cards

```bash
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" | grep 'name="twitter:' | head -5
```

**Expected:**
```html
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:site" content="@Gappsy" />
<meta name="twitter:title" content="Top 25 Marketing Agencies in New Jersey (2026) | Gappsy" />
<meta name="twitter:description" content="Browse the top marketing agencies in New Jersey. Compare services, locations, and reviews. Updated for 2026." />
<meta name="twitter:image" content="https://www.gappsy.com/og/marketing-agencies-in-new-jersey-united-states.svg" />
```

## OG Image Fallback Test

Verify the default OG image exists:

```bash
curl -I "https://www.gappsy.com/og/default-1200x630.jpg"
```

**Expected:**
```
HTTP/2 200
content-type: image/jpeg
```

## Test All 52 States (Title Only)

Quick test that all states return correct titles:

```bash
for state in alabama alaska arizona arkansas california colorado connecticut delaware district-of-columbia florida georgia hawaii idaho illinois indiana iowa kansas kentucky louisiana maine maryland massachusetts michigan minnesota mississippi missouri montana nebraska nevada new-hampshire new-jersey new-mexico new-york north-carolina north-dakota ohio oklahoma oregon pennsylvania puerto-rico rhode-island south-carolina south-dakota tennessee texas utah vermont virginia washington west-virginia wisconsin wyoming; do
  echo -n "$state: ";
  curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-$state-united-states/" 2>/dev/null | grep -o '<title>[^<]*</title>' | head -n 1 | grep -q "(2026) | Gappsy" && echo "✓" || echo "✗";
done
```

**Expected:** All 52 states should show ✓

## Social Media Preview Tests

### Facebook Sharing Debugger

1. Open: https://developers.facebook.com/tools/debug/
2. Enter URL: `https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/`
3. Click "Debug"
4. Verify:
   - Title shows with (2026) | Gappsy
   - Description includes "Updated for 2026"
   - OG image displays

### Twitter Card Validator

1. Open: https://cards-dev.twitter.com/validator
2. Enter URL: `https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/`
3. Click "Preview card"
4. Verify:
   - Title shows with (2026) | Gappsy
   - Description includes "Updated for 2026"
   - Image displays as 1200x630

### LinkedIn Post Inspector

1. Open: https://www.linkedin.com/post-inspector/
2. Enter URL: `https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/`
3. Click "Inspect"
4. Verify:
   - Title shows with (2026) | Gappsy
   - Description includes "Updated for 2026"
   - Preview image shows

## Troubleshooting

### Issue: Old Title/Description Shows

**Cause:** Cached response

**Fix:**
```bash
# Add cache-busting timestamp
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/?t=$(date +%s)" | grep -o '<title>[^<]*</title>'

# Or use -H "Cache-Control: no-cache"
curl -A "Googlebot" -H "Cache-Control: no-cache" -sL "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" | grep -o '<title>[^<]*</title>'
```

### Issue: 404 Not Found

**Cause:** Prerendered HTML files not deployed

**Fix:**
1. Verify build completed: `ls dist/marketing-agencies-in-*-united-states/`
2. Check Netlify deploy log for errors
3. Verify dist folder was uploaded to Netlify

### Issue: JavaScript Required

**Symptom:** curl shows placeholder title, not state-specific title

**Cause:** Static HTML files missing, falling back to SPA

**Fix:**
1. Check build logs for prerender errors
2. Verify `vite.config.ts` has `prerenderPlugin()`
3. Rebuild: `npm run build`

### Issue: Social Media Shows Wrong Image

**Cause:** Social platforms cached old metadata

**Fix:**
1. Facebook: https://developers.facebook.com/tools/debug/ → "Scrape Again"
2. Twitter: https://cards-dev.twitter.com/validator → Re-validate
3. LinkedIn: https://www.linkedin.com/post-inspector/ → Re-inspect

## Success Criteria

All tests should pass:

- [x] All 52 states return correct titles with (2026) | Gappsy
- [x] Descriptions include "Updated for 2026"
- [x] SEO proof tags present: `state:{slug}:2026`
- [x] Canonical URLs have trailing slashes
- [x] OG images have width/height/type metadata
- [x] Twitter card metadata complete
- [x] Default OG image returns 200 OK
- [x] Facebook debugger shows correct preview
- [x] Twitter card validator shows correct preview
- [x] LinkedIn inspector shows correct preview

## Automated Testing

Create a simple test script:

```bash
#!/bin/bash
# save as: test-production-seo.sh

echo "Testing Production SEO..."
PASS=0
FAIL=0

for state in vermont wyoming alaska north-dakota new-jersey; do
  TITLE=$(curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-$state-united-states/" 2>/dev/null | grep -o '<title>[^<]*</title>' | head -n 1)

  if echo "$TITLE" | grep -q "(2026) | Gappsy"; then
    echo "✓ $state"
    PASS=$((PASS + 1))
  else
    echo "✗ $state: $TITLE"
    FAIL=$((FAIL + 1))
  fi
done

echo ""
echo "Results: $PASS passed, $FAIL failed"

if [ $FAIL -eq 0 ]; then
  echo "✅ All tests passed!"
  exit 0
else
  echo "❌ Some tests failed"
  exit 1
fi
```

Run it:
```bash
chmod +x test-production-seo.sh
./test-production-seo.sh
```

---

**Last Updated:** 2026-01-27
**Domain:** https://www.gappsy.com
**States:** 52 (50 states + DC + Puerto Rico)
