# Email Center Post-Deploy Test Guide

## Quick Test (30 seconds)

After deploying, run this single command:

```bash
curl https://gappsy.com/wp-admin/api/email-center-upstream-check
```

### Expected Result (SUCCESS):
```json
{
  "ok": true,
  "stage": "upstream_reachable",
  "upstreamUrl": "https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1/email-center",
  "upstreamStatus": 401,
  "message": "Upstream is reachable (returned 401)"
}
```

**Note:** `upstreamStatus: 401` is correct. It means Supabase is responding (authentication required).

### If You See This (FAILURE):
```json
{
  "ok": false,
  "stage": "upstream_fetch_failed",
  "error": "..."
}
```

→ Check the `errorCode` and `hint` fields for specific troubleshooting.

## Full UI Test (2 minutes)

### Step 1: Login
1. Visit: https://gappsy.com/wp-admin/email-center
2. Enter admin secret
3. Click "Login"

### Step 2: Check Upstream
1. Click "Check Upstream" button (bottom of page)
2. Should see green box: "Upstream is reachable (returned 401)"

### Step 3: Test SMTP Status
1. Click "Refresh" button (top section)
2. Should see SMTP credentials table populate
3. No "upstream_fetch_failed" error

### Step 4: Test Preview
1. Select template from dropdown (e.g., "availability_request_client")
2. Click "Preview" button
3. Should see email preview display

### Step 5: Test Send
1. Enter your email in "Test Email" field
2. Click "Send Test Email" button
3. Check your inbox
4. Should receive test email

## Expected API Responses

### Upstream Check (Diagnostic)
**Endpoint:** `GET /wp-admin/api/email-center-upstream-check`

**Success:**
```json
{
  "ok": true,
  "stage": "upstream_reachable",
  "upstreamStatus": 401
}
```

### Email Center (Main API)
**Endpoint:** `POST /wp-admin/api/email-center`

**Without Admin Secret:**
```json
{
  "ok": false,
  "stage": "upstream_response",
  "upstreamStatus": 401,
  "data": {
    "ok": false,
    "error": "Unauthorized"
  }
}
```

**With Valid Admin Secret:**
```json
{
  "ok": true,
  "stage": "upstream_response",
  "upstreamStatus": 200,
  "data": {
    "ok": true,
    "action": "...",
    "result": {...}
  }
}
```

## Troubleshooting

### Issue: "upstream_fetch_failed"
**Check:**
1. Supabase Edge Function deployed?
   - Visit: Supabase Dashboard → Edge Functions
   - Verify "email-center" function exists
2. Supabase project reachable?
   - Test: `curl https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1/email-center`
3. Netlify function deployed?
   - Check: Netlify Dashboard → Functions
   - Verify "email-center-proxy" appears

### Issue: "config_error"
This should NOT appear anymore. If you see it:
- The old version is still deployed
- Clear Netlify cache and redeploy

### Issue: CORS Error in Browser
**Check:**
1. Are you testing from https://gappsy.com?
   - CORS only allows https://gappsy.com origin
2. Check browser console for specific CORS error
3. Verify request includes correct headers

### Issue: 401 Unauthorized
**Normal for:**
- Upstream check (proves connection works)
- API calls without admin secret

**Problem if:**
- You're sending valid admin secret but still getting 401
- Check admin_secrets table in Supabase
- Verify secret matches

### Issue: 404 Not Found
**Check:**
1. URL path correct?
   - Should be: `/wp-admin/api/email-center`
2. Redirects deployed?
   - Check `_redirects` file in deployment
3. Netlify function deployed?
   - Check function logs

## Success Checklist

After deploy, verify:
- ✅ Upstream check returns `ok: true`
- ✅ Email Center login works
- ✅ "Check Upstream" shows green
- ✅ "Refresh" loads SMTP status
- ✅ "Preview" displays email
- ✅ "Send" delivers email
- ✅ No console errors
- ✅ No "upstream_fetch_failed" errors

## What Changed in This Deploy

**Before:**
- Functions required `SUPABASE_FUNCTIONS_BASE_URL` env var
- Failed with "config_error" because env var missing
- Couldn't be configured in Bolt-managed Netlify

**After:**
- Functions use hardcoded URL
- No environment variables needed
- Works immediately after deploy
- Zero configuration required

## Build Details

**Build ID:** `7vfrrsnj`
**Timestamp:** `2026-01-17T23:23:50.515Z`

**Files Changed:**
- `netlify/functions/email-center-proxy.ts`
- `netlify/functions/email-center-upstream-check.ts`

**Hardcoded URL:**
```
https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1
```

## Quick Reference

| Test | Command | Expected |
|------|---------|----------|
| Upstream Check | `curl https://gappsy.com/wp-admin/api/email-center-upstream-check` | `ok: true, upstreamStatus: 401` |
| API (No Auth) | `curl -X POST https://gappsy.com/wp-admin/api/email-center` | `upstreamStatus: 401` |
| UI | Visit https://gappsy.com/wp-admin/email-center | Login page loads |

## Next Steps

1. Deploy the build
2. Run the quick test curl command
3. If `ok: true`, you're done!
4. If `ok: false`, check the error details and troubleshoot

The Email Center should now work perfectly without any configuration.
