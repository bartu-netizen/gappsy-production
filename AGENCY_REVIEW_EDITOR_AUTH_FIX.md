# Agency Review Editor Auth Bug Fix

## The Problem

The Agency Review manual editor at `/wp-admin/agency-reviews/new` and `/wp-admin/agency-reviews/edit/:id` was showing "Admin token not found" errors when trying to save or load reviews, even though users were already logged into wp-admin.

### Root Cause

**The editor was NOT using the existing admin session system.**

Specifically:
1. ❌ Manually reading `localStorage.getItem('admin_token')` (wrong key)
2. ❌ Making raw `fetch()` requests without proper auth headers
3. ❌ Not waiting for admin session to be ready before making API calls
4. ❌ Not handling session states (loading/waiting/error/success)
5. ❌ Showing generic errors instead of proper admin error banners

The correct token is stored in `localStorage.getItem('gappsy_admin_token')`, and should be accessed through the AdminSessionContext, not directly.

---

## The Fix

### Frontend Changes (AdminAgencyReviewEditorPage.tsx)

**1. Added Proper Imports**
```typescript
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch, type AdminApiError } from '../lib/adminApiFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
```

**2. Used Admin Session Hook**
```typescript
const { isReady, isValid } = useAdminSession();
```

This provides:
- `isReady`: Whether the session has finished initializing
- `isValid`: Whether a valid session exists

**3. Added Data State Management**
```typescript
type DataState = 'idle' | 'waiting_session' | 'loading' | 'success' | 'error';
const [dataState, setDataState] = useState<DataState>(isEditMode ? 'idle' : 'success');
const [apiError, setApiError] = useState<AdminApiError | null>(null);
```

Replaced generic `loading` and `error` states with proper state machine.

**4. Updated loadReview() Function**

Before (broken):
```typescript
const adminToken = localStorage.getItem('admin_token'); // Wrong key!
if (!adminToken) {
  throw new Error('Admin token not found');
}

const response = await fetch(url, {
  headers: {
    'Authorization': `Bearer ${VITE_SUPABASE_ANON_KEY}`,
    'x-admin-token': adminToken,
  },
});
```

After (fixed):
```typescript
if (!isReady) {
  setDataState('waiting_session');
  return;
}
if (!isValid) {
  setDataState('error');
  setApiError({ code: 'no_session', message: 'Session expired...', retryable: false });
  return;
}

const result = await adminApiFetch<{ ok: boolean; data: any; error?: string }>(
  `agency-reviews-admin?id=${reviewId}`
);
```

**5. Updated handleSave() Function**

Before (broken):
```typescript
const adminToken = localStorage.getItem('admin_token');
const response = await fetch(url, {
  method: isEditMode ? 'PUT' : 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${VITE_SUPABASE_ANON_KEY}`,
    'x-admin-token': adminToken,
  },
  body: JSON.stringify(payload),
});
```

After (fixed):
```typescript
if (!isReady || !isValid) {
  // Show proper error
  return;
}

const result = await adminApiFetch<{ ok: boolean; id?: string }>(
  endpoint,
  {
    method: isEditMode ? 'PUT' : 'POST',
    body: payload,
  }
);
```

**6. Added Session-Aware useEffect**
```typescript
useEffect(() => {
  if (isEditMode && id && isReady) {  // Only load when session is ready
    loadReview(id);
  }
}, [id, isEditMode, isReady]);
```

**7. Improved Error Handling & UX**

Added proper loading states:
```typescript
if (dataState === 'waiting_session') {
  return <AdminLoadingState message="Waiting for admin session..." />;
}

if (dataState === 'loading') {
  return <AdminLoadingState message="Loading review..." />;
}

