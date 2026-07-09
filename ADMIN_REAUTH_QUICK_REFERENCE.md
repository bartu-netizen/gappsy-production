# Admin Re-Auth Quick Reference

## Problem Fixed

`/wp-admin/other-agencies-import` was showing "session expired" errors with no way to log in again.

## Solution Summary

All auth/session errors now trigger inline re-authentication instead of dead-end error banners.

## Central Handler

### Location
`src/pages/AdminOtherAgenciesImportPage.tsx:179`

### Function
```typescript
const handleAuthFailure = (errorMsg: string, statusCode?: number) => {
  if (isAuthError(errorMsg, statusCode)) {
    console.log('[AUTH FAILURE DETECTED]', errorMsg);
    setNeedsReAuth(true);
    setError('');
    setIsImporting(false);
    setIsSaving(false);
    setLoadingJobs(false);
    setLoadingAgencies(false);
  } else {
    setError(errorMsg);
  }
};
```

### Error Detection
Detects 14+ auth error patterns:
- `invalid_token`
- `no_token`
- `missing authorization`
- `session expired`
- `unauthorized`
- `401`
- `403`
- `forbidden`
- `please log in again`
- And more...

## Usage in All Protected Actions

```typescript
// Every catch block now uses:
catch (err) {
  const rawError = err instanceof Error ? err.message : 'Error message';
  handleAuthFailure(rawError);  // ← Central handler
}
```

### Actions Updated
1. ✅ `handleImport()` - Upload
2. ✅ `fetchJobs()` - Import History
3. ✅ `fetchAgencies()` - Agency List
4. ✅ `handleSaveEdit()` - Save Agency
5. ✅ `handleDeleteAgency()` - Delete Agency
6. ✅ `pollJobStatus()` - Status Polling

## UI Behavior

### When Auth Fails
```
[Amber Re-Auth Card Appears]
Session Expired
Your admin session has expired...
[🔒 Enter admin secret] [Log In]
```

### After Successful Login
```
[Blue Info Banner]
For security reasons, please re-select your file...

[Selected state: PRESERVED ✅]
[Selected format: PRESERVED ✅]
[Active tab: PRESERVED ✅]
```

## Conditional Rendering

```typescript
{needsReAuth && (
  <AdminReAuthCard onSuccess={handleReAuthSuccess} />
)}

{error && !needsReAuth && (
  <div>Red Error Banner</div>
)}
```

**Key:** `!needsReAuth` prevents dead-end error banner state.

## Testing

### Force Session Expiry
```javascript
localStorage.removeItem('gappsy_admin_token');
```

### Expected Result
- ✅ Amber re-auth card appears
- ✅ Can enter password and log in
- ✅ Page becomes usable again

### NOT Expected
- ❌ Red banner with no recovery
- ❌ User stuck without login path

## Console Debug

Look for:
```
[AUTH FAILURE DETECTED] invalid_token
```

## Files Modified

1. `src/pages/AdminOtherAgenciesImportPage.tsx`
   - Enhanced `isAuthError()` function
   - Added `handleAuthFailure()` central handler
   - Updated all catch blocks (5 total)
   - Verified conditional rendering logic

## Acceptance Criteria

✅ Upload auth failure → re-auth mode
✅ History auth failure → re-auth mode
✅ Manage auth failure → re-auth mode
✅ Edit auth failure → re-auth mode
✅ Delete auth failure → re-auth mode
✅ After re-auth, all actions work
✅ State/format/tab preserved
✅ File reselection clearly explained
✅ No dead-end error banner states

## Production Ready

Build status: ✅ Success

All auth failures now route through central handler to inline re-authentication.
