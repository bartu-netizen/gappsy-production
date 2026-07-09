# Quick Fix: Netlify Domain Redirects (5 minutes)

## The Problem

`ERR_TOO_MANY_REDIRECTS` because Netlify and `_redirects` file are both trying to control URL canonicalization.

## The Fix

**Disable Netlify's automatic domain redirect setting.**

---

## Step-by-Step Instructions

### 1. Access Netlify Dashboard

```
https://app.netlify.com/
```

Login and select your site: **gappsy.com**

### 2. Navigate to Domain Settings

```
Site Settings → Domain Management → Domains
```

### 3. Find the Conflicting Setting

Look for one of these:

**Option A: "Primary Domain" Badge**
```
Custom domains:
  • www.gappsy.com
  • gappsy.com (Primary) ← Click this
```

**Option B: Domain Options Menu**
```
Click ⋮ (three dots) next to domain name
→ "Set as primary domain"
```

### 4. Disable Auto-Redirect

You'll see a checkbox:

```
☑ Redirect automatically to primary domain
```

**UNCHECK this box** ← This is the fix!

### 5. Alternative: Remove Primary Domain

If you can't find the checkbox, simply:

```
Remove "primary domain" designation from ALL domains
```

Let `_redirects` file handle everything.

### 6. Save

Click **Save** or **Update**

Changes take effect in 1-2 minutes.

---

## Test the Fix

### Quick Browser Test

Open: `https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/`

**Expected:**
- ✅ Page loads immediately
- ✅ No redirect
- ✅ No `ERR_TOO_MANY_REDIRECTS`

### Command Line Test

```bash
curl -sI https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ | grep HTTP
```

**Expected:** `HTTP/2 200` (not 301)

### Full Diagnostic

```bash
./diagnose-redirect-loop.sh
```

---

## What This Does

**Before:**
```
Netlify: Force non-www
↓
_redirects: Force www
↓
Netlify: Force non-www
↓
... LOOP
```

**After:**
```
Netlify: Pass through (do nothing)
↓
_redirects: Force www
↓
Done ✅
```

---

## If Still Not Working

1. **Wait 2-3 minutes** for Netlify propagation
2. **Clear browser cache** (Ctrl+Shift+R)
3. **Check DNS provider** (Cloudflare page rules, etc.)
4. **Verify setting saved** (check Netlify dashboard again)
5. **Run diagnostic script** to pinpoint issue

---

## Success Criteria

| URL | Expected Result |
|-----|-----------------|
| `https://www.gappsy.com/page/` | 200 OK (no redirect) |
| `https://gappsy.com/page` | 301 → canonical |
| `https://www.gappsy.com/page` | 301 → canonical |

All variants should eventually reach: `https://www.gappsy.com/<path>/`

---

## Why This Happened

Netlify automatically offers to redirect to a "primary domain" when you add multiple domains (www and non-www). If you enable this, it conflicts with custom redirect rules in `_redirects` file.

**Solution:** Only use ONE system for redirects.
**Best Practice:** Use `_redirects` file, disable Netlify auto-redirects.

---

## Documentation

- Full details: `NETLIFY_REDIRECT_CONFLICT_FIX.md`
- Executive summary: `REDIRECT_LOOP_SOLUTION.md`
- Diagnostic tool: `diagnose-redirect-loop.sh`
