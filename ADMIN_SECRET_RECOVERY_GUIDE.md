# Admin Secret Recovery & Rotation Guide

## Overview

The state import feature requires an **admin secret** to protect the import endpoint. This guide covers how to generate, configure, and recover the admin import secret.

## Problem

**Symptom**: Import fails with error:
```
FORBIDDEN: Invalid admin secret
The admin secret you entered is incorrect or missing.
```

**Cause**: The secret in the UI doesn't match `ADMIN_IMPORT_SECRET` in Supabase, or the environment variable isn't configured.

## Solution: Generate & Configure Secret

### Step 1: Access Settings Page

1. Log in to WP Admin: `/wp-admin`
2. From Dashboard, click **"Settings & Secrets"**
3. Or navigate directly to: `/wp-admin/settings`

### Step 2: Generate New Secret

1. Click **"Generate New Secret"** button
2. A secure 32-character random secret will be created
3. **IMPORTANT**: The secret is shown **only once**. Copy it immediately.

Example secret:
```
a7B9dE2fG4hJ6kM8nP3qR5tV7wX9yZ2b
```

### Step 3: Configure in Supabase

#### Option A: Supabase Dashboard (Recommended)

1. Go to [supabase.com/dashboard](https://supabase.com/dashboard)
2. Select your project
3. Navigate to: **Project Settings** → **Edge Functions** → **Secrets**
4. Add or update secret:
   - **Name**: `ADMIN_IMPORT_SECRET`
   - **Value**: [paste the generated secret]
5. Click **Save**

The edge function will immediately start using the new secret (no redeploy needed).

#### Option B: Supabase CLI

If you have the Supabase CLI installed:

```bash
supabase secrets set ADMIN_IMPORT_SECRET="a7B9dE2fG4hJ6kM8nP3qR5tV7wX9yZ2b"
```

### Step 4: Test Import

1. Go to: `/admin/json-import`
2. Enter the secret in the **Admin Import Secret** field
3. Upload a test JSON file
4. Click **Import All**

**Expected**: Import succeeds ✅

## Error Messages & Solutions

### Error 1: "Invalid admin secret"

**Full Error**:
```json
{
  "code": "FORBIDDEN",
  "message": "Invalid admin secret",
  "details": "The admin secret you entered is incorrect or missing...",
  "envVarName": "ADMIN_IMPORT_SECRET",
  "hint": "Get the correct secret from Supabase Dashboard..."
}
```

**Solutions**:
1. Verify the secret in Supabase matches what you entered in the UI
2. Generate a new secret in Settings and reconfigure Supabase
3. Check for typos (secrets are case-sensitive)
4. Ensure there are no leading/trailing spaces

### Error 2: "Import secret not configured on server"

**Full Error**:
```json
{
  "code": "SECRET_NOT_CONFIGURED",
  "message": "Import secret not configured on server",
  "details": "The ADMIN_IMPORT_SECRET environment variable is not set...",
  "setupInstructions": "1. Go to Supabase Dashboard..."
}
```

**Solution**:
The `ADMIN_IMPORT_SECRET` environment variable doesn't exist in Supabase. Follow **Step 3** above to configure it.

### Error 3: Secret cleared from local storage

**Symptom**: You see "Admin Secret Required" warning banner

**Solution**:
1. Click the link: **"Generate one in Settings"**
2. Or manually enter the secret if you have it stored securely
3. The UI will save it to localStorage for future imports

## Security Best Practices

### 1. Secret Storage

- ✅ **DO**: Store in Supabase Secrets (encrypted at rest)
- ✅ **DO**: Save securely in password manager
- ❌ **DON'T**: Commit to Git
- ❌ **DON'T**: Share via email or Slack
- ❌ **DON'T**: Store in plain text files

### 2. Secret Rotation

**When to rotate**:
- Every 90 days (recommended)
- If secret is compromised
- When team member leaves with access
- After security audit

**How to rotate**:
1. Generate new secret in Settings
2. Update Supabase immediately
3. Notify team members with import access
4. Old secret becomes invalid instantly

### 3. Access Control

- Only give the secret to users who need to perform imports
- Consider using different secrets for different environments (dev/staging/prod)
- Audit import logs regularly

## Technical Details

### Where the Secret is Used

**Frontend** (`src/pages/AdminBulkStateImport.tsx`):
- Stored in `localStorage` as `admin_import_secret`
- Sent as `x-admin-secret` header in import requests

**Edge Function** (`supabase/functions/state-json-import/index.ts`):
- Reads `ADMIN_IMPORT_SECRET` from environment
- Validates incoming `x-admin-secret` header
- Returns 401 if mismatch

### Secret Format

- **Length**: 32 characters
- **Character set**: A-Z, a-z, 2-9 (excludes 0, 1, O, I for clarity)
- **Example**: `a7B9dE2fG4hJ6kM8nP3qR5tV7wX9yZ2b`

### Edge Function Validation Logic

```typescript
const adminSecret = req.headers.get("x-admin-secret");
const expectedSecret = Deno.env.get("ADMIN_IMPORT_SECRET");

if (!expectedSecret) {
  // Returns 500: SECRET_NOT_CONFIGURED
  return errorResponse(...);
}

if (!adminSecret || adminSecret !== expectedSecret) {
  // Returns 401: FORBIDDEN
  return errorResponse(...);
}

// Proceed with import
```

## Troubleshooting Checklist

Before contacting support, verify:

- [ ] Secret is configured in Supabase Edge Function Secrets
- [ ] Environment variable name is exactly `ADMIN_IMPORT_SECRET`
- [ ] No leading/trailing spaces in secret value
- [ ] Secret in UI matches Supabase (case-sensitive)
- [ ] Edge function is deployed (check Supabase Functions dashboard)
- [ ] Browser has network access to Supabase edge functions

### Debug: Test Edge Function Directly

```bash
curl -X POST \
  "https://YOUR_PROJECT.supabase.co/functions/v1/state-json-import" \
  -H "x-admin-secret: YOUR_SECRET" \
  -H "Content-Type: application/json" \
  -d '{
    "stateSlug": "test",
    "stateName": "Test",
    "agencies": [],
    "otherAgencies": [],
    "options": {
      "markAsPlaceholders": true,
      "overrideExisting": false
    }
  }'
```

**Expected**:
- 200 OK: Secret is valid ✅
- 401 Unauthorized: Secret mismatch ❌
- 500 Internal Error: Secret not configured ❌

## Quick Reference

| Action | URL | Description |
|--------|-----|-------------|
| Generate Secret | `/wp-admin/settings` | Create new random secret |
| Configure Secret | Supabase Dashboard → Secrets | Set `ADMIN_IMPORT_SECRET` |
| Import UI | `/admin/json-import` | Enter secret and import |
| Admin Dashboard | `/wp-admin/dashboard` | Access all admin tools |

## Files Modified

This recovery system includes:

1. **`supabase/functions/state-json-import/index.ts`**
   - Enhanced error messages with actionable hints
   - Separate error codes for different failure scenarios
   - Includes `envVarName` in error response

2. **`src/utils/stateJsonImport.ts`**
   - Better error handling for secret-related failures
   - Includes setup instructions in error details

3. **`src/pages/WpAdminSettingsPage.tsx`** (NEW)
   - Secret generation UI
   - Step-by-step setup instructions
   - Copy-to-clipboard functionality

4. **`src/pages/AdminBulkStateImport.tsx`**
   - Warning banner with link to Settings
   - Help text with Settings link
   - Improved UX for missing secret

5. **`src/pages/WpAdminDashboardPage.tsx`**
   - Added Settings tile to dashboard

6. **`src/App.tsx`**
   - Added `/wp-admin/settings` route

## Future Enhancements

Potential improvements:

1. **Programmatic secret update**: Allow Settings page to directly update Supabase (requires Supabase Management API)
2. **Secret expiration**: Auto-rotate secrets every 90 days
3. **Audit log**: Track when secrets are used for imports
4. **Multi-factor auth**: Require 2FA for secret generation
5. **Role-based access**: Different secrets for different user roles

## Summary

The admin secret recovery flow is now:

1. **User-friendly**: Clear error messages with actionable steps
2. **Recoverable**: Self-service secret generation in Settings
3. **Secure**: Secrets only shown once, stored encrypted in Supabase
4. **Documented**: Complete setup instructions in UI
5. **Testable**: Can verify import immediately after setup

No code knowledge required - any admin can generate and configure secrets using the web UI.
