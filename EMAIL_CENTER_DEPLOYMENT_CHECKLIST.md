# Email Center Deployment Checklist

## Pre-Deployment Verification

### Files Created ✅
- [x] `netlify/functions/email-center-probe.ts` - Health check endpoint
- [x] `netlify/functions/email-center-proxy.ts` - Main proxy endpoint

### Files Modified ✅
- [x] `public/_redirects` - Added proxy routes (lines 325-326)
- [x] `netlify.toml` - Removed edge function config
- [x] `src/pages/WpAdminEmailCenterPage.tsx` - Updated to use Netlify Functions
- [x] `package.json` - Added @netlify/functions devDependency

### Files Removed ✅
- [x] `netlify/edge-functions/email-center-proxy.ts` - Old edge function removed

### Build Status ✅
- [x] Build successful: `npm run build`
- [x] Build ID: `m8mpqcx7`
- [x] Deploy timestamp: `2026-01-17T22:55:27.264Z`
- [x] All 52 state pages pre-rendered

## Post-Deployment Testing

### Step 1: Test Probe Endpoint (Critical)
```bash
curl https://gappsy.com/wp-admin/api/email-center-probe
```

**Expected Response:**
```json
{
  "ok": true,
  "source": "netlify-function",
  "path": "/wp-admin/api/email-center-probe",
  "method": "GET",
  "hasAdminSecretHeader": false
}
```

**If this fails:**
- Check Netlify Functions deployment logs
- Verify `_redirects` file is in the deployed dist folder
- Check Netlify Functions tab in dashboard

### Step 2: Test Email Center UI
1. Navigate to: `https://gappsy.com/wp-admin/email-center`
2. Login with admin secret
3. Verify debug panel shows:
   - **NETLIFY FUNCTION PROXY** banner
   - BUILD_ID: `email-center-netlify-proxy-v2`
   - API_ENDPOINT: `/wp-admin/api/email-center`
   - PROBE_ENDPOINT: `/wp-admin/api/email-center-probe`

### Step 3: Test Proxy Button
1. Click "Test Proxy" button
2. Should show success message: "Probe successful! Routing is working."
3. Should display JSON response in debug panel

### Step 4: Test Email Center Features
1. Click "Refresh" button
   - Should fetch SMTP status
   - Should show green checkmarks for configured SMTP settings
   - Should NOT show "Failed to fetch" error

2. Select a template from dropdown
   - Should populate template selector

3. Click "Preview" button
   - Should show email subject
   - Should show HTML preview
   - Should show plain text version

4. Enter test email and click "Send Test Email"
   - Should send email successfully
   - Should show success message

### Step 5: Verify Network Tab
Open browser DevTools → Network tab:
- All requests should be to: `https://gappsy.com/wp-admin/api/email-center*`
- NO requests should be to: `*.supabase.co`
- Response status should be: 200, 401, or 500 (not network error)
- Response should be valid JSON

### Step 6: Check Browser Console
- Should have NO CORS errors
- Should have NO CSP violations
- Should have NO "Failed to fetch" errors

## Success Criteria

The deployment is successful when:
1. ✅ Probe endpoint returns JSON (not 404)
2. ✅ Email Center UI loads without errors
3. ✅ Test Proxy button works
4. ✅ Refresh button fetches SMTP status
5. ✅ Preview button shows email templates
6. ✅ Send Test Email delivers messages
7. ✅ No CORS errors in console
8. ✅ No requests to *.supabase.co in Network tab

## Troubleshooting

### Problem: Probe endpoint returns 404
**Solution:**
- Check if Netlify Functions were deployed (Netlify dashboard → Functions tab)
- Verify `_redirects` file is in dist folder
- Redeploy if necessary

### Problem: "Failed to fetch" error
**Solution:**
- Test probe endpoint first to confirm routing works
- Check browser Network tab for actual error
- Look for CORS errors in console
- Check Netlify Functions logs

### Problem: 401 Unauthorized
**Solution:**
- This is expected behavior - admin secret is required
- Login at `/wp-admin` with correct secret
- Secret is stored in localStorage

### Problem: 500 Internal Server Error
**Solution:**
- Check Netlify Functions logs for error details
- Verify Supabase Edge Function is working
- Test Supabase function directly with curl

## Rollback Plan

If the deployment fails, rollback by:
1. Revert to previous commit
2. Or manually revert these changes:
   - Remove redirect rules from `_redirects`
   - Restore previous BUILD_ID in Email Center page
   - Remove Netlify Functions folder

## Support

For issues, check:
1. Netlify deployment logs
2. Netlify Functions logs
3. Browser DevTools console
4. Browser DevTools Network tab
5. Supabase Edge Function logs
