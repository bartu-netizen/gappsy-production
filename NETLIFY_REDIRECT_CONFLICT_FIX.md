# Netlify Redirect Conflict - Fix Guide

**Problem:** ERR_TOO_MANY_REDIRECTS caused by conflicting redirect layers

**Root Cause:** Netlify dashboard settings are applying redirects that conflict with `public/_redirects`

---

## ✅ Verified: Codebase is Clean

**Redirect rules ONLY exist in:**
- ✅ `public/_redirects` (canonical URL rules)

**No redirect rules in:**
- ✅ `netlify.toml` (only headers, no redirects)
- ✅ `public/_headers` (only cache/security headers, no redirects)
- ✅ No other configuration files

**Conclusion:** The redirect loop is caused by **Netlify dashboard settings**, not the code.

---

## 🔍 Identifying the Conflict

### The Redirect Loop Pattern

```
User requests: https://www.gappsy.com/page/

Netlify DNS: "Force non-WWW" → https://gappsy.com/page/
  ↓
_redirects Rule 3: "Force WWW" → https://www.gappsy.com/page/
  ↓
Netlify DNS: "Force non-WWW" → https://gappsy.com/page/
  ↓
_redirects Rule 3: "Force WWW" → https://www.gappsy.com/page/
  ↓
... LOOP FOREVER → ERR_TOO_MANY_REDIRECTS
```

---

## 🛠️ Fix: Disable Netlify Domain-Level Redirects

### Step 1: Access Netlify Dashboard

1. Go to: https://app.netlify.com/
2. Select your site: **gappsy.com**
3. Navigate to: **Site settings → Domain management → Domains**

### Step 2: Check Domain Settings

Look for these settings and **DISABLE** them:

#### ❌ Primary Domain Setting (MOST LIKELY CULPRIT)

**Location:** Site settings → Domain management → Domains → Options

**Problem Settings:**
- ❌ "Set as primary domain" with redirect option enabled
- ❌ "Redirect automatically to primary domain"

**Fix:**
```
Option 1: Remove any "primary domain" setting
Option 2: If primary domain is set, ensure "redirect" is DISABLED
```

#### ❌ HTTPS Settings

**Location:** Site settings → Domain management → HTTPS

**Check:**
- ✅ "Force HTTPS" can stay ENABLED (our _redirects handles this)
- ❌ "Force TLS" - check if causing issues

#### ❌ Branch Deploy Settings

**Location:** Site settings → Build & deploy → Continuous deployment → Deploy contexts

**Fix:**
```
Ensure branch deploys don't have conflicting domain redirects
```

### Step 3: DNS Configuration

**Location:** Netlify DNS or your DNS provider (Cloudflare, etc.)

**Check:**
- ✅ CNAME record for `www` points to Netlify
- ✅ A record for `@` (apex) points to Netlify load balancer
- ❌ No external redirect rules in DNS provider (Cloudflare page rules, etc.)

### Step 4: Netlify Configuration File

Verify `netlify.toml` has **NO** redirect rules:

```toml
# ✅ CORRECT - No [[redirects]] section
[build]
  command = "npx vite build"
  publish = "dist"

# ❌ REMOVE IF PRESENT
# [[redirects]]
#   from = "https://gappsy.com/*"
#   to = "https://www.gappsy.com/:splat"
#   status = 301
#   force = true
```

---

## 🎯 Correct Configuration

### Netlify Dashboard Settings

| Setting | Value | Location |
|---------|-------|----------|
| Primary domain | `www.gappsy.com` (NO auto-redirect) | Domain management |
| Force HTTPS | Enabled (optional) | HTTPS settings |
| Redirect to primary | **DISABLED** | Domain options |
| Pretty URLs | Disabled | Build settings |

### DNS Records

```
Type    Name    Value
────────────────────────────────────────────────
A       @       75.2.60.5 (Netlify)
CNAME   www     your-site.netlify.app
```

### Redirect Control

```
✅ public/_redirects    = Controls ALL redirects
❌ Netlify dashboard    = NO redirect settings
❌ DNS provider         = NO redirect rules
```

---

## 🧪 Testing After Fix

### Test 1: Check for External Redirects

