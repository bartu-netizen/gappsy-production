# Bolt Hosting Redirect Loop Fix

## Problem Statement

**Symptom:** `ERR_TOO_MANY_REDIRECTS` on production
**Pattern:** `gappsy.com` ↔ `www.gappsy.com` ↔ `gappsy.com` ↔ ...

## Root Cause Analysis

### Proof: public/_redirects Cannot Create Loop

The `_redirects` file contains rules that create a **directed acyclic graph** (DAG):

```
All variants → https://www.gappsy.com/<path>/
```

Once a URL reaches canonical format (`https://www.gappsy.com/<path>/`), **no rule matches it**.

See `PROOF_NO_LOOP_IN_REDIRECTS.md` for mathematical proof.

### Identified Issue: Platform-Level Redirect

The loop pattern indicates two conflicting systems:

1. **Platform (Netlify):** Redirecting `www.gappsy.com` → `gappsy.com`
2. **_redirects file:** Redirecting `gappsy.com` → `www.gappsy.com`

This creates an infinite ping-pong loop.

## Netlify Primary Domain Feature

When a Netlify site has multiple domains (e.g., `gappsy.com` AND `www.gappsy.com`), Netlify offers:

```
Primary Domain: [domain]
☑ Redirect automatically to primary domain
```

**If enabled, this applies an edge-level redirect BEFORE `_redirects` is processed.**

## Bolt Deployment Configuration

Since the user states:
- "Bolt controls the hosting"
- "I do NOT have access to Netlify dashboard"
- "All hosting configuration is controlled by Bolt"

**Conclusion:** Bolt is programmatically configuring Netlify domain settings via API during deployment.

## The Fix: Disable Platform-Level Redirects

Bolt must ensure that when deploying to Netlify, it does ONE of:

### Option 1: No Primary Domain (RECOMMENDED)

```javascript
// Bolt deployment code
netlifyAPI.updateSite(siteId, {
  // Do NOT set primary_domain
  // Do NOT enable automatic redirects
  domains: ['gappsy.com', 'www.gappsy.com']
  // Let _redirects file handle ALL canonicalization
});
```

### Option 2: Primary Domain Without Auto-Redirect

```javascript
// Bolt deployment code
netlifyAPI.updateSite(siteId, {
  default_domain: 'www.gappsy.com',  // Primary domain
  force_ssl: true,                    // Force HTTPS (OK)
  // But DO NOT set:
  // domain_aliases: [] with redirect flags
});

// Ensure no redirect rule is added for primary domain
```

### Option 3: Primary Domain Configuration via Dashboard Override

If Bolt uses Netlify's automated domain setup, it must pass:

```json
{
  "domains": [
    {
      "name": "gappsy.com",
      "redirect_to": null  // ← CRITICAL: No redirect
    },
    {
      "name": "www.gappsy.com",
      "redirect_to": null  // ← CRITICAL: No redirect
    }
  ]
}
```

## Required Configuration Changes in Bolt

### 1. Deployment Script

Bolt's deployment script must NOT call:

```javascript
// ❌ BAD: This enables auto-redirect
netlify.setPrimaryDomain('www.gappsy.com', { redirect: true });

// ✅ GOOD: No auto-redirect
netlify.setPrimaryDomain('www.gappsy.com', { redirect: false });
// OR just don't set primary domain at all
```

### 2. Environment Configuration

If Bolt uses environment variables to configure domains:

```bash
# ❌ BAD
NETLIFY_PRIMARY_DOMAIN="www.gappsy.com"
NETLIFY_REDIRECT_TO_PRIMARY="true"  # ← This causes loop

# ✅ GOOD
NETLIFY_PRIMARY_DOMAIN=""  # No primary domain
# OR
NETLIFY_REDIRECT_TO_PRIMARY="false"  # Disable auto-redirect
```

### 3. netlify.toml Configuration

This project's `netlify.toml` already specifies:

```toml
# ONLY public/_redirects should control URL canonicalization
# NO platform-level redirects should be applied
[build.processing]
skip_processing = false
```

Bolt should respect this and NOT override it with API settings.

## Detection: How to Identify Platform-Level Redirect

### Test 1: Check HTTP Headers

```bash
curl -sI https://www.gappsy.com/test/ | grep -E "(HTTP|Location|x-nf)"
```

