# Admin Re-Auth Central Handler Implementation

## Problem Solved

The page `/wp-admin/other-agencies-import` was showing auth/session errors as red error banners with no recovery path. Users saw messages like:
- "Your session has expired. Please log in again."
- "INVALID_TOKEN"
- "Missing authorization header"

But had NO WAY to actually log in again without manually navigating away.

## Solution: Central Auth Failure Handler

### 1. Enhanced Auth Error Detection

**Function:** `isAuthError(errorMsg: string, statusCode?: number): boolean`

**Location:** `src/pages/AdminOtherAgenciesImportPage.tsx:97`

```typescript
function isAuthError(errorMsg: string, statusCode?: number): boolean {
  const lower = errorMsg.toLowerCase();
  return (
    lower.includes('invalid_token') ||
    lower.includes('invalid token') ||
    lower.includes('no_token') ||
    lower.includes('no token') ||
    lower.includes('missing authorization') ||
    lower.includes('token') && lower.includes('expired') ||
    lower.includes('session') && lower.includes('expired') ||
    lower.includes('unauthorized') ||
    lower.includes('401') ||
    lower.includes('403') ||
    lower.includes('forbidden') ||
    lower.includes('please log in again') ||
    statusCode === 401 ||
    statusCode === 403
  );
}
```

**Detects:**
- ✅ `invalid_token`
- ✅ `invalid token`
- ✅ `no_token`
- ✅ `no token`
- ✅ `missing authorization`
- ✅ `token expired`
- ✅ `session expired`
- ✅ `unauthorized`
- ✅ `401`
- ✅ `403`
- ✅ `forbidden`
- ✅ `please log in again`
- ✅ HTTP 401 status code
- ✅ HTTP 403 status code

### 2. Central Auth Failure Handler

**Function:** `handleAuthFailure(errorMsg: string, statusCode?: number): void`

**Location:** `src/pages/AdminOtherAgenciesImportPage.tsx:179`

```typescript
const handleAuthFailure = (errorMsg: string, statusCode?: number) => {
  if (isAuthError(errorMsg, statusCode)) {
    console.log('[AUTH FAILURE DETECTED]', errorMsg);
    setNeedsReAuth(true);           // Trigger re-auth mode
    setError('');                   // Clear error banner
    setIsImporting(false);          // Stop import spinner
    setIsSaving(false);             // Stop save spinner
    setLoadingJobs(false);          // Stop jobs spinner
    setLoadingAgencies(false);      // Stop agencies spinner
  } else {
    setError(errorMsg);             // Show as regular error
  }
};
```

**Behavior:**
- If auth error detected → Enter re-auth mode
- Clear error banner (re-auth card shows instead)
- Stop all loading spinners
- If not auth error → Show as regular error banner

### 3. All Protected Actions Use Central Handler

Every protected action now routes through `handleAuthFailure()`:

#### A. `handleImport()` - File Upload
```typescript
try {
  // ... upload logic
} catch (err) {
  const rawError = err instanceof Error ? err.message : 'Import error';
  handleAuthFailure(rawError);  // ← Central handler
}
```

#### B. `fetchJobs()` - Import History
```typescript
try {
  // ... fetch jobs logic
} catch (err) {
  const rawError = err instanceof Error ? err.message : 'Failed to fetch jobs';
  handleAuthFailure(rawError);  // ← Central handler
}
```

#### C. `fetchAgencies()` - Agency List
```typescript
try {
  // ... fetch agencies logic
} catch (err) {
  const rawError = err instanceof Error ? err.message : 'Failed to fetch agencies';
  handleAuthFailure(rawError);  // ← Central handler
}
```

#### D. `handleSaveEdit()` - Save Agency Changes
```typescript
try {
  // ... save logic
} catch (err) {
  const rawError = err instanceof Error ? err.message : 'Failed to save agency';
  handleAuthFailure(rawError);  // ← Central handler
}
```

#### E. `handleDeleteAgency()` - Delete Agency
```typescript
try {
  // ... delete logic
} catch (err) {
  const rawError = err instanceof Error ? err.message : 'Failed to delete agency';
  handleAuthFailure(rawError);  // ← Central handler
}
```

### 4. Early Auth Checks Still Trigger Re-Auth

Before API calls, actions check session status:

```typescript
if (!token || status === 'invalid') {
  setNeedsReAuth(true);
  return;
}

const valid = await ensureValid();
if (!valid) {
  setNeedsReAuth(true);
  return;
}
```

### 5. API Response Errors Trigger Re-Auth

When API returns 401/403:

```typescript
if (!response.ok) {
  const errorMsg = await parseApiError(response);
  if (isAuthError(errorMsg, response.status)) {
    setNeedsReAuth(true);
    setIsImporting(false);
    return;
  }
  throw new Error(`Upload failed: ${errorMsg}`);
}
```

### 6. Re-Auth UI Rendering

**Location:** `src/pages/AdminOtherAgenciesImportPage.tsx:754`

```typescript
{needsReAuth && (
  <div className="mb-6">
    <AdminReAuthCard
      onSuccess={handleReAuthSuccess}
      message="Your admin session has expired. Please log in again to continue using the import tools."
    />
  </div>
)}

{error && !needsReAuth && (
  <div className="mb-6 p-4 bg-red-50 border border-red-200 rounded-lg">
    {/* Red error banner - only shows if NOT in re-auth mode */}
  </div>
)}
```

