# Admin Secret Quick Start

## Problem: Import Failed with "Invalid admin secret"

Follow these 4 steps to fix it:

## Step 1: Generate Secret

1. Go to: `/wp-admin/settings`
2. Click **"Generate New Secret"**
3. **Copy the secret** (shown only once)

Example:
```
a7B9dE2fG4hJ6kM8nP3qR5tV7wX9yZ2b
```

## Step 2: Configure in Supabase

1. Open [Supabase Dashboard](https://supabase.com/dashboard)
2. Go to: **Project Settings** → **Edge Functions** → **Secrets**
3. Add secret:
   - Name: `ADMIN_IMPORT_SECRET`
   - Value: [paste the copied secret]
4. Click **Save**

## Step 3: Enter in Import UI

1. Go to: `/admin/json-import`
2. Paste the secret in **"Admin Import Secret"** field
3. Secret auto-saves to localStorage

## Step 4: Test Import

1. Upload a test JSON file
2. Click **Import All**
3. ✅ Should succeed

## Error Still Persists?

### Check These:

1. **Secret matches Supabase**
   - No typos, no spaces
   - Case-sensitive

2. **Environment variable name is correct**
   - Must be: `ADMIN_IMPORT_SECRET`
   - Not: `ADMIN_SECRET` or anything else

3. **Edge function is deployed**
   - Check Supabase Functions dashboard

4. **Try generating a fresh secret**
   - Go to Settings
   - Generate new
   - Reconfigure Supabase

## Quick Test

Test the edge function directly:

```bash
curl -X POST \
  "https://YOUR_PROJECT.supabase.co/functions/v1/state-json-import" \
  -H "x-admin-secret: YOUR_SECRET" \
  -H "Content-Type: application/json" \
  -d '{"stateSlug":"test","stateName":"Test","agencies":[],"otherAgencies":[],"options":{"markAsPlaceholders":true,"overrideExisting":false}}'
```

- **200**: Secret works ✅
- **401**: Secret mismatch ❌
- **500**: Not configured ❌

## Where to Find Things

| What | Where |
|------|-------|
| Generate Secret | `/wp-admin/settings` |
| Configure Secret | Supabase Dashboard → Secrets |
| Import UI | `/admin/json-import` |
| Full Guide | `ADMIN_SECRET_RECOVERY_GUIDE.md` |

## Security Note

- Store secret securely (password manager)
- Don't commit to Git
- Rotate every 90 days
- Only share with users who need import access
