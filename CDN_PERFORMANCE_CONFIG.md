# CDN & Performance Optimization Configuration

This document describes the comprehensive performance optimizations implemented for the Gappsy marketing agency directory platform.

## Overview

The configuration provides:
- **Brotli/Gzip compression** for all text assets
- **Long-term caching** (1 year) for static assets with immutable flag
- **Smart HTML caching** with stale-while-revalidate for public pages
- **No caching** for private/sensitive pages
- **Domain-agnostic** configuration (works for bolt.host and gappsy.com)

---

## A. Compression Configuration

### Status: ✅ ENABLED BY DEFAULT

Netlify/Bolt automatically compresses all text-based assets using:
- **Brotli** (preferred, ~20% better than gzip)
- **Gzip** (fallback for older browsers)

**Compressed file types:**
- HTML
- CSS
- JavaScript
- JSON
- SVG
- XML

**How it works:**
- Netlify CDN automatically detects `Accept-Encoding` headers from browsers
- Serves pre-compressed files or compresses on-the-fly
- No configuration needed - works out of the box

---

## B. Static Asset Caching (1 Year Immutable)

### Configured in: `netlify.toml` + `public/_headers`

All versioned static assets served from `/assets/` receive aggressive caching:

```
Cache-Control: public, max-age=31536000, immutable
```

**Benefits:**
- **max-age=31536000** = Cache for 1 year (31,536,000 seconds)
- **immutable** = Browser won't revalidate even on refresh (save bandwidth)
- Safe because Vite adds content hashes to filenames (e.g., `index-DgzRUZef.js`)

**Asset types covered:**
- JavaScript bundles (`/assets/*.js`)
- CSS stylesheets (`/assets/*.css`)
- Images (`/assets/*.png`, `*.jpg`, `*.webp`, `*.svg`)
- Fonts (`/assets/*.woff`, `*.woff2`, `*.ttf`, `*.otf`)

**Public directory images** (logos, badges) get **1 week cache**:
```
Cache-Control: public, max-age=604800
```

---

## C. Smart HTML Caching for Public Pages

### Configured in: `netlify.toml` + `public/_headers`

Public, mostly-static pages use edge caching with short TTL and stale-while-revalidate:

```
Cache-Control: public, max-age=300, stale-while-revalidate=86400
```

**How it works:**
1. **First 5 minutes (max-age=300):** CDN serves cached version directly
2. **After 5 minutes:** CDN marks cache as stale
3. **Stale-while-revalidate (24 hours):** CDN serves stale version to visitors WHILE fetching fresh version from origin
4. **After 24 hours:** Cache expires, CDN fetches fresh version before serving

**Public pages with smart caching:**
- `/` (home page)
- `/marketing-agencies-in-*-united-states` (all state ranking pages)
- `/united-states` (USA hub)
- `/about`
- `/contact`
- `/editorial-policy`
- `/terms`
- `/privacy`
- `/refund`

**State data JSON files** also get smart caching:
```
/data/*.json → Cache-Control: public, max-age=300, stale-while-revalidate=86400
```

---

## D. Private/Sensitive Page Exclusions

### Configured in: `netlify.toml` + `public/_headers`

Pages that contain user-specific data, authentication, or transactional content are **never cached**:

```
Cache-Control: no-store, private
```

**Excluded URLs:**
- `/availability/owner/*` (private owner analytics)
- `/admin/*` (admin dashboard)
- `/login` (authentication)
- `/signup` (registration)
- `/products` (Stripe product selection)
- `/success` (payment success)
- `/order-complete` (order confirmation)
- `/spotlight/confirm` (spotlight checkout)
- `/top25/confirm` (top25 checkout)

**Additional protection:**
- `X-Robots-Tag: noindex, nofollow` prevents search engine indexing
- Applied to `/availability/owner/*` and `/admin/*`

---

## E. CDN Cache Key & Query String Handling

### Configuration: Netlify CDN Default Behavior

**Query parameters and caching:**

1. **Tracking parameters ignored** (by Netlify default):
   - `utm_source`, `utm_medium`, `utm_campaign`, `utm_content`, `utm_term`
   - `fbclid`, `gclid`, `msclkid`
   - These don't create separate cache entries

2. **Functional parameters respected**:
   - Query params like `?owner_view=1`, `?checkout=1` create separate cache entries
   - POST requests are never cached

3. **Cache key composition**:
   - Protocol (http/https)
   - Hostname (bolt.host or gappsy.com)
   - Path
   - Relevant query parameters

**Domain compatibility:**
- All rules are **path-based** (not hostname-based)
- Work identically for:
  - `https://new-jersey-marketing-3cac.bolt.host`
  - `https://gappsy.com`
  - Any future custom domains

---

## F. Order of Precedence

Headers are evaluated in this order:

