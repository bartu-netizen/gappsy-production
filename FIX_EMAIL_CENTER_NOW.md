# Fix Email Center in 3 Steps

## 1. Add Environment Variable in Netlify

Go to: https://app.netlify.com → Your Site → **Site Settings** → **Environment Variables**

Click **"Add a variable"**:

```
Name:  SUPABASE_FUNCTIONS_BASE_URL
Value: https://jczdgzhnszvzbpfqueyy.supabase.co/functions/v1
Scope: Production ✅
```

Click **Save**

## 2. Redeploy with Cache Clear

Go to: **Deploys** tab → **Trigger deploy** → **Clear cache and deploy site**

Wait for deploy to complete (~2-3 minutes)

## 3. Test It Works

```bash
curl https://gappsy.com/wp-admin/api/email-center-upstream-check
```

**Expected:**
```json
{
  "ok": true,
  "upstreamStatus": 401
}
```

**If you see this instead:**
```json
{
  "ok": false,
  "stage": "config_error"
}
```
→ Variable not set or cache not cleared. Go back to step 1.

---

## Done!

After these 3 steps:
- ✅ Upstream check returns `ok: true`
- ✅ Email Center UI works
- ✅ SMTP Status loads
- ✅ Preview works
- ✅ Send email works

## Why This Fixes It

The Netlify function **must** know where your Supabase project is. Without this env var, it literally cannot connect to anything. With it set, the entire proxy chain works:

```
Email Center UI → Netlify Function → Supabase Function → Email Delivery
              ✅ with env var ✅
```

## Still Having Issues?

Check the full guide: `NETLIFY_ENV_VAR_SETUP_REQUIRED.md`
