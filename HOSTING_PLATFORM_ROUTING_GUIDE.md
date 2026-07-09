# Hosting Platform Routing Configuration

## Current Setup (Netlify-style)

The project uses `public/_redirects` file with this pattern:

```
/marketing-agencies-in-*-united-states  /marketing-agencies-in-:splat-united-states.html  200
/*    /index.html   200
```

**How it works:**
- Request to `/marketing-agencies-in-alabama-united-states`
- Matches wildcard pattern `*`
- Serves `/marketing-agencies-in-alabama-united-states.html`
- Returns 200 (not redirect, just internal rewrite)

---

## Platform-Specific Configurations

If the `_redirects` file isn't working on your hosting platform, use the appropriate config below:

---

### Netlify (Current Platform)

**Option 1: _redirects file (already configured)**
```
# public/_redirects
/marketing-agencies-in-*-united-states  /marketing-agencies-in-:splat-united-states.html  200
/*    /index.html   200
```

**Option 2: netlify.toml**
```toml
# netlify.toml
[[redirects]]
  from = "/marketing-agencies-in-*-united-states"
  to = "/marketing-agencies-in-:splat-united-states.html"
  status = 200

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

**Verification:**
- Check deploy logs for "Redirect rules processed: 2"
- Test with curl: `curl -I https://yoursite.com/marketing-agencies-in-alabama-united-states`
- Should return 200, not 301/302

---

### Vercel

**Create:** `vercel.json` in project root

```json
{
  "rewrites": [
    {
      "source": "/marketing-agencies-in-(.*)-united-states",
      "destination": "/marketing-agencies-in-$1-united-states.html"
    },
    {
      "source": "/(.*)",
      "destination": "/index.html"
    }
  ]
}
```

**Note:** Vercel uses regex, not wildcards like Netlify

---

### Cloudflare Pages

**Uses:** `_redirects` file (same syntax as Netlify)

```
# public/_redirects
/marketing-agencies-in-*-united-states  /marketing-agencies-in-:splat-united-states.html  200
/*    /index.html   200
```

**Alternative:** `_headers` file for additional control

```
# public/_headers
/marketing-agencies-in-*-united-states.html
  Cache-Control: public, max-age=3600
```

---

### AWS Amplify

**Create:** `public/redirects.json`

```json
[
  {
    "source": "/marketing-agencies-in-<state>-united-states",
    "target": "/marketing-agencies-in-<state>-united-states.html",
    "status": "200",
    "condition": null
  },
  {
    "source": "/<*>",
    "target": "/index.html",
    "status": "200",
    "condition": null
  }
]
```

---

### Firebase Hosting

**Update:** `firebase.json`

```json
{
  "hosting": {
    "public": "dist",
    "rewrites": [
      {
        "source": "/marketing-agencies-in-*-united-states",
        "destination": "/marketing-agencies-in-:splat-united-states.html"
      },
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

---

### Azure Static Web Apps

**Create:** `staticwebapp.config.json`

```json
{
  "routes": [
    {
      "route": "/marketing-agencies-in-*-united-states",
      "rewrite": "/marketing-agencies-in-{state}-united-states.html"
    }
  ],
  "navigationFallback": {
    "rewrite": "/index.html"
  }
}
```

---

### GitHub Pages

**Note:** GitHub Pages doesn't support server-side redirects or rewrites.

**Workaround:** Use a 404.html fallback with client-side routing detection.

---

### Generic Apache (.htaccess)

If hosting on Apache server:

```apache
# public/.htaccess
RewriteEngine On

# Serve pre-rendered state pages
RewriteRule ^marketing-agencies-in-([a-z-]+)-united-states$ marketing-agencies-in-$1-united-states.html [L]

# SPA fallback
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.html [L]
```

---

### Generic Nginx

If hosting on Nginx:

```nginx
# nginx.conf
location ~ ^/marketing-agencies-in-([a-z-]+)-united-states$ {
    try_files /marketing-agencies-in-$1-united-states.html =404;
}