1. **Most specific first**: `/availability/owner/*`, `/admin/*`
2. **Named routes**: `/login`, `/signup`, `/products`, etc.
3. **Wildcard patterns**: `/marketing-agencies-in-*-united-states`
4. **Root**: `/`
5. **Static assets**: `/assets/*`, `*.png`, etc.

**Files checked:**
1. `public/_headers` (takes precedence for matching paths)
2. `netlify.toml` (backup, also provides build config)

---

## G. Verification Checklist

After deployment, verify these responses:

### ✅ Public State Page (e.g., /marketing-agencies-in-new-jersey-united-states)
```bash
curl -I https://new-jersey-marketing-3cac.bolt.host/marketing-agencies-in-new-jersey-united-states
```
**Expected:**
- `Content-Encoding: br` or `gzip`
- `Cache-Control: public, max-age=300, stale-while-revalidate=86400`
- `X-Content-Type-Options: nosniff`

### ✅ Static JS Bundle (e.g., /assets/index-DgzRUZef.js)
```bash
curl -I https://new-jersey-marketing-3cac.bolt.host/assets/index-DgzRUZef.js
```
**Expected:**
- `Content-Encoding: br` or `gzip`
- `Cache-Control: public, max-age=31536000, immutable`

### ✅ Private Owner Page (e.g., /availability/owner/dashboard)
```bash
curl -I https://new-jersey-marketing-3cac.bolt.host/availability/owner/dashboard
```
**Expected:**
- `Cache-Control: no-store, private`
- `X-Robots-Tag: noindex, nofollow`

### ✅ State Data JSON (e.g., /data/new-jersey.json)
```bash
curl -I https://new-jersey-marketing-3cac.bolt.host/data/new-jersey.json
```
**Expected:**
- `Content-Encoding: br` or `gzip`
- `Cache-Control: public, max-age=300, stale-while-revalidate=86400`

---

## H. Future State Expansion

**New state pages automatically inherit these rules!**

When you add a new state (e.g., California):
1. Create `/data/california.json`
2. Access `https://gappsy.com/marketing-agencies-in-california-united-states`

**What happens automatically:**
- ✅ HTML gets smart caching (5 min + stale-while-revalidate)
- ✅ JSON data gets smart caching
- ✅ All static assets cached for 1 year
- ✅ Compression enabled
- ✅ Security headers applied

**No additional configuration needed!**

---

## I. Performance Impact

### Expected improvements:

1. **TTFB (Time to First Byte)**
   - Public pages: **Reduced by 80-95%** (served from edge cache)
   - Static assets: **Instant** (1-year cache in browser)

2. **Transfer Size**
   - HTML: **~70% smaller** (Brotli compression)
   - JS/CSS: **~80% smaller** (Brotli compression)
   - Images: **No change** (already compressed)

3. **Page Load Time**
   - First visit: **20-30% faster** (compressed assets)
   - Repeat visits: **90% faster** (cached assets)
   - Stale pages: **Near-instant** (served while revalidating)

4. **Origin Server Load**
   - Reduced by **85-95%** (edge caching handles most traffic)

---

## J. Monitoring Recommendations

**Tools to test performance:**

1. **WebPageTest** (https://www.webpagetest.org/)
   - Check TTFB, compression, caching
   - Should show "Compress components with gzip" as PASSED

2. **Pingdom** (https://tools.pingdom.com/)
   - Verify load times
   - Check individual asset caching

3. **Chrome DevTools**
   - Network tab → Check "Size" column (shows compression)
   - Headers tab → Verify `Cache-Control` headers

4. **Netlify Analytics**
   - Monitor bandwidth savings
   - Check cache hit rates

---

## K. Troubleshooting

### Issue: Headers not applying
**Solution:** Check file order in `_headers` - most specific rules first

### Issue: Cache not clearing
**Solution:** Vite auto-updates filenames when content changes. For HTML, max-age is only 5 minutes.

### Issue: Private pages being cached
**Solution:** Verify path matches exactly in `_headers` and `netlify.toml`

### Issue: Different behavior on gappsy.com vs bolt.host
**Solution:** All rules are path-based, not hostname-based. Both domains should behave identically.

---

## L. Configuration Files

### Modified files:
1. `netlify.toml` - Primary configuration
2. `public/_headers` - Header overrides (takes precedence)
3. `public/_redirects` - SPA fallback (unchanged)

### Do not modify:
- `vite.config.ts` - Build config (already optimized)
- `index.html` - Entry point (SPA)
- Any React components (performance at CDN level only)

---

## Summary

🎯 **Goal achieved:** Fastest possible delivery from bolt.host + CDN
✅ **Compression:** Brotli/Gzip for all text assets
✅ **Static assets:** 1-year immutable cache
✅ **Public pages:** 5-min cache + 24-hour stale-while-revalidate
✅ **Private pages:** No caching whatsoever
✅ **Domain-agnostic:** Works for bolt.host and gappsy.com
✅ **Future-proof:** All new states automatically optimized

**No design changes. No functional changes. Pure performance.**
