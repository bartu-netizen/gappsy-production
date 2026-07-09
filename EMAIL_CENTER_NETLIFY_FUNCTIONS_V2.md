# Email Center - Netlify Functions Implementation (v2)

## Overview
Switched from Netlify Edge Functions to stable Netlify Functions for production reliability. The browser only communicates with gappsy.com using same-origin requests.

## Architecture

```
Browser → gappsy.com/wp-admin/api/email-center → Netlify Function → Supabase Edge Function
Browser → gappsy.com/wp-admin/api/email-center-probe → Netlify Function (health check)
```

## Implementation

### 1. Probe Endpoint (Health Check)
**File:** `netlify/functions/email-center-probe.ts`
**Route:** `/wp-admin/api/email-center-probe`

Returns JSON for testing routing:
```json
{
  "ok": true,
  "source": "netlify-function",
  "path": "/wp-admin/api/email-center-probe",
  "method": "GET",
  "hasAdminSecretHeader": true/false
}
```

**CORS Headers:**
- `Access-Control-Allow-Origin`: https://gappsy.com
- `Access-Control-Allow-Methods`: GET, POST, OPTIONS
- `Access-Control-Allow-Headers`: content-type, x-admin-secret

### 2. Email Center Proxy
**File:** `netlify/functions/email-center-proxy.ts`
**Route:** `/wp-admin/api/email-center`

Behavior:
- Accepts POST requests only (plus OPTIONS for preflight)
- Forwards to: `https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1/email-center`
- Passes through the `x-admin-secret` header
- Returns upstream status and body
- Includes proper CORS headers for gappsy.com

**CORS Headers:**
- `Access-Control-Allow-Origin`: https://gappsy.com
- `Access-Control-Allow-Methods`: POST, OPTIONS
- `Access-Control-Allow-Headers`: content-type, x-admin-secret

### 3. Redirect Rules
**File:** `public/_redirects`

```
/wp-admin/api/email-center-probe  /.netlify/functions/email-center-probe  200
/wp-admin/api/email-center  /.netlify/functions/email-center-proxy  200
```

### 4. Email Center UI
**File:** `src/pages/WpAdminEmailCenterPage.tsx`

Updated features:
- `BUILD_ID`: `email-center-netlify-proxy-v2`
- `functionUrl`: `/wp-admin/api/email-center`
- `probeUrl`: `/wp-admin/api/email-center-probe`
- Added "Test Proxy" button that calls the probe endpoint
- Shows probe response in debug panel
- All requests include `x-admin-secret` header from localStorage

### 5. Configuration
**File:** `netlify.toml`

- Removed edge function configuration
- Using standard Netlify Functions via _redirects

## Benefits

1. **Production Stability**: Netlify Functions are more mature and reliable than Edge Functions
2. **No CORS Issues**: All requests are same-origin (gappsy.com → gappsy.com)
3. **Health Check**: Probe endpoint confirms routing is working before making actual API calls
4. **Full Control**: Can handle OPTIONS, customize headers, add logging
5. **Debugging**: Test Proxy button shows routing is functional

## Testing Steps

After deployment to https://gappsy.com:

### Step 1: Test Probe Endpoint
```bash
curl https://gappsy.com/wp-admin/api/email-center-probe
```

Expected response:
```json
{
  "ok": true,
  "source": "netlify-function",
  "path": "/wp-admin/api/email-center-probe",
  "method": "GET",
  "hasAdminSecretHeader": false
}
```

### Step 2: Test in Browser
1. Navigate to: `https://gappsy.com/wp-admin/email-center`
2. Login with admin secret
3. Click "Test Proxy" button - should show JSON response
4. Click "Refresh" - should fetch SMTP status successfully
5. Select a template and click "Preview" - should show email preview
6. Send a test email - should deliver successfully

### Step 3: Verify Network Tab
All requests should show:
- Request URL: `https://gappsy.com/wp-admin/api/email-center`
- Request URL: `https://gappsy.com/wp-admin/api/email-center-probe`
- NO requests to `*.supabase.co` visible in Network tab

## Files Modified

- ✅ `netlify/functions/email-center-probe.ts` (created)
- ✅ `netlify/functions/email-center-proxy.ts` (created)
- ✅ `public/_redirects` (added proxy rules)
- ✅ `netlify.toml` (removed edge function config)
- ✅ `src/pages/WpAdminEmailCenterPage.tsx` (updated UI + test button)
- ✅ `package.json` (added @netlify/functions devDependency)
- ❌ `netlify/edge-functions/email-center-proxy.ts` (removed)

## Build Status

✅ Build successful
✅ All 52 state pages pre-rendered
✅ Build ID: `m8mpqcx7`
✅ Deploy timestamp: `2026-01-17T22:55:27.264Z`
✅ Netlify Functions ready for deployment

## Troubleshooting

If the proxy doesn't work after deployment:

1. **Check probe endpoint first**: Visit `https://gappsy.com/wp-admin/api/email-center-probe` directly
   - Should return JSON, not 404
   - If 404, check Netlify Functions deployment logs

2. **Check Network tab**:
   - Look for the actual request URL
   - Check response status code
   - Look for CORS errors in console

3. **Check Netlify deployment**:
   - Verify Functions were deployed
   - Check Functions logs in Netlify dashboard
   - Ensure `_redirects` file is in dist folder

4. **Test with curl**:
   ```bash
   # Test OPTIONS
   curl -X OPTIONS https://gappsy.com/wp-admin/api/email-center \
     -H "Access-Control-Request-Method: POST" \
     -H "Access-Control-Request-Headers: content-type, x-admin-secret"

   # Test POST (with valid admin secret)
   curl -X POST https://gappsy.com/wp-admin/api/email-center \
     -H "Content-Type: application/json" \
     -H "x-admin-secret: YOUR_SECRET" \
     -d '{"action":"status"}'
   ```

## Next Steps

Deploy to Netlify and verify:
1. Probe endpoint returns JSON
2. Email Center UI loads and shows "NETLIFY FUNCTION PROXY" banner
3. Test Proxy button works
4. All Email Center features work (Refresh, Preview, Send Test)
5. No CORS errors in browser console
6. No requests to *.supabase.co in Network tab
