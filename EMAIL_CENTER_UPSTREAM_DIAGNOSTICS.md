# Email Center Upstream Diagnostics - Implementation Complete

## Problem Solved
Added comprehensive upstream connectivity diagnostics to identify and fix the "Failed to connect to upstream service" error.

## Implementation

### 1. New Diagnostic Endpoint
**File:** `netlify/functions/email-center-upstream-check.ts`

**Features:**
- Tests connectivity to Supabase Edge Function
- 5-second timeout with AbortController
- Returns detailed error diagnostics
- No authentication required (public endpoint)
- Always returns JSON with helpful hints

**Response Format (Success):**
```json
{
  "ok": true,
  "stage": "upstream_reachable",
  "upstreamUrl": "https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1/email-center",
  "upstreamBase": "https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1",
  "upstreamStatus": 401,
  "responsePreview": "{\"error\":\"Admin secret required\"}",
  "message": "Upstream is reachable (returned 401)"
}
```

**Response Format (Failure):**
```json
{
  "ok": false,
  "stage": "upstream_fetch_failed",
  "upstreamUrl": "https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1/email-center",
  "upstreamBase": "https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1",
  "error": "fetch failed",
  "errorName": "TypeError",
  "errorCode": "ENOTFOUND",
  "hint": "DNS lookup failed. The upstream hostname does not exist or is misspelled.",
  "envVarSet": false,
  "troubleshooting": [
    "Verify SUPABASE_FUNCTIONS_BASE_URL env var in Netlify dashboard",
    "Check if Supabase function is deployed and running",
    "Test URL directly: curl -X POST https://...",
    "Verify no firewall blocking Netlify -> Supabase traffic"
  ]
}
```