```bash
# Test if Netlify is adding redirects before _redirects file runs
curl -sI https://www.gappsy.com/test-path-does-not-exist/ | grep -E '(HTTP|Location)'
```

**Expected:**
- If returns 200 or 404: Good (goes through _redirects to SPA)
- If returns 301 with Location to non-www: BAD (Netlify is still redirecting)

### Test 2: Test Non-WWW

```bash
curl -sI https://gappsy.com/marketing-agencies-in-new-jersey-united-states/ | grep -E '(HTTP|Location)'
```

**Expected:**
```
HTTP/2 301
Location: https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

Should see **ONE** redirect, not multiple

### Test 3: Test Canonical URL

```bash
curl -sI https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ | grep -E '(HTTP|Location)'
```

**Expected:**
```
HTTP/2 200
```

**No Location header** (no redirect)

### Test 4: Full Redirect Chain

```bash
curl -sIL https://gappsy.com/marketing-agencies-in-new-jersey-united-states | grep -E '(HTTP|Location)'
```

**Expected:**
```
HTTP/2 301
Location: https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states
HTTP/2 301
Location: https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
HTTP/2 200
```

Should see exactly **2 redirects**, then 200 OK

---

## 🔧 Alternative: Force _redirects Priority

If you can't find the conflicting setting, force `_redirects` to override Netlify:

### Add to netlify.toml

```toml
[build]
  command = "npx vite build"
  publish = "dist"

# Force _redirects file to take precedence
[build.processing]
  skip_processing = false

# Ensure _redirects is not overridden
[[plugins]]
  package = "@netlify/plugin-nextjs"
  [plugins.inputs]
    distDir = "dist"
```

**Note:** This is a workaround. The correct fix is to disable conflicting Netlify settings.

---

## 🚨 Common Mistakes

### ❌ Wrong: Setting Primary Domain with Auto-Redirect

```
Netlify Dashboard:
  Primary domain: www.gappsy.com
  ✓ Redirect automatically to primary domain  ← CAUSES LOOP
```

### ✅ Correct: No Auto-Redirect

```
Netlify Dashboard:
  Primary domain: www.gappsy.com
  ☐ Redirect automatically to primary domain  ← DISABLED

  OR

  No primary domain set (let _redirects handle it)
```

---

## 📊 Decision Matrix

| Scenario | Netlify Setting | _redirects Rule | Result |
|----------|----------------|-----------------|--------|
| Non-WWW request | ❌ Force WWW | ✅ Force WWW | Loop ⚠️ |
| Non-WWW request | ✅ Pass through | ✅ Force WWW | Works ✅ |
| WWW request | ❌ Force non-WWW | ✅ Force WWW | Loop ⚠️ |
| WWW request | ✅ Pass through | ✅ Force WWW | Works ✅ |

**Rule:** Netlify must pass ALL requests to `_redirects` without modification

---

## 🎯 Quick Fix Checklist

1. [ ] Go to Netlify dashboard → Domain management
2. [ ] Check "Primary domain" settings
3. [ ] **DISABLE** any automatic redirect options
4. [ ] Verify no redirect rules in `netlify.toml`
5. [ ] Check DNS provider (Cloudflare, etc.) for redirect rules
6. [ ] Deploy and test with curl commands above
7. [ ] Confirm no redirect loops in browser

---

## 📞 Support

If the issue persists after disabling all Netlify redirect settings:

1. **Check Netlify Deploy Log:**
   ```
   Site settings → Deploys → [Latest deploy] → Deploy log
   ```
   Look for: "Processing redirect rules" or similar

2. **Check Netlify Headers:**
   ```bash
   curl -sI https://www.gappsy.com/ | grep -i netlify
   ```

3. **Contact Netlify Support:**
   Provide:
   - Site ID
   - URL causing loop
   - Screenshot of domain settings
   - Output of curl tests above

---

## ✅ Expected Final State

**Single source of truth:** `public/_redirects`

**All URL variants resolve correctly:**
```
https://gappsy.com/page              → 301 → https://www.gappsy.com/page/
https://www.gappsy.com/page          → 301 → https://www.gappsy.com/page/
https://gappsy.com/page/             → 301 → https://www.gappsy.com/page/
https://www.gappsy.com/page/         → 200 OK (canonical)
```

**Zero redirect loops** ✅
