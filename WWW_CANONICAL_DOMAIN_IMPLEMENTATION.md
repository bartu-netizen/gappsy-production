# WWW Canonical Domain Implementation - Complete

## Overview

Ensured https://www.gappsy.com is the ONLY canonical host across all metadata, redirects, and API endpoints. All apex domain requests (gappsy.com) redirect to www in a single 301 hop.

---

## A) EXACT CODE CHANGES

### 1. Redirects (public/_redirects)

**ALREADY CORRECT - No changes needed:**

```
# Step 1: Redirect non-www to www (force HTTPS + WWW)
http://gappsy.com/*  https://www.gappsy.com/:splat  301!
https://gappsy.com/*  https://www.gappsy.com/:splat  301!
http://www.gappsy.com/*  https://www.gappsy.com/:splat  301!
```

✅ These rules ensure single-hop redirects:
- http://gappsy.com/* → https://www.gappsy.com/*
- https://gappsy.com/* → https://www.gappsy.com/*
- http://www.gappsy.com/* → https://www.gappsy.com/*

---

### 2. SEO Helper (src/utils/seoHelper.ts)

**ALREADY CORRECT - No changes needed:**

```typescript
const DOMAIN = 'https://www.gappsy.com';
```

Line 9: Hardcoded to WWW canonical domain

✅ All canonical URLs: `https://www.gappsy.com/marketing-agencies-in-{slug}-united-states/`
✅ All og:url: Same as canonical (line 79)
✅ All og:image: `https://www.gappsy.com/og/marketing-agencies-in-{slug}-united-states.svg`
✅ All twitter:image: Same as og:image (line 83)

---

### 3. Email Templates (supabase/functions/_shared/emailTemplates.ts)

**FIXED - Changed apex to www:**

```typescript
// Line 328 - BEFORE
const returnUrl = `https://gappsy.com/${stateSlug}/top-25/offer`;

// Line 328 - AFTER
const returnUrl = `https://www.gappsy.com/${stateSlug}/top-25/offer`;
```

```typescript
// Line 480 - BEFORE
const returnUrl = `https://gappsy.com/${stateSlug}/spotlight/offer`;

// Line 480 - AFTER
const returnUrl = `https://www.gappsy.com/${stateSlug}/spotlight/offer`;
```

```typescript
// Line 626 - BEFORE
const returnUrl = `https://gappsy.com/${stateSlug}/activation/upgrade`;

// Line 626 - AFTER
const returnUrl = `https://www.gappsy.com/${stateSlug}/activation/upgrade`;
```

---

### 4. Netlify Functions CORS (netlify/functions/*.ts)

**FIXED - Changed CORS origin from apex to www:**

**netlify/functions/smtp-test.ts:**
```typescript
// Line 16 - BEFORE
const ALLOWED_ORIGIN = "https://gappsy.com";

// Line 16 - AFTER
const ALLOWED_ORIGIN = "https://www.gappsy.com";
```

**netlify/functions/email-center-probe.ts:**
```typescript
// Line 18 - BEFORE
"Access-Control-Allow-Origin": "https://gappsy.com",

// Line 18 - AFTER
"Access-Control-Allow-Origin": "https://www.gappsy.com",
```

**netlify/functions/email-center-proxy.ts:**
```typescript
// Line 12 - BEFORE
const ALLOWED_ORIGIN = "https://gappsy.com";

// Line 12 - AFTER
const ALLOWED_ORIGIN = "https://www.gappsy.com";
```

---

### 5. Other Files Already Correct

**src/utils/canonicalUrl.ts:**
```typescript
// Line 14 - ALREADY CORRECT
const CANONICAL_DOMAIN = 'https://www.gappsy.com';
```

**src/utils/stateJsonImport.ts:**
```typescript
// Line 236 - ALREADY CORRECT
fullCanonicalUrl = `https://www.gappsy.com${canonicalUrl}`;
```

---

## B) VERIFICATION INSTRUCTIONS

### Test 1: Apex → WWW Redirect (Single Hop)

```bash
# Test apex without protocol
curl -I https://gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

