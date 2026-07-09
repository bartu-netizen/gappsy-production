# Logo Upload Authentication Fix

## Problem Solved
Fixed persistent 401 errors on `/admin/logo-upload` by implementing a single, clear authentication contract.

## Changes Made

### Edge Function (logo-upload)
**Simplified Authentication:**
- ONLY accepts admin secret via `x-admin-secret` header
- Removed multi-path auth (authorization header, body, query params)
- Clear error responses with diagnostics:
  - 500: `ADMIN_SECRET_NOT_CONFIGURED` if env var missing
  - 401: `UNAUTHORIZED` with `hasHeader`, `receivedLength`, `expectedLength`
  - Never logs or returns actual secret values

**Rank #1 VazAgency Protection:**
- Logo uploads to storage for rank #1 (VazAgency)
- Skips database update (protected by DB triggers)
- Returns success with note: "Rank 1 is reserved; logo stored without DB update"

### Frontend (BulkLogoUploadPage.tsx)
**Simplified Request:**
- Sends admin secret ONLY in `x-admin-secret` header
- Trims whitespace before sending
- No longer sends in body, authorization header, or query params

**Test Auth Button:**
- Tests authentication before uploading files
- Shows clear success/failure with diagnostics
- Helps debug auth issues before actual upload

**Error Display:**
- Shows detailed JSON error response from server
- Displays: hasHeader, receivedLength, expectedLength
- No generic "401" messages

## Authentication Contract

### Edge Function Expects:
```
Header: x-admin-secret: <ADMIN_SECRET>
```

### Frontend Sends:
```javascript
headers: {
  'x-admin-secret': adminSecret.trim(),
  'Content-Type': 'application/json'
}
```

## Verification Steps

### 1. Test Auth (Before Upload)
1. Go to `/admin/logo-upload`
2. Enter admin secret
3. Click "Test Auth" button
4. Should see: "✓ Auth test passed! Your admin secret is correct."

### 2. Upload VazAgency Logo (Rank #1)
1. Select a state (e.g., Alaska)
2. Upload logo named `VazAgency.webp`
3. Should succeed with note: "Rank 1 is reserved; logo stored without DB update"
4. Logo appears in storage, database not modified

### 3. Upload Other Rank Logos
1. Upload logos for ranks 2-25
2. Should succeed and update database
3. Logo URL updated in top25_slots table

### 4. Wrong Secret Test
1. Enter incorrect admin secret
2. Click "Test Auth"
3. Should see:
   ```
   ✗ Auth test failed:

   Status: 401
   Error: UNAUTHORIZED
   Has Header: true
   Received Length: <wrong length>
   Expected Length: <correct length>
   ```

### 5. Missing Secret Test
1. Clear admin secret
2. Try to upload
3. Should see alert: "Admin secret is required"

## Edge Function Logs
Check Supabase logs for:
- `[logo-upload] Auth check - hasHeader: true, envConfigured: true`
- `[logo-upload] ✓ Authentication successful`
- `✓ Logo uploaded for alaska rank 1 (VazAgency) - logo stored without DB update`

## No Changes To:
- Database triggers (rank #1 protection still enforced)
- Storage bucket configuration
- RLS policies
- UI layout or styling
- JSON import functionality

## Security Maintained:
- Admin secret required for all uploads
- Secret never logged or returned in responses
- Only boolean flags and lengths exposed for diagnostics
- Rank #1 protection unchanged
