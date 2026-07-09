# Crawler Access Verification Guide

## Quick Start

### 1. Build and Verify Locally

```bash
npm run build:verify
```

Expected output:
```
✓ ALL VERIFICATION CHECKS PASSED
Passed: 52/52
```

### 2. Test Production Crawler Access

```bash
npm run verify-crawlers
```

Expected output (once Netlify issue is resolved):
```
✓ ALL TESTS PASSED: 20/20
Browser:        5 passed, 0 failed
Googlebot:      5 passed, 0 failed
InspectionTool: 5 passed, 0 failed
Bingbot:        5 passed, 0 failed
```

---

## Current Status

### ✅ Works Correctly

- **Browser requests:** 200 OK with full HTML
- **Prerendered files:** All 52 states built correctly
- **SEO tags:** Title, meta, canonical, OG tags present
- **Content:** All agencies loaded (no "Loading..." placeholders)

### ❌ Known Issue

- **Googlebot requests:** Returns 502 Bad Gateway
- **Google-InspectionTool:** Returns 502 Bad Gateway
- **Impact:** Blocks Google crawling/indexing

**Root Cause:** Netlify platform-level issue (not application configuration)

See `GOOGLEBOT_502_DIAGNOSTIC.md` for full technical analysis.

---

## Verification Commands

### Build-Time Verification

```bash
# Full build with verification
npm run build:verify

# Just verify existing dist/ files
npm run verify-files
```

**What it checks:**
- All 52 HTML files exist in dist/
- Each file contains H1, title, canonical, OG tags
- No "Loading..." placeholder text remains
- Agency content present
- _redirects file configured correctly

### Production Crawler Testing

```bash
# Test production site with multiple UAs
npm run verify-crawlers

# Test specific domain
TEST_DOMAIN=https://staging.gappsy.com npm run verify-crawlers
```

**What it tests:**
- 5 representative states (TX, CA, NJ, FL, NY)
- 4 User-Agents (Browser, Googlebot, InspectionTool, Bingbot)
- HEAD request for status code
- GET request for content validation
- Checks for H1 tags and proper content
- Detects 502 error pages

---

## Manual Testing

### Test Googlebot Access

```bash
# Texas
curl -Is -A 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' \
  https://www.gappsy.com/marketing-agencies-in-texas-united-states/ | head -20

# Should show: HTTP/2 200
# Currently shows: HTTP/2 502
```

### Test Content is Served

```bash
# Check if HTML contains H1 tag
curl -s -A 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' \
  https://www.gappsy.com/marketing-agencies-in-texas-united-states/ \
  | grep -c '<h1'

# Should output: 1 (or higher)
# Currently: curl fails with 502
```

### Test All States

```bash
# Quick test of all 52 states
for state in alabama alaska arizona arkansas california colorado connecticut delaware district-of-columbia florida georgia hawaii idaho illinois indiana iowa kansas kentucky louisiana maine maryland massachusetts michigan minnesota mississippi missouri montana nebraska nevada new-hampshire new-jersey new-mexico new-york north-carolina north-dakota ohio oklahoma oregon pennsylvania puerto-rico rhode-island south-carolina south-dakota tennessee texas utah vermont virginia washington west-virginia wisconsin wyoming; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
    -A 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' \
    "https://www.gappsy.com/marketing-agencies-in-${state}-united-states/")
  echo "$state: $STATUS"
done
```

---

## Understanding the 502 Error

### What is HTTP 502?

> **502 Bad Gateway:** The server, while acting as a gateway or proxy, received an invalid response from an upstream server.

In this case:
- Netlify Edge receives the request
- Attempts to process/optimize for crawler
- Something fails in that process
- Returns 502 instead of gracefully falling back

### Why Only Crawlers?

Netlify may have special handling for crawler User-Agents:
- Prerender service integration
- Bot-specific optimizations
- Crawler cache layer
- Image optimization for bots

When this special handling fails, it returns 502 instead of serving the static HTML.

### What We've Ruled Out

✅ **Not caused by:**
- Edge Functions (none exist)
- UA-specific redirects (none configured)
- Prerender middleware (none found)
- Missing HTML files (all 52 present)
- Invalid _redirects syntax (verified correct)
- Application code errors (works for browsers)