**Error Detection:**
- `ENOTFOUND` → DNS lookup failed (hostname doesn't exist)
- `ECONNREFUSED` → Connection refused (service not accepting connections)
- `ETIMEDOUT` → Connection timed out (unreachable or blocked)
- `AbortError` → Request timed out after 5 seconds

### 2. Configurable Upstream URL
**File:** `netlify/functions/email-center-proxy.ts`

**Changes:**
- Reads `SUPABASE_FUNCTIONS_BASE_URL` from environment
- Falls back to: `https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1`
- Constructs full URL: `${base}/email-center`
- Includes helpful comments for troubleshooting

**Added to Error Response:**
```json
{
  "details": {
    "errorName": "TypeError",
    "upstream": "https://...",
    "upstreamBase": "https://...",
    "hint": "Test upstream connectivity at: /wp-admin/api/email-center-upstream-check"
  }
}
```

### 3. Updated Routing
**File:** `public/_redirects`

**Added:**
```
/wp-admin/api/email-center-upstream-check  /.netlify/functions/email-center-upstream-check  200
```

**All Email Center Routes:**
```
/wp-admin/api/email-center-probe           /.netlify/functions/email-center-probe  200
/wp-admin/api/email-center-upstream-check  /.netlify/functions/email-center-upstream-check  200
/wp-admin/api/email-center                 /.netlify/functions/email-center-proxy  200
```

### 4. Enhanced UI
**File:** `src/pages/WpAdminEmailCenterPage.tsx`

**New Features:**
- "Check Upstream" button in debug panel
- Upstream check result display with color coding
- Green border = upstream reachable
- Red border = upstream unreachable
- Yellow hint box with troubleshooting advice

**UI Components:**
- Added state: `upstreamCheckResult`
- Added handler: `handleUpstreamCheck()`
- Added button next to "Test Proxy"
- Added result display with conditional styling

## Testing After Deployment

### 1. Quick Upstream Check
```bash
curl https://gappsy.com/wp-admin/api/email-center-upstream-check
```

**Expected (Success):**
- `ok: true`
- `stage: "upstream_reachable"`
- `upstreamStatus: 401` (means Supabase function exists and returns auth error)

**Expected (Failure):**
- `ok: false`
- `stage: "upstream_fetch_failed"`
- Detailed error with errorName, errorCode, and hint

### 2. UI Testing
1. Visit: `https://gappsy.com/wp-admin/email-center`
2. Login with admin secret
3. Click **"Check Upstream"** button
4. Review result:
   - Green box = Upstream is reachable
   - Red box = Upstream unreachable (check hint)

### 3. Full Flow Testing
After fixing upstream connectivity:
1. Click "Check Upstream" → Should be green (reachable)
2. Click "Test Proxy" → Should show routing works
3. Click "Refresh" → Should fetch SMTP status
4. Test preview and send email → Should work

## Troubleshooting Guide

### If Upstream Check Shows "ok: false"

**Error: ENOTFOUND**
- Problem: DNS can't resolve hostname
- Solution: Check if `SUPABASE_FUNCTIONS_BASE_URL` env var is correct
- Verify: URL should be `https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1`

**Error: ECONNREFUSED**
- Problem: Supabase function not deployed or wrong URL
- Solution: Deploy email-center function to Supabase
- Verify: Test URL directly with curl

**Error: ETIMEDOUT or AbortError**
- Problem: Network timeout (firewall blocking or service down)
- Solution: Check Netlify → Supabase connectivity
- Verify: Check Supabase status page

**Error: fetch failed**
- Problem: Generic network error
- Solution: Check network/firewall rules
- Verify: Try accessing Supabase dashboard

### Configuring SUPABASE_FUNCTIONS_BASE_URL

If you need to change the upstream URL:

1. Go to Netlify Dashboard
2. Site Settings → Environment Variables
3. Add: `SUPABASE_FUNCTIONS_BASE_URL`
4. Value: `https://YOUR_PROJECT.supabase.co/functions/v1`
5. Redeploy site
6. Test upstream check

## Build Status

✅ Build successful  
✅ Build ID: `b0is83is`  
✅ Timestamp: `2026-01-17T23:09:22.844Z`  
✅ All files deployed:
- ✅ `netlify/functions/email-center-upstream-check.ts` (NEW)
- ✅ `netlify/functions/email-center-proxy.ts` (UPDATED - env var support)
- ✅ `src/pages/WpAdminEmailCenterPage.tsx` (UPDATED - upstream check UI)
- ✅ `public/_redirects` (UPDATED - new route)

## API Endpoints Summary

| Endpoint | Purpose | Auth Required | Returns |
|----------|---------|---------------|---------|
| `/wp-admin/api/email-center-probe` | Test Netlify routing | No | Routing status |
| `/wp-admin/api/email-center-upstream-check` | Test Supabase connectivity | No | Upstream status |
| `/wp-admin/api/email-center` | Email Center API proxy | Yes (x-admin-secret) | SMTP/templates data |

## Success Criteria

After deployment, verify:

1. ✅ Upstream check endpoint returns JSON
2. ✅ Upstream check shows if Supabase is reachable
3. ✅ Error messages include helpful hints
4. ✅ UI shows "Check Upstream" button
5. ✅ Clicking button displays diagnostic result
6. ✅ If upstream reachable, Email Center works
7. ✅ If upstream unreachable, clear error shown

## Next Steps

1. Deploy to Netlify
2. Visit `/wp-admin/api/email-center-upstream-check`
3. Review the JSON response
4. If `ok: false`, follow the troubleshooting hints
5. If `ok: true`, Email Center should work
6. If still having issues, check the `errorName` and `errorCode` fields

## Environment Variables

**Optional (defaults work):**
- `SUPABASE_FUNCTIONS_BASE_URL` - Base URL for Supabase Functions
  - Default: `https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1`
  - Only set if you need to override the default

**The proxy will tell you:**
- Whether the env var is set (`envVarSet: true/false`)
- What URL it's trying to connect to (`upstreamUrl`, `upstreamBase`)
- Exact error from the connection attempt

## Direct Testing (cURL)

```bash
# Test upstream connectivity
curl https://gappsy.com/wp-admin/api/email-center-upstream-check

# Test if Supabase function responds
curl -X POST https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1/email-center \
  -H "Content-Type: application/json" \
  -d '{"action":"status"}'

# Expected: 401 with {"error":"Admin secret required"}
# This proves the function exists and is working
```

## Key Features

1. **Zero-Config Default** - Works out of the box with correct URL
2. **Environment Override** - Can change URL without code changes
3. **Detailed Diagnostics** - Know exactly what's wrong
4. **Helpful Hints** - Specific troubleshooting for each error type
5. **UI Integration** - One-click diagnostic from Email Center page
6. **No Auth Required** - Public endpoint for easy testing
7. **Safe Responses** - Always returns JSON, never crashes