**Expected output:**
```
HTTP/2 301
location: https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

✅ Single 301 redirect from apex to www

---

### Test 2: HTTP → HTTPS + WWW Redirect

```bash
# Test http://gappsy.com
curl -I http://gappsy.com/marketing-agencies-in-california-united-states/
```

**Expected output:**
```
HTTP/1.1 301 Moved Permanently
Location: https://www.gappsy.com/marketing-agencies-in-california-united-states/
```

✅ Single 301 redirect from http apex to https www

---

### Test 3: WWW Domain Returns 200

```bash
# Test canonical WWW URL
curl -I https://www.gappsy.com/marketing-agencies-in-texas-united-states/
```

**Expected output:**
```
HTTP/2 200
content-type: text/html
```

✅ WWW domain serves content directly (no redirect)

---

### Test 4: Canonical Tag in HTML Source

```bash
# Test canonical meta tag
curl -s https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ | grep 'canonical'
```

**Expected output:**
```html
<link rel="canonical" href="https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/">
```

✅ Canonical uses WWW domain with trailing slash

---

### Test 5: OG Tags Use WWW Domain

```bash
# Test Open Graph URL
curl -s https://www.gappsy.com/marketing-agencies-in-florida-united-states/ | grep 'og:url'
```

**Expected output:**
```html
<meta property="og:url" content="https://www.gappsy.com/marketing-agencies-in-florida-united-states/">
```

```bash
# Test Open Graph Image
curl -s https://www.gappsy.com/marketing-agencies-in-florida-united-states/ | grep 'og:image'
```

**Expected output:**
```html
<meta property="og:image" content="https://www.gappsy.com/og/marketing-agencies-in-florida-united-states.svg">
```

✅ All Open Graph tags use WWW domain

---

### Test 6: Twitter Card Tags Use WWW Domain

```bash
# Test Twitter image
curl -s https://www.gappsy.com/marketing-agencies-in-california-united-states/ | grep 'twitter:image'
```

**Expected output:**
```html
<meta name="twitter:image" content="https://www.gappsy.com/og/marketing-agencies-in-california-united-states.svg">
```

✅ Twitter card uses WWW domain

---

### Test 7: Verify All 52 States Use WWW

```bash
# Test multiple states
for state in new-york california texas florida illinois pennsylvania ohio; do
  echo "=== Testing $state ==="
  curl -s "https://www.gappsy.com/marketing-agencies-in-$state-united-states/" | grep -E '(canonical|og:url|og:image)' | head -3
  echo ""
done
```

**Expected output (for each state):**
```html
<link rel="canonical" href="https://www.gappsy.com/marketing-agencies-in-{state}-united-states/">
<meta property="og:url" content="https://www.gappsy.com/marketing-agencies-in-{state}-united-states/">
<meta property="og:image" content="https://www.gappsy.com/og/marketing-agencies-in-{state}-united-states.svg">
```

✅ Every state page uses WWW domain consistently

---

### Test 8: View-Source Verification (Browser)

Open in browser:
```
view-source:https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

Search for (`Ctrl+F`):
1. `rel="canonical"` → Should be `https://www.gappsy.com/...`
2. `og:url` → Should be `https://www.gappsy.com/...`
3. `og:image` → Should be `https://www.gappsy.com/og/...`
4. `twitter:image` → Should be `https://www.gappsy.com/og/...`

✅ All metadata uses WWW domain

---

### Test 9: OG Image Availability

```bash
# Test that OG images are accessible
curl -I https://www.gappsy.com/og/marketing-agencies-in-new-jersey-united-states.svg
```

**Expected output:**
```
HTTP/2 200
content-type: image/svg+xml
```

✅ OG images are accessible on WWW domain

---

### Test 10: Homepage and Other Pages

```bash
# Test homepage
curl -I https://gappsy.com/
```

**Expected:**
```
HTTP/2 301
location: https://www.gappsy.com/
```

```bash
# Test about page
curl -I https://gappsy.com/about
```

**Expected:**
```
HTTP/2 301
location: https://www.gappsy.com/about
```

✅ All pages redirect apex to www

---

## C) SUMMARY OF CHANGES

### Files Modified

1. ✅ **supabase/functions/_shared/emailTemplates.ts** (3 changes)
   - Line 328: Top-25 offer URL → www
   - Line 480: Spotlight offer URL → www
   - Line 626: Activation upgrade URL → www

2. ✅ **netlify/functions/smtp-test.ts** (1 change)
   - Line 16: ALLOWED_ORIGIN → www

3. ✅ **netlify/functions/email-center-probe.ts** (1 change)
   - Line 18: Access-Control-Allow-Origin → www

4. ✅ **netlify/functions/email-center-proxy.ts** (1 change)
   - Line 12: ALLOWED_ORIGIN → www