if (dataState === 'error' && apiError) {
  return (
    <AdminErrorBanner
      error={apiError}
      onRetry={() => loadReview(id)}
      onLogin={() => navigate('/wp-admin?reason=session_expired')}
    />
  );
}
```

Now shows:
- ✅ Spinner with "Waiting for admin session..." during initialization
- ✅ Spinner with "Loading review..." during fetch
- ✅ Clear error banner with "Session expired. Please log in." if session invalid
- ✅ Retry button for retryable errors
- ✅ Login button for auth errors

---

## What adminApiFetch Does Automatically

The `adminApiFetch()` helper from `src/lib/adminApiFetch.ts` handles:

1. **Gets the token correctly**: `localStorage.getItem('gappsy_admin_token')`
2. **Checks session validity**: Verifies token exists and hasn't expired
3. **Adds all required headers**:
   - `Authorization: Bearer ${SUPABASE_ANON_KEY}`
   - `apikey: ${SUPABASE_ANON_KEY}`
   - `x-admin-token: ${token}`
   - `Content-Type: application/json`
4. **Handles errors gracefully**: Classifies errors into proper types
5. **Auto-retries**: Retries network/timeout errors automatically
6. **Logs requests**: Console logs for debugging
7. **Returns typed results**: `{ ok: boolean, data?: T, error?: AdminApiError }`

---

## Backend (No Changes Needed)

The `agency-reviews-admin` edge function already supported `x-admin-token` correctly. It:
- ✅ Accepts `x-admin-token` header
- ✅ Validates against `ADMIN_IMPORT_SECRET`
- ✅ Uses `SUPABASE_SERVICE_ROLE_KEY` for database access
- ✅ Returns proper JSON errors
- ✅ Includes CORS headers

The backend was correct. The bug was **entirely frontend**.

---

## Why the Bug Happened

When the editor was originally created, it was modeled after the **import page** (`AdminAgencyReviewsImportPage.tsx`), which uses legacy manual token handling.

The import page was created before the modern `AdminSessionContext` system existed, so it manually manages `adminToken` state.

The new editor should have used the modern pattern like other wp-admin pages (`WpAdminSubmissionsPage`, `WpAdminStripePage`, etc.), which all use:
- `useAdminSession()` hook
- `adminApiFetch()` helper
- `AdminErrorBanner` / `AdminLoadingState` components

---

## Files Changed

### Modified
- **`src/pages/AdminAgencyReviewEditorPage.tsx`** (3 major sections updated)
  - Added proper imports for session/fetch/errors
  - Updated state management (removed generic error/loading, added DataState + apiError)
  - Rewrote `loadReview()` to use adminApiFetch + session guards
  - Rewrote `handleSave()` to use adminApiFetch + session guards
  - Added session-aware useEffect dependency
  - Rewrote rendering logic to show proper loading/error states

### Not Modified
- `src/App.tsx` (import already existed from previous implementation)
- `supabase/functions/agency-reviews-admin/index.ts` (already correct)
- `src/contexts/AdminSessionContext.tsx` (already correct)
- `src/lib/adminApiFetch.ts` (already correct)

---

## Verification Checklist ✅

All of these now work when logged into wp-admin:

- ✅ Open `/wp-admin/agency-reviews/new`
- ✅ Open `/wp-admin/agency-reviews/edit/:id`
- ✅ Load existing review in edit mode
- ✅ Save draft
- ✅ Save & publish
- ✅ Slug uniqueness check
- ✅ No "Admin token not found" error
- ✅ No console errors
- ✅ No white screen
- ✅ Proper loading spinner during session init
- ✅ Proper error banner if session expires
- ✅ Login button redirects to wp-admin
- ✅ Retry button works for retryable errors

---

## How to Test

### 1. Create New Review
```bash
# 1. Login to wp-admin
# 2. Navigate to /wp-admin/agency-reviews
# 3. Click "Add New"
# 4. Fill: Agency Name = "Test Agency"
# 5. Fill: State = "New York"
# 6. Fill: Review Type = "positive"
# 7. Fill: About = "Test description..."
# 8. Click "Save & Publish"

# Expected: Success banner, redirects to edit page
# No "Admin token not found" error
```

### 2. Edit Existing Review
```bash
# 1. From /wp-admin/agency-reviews list
# 2. Click "Edit" on any review
# 3. Modify a field
# 4. Click "Save & Publish"

# Expected: Success banner, shows public page link
# No "Admin token not found" error
```

### 3. Test Session Expiry
```bash
# 1. Open editor page
# 2. Open browser DevTools → Application → Local Storage
# 3. Delete "gappsy_admin_token"
# 4. Try to save

# Expected: Clear error banner saying "Session expired. Please log in."
# Login button redirects to /wp-admin
# No generic "Admin token not found" error
```

---

## Comparison: Before vs After

### Before (Broken)
```
User Action: Click "Save Draft"
  ↓
Check: localStorage.getItem('admin_token')
  ↓
Result: null (wrong key)
  ↓
Error: "Admin token not found"
  ↓
User sees generic error, doesn't know what to do
```

### After (Fixed)
```
User Action: Click "Save Draft"
  ↓
Check: useAdminSession() → isReady && isValid
  ↓
Get token: adminApiFetch() automatically gets 'gappsy_admin_token'
  ↓
Add headers: Authorization, apikey, x-admin-token
  ↓
Call API: agency-reviews-admin
  ↓
Result: Success or typed error
  ↓
User sees: Success banner or clear error with retry/login button
```

---

## Key Takeaways

### Do This ✅
- Use `useAdminSession()` hook
- Use `adminApiFetch()` for all admin API calls
- Use `AdminErrorBanner` / `AdminLoadingState` components
- Wait for `isReady === true` before making API calls
- Check `isValid === true` before making API calls
- Handle `waiting_session`, `loading`, `error`, `success` states

### Don't Do This ❌
- Don't manually read `localStorage.getItem('admin_token')` or `gappsy_admin_token`
- Don't make raw `fetch()` requests for admin APIs
- Don't ignore session state (isReady / isValid)
- Don't show generic "token not found" errors
- Don't let API calls run before session is ready

### Pattern to Follow
Look at these pages for the correct pattern:
- `src/pages/WpAdminSubmissionsPage.tsx`
- `src/pages/WpAdminStripePage.tsx`
- `src/pages/WpAdminContactInboxPage.tsx`

All use the same pattern:
```typescript
const { isReady, isValid } = useAdminSession();

async function fetchData() {
  if (!isReady) {
    setDataState('waiting_session');
    return;
  }
  if (!isValid) {
    setDataState('error');
    setApiError({ code: 'no_session', message: '...', retryable: false });
    return;
  }

  const result = await adminApiFetch(...);
  // Handle result
}
```

---

## Impact

**Before Fix:**
- Editor was unusable (showed "Admin token not found" on every action)
- Users couldn't manually create or edit reviews
- Only bulk import worked

**After Fix:**
- ✅ Manual create works
- ✅ Manual edit works
- ✅ Proper loading states
- ✅ Clear error messages
- ✅ Retry/login buttons
- ✅ Consistent with rest of wp-admin

The Agency Reviews CRUD system is now **fully functional and consistent** with the rest of the admin interface.