---

## Netlify Configuration Audit

### Configuration Files Checked

- ✅ `netlify.toml` - No Edge Functions, no UA logic
- ✅ `public/_redirects` - Correct splat syntax
- ✅ `public/_headers` - No UA-specific headers
- ✅ `netlify/edge-functions/` - Directory doesn't exist
- ✅ `.netlify/edge-functions/` - Directory doesn't exist

### Current _redirects Configuration

```
# Prerendered state pages (MUST be above SPA fallback)
/marketing-agencies-in-*-united-states   /marketing-agencies-in-:splat-united-states.html  200
/marketing-agencies-in-*-united-states/  /marketing-agencies-in-:splat-united-states.html  200

# SPA fallback
/*  /index.html 200
```

**Status:** ✅ Correct

---

## Troubleshooting Steps

### If Build Verification Fails

1. **Clean build:**
   ```bash
   rm -rf dist node_modules/.vite
   npm run build
   ```

2. **Check specific state:**
   ```bash
   ls -lh dist/marketing-agencies-in-texas-united-states.html
   grep '<h1' dist/marketing-agencies-in-texas-united-states.html
   ```

3. **Verify _redirects:**
   ```bash
   cat dist/_redirects | grep "marketing-agencies"
   ```

### If Crawler Verification Fails

1. **Check Netlify deploy logs:**
   - Look for warnings or errors
   - Check build time (should be ~2-3 minutes)
   - Verify prerender script ran successfully

2. **Test specific states manually:**
   ```bash
   # Replace DOMAIN with your actual domain
   curl -Is https://www.gappsy.com/marketing-agencies-in-california-united-states/
   ```

3. **Check Netlify dashboard:**
   - Functions tab → Should be empty (no Edge Functions)
   - Deploys tab → Check for errors
   - Site settings → Asset optimization → May need adjustment

### If 502 Persists

1. **Contact Netlify Support:**
   - Provide x-nf-request-id from failed request
   - Share this diagnostic report
   - Include curl reproduction command

2. **Get request ID:**
   ```bash
   curl -I -A 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' \
     https://www.gappsy.com/marketing-agencies-in-texas-united-states/ 2>&1 \
     | grep x-nf-request-id
   ```

3. **Temporary workaround:**
   - Consider using Vercel or Cloudflare Pages
   - Both have better crawler support
   - Near-identical deployment process

---

## Success Criteria

### Build Verification ✅

```bash
npm run build:verify
# Output: ✓ ALL VERIFICATION CHECKS PASSED
```

### Crawler Verification ⏳ (Pending Netlify fix)

```bash
npm run verify-crawlers
# Output: ✓ ALL TESTS PASSED: 20/20
```

### Production Spot Check ⏳ (Pending Netlify fix)

```bash
curl -Is -A 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' \
  https://www.gappsy.com/marketing-agencies-in-texas-united-states/ \
  | head -5
# Should show: HTTP/2 200
```

---

## Next Steps

1. ✅ **Complete:** Configuration audit
2. ✅ **Complete:** Build verification script
3. ✅ **Complete:** Crawler testing script
4. ⏳ **Pending:** Deploy to Netlify
5. ⏳ **Pending:** Test crawler access
6. ⏳ **Pending:** Contact Netlify if still failing

---

## Additional Resources

- [Googlebot User-Agent](https://developers.google.com/search/docs/crawling-indexing/overview-google-crawlers)
- [Google-InspectionTool](https://developers.google.com/search/docs/appearance/google-inspection-tool)
- [Netlify Redirects Documentation](https://docs.netlify.com/routing/redirects/)
- [HTTP 502 Troubleshooting](https://docs.netlify.com/configure-builds/troubleshooting-tips/)

---

## Related Files

- `GOOGLEBOT_502_DIAGNOSTIC.md` - Full technical analysis
- `scripts/verify-prerendered-files.sh` - Build verification
- `scripts/verify-crawler-access.sh` - Production testing
- `public/_redirects` - Routing configuration
- `netlify.toml` - Netlify configuration
