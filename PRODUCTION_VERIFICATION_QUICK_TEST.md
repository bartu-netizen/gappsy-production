# Production Verification - Quick Test

## After Deployment, Run These 3 Tests

### Test 1: Build ID File
```bash
curl -I https://gappsy.com/build-id.txt
```
**Expected:** HTTP 200, Content-Type: text/plain

```bash
curl https://gappsy.com/build-id.txt
```
**Expected:** Shows timestamp like "DEPLOY: 2026-01-15T18:09:05.085Z"

### Test 2: Alabama Prerendered Page
```bash
curl -s https://gappsy.com/marketing-agencies-in-alabama-united-states/ | grep -E "(canonical|og:url|og:image)"
```
**Expected Output:**
```html
<link rel="canonical" href="https://gappsy.com/marketing-agencies-in-alabama-united-states/" />
<meta property="og:url" content="https://gappsy.com/marketing-agencies-in-alabama-united-states/" />
<meta property="og:image" content="https://gappsy.com/og/marketing-agencies-in-alabama-united-states.svg" />
```

### Test 3: Check for bolt.host (MUST BE ZERO)
```bash
curl -s https://gappsy.com/marketing-agencies-in-alabama-united-states/ | grep -c "bolt.host"
```
**Expected Output:** `0`

## Visual Verification (Browser)

1. Open: https://gappsy.com/marketing-agencies-in-alabama-united-states/
2. Right-click → View Page Source
3. Verify in `<head>`:
   - `<title>Top 25 Marketing Agencies in Alabama (2026) | Gappsy</title>`
   - `<link rel="canonical" href="https://gappsy.com/marketing-agencies-in-alabama-united-states/" />`
   - `<meta property="og:url" content="https://gappsy.com/marketing-agencies-in-alabama-united-states/" />`
   - NO references to `gappsy.bolt.host`

## If Tests Pass
✅ Deployment is successful
✅ SEO is correctly configured
✅ Google will index the correct canonical URLs

## If Tests Fail
❌ Check Netlify build logs for errors
❌ Verify build command is `npm run build` not `vite build`
❌ Verify publish directory is `dist`
❌ Trigger a new deployment