**If Netlify is applying platform redirect:**
```
HTTP/2 301
Location: https://gappsy.com/test/
x-nf-request-id: ...
```

**If platform redirect is disabled (CORRECT):**
```
HTTP/2 200
x-nf-request-id: ...
```

### Test 2: Check Redirect Chain

```bash
curl -sIL https://www.gappsy.com/test/ | grep -c "HTTP"
```

**If loop exists:** Returns `11` or more (redirect limit)
**If working:** Returns `1` (no redirects)

### Test 3: Netlify API Check

```bash
# Check domain configuration via Netlify API
curl -H "Authorization: Bearer $NETLIFY_TOKEN" \
  https://api.netlify.com/api/v1/sites/$SITE_ID | jq '.domain_aliases'
```

Look for `"redirect_to"` fields - they should all be `null`.

## Implementation Checklist for Bolt

- [ ] Identify where Bolt configures Netlify domains (deployment script, API calls, etc.)
- [ ] Ensure primary domain is NOT set OR is set without auto-redirect
- [ ] Verify no domain has `redirect_to` property set
- [ ] Test that `https://www.gappsy.com/page/` returns 200 (not 301)
- [ ] Test that `https://gappsy.com/page` returns 301 to `https://www.gappsy.com/page/`
- [ ] Confirm redirect chain never exceeds 2-3 redirects
- [ ] Verify no `ERR_TOO_MANY_REDIRECTS` errors

## Expected Behavior After Fix

| Input URL | Expected Redirects | Final URL | Status |
|-----------|-------------------|-----------|--------|
| `https://www.gappsy.com/page/` | 0 | `https://www.gappsy.com/page/` | 200 ✅ |
| `https://gappsy.com/page` | 2 | `https://www.gappsy.com/page/` | 200 ✅ |
| `https://www.gappsy.com/page` | 1 | `https://www.gappsy.com/page/` | 200 ✅ |
| `http://gappsy.com/page` | 2 | `https://www.gappsy.com/page/` | 200 ✅ |

**Key:** Canonical URL (`https://www.gappsy.com/page/`) serves immediately with 0 redirects.

## File System Evidence

| File | Redirect Rules | Purpose |
|------|---------------|---------|
| `public/_redirects` | ✅ Lines 8-13 | Force HTTPS + WWW + trailing slash |
| `netlify.toml` | ✅ No [[redirects]] | No conflicting rules |
| `public/_headers` | ✅ No redirects | Headers only |

**Conclusion:** Code is correct. Issue is platform configuration.

## Debugging Commands

### View Current Platform Config

If Bolt has access to Netlify API:

```bash
# Get site details
netlify api getSite --data '{"site_id": "YOUR_SITE_ID"}'

# Check for domain configuration
netlify api listSiteDomains --data '{"site_id": "YOUR_SITE_ID"}'
```

### Manually Fix (If API Access Available)

```bash
# Disable auto-redirect for all domains
netlify api updateSite --data '{
  "site_id": "YOUR_SITE_ID",
  "domain_aliases": []
}'
```

## Contact Netlify Support (If Needed)

If Bolt cannot identify the configuration issue:

**Template:**
```
Subject: Disable Primary Domain Auto-Redirect for Site

Site ID: [YOUR_SITE_ID]
Domain: gappsy.com / www.gappsy.com

Issue: Platform is applying automatic redirect that conflicts with
       _redirects file, causing ERR_TOO_MANY_REDIRECTS.

Request: Disable "redirect to primary domain" feature for this site.
         Let _redirects file control ALL canonicalization.

Evidence:
- curl -sI https://www.gappsy.com/ returns 301 instead of 200
- Loop pattern: www → non-www → www → ...
```

## Timeline

Once Bolt disables platform-level redirects:

| Step | Duration | Owner |
|------|----------|-------|
| Update Bolt deployment config | 10 min | Bolt Dev |
| Deploy with new config | 2 min | Bolt |
| Wait for propagation | 1-2 min | Netlify |
| Test and verify | 1 min | User |
| **Total** | **~15 min** | |

## Success Criteria

✅ `https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/` loads immediately (200 OK)
✅ No `ERR_TOO_MANY_REDIRECTS` errors
✅ All 52 state pages accessible
✅ Redirect chain never exceeds 2-3 redirects
✅ Canonical URLs serve with 0 redirects