location / {
    try_files $uri $uri/ /index.html;
}
```

---

## Debugging Routing Issues

### Test 1: Check if flat file is accessible

```bash
curl -I https://yoursite.com/marketing-agencies-in-alabama-united-states.html
```

**Expected:** `200 OK`

**If 404:** Flat file wasn't deployed or is in wrong location

---

### Test 2: Check if route serves flat file

```bash
curl -s https://yoursite.com/marketing-agencies-in-alabama-united-states | grep "<title>"
```

**Expected:**
```html
<title>Top 25 Marketing Agencies in Alabama | 2025 Rankings</title>
```

**If generic title:** Routing isn't working, falling back to index.html

---

### Test 3: Check response headers

```bash
curl -I https://yoursite.com/marketing-agencies-in-alabama-united-states
```

**Look for:**
- `Content-Type: text/html`
- `200 OK` (not 301 or 302)
- `Content-Length` should be ~3400 bytes (not ~1600 for index.html)

---

### Test 4: Check actual content length

```bash
curl -s https://yoursite.com/marketing-agencies-in-alabama-united-states | wc -c
```

**Expected:** ~3400 bytes (pre-rendered Alabama page)
**If ~1600 bytes:** Generic index.html being served

---

## Common Issues

### Issue: 404 on state routes

**Cause:** Routing config not applied or flat files not deployed

**Solution:**
1. Verify build logs show pre-rendering success
2. Check that flat `.html` files exist in build output
3. Verify `_redirects` file is copied to dist/
4. Check hosting platform docs for redirect syntax

---

### Issue: 200 but wrong content (generic index.html)

**Cause:** Routing pattern not matching or falling through to fallback

**Solution:**
1. Check wildcard/regex syntax for your platform
2. Test pattern with platform's routing tester if available
3. Try more explicit pattern (list each state individually)
4. Check order of rules (state routes must come before `/*`)

---

### Issue: Content correct but social scrapers show old data

**Cause:** Social platform cache, not routing issue

**Solution:**
1. Verify "View Source" shows correct HTML first
2. Use Facebook Debugger to force re-scrape
3. Wait 24-48 hours for cache expiration
4. This is expected behavior, not a bug

---

### Issue: Routes work but assets 404

**Cause:** Asset routing conflicting with state routes

**Solution:**
1. Ensure `/assets/*` routes aren't affected
2. Add explicit rule for assets before state routes:
   ```
   /assets/*  /assets/:splat  200
   /marketing-agencies-in-*-united-states  /marketing-agencies-in-:splat-united-states.html  200
   /*  /index.html  200
   ```

---

## Fallback: Manual State List

If wildcard routing is problematic on your platform, use explicit rules:

```
# Explicit rules (no wildcards)
/marketing-agencies-in-alabama-united-states       /marketing-agencies-in-alabama-united-states.html       200
/marketing-agencies-in-new-jersey-united-states    /marketing-agencies-in-new-jersey-united-states.html    200
/marketing-agencies-in-california-united-states    /marketing-agencies-in-california-united-states.html    200
# ... add one line per state

# Fallback
/*  /index.html  200
```

**Pros:**
- Works on all platforms
- More predictable behavior
- Easier to debug

**Cons:**
- Must update config when adding new states
- Longer config file

---

## Recommended Order of Operations

1. **Deploy with current `_redirects` config**
2. **Test with "View Source" method**
3. **If not working:**
   - Check platform documentation
   - Try platform-specific config from this guide
   - Test with curl commands
   - Check deploy logs for errors
4. **If still not working:**
   - Use explicit rules (no wildcards)
   - Contact platform support with:
     - Build logs showing flat files created
     - Current routing config
     - Curl test results

---

## Success Criteria

Routing is configured correctly when:

✅ `curl -s URL | grep "<title>"` returns state-specific title
✅ "View Source" shows state-specific SEO
✅ Content-Length header is ~3400 bytes
✅ Response status is 200 (not 301/302)
✅ No JavaScript required for SEO tags
✅ Facebook/Twitter scrapers see correct preview
✅ Assets still load correctly
✅ SPA routing works for users

---

## Platform Support Matrix

| Platform | Wildcards | Regex | Config File | Notes |
|----------|-----------|-------|-------------|-------|
| Netlify | ✅ | ❌ | `_redirects` or `netlify.toml` | Uses `:splat` syntax |
| Vercel | ❌ | ✅ | `vercel.json` | Uses `$1` syntax |
| Cloudflare Pages | ✅ | ❌ | `_redirects` | Same as Netlify |
| AWS Amplify | ✅ | ❌ | `redirects.json` | Uses `<state>` syntax |
| Firebase | ✅ | ❌ | `firebase.json` | Uses `:splat` syntax |
| Azure | ✅ | ❌ | `staticwebapp.config.json` | Uses `{state}` syntax |
| GitHub Pages | ❌ | ❌ | N/A | No server-side routing |
| Apache | ❌ | ✅ | `.htaccess` | Uses `$1` syntax |
| Nginx | ❌ | ✅ | `nginx.conf` | Uses `$1` syntax |

---

## Quick Reference Commands

```bash
# Check if flat file exists
curl -I https://yoursite.com/marketing-agencies-in-alabama-united-states.html

# Get title tag from route
curl -s https://yoursite.com/marketing-agencies-in-alabama-united-states | grep "<title>"

# Check content length
curl -s https://yoursite.com/marketing-agencies-in-alabama-united-states | wc -c

# Get all headers
curl -I https://yoursite.com/marketing-agencies-in-alabama-united-states

# Save full HTML for inspection
curl -s https://yoursite.com/marketing-agencies-in-alabama-united-states > test.html
```

---

## Need Help?

If routing still isn't working after trying platform-specific configs:

1. Check hosting platform's documentation for:
   - Redirect/rewrite rules
   - Static site hosting configuration
   - SPA routing support

2. Share these details with platform support:
   - Build logs showing flat files created
   - Current routing configuration
   - Output of curl tests
   - Screenshots of "View Source"

3. Consider switching to a platform that supports `_redirects` files (Netlify, Cloudflare Pages)