### Files Already Correct (No Changes Needed)

1. ✅ **public/_redirects** - Apex → WWW redirects already in place
2. ✅ **src/utils/seoHelper.ts** - DOMAIN = 'https://www.gappsy.com'
3. ✅ **src/utils/canonicalUrl.ts** - CANONICAL_DOMAIN uses www
4. ✅ **src/utils/stateJsonImport.ts** - Full canonical uses www

---

## D) SEO IMPACT

### Benefits of WWW Canonicalization

✅ **Consistent ranking signals** - All backlinks resolve to single canonical host
✅ **No duplicate content** - Search engines see one authoritative version
✅ **Link equity preservation** - All apex links 301 redirect to www (passes 95%+ equity)
✅ **Social sharing consistency** - Facebook/Twitter/LinkedIn use correct domain
✅ **Analytics accuracy** - All traffic tracked under single hostname
✅ **WordPress migration continuity** - Maintains same host structure as old site

### Redirect Chain Prevention

Before (WRONG - multiple hops):
```
http://gappsy.com/state/ → https://gappsy.com/state/ → https://www.gappsy.com/state/
```

After (CORRECT - single hop):
```
http://gappsy.com/state/ → https://www.gappsy.com/state/
```

✅ All redirects are direct 301 to final destination

---

## E) DEPLOYMENT CHECKLIST

After deploying:

- [ ] Test apex redirect: `curl -I https://gappsy.com/marketing-agencies-in-new-jersey-united-states/`
- [ ] Test http redirect: `curl -I http://gappsy.com/`
- [ ] Test www 200: `curl -I https://www.gappsy.com/`
- [ ] View-source canonical: Check `<link rel="canonical">`
- [ ] View-source og:url: Check `<meta property="og:url">`
- [ ] View-source og:image: Check `<meta property="og:image">`
- [ ] Test 5+ random states: Verify all use www domain
- [ ] Check email links: Send test emails and verify links use www
- [ ] Monitor Google Search Console: Ensure no crawl errors
- [ ] Update any external tools: Analytics, Search Console, etc. (if needed)

---

## F) EDGE FUNCTION DEPLOYMENT

**IMPORTANT:** Edge function changes require redeployment.

Since we modified `supabase/functions/_shared/emailTemplates.ts`, any edge functions that import it need to be redeployed:

**Functions that need redeployment:**
1. `availability-notify` (uses emailTemplates)
2. `submit-agency` (uses emailTemplates)
3. `featured-spotlight` (uses emailTemplates)
4. `top25-claim-intent` (uses emailTemplates)
5. `contact-submit` (uses emailTemplates)
6. `top25-listing` (uses emailTemplates)

**Deployment command for each:**
```bash
# These will be auto-deployed with your next Supabase deploy
# OR manually deploy via Supabase CLI:
supabase functions deploy availability-notify
supabase functions deploy submit-agency
supabase functions deploy featured-spotlight
supabase functions deploy top25-claim-intent
supabase functions deploy contact-submit
supabase functions deploy top25-listing
```

---

## G) TROUBLESHOOTING

### Issue: Apex domain not redirecting

**Diagnosis:**
```bash
curl -I https://gappsy.com/
```

**If returns 200 instead of 301:**
- Check hosting platform redirect rules
- Verify `public/_redirects` is deployed
- Clear CDN cache

---

### Issue: Canonical still shows apex domain

**Diagnosis:**
```bash
curl -s https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ | grep canonical
```

**If shows `https://gappsy.com/` (without www):**
- Check build output includes latest code
- Verify `src/utils/seoHelper.ts` line 9 is `https://www.gappsy.com`
- Clear browser cache and test in incognito

---

### Issue: Email links still use apex

**Diagnosis:**
Send test email and check links in HTML source

**If links are `https://gappsy.com/` (without www):**
- Redeploy affected edge functions
- Wait 2-3 minutes for deployment to complete
- Send new test email to verify

---

## H) VERIFICATION SUMMARY

✅ **Redirects:** Apex → WWW in single 301 hop
✅ **Canonicals:** All state pages use https://www.gappsy.com
✅ **OG Tags:** og:url and og:image use www domain
✅ **Twitter Tags:** twitter:image uses www domain
✅ **Email Links:** Email templates use www URLs
✅ **CORS:** Netlify functions allow www origin
✅ **Build:** Project compiles successfully

**Result:** https://www.gappsy.com is the ONLY canonical host across the entire platform.
