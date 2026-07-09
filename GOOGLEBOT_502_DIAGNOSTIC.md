# Googlebot 502 Error Diagnostic Report

**Date:** 2026-02-13
**Issue:** Googlebot requests return HTTP/2 502 from Netlify Edge
**Impact:** Blocks Google crawling and indexing

---

## Problem Summary

Browser requests to state pages work correctly (200 OK), but requests with Googlebot User-Agent return 502 Bad Gateway from Netlify Edge infrastructure.

### Reproduction

```bash
# Works fine
curl -Is https://www.gappsy.com/marketing-agencies-in-texas-united-states/ | head -n 5
# → HTTP/2 200

# FAILS
curl -Is -A 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' \
  https://www.gappsy.com/marketing-agencies-in-texas-united-states/ | head -n 20
# → HTTP/2 502
# Server: Netlify
# Cache-Status: Netlify Edge
```

---

## Configuration Audit

### ✅ No Edge Functions Found

- **Checked:** `netlify.toml` for `[[edge_functions]]` sections → None found
- **Checked:** `netlify/edge-functions/*` directory → Does not exist
- **Checked:** `.netlify/edge-functions/*` directory → Does not exist

### ✅ No UA-Specific Logic in Config

- **Checked:** `netlify.toml` for crawler/UA keywords → None found
- **Checked:** `public/_redirects` for prerender services → None found
- **Checked:** `public/_headers` for UA-specific headers → None found

### ✅ Proper Redirects Configuration

File: `public/_redirects`

```
# Prerendered state pages (MUST be above SPA fallback)
# Using splat syntax for maximum Netlify compatibility
/marketing-agencies-in-*-united-states   /marketing-agencies-in-:splat-united-states.html  200
/marketing-agencies-in-*-united-states/  /marketing-agencies-in-:splat-united-states.html  200

# SPA fallback
/*  /index.html 200
```

**Status:** Correct splat syntax, proper ordering

### ✅ All 52 States Prerendered

All HTML files exist in `dist/` directory:
- `marketing-agencies-in-{state}-united-states.html`
- Full SEO tags (title, meta, canonical, OG)
- Complete agency content (no "Loading...")
- Valid H1 tags

---

## Root Cause Analysis

Based on comprehensive audit, the 502 error is **NOT caused by**:

1. ❌ Edge Functions (none exist)
2. ❌ UA-specific redirects (none configured)
3. ❌ Prerender service integration (none found)
4. ❌ Missing HTML files (all 52 exist)
5. ❌ Invalid _redirects syntax (verified correct)

**Conclusion:** The 502 error appears to be a **Netlify platform-level issue** affecting crawler User-Agents, not caused by application configuration.

---

## Potential Netlify Platform Issues

### 1. Netlify Bot Detection

Netlify may have built-in bot/crawler detection at the Edge layer that:
- Intercepts requests with crawler UAs
- Attempts special handling (prerender cache, optimization)
- Fails/crashes when processing these requests
- Returns 502 instead of gracefully falling back

### 2. Netlify Image Optimization

If Netlify's image optimization service runs for crawlers:
- May attempt to optimize images in prerendered HTML
- Could fail on missing/invalid image references
- Returns 502 on optimization error

### 3. Netlify Forms/Functions Auto-Detection

Netlify scans HTML for forms and serverless function calls:
- May fail when parsing prerendered HTML
- Could timeout on large HTML files (state pages are content-heavy)
- Returns 502 on parsing error

---

## Verification Scripts

### Build-Time Verification

```bash
bash scripts/verify-prerendered-files.sh
```

Checks:
- All 52 HTML files exist
- Each file contains H1, title, canonical, OG tags
- No "Loading..." placeholder text
- _redirects file properly configured

### Production Crawler Testing

```bash
bash scripts/verify-crawler-access.sh
```

Tests production URLs with:
- Browser UA → Must return 200 + H1
- Googlebot UA → Must return 200 + H1
- Google-InspectionTool UA → Must return 200 + H1
- Bingbot UA → Must return 200 + H1

**Note:** This script will FAIL until Netlify issue is resolved.

---

## Recommended Solutions

### Immediate Action Items

1. **Contact Netlify Support**
   - Reference: x-nf-request-id from failed requests
   - Provide: curl reproduction command
   - Ask about: Edge layer crawler handling

2. **Check Netlify Dashboard**
   - Build logs for warnings/errors
   - Edge Functions (if enabled unknowingly)
   - Asset optimization settings
   - Form detection settings

3. **Test Build Plugins**
   - Disable any Netlify build plugins temporarily
   - Redeploy and test Googlebot access
   - Re-enable one by one to isolate issue

### Alternative Hosting Solutions

If Netlify issue persists:

1. **Vercel**
   - Similar edge network
   - Better bot handling
   - Drop-in replacement

2. **Cloudflare Pages**
   - Excellent crawler support
   - Built-in cache control
   - No bot-specific issues known

3. **AWS S3 + CloudFront**
   - Static hosting
   - Full control over CDN behavior
   - No automatic bot detection

---

## Testing Commands

### Local Build Verification

```bash
npm run build
bash scripts/verify-prerendered-files.sh
```

Expected output:
```
Passed: 52/52
✓ ALL VERIFICATION CHECKS PASSED
```

### Production Crawler Test (Manual)

```bash
# Test specific state
STATE="texas"
URL="https://www.gappsy.com/marketing-agencies-in-${STATE}-united-states/"

# Test Googlebot
echo "Testing Googlebot..."
curl -s -A 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' "$URL" \
  | grep -c '<h1'

# Should output: 1 (found H1 tag)
# Currently: curl fails with 502
```

---

## Status Summary

| Component | Status | Notes |
|-----------|--------|-------|
| Prerendered HTML files | ✅ Pass | All 52 states with full content |
| _redirects configuration | ✅ Pass | Splat syntax, correct order |
| Edge Functions | ✅ Pass | None exist (good) |
| UA-specific logic | ✅ Pass | None found (good) |
| Browser access | ✅ Pass | 200 OK with full content |
| Googlebot access | ❌ **FAIL** | 502 Bad Gateway |
| InspectionTool access | ❌ **FAIL** | 502 Bad Gateway |
| Bingbot access | ❓ Unknown | Needs testing |

---

## Next Steps

1. Run build verification: `npm run build && bash scripts/verify-prerendered-files.sh`
2. Deploy to Netlify
3. Test crawler access: `bash scripts/verify-crawler-access.sh`
4. If still failing, contact Netlify support with this diagnostic report
5. Consider alternative hosting if Netlify cannot resolve

---

## Additional Context

- **Site:** https://www.gappsy.com
- **Framework:** React + Vite
- **Hosting:** Netlify
- **Prerender:** Custom Node.js script (scripts/prerender.js)
- **States:** 52 total (50 states + DC + Puerto Rico)
- **Content per page:** ~25 agencies + FAQs + structured data
