# Bulk State JSON Import - Setup Guide

## Overview
The Bulk State JSON Import system allows you to import state data without any login or authentication system. It's protected by a simple admin secret.

## Environment Variables Setup (CRITICAL)

You need to configure **TWO** environment variables in Bolt:

### 1. Frontend Variable (Vite)
```
VITE_ADMIN_IMPORT_SECRET=your-secret-key-here
```
- This is used by the React frontend
- Must start with `VITE_` prefix
- Can be any random string (e.g., `gappsy-admin-2025`)

### 2. Edge Function Variable
```
ADMIN_IMPORT_SECRET=your-secret-key-here
```
- This is used by the Edge Function
- Does NOT have `VITE_` prefix
- **MUST BE IDENTICAL** to the value above

### Example Configuration
```
VITE_ADMIN_IMPORT_SECRET=gappsy-admin-2025
ADMIN_IMPORT_SECRET=gappsy-admin-2025
```

## How It Works

1. **Frontend Protection**
   - `/admin/json-import` is accessible without login
   - Reads `VITE_ADMIN_IMPORT_SECRET` from environment
   - Shows yellow warning if not configured
   - Disables import button if secret is missing
   - Sends secret in `x-admin-secret` header

2. **Edge Function Validation**
   - Receives `x-admin-secret` header from frontend
   - Reads `ADMIN_IMPORT_SECRET` from Deno environment
   - Validates they match
   - Returns 401 if invalid or missing
   - Uses `SUPABASE_SERVICE_ROLE_KEY` to bypass RLS

3. **Database Import**
   - Validates rank is 1-25
   - Sets `logo_url` to NULL if missing (not empty string)
   - Sets `description` to NULL if missing (not empty string)
   - Ensures `services` is always an array
   - Returns detailed error info on failure

## Usage

1. Navigate to `/admin/json-import`
2. Upload state JSON file(s)
3. Review validation results
4. Configure import options
5. Click "Import" button

## Acceptance Criteria

After setup:
- ✅ No login required
- ✅ Yellow warning disappears when secret is set
- ✅ Import button shows "Admin Secret Required" when disabled
- ✅ Alabama import results in: 25 Top25 imported, 0 errors
- ✅ Alabama page renders correctly

## Security Notes

- No Supabase Auth involved
- No JWT tokens
- No user login system
- Simple secret-based protection
- Production-ready for internal admin use

## Troubleshooting

### "Admin Secret Required" button disabled
- Configure `VITE_ADMIN_IMPORT_SECRET` in Bolt Environment Variables

### "Missing or invalid admin secret" error
- Ensure both variables are set
- Verify they have identical values
- Check for typos or extra spaces

### Database errors
- Check database schema is up to date
- Verify RLS policies allow service role access
- Review error details in UI
