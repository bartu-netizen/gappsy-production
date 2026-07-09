# CRITICAL: Netlify Environment Variable Setup Required

## The Problem
Email Center is failing with error:
```
stage: "config_error"
error: "SUPABASE_FUNCTIONS_BASE_URL is missing in Netlify environment"
```

This happens because the Netlify function **requires** an environment variable that points to your Supabase Edge Functions.

## The Solution: Add Environment Variable in Netlify

### Step 1: Go to Netlify Dashboard
1. Visit: https://app.netlify.com
2. Select your site: `gappsy.com`
3. Click: **Site Settings**
4. In sidebar, click: **Environment Variables**

### Step 2: Add the Required Variable

Click **"Add a variable"** and enter:

**Variable Name:**
```
SUPABASE_FUNCTIONS_BASE_URL
```

**Variable Value:**
```
https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1
```

**Scopes:**
- ✅ Production
- ✅ Deploy Previews (optional)
- ✅ Branch Deploys (optional)

Click **"Save"**

### Step 3: Redeploy Your Site

After adding the variable, you MUST redeploy:

**Option A: Trigger New Deploy (Recommended)**
1. Go to: **Deploys** tab
2. Click: **Trigger deploy**
3. Select: **Clear cache and deploy site**

**Option B: Push a Small Change**
1. Make any small commit to your repo
2. Push to main branch
3. Netlify will auto-deploy

### Step 4: Verify It Works

After deployment completes, test the diagnostic endpoint:

```bash
curl https://gappsy.com/wp-admin/api/email-center-upstream-check
```

**Expected Response (Success):**
```json
{
  "ok": true,
  "stage": "upstream_reachable",
  "upstreamStatus": 401,
  "message": "Upstream is reachable (returned 401)"
}
```

**If Still Failing:**
```json
{
  "ok": false,
  "stage": "config_error",
  "error": "SUPABASE_FUNCTIONS_BASE_URL is missing..."
}
```
→ Variable not set correctly or cache not cleared

## Why This Is Required

The Netlify Functions run in a separate environment from your frontend. They need to know where your Supabase project is located. This URL **cannot** be hardcoded because:

1. It needs to be configurable per environment
2. It's a server-side setting
3. It keeps the architecture flexible

Without this env var:
- ❌ Netlify function doesn't know where to proxy requests
- ❌ Email Center API calls fail
- ❌ SMTP status, preview, and send features don't work

With this env var:
- ✅ Netlify function knows the Supabase endpoint
- ✅ Requests are properly proxied
- ✅ Email Center works end-to-end

## Testing Checklist

After setting the env var and redeploying:

1. **Test Upstream Check:**
   ```bash
   curl https://gappsy.com/wp-admin/api/email-center-upstream-check
   ```
   → Should return `ok: true` with `upstreamStatus: 401`

2. **Test Email Center UI:**
   - Visit: https://gappsy.com/wp-admin/email-center
   - Login with admin secret
   - Click **"Check Upstream"** button
   - Should show green box with "Upstream is reachable"

3. **Test Full Flow:**
   - Click **"Refresh"** → SMTP status loads
   - Select template → Click **"Preview"** → Email preview shows
   - Enter test email → Click **"Send"** → Email delivers

## Troubleshooting

### Issue: Still showing "config_error" after setting variable
**Solution:** Clear cache and redeploy
```
Deploys → Trigger deploy → Clear cache and deploy site
```

### Issue: Variable shows in dashboard but still not working
**Solution:**
1. Check variable name exactly matches: `SUPABASE_FUNCTIONS_BASE_URL`
2. Check value exactly matches: `https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1`
3. Check "Production" scope is enabled
4. Redeploy with cache clear

### Issue: "ok: true" but upstreamStatus is 500
**Solution:** Supabase function has internal error
1. Check Supabase Dashboard → Edge Functions → email-center
2. Review function logs
3. Verify function is deployed

### Issue: "ok: false" with ENOTFOUND
**Solution:** Wrong URL in env var
1. Double-check the URL value
2. Should be: `https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1`
3. No trailing slash, no `/email-center` at the end

## Environment Variable Details

| Field | Value |
|-------|-------|
| **Name** | `SUPABASE_FUNCTIONS_BASE_URL` |
| **Value** | `https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1` |
| **Type** | String |
| **Required** | Yes (absolutely required) |
| **Where** | Netlify Dashboard → Site Settings → Environment Variables |
| **Scopes** | Production (required), others optional |
| **Restart Required** | Yes (redeploy site) |

## Code Implementation

The proxy function now **strictly requires** this variable:

```typescript
const upstreamBase = process.env.SUPABASE_FUNCTIONS_BASE_URL;

if (!upstreamBase) {
  return {
    statusCode: 500,
    body: JSON.stringify({
      ok: false,
      stage: "config_error",
      error: "SUPABASE_FUNCTIONS_BASE_URL is missing in Netlify environment",
      required: {
        variable: "SUPABASE_FUNCTIONS_BASE_URL",
        expectedValue: "https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1",
        where: "Netlify Dashboard → Site Settings → Environment Variables",
      },
    }),
  };
}
```

No fallback, no defaults, no workarounds. The variable **must** be set.

## Build Status

✅ Build ID: `yit1wt7c`
✅ Timestamp: `2026-01-17T23:17:50.391Z`
✅ Files Updated:
- ✅ `netlify/functions/email-center-proxy.ts` - Strict env var requirement
- ✅ `netlify/functions/email-center-upstream-check.ts` - Env var validation

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────┐
│ NETLIFY ENVIRONMENT VARIABLE SETUP                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Variable Name:                                             │
│  SUPABASE_FUNCTIONS_BASE_URL                               │
│                                                             │
│  Variable Value:                                            │
│  https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1    │
│                                                             │
│  Where to Add:                                              │
│  Netlify Dashboard → Site Settings → Environment Variables │
│                                                             │
│  After Adding:                                              │
│  Deploys → Trigger deploy → Clear cache and deploy site    │
│                                                             │
│  Test:                                                      │
│  curl https://gappsy.com/wp-admin/api/email-center-...     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## What Happens After Setup

**Before (without env var):**
```
Email Center → Netlify Function → ❌ Error: No upstream URL configured
```

**After (with env var):**
```
Email Center → Netlify Function → ✅ Supabase Edge Function → Email Delivery
```

## Next Steps

1. ✅ Add `SUPABASE_FUNCTIONS_BASE_URL` to Netlify env vars
2. ✅ Set value to: `https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1`
3. ✅ Clear cache and redeploy site
4. ✅ Test upstream check endpoint
5. ✅ Verify Email Center works
6. ✅ Monitor for any remaining issues

## Support

If you still have issues after setting the variable:

1. Check Netlify function logs: Netlify Dashboard → Functions → email-center-proxy
2. Check Supabase logs: Supabase Dashboard → Edge Functions → email-center
3. Use the diagnostic: `/wp-admin/api/email-center-upstream-check`
4. Check browser console for client-side errors

The diagnostic endpoint will tell you exactly what's wrong with detailed error messages and troubleshooting steps.
