# Email Center - Quick Test Guide

## Immediate Tests (After Deploy)

### Test 1: Upstream Check Endpoint (30 seconds)
```bash
curl https://gappsy.com/wp-admin/api/email-center-upstream-check
```

**What to look for:**
- ✅ Returns JSON (not 404 or HTML)
- ✅ Has `ok` field (true or false)
- ✅ Has `upstreamUrl` field showing Supabase URL

**If `ok: true`:**
- Upstream is reachable
- Check `upstreamStatus` (should be 401 = auth required, which is good)
- Email Center should work now

**If `ok: false`:**
- Read the `hint` field - it tells you exactly what's wrong
- Check `errorCode` (ENOTFOUND, ECONNREFUSED, ETIMEDOUT)
- Follow troubleshooting steps in the response

### Test 2: UI Upstream Check (1 minute)
1. Visit: `https://gappsy.com/wp-admin/email-center`
2. Login with admin secret
3. Look for the debug panel (green box at top)
4. Click **"Check Upstream"** button (purple button)
5. Review the result:
   - **Green box** = Upstream reachable ✅
   - **Red box** = Upstream unreachable ❌ (read the hint)

### Test 3: Full Email Center Flow (2 minutes)
If upstream check shows green:
1. Click **"Refresh"** button
2. Should see SMTP status with green checkmarks
3. Select a template from dropdown
4. Click **"Preview"**
5. Should see email HTML preview
6. Enter test email
7. Click **"Send Test Email"**
8. Should deliver successfully

## Common Issues & Solutions

### Issue: "ok: false" with ENOTFOUND
**Problem:** DNS can't resolve the Supabase hostname  
**Solution:** 
1. Check if Supabase URL is correct in the function
2. Try visiting Supabase dashboard to verify it's up
3. Check for typos in URL

### Issue: "ok: false" with ECONNREFUSED
**Problem:** Supabase function not deployed or wrong endpoint  
**Solution:**
1. Verify email-center function is deployed to Supabase
2. Test directly: `curl -X POST https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1/email-center -H "Content-Type: application/json" -d '{"action":"status"}'`
3. Should get 401 auth error (proves it exists)

### Issue: "ok: false" with ETIMEDOUT or AbortError
**Problem:** Network timeout (firewall or service down)  
**Solution:**
1. Check Supabase status page
2. Verify no firewall blocking Netlify → Supabase traffic
3. Try again in a few minutes

### Issue: "ok: true" but Email Center still fails
**Problem:** Upstream is reachable but has other issues  
**Solution:**
1. Check the `upstreamStatus` in result
2. If 401 = needs auth (normal, click Refresh with admin secret)
3. If 500 = Supabase function has internal error
4. Check Supabase function logs

## Debugging Workflow

```
1. Test Upstream Check
   ↓
2. If OK → Test Proxy
   ↓
3. If OK → Test Refresh
   ↓
4. If OK → Email Center works!

If any step fails:
   ↓
Check the error message
   ↓
Follow the hint provided
   ↓
Retry from step 1
```

## Success Indicators

After fixing upstream:
- ✅ Upstream check returns `ok: true`
- ✅ Upstream status is 401 (auth required)
- ✅ Test Proxy shows routing works
- ✅ Refresh loads SMTP status
- ✅ Preview shows email templates
- ✅ Send test email delivers successfully
- ✅ No "Failed to fetch" errors in console

## Environment Variable (If Needed)

Only if the default URL is wrong:

1. Netlify Dashboard → Site Settings → Environment Variables
2. Add: `SUPABASE_FUNCTIONS_BASE_URL`
3. Value: `https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1`
4. Redeploy site
5. Test upstream check again

The diagnostic will tell you if this var is set: `envVarSet: true/false`

## Quick Reference

| Test | URL | Expected Result |
|------|-----|-----------------|
| Upstream Check | `/wp-admin/api/email-center-upstream-check` | `ok: true, upstreamStatus: 401` |
| Proxy Test | Click "Test Proxy" | `ok: true, source: netlify-function` |
| SMTP Status | Click "Refresh" | Green checkmarks |
| Preview | Select template → Preview | HTML content |
| Send Email | Enter email → Send | Success message |

## Next Steps After Testing

1. ✅ Verify upstream check works
2. ✅ Verify Email Center loads
3. ✅ Test all features work
4. ✅ Monitor for any errors
5. ✅ If issues persist, check Netlify Functions logs

## Direct Supabase Test

Verify the Supabase function itself works:

```bash
curl -X POST https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1/email-center \
  -H "Content-Type: application/json" \
  -d '{"action":"status"}'
```

**Expected Response:**
```json
{
  "error": "Admin secret required"
}
```

This 401 error is GOOD - it means the function exists and is working.

If you get:
- 404 → Function not deployed
- Network error → Supabase down or URL wrong
- 500 → Function has internal error

## Support Resources

- Netlify Functions logs: Netlify Dashboard → Functions → email-center-proxy
- Supabase logs: Supabase Dashboard → Edge Functions → email-center
- Browser console: F12 → Console tab
- Network tab: F12 → Network tab (see actual requests/responses)
