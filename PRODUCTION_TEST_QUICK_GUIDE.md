# Production Test - Quick Guide

**Test the canonical redirect fix after deployment**

---

## 🎯 Test URL

```
https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

---

## ✅ Expected Behavior

### Browser Test

1. **Open in browser:**
   ```
   https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
   ```

2. **Expected result:**
   - ✅ Page loads immediately
   - ✅ No redirects
   - ✅ No `ERR_TOO_MANY_REDIRECTS` error
   - ✅ URL stays: `https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/`

---

## 🔄 Redirect Test Matrix

| Input URL | Expected Redirects | Final URL |
|-----------|-------------------|-----------|
| `http://gappsy.com/page` | 2 redirects | `https://www.gappsy.com/page/` |
| `http://www.gappsy.com/page` | 1 redirect | `https://www.gappsy.com/page/` |
| `https://gappsy.com/page` | 2 redirects | `https://www.gappsy.com/page/` |
| `https://www.gappsy.com/page` | 1 redirect | `https://www.gappsy.com/page/` |
| `https://gappsy.com/page/` | 1 redirect | `https://www.gappsy.com/page/` |
| `https://www.gappsy.com/page/` | **0 redirects** ⚡ | `https://www.gappsy.com/page/` |

---

## 🧪 Manual Tests

### Test 1: Canonical URL (Direct Hit)

```bash
curl -I https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

**Expected:**
```
HTTP/2 200 OK
```
✅ No Location header (no redirect)

### Test 2: Non-www

```bash
curl -I https://gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

**Expected:**
```
HTTP/2 301 Moved Permanently
Location: https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

### Test 3: Missing Trailing Slash

```bash
curl -I https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states
```

**Expected:**
```
HTTP/2 301 Moved Permanently
Location: https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

### Test 4: Both Issues (Non-www + No Slash)

```bash
curl -I https://gappsy.com/marketing-agencies-in-new-jersey-united-states
```

**Expected:**
```
HTTP/2 301 Moved Permanently
Location: https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states

(followed by another redirect to add trailing slash)
```

---

## 🔍 SEO Verification

### View Page Source

```
https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/
```

**Check for:**

```html
<link rel="canonical" href="https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" />
<meta property="og:url" content="https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/" />
```

✅ Both must use: `https://www.gappsy.com/...` with trailing slash

---

## ❌ What Would Indicate a Problem

| Issue | Symptom |
|-------|---------|
| Redirect loop | `ERR_TOO_MANY_REDIRECTS` in browser |
| Wrong canonical | `<link rel="canonical" href="https://gappsy.com/...` (no www) |
| Missing slash | `<link rel="canonical" href="...united-states">` (no slash) |
| Multiple redirects on canonical | `curl -I` shows 301 on canonical URL |

---

## ✅ Success Criteria

1. ✅ `https://www.gappsy.com/.../` loads without redirects (200 OK)
2. ✅ All non-canonical variants redirect to canonical form
3. ✅ No `ERR_TOO_MANY_REDIRECTS` errors
4. ✅ Canonical and og:url tags match final URL exactly
5. ✅ All 52 state pages accessible

---

## 🚀 Quick One-Command Test

```bash
# Test all 4 URL variants
for url in \
  "https://gappsy.com/marketing-agencies-in-new-jersey-united-states" \
  "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states" \
  "https://gappsy.com/marketing-agencies-in-new-jersey-united-states/" \
  "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/"
do
  echo "Testing: $url"
  curl -sI "$url" | grep -E '(HTTP|Location)'
  echo "---"
done
```

**Expected:**
- First 3 variants: Show `301` with `Location:` header
- Last variant: Show `200` with no `Location:` header

---

## 📞 Troubleshooting

### If you see redirect loops:

1. Check Netlify deploy log for errors
2. Verify `public/_redirects` was deployed correctly
3. Check browser dev tools Network tab for redirect chain
4. Clear browser cache and try again
5. Test with `curl -I` to see raw headers

### If canonical URLs are wrong:

1. Verify build ID matches deployment: `https://www.gappsy.com/build-id.txt`
2. Check if pre-rendered HTML was included in deployment
3. Verify state page HTML contains correct canonical tags

---

## Build Info

**Build ID:** `e5jnx0ay`
**Date:** 2026-01-21
**Status:** Ready for production testing