**Key Points:**
- Re-auth card shows when `needsReAuth === true`
- Error banner only shows when `needsReAuth === false`
- This ensures NO DEAD-END "session expired" banner state

## Flow Diagram

```
User Action (Upload/View/Edit/Delete)
          ↓
Pre-Action Session Check
          ↓
    Invalid? ────→ setNeedsReAuth(true) ───┐
          ↓                                  ↓
    Valid?                                   ↓
          ↓                                  ↓
   API Call                                  ↓
          ↓                                  ↓
   401/403? ────→ setNeedsReAuth(true) ─────┤
          ↓                                  ↓
   Success?                                  ↓
          ↓                                  ↓
    Error? ────→ handleAuthFailure() ────────┤
          ↓                                  ↓
     Done                                    ↓
                                             ↓
                          [AdminReAuthCard Appears]
                                             ↓
                          User Enters Admin Secret
                                             ↓
                           handleReAuthSuccess()
                                             ↓
                          setNeedsReAuth(false)
                                             ↓
                          [Page Usable Again]
```

## Comprehensive Error Coverage

### Upload Tab
1. ✅ Pre-action session check → re-auth mode
2. ✅ Upload API 401/403 → re-auth mode
3. ✅ Upload API auth error → re-auth mode
4. ✅ Catch block auth error → central handler → re-auth mode
5. ✅ Poll status 401/403 → re-auth mode

### Import History Tab
1. ✅ Tab switch session check → re-auth mode
2. ✅ Fetch jobs API 401/403 → re-auth mode
3. ✅ Fetch jobs API auth error → re-auth mode
4. ✅ Catch block auth error → central handler → re-auth mode

### Manage Agencies Tab
1. ✅ Tab switch session check → re-auth mode
2. ✅ Fetch agencies API 401/403 → re-auth mode
3. ✅ Fetch agencies API auth error → re-auth mode
4. ✅ Catch block auth error → central handler → re-auth mode
5. ✅ View agency API 401/403 → re-auth mode
6. ✅ Edit agency API 401/403 → re-auth mode
7. ✅ Save edit API 401/403 → re-auth mode
8. ✅ Save edit catch block → central handler → re-auth mode
9. ✅ Delete agency API 401/403 → re-auth mode
10. ✅ Delete catch block → central handler → re-auth mode

## State Preservation Across Re-Auth

```typescript
const handleReAuthSuccess = () => {
  setNeedsReAuth(false);    // Hide re-auth card
  setError('');             // Clear errors

  // File security handling
  if (file) {
    setFileNeedsReselect(true);  // Show info banner
    setFile(null);               // Clear file
    if (fileInputRef.current) {
      fileInputRef.current.value = '';
    }
  }

  // PRESERVED across re-auth:
  // - selectedState ✅
  // - mode (csv/json/xlsx) ✅
  // - activeTab ✅
  // - filterState ✅
  // - searchQuery ✅
  // - statusFilter ✅
};
```

## Testing the Central Handler

### Test 1: Upload Auth Failure
```bash
# Force session expiry
localStorage.removeItem('gappsy_admin_token');

# Try to upload
# Expected: Re-auth card appears (not red banner)
```

### Test 2: History Auth Failure
```bash
# Force session expiry
localStorage.removeItem('gappsy_admin_token');

# Click "Import History"
# Expected: Re-auth card appears (not red banner)
```

### Test 3: Manage Auth Failure
```bash
# Force session expiry
localStorage.removeItem('gappsy_admin_token');

# Click "Manage Agencies"
# Expected: Re-auth card appears (not red banner)
```

### Test 4: Successful Re-Auth
```bash
# After re-auth card appears:
# 1. Enter admin secret
# 2. Click "Log In"
# Expected:
#   - Re-auth card disappears ✅
#   - Blue "file needs reselection" banner appears ✅
#   - Selected state/format preserved ✅
#   - All actions usable again ✅
```

## Proof: No More Dead-End State

### BEFORE (Dead-End)
```
[Red Error Banner]
Your session has expired. Please log in again.

[Upload Form - Disabled/Broken]
← User is STUCK
```

### AFTER (Recovery Path)
```
[Amber Re-Auth Card]
Session Expired
Your admin session has expired...
[🔒 Enter admin secret] [Log In]

← User can RECOVER
```

## Code Proof: Error Banner is Hidden During Re-Auth

```typescript
{error && !needsReAuth && (
  <div className="mb-6 p-4 bg-red-50 border border-red-200 rounded-lg">
    {/* This ONLY shows when NOT in re-auth mode */}
  </div>
)}
```

The `!needsReAuth` condition ensures that if an auth error triggers re-auth mode, the red banner does NOT show. Only the amber re-auth card shows.

## Console Logging for Debugging

When auth failure is detected, the console logs:
```javascript
console.log('[AUTH FAILURE DETECTED]', errorMsg);
```

This helps verify the central handler is working in production.

## Files Modified

1. `src/pages/AdminOtherAgenciesImportPage.tsx`
   - Enhanced `isAuthError()` function
   - Added `handleAuthFailure()` central handler
   - Updated all catch blocks to use central handler
   - Verified re-auth card rendering logic

## Summary

✅ **Central handler** - Single path for all auth failures
✅ **No dead-end states** - Always shows recovery path
✅ **Comprehensive coverage** - All protected actions handled
✅ **Clear error detection** - Catches 14+ auth error patterns
✅ **State preservation** - User selections maintained
✅ **Consistent behavior** - Same flow across all tabs

The page is now production-ready with robust auth failure handling.
