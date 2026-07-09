# Bolt Quick Fix - Redirect Loop (5 minutes)

## The Problem

Bolt is setting Netlify "primary domain" with auto-redirect enabled.

This conflicts with `public/_redirects`, creating an infinite loop.

## The Fix

**Bolt must modify its Netlify API configuration to disable primary domain auto-redirect.**

---

## Step 1: Identify Configuration Code

Find where Bolt calls Netlify API to configure domains.

Look for:
```javascript
netlifyAPI.createSite()
netlifyAPI.updateSite()
netlifyAPI.configureDomains()
```

## Step 2: Disable Auto-Redirect

### Option A: Remove Primary Domain (Recommended)

```javascript
// BEFORE (causes loop):
netlifyAPI.updateSite(siteId, {
  default_domain: 'gappsy.com',
  force_ssl: true
});

// AFTER (fixed):
netlifyAPI.updateSite(siteId, {
  // Don't set default_domain
  domains: ['gappsy.com', 'www.gappsy.com'],
  force_ssl: true
});
```

### Option B: Disable Redirect Flag

```javascript
// BEFORE (causes loop):
netlifyAPI.updateSite(siteId, {
  default_domain: 'www.gappsy.com',
  redirect_to_primary: true  // ← Problem
});

// AFTER (fixed):
netlifyAPI.updateSite(siteId, {
  default_domain: 'www.gappsy.com',
  redirect_to_primary: false  // ← Fixed
});
```

### Option C: Explicit Domain Config

```javascript
netlifyAPI.updateSiteDomains(siteId, {
  domains: [
    { name: 'gappsy.com', redirect_to: null },
    { name: 'www.gappsy.com', redirect_to: null }
  ]
});
```

## Step 3: Deploy

Apply configuration change to affected sites.

## Step 4: Verify

```bash
# Test canonical URL (should return 200, not 301)
curl -sI https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/

# Expected:
HTTP/2 200

# If you see HTTP/2 301, platform redirect is still active
```

---

## Timeline

| Task | Time |
|------|------|
| Find Bolt deployment code | 5 min |
| Modify API configuration | 2 min |
| Deploy | 2 min |
| Propagate | 1 min |
| **Total** | **10 min** |

---

## Success Criteria

✅ `https://www.gappsy.com/page/` returns 200 (not 301)
✅ No `ERR_TOO_MANY_REDIRECTS`
✅ All pages load correctly

---

## Full Documentation

- `REDIRECT_LOOP_ROOT_CAUSE.md` - Complete analysis
- `BOLT_HOSTING_REDIRECT_FIX.md` - Detailed implementation
- `test-platform-redirect.sh` - Diagnostic script
