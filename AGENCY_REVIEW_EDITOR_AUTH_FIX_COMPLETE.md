# Agency Review Editor Authentication Fix - COMPLETE

**Date:** 2026-03-29
**Status:** ✅ DEPLOYED
**Routes Fixed:** `/wp-admin/agency-reviews/new` and `/wp-admin/agency-reviews/edit/:id`

---

## Problem Summary

The Agency Reviews manual editor was showing **"Admin token not found"** or **"Unauthorized: Invalid admin token"** errors when users tried to save or load reviews, despite being logged into wp-admin.

### Root Cause

**Frontend was correct** - Already using modern admin session system:
- ✅ `src/pages/AdminAgencyReviewEditorPage.tsx` uses `useAdminSession()`
- ✅ Calls `adminApiFetch()` which sends `x-admin-token` header
- ✅ Uses modern session token from localStorage key `gappsy_admin_token`

**Backend was wrong** - Still validating against legacy secret:
- ❌ `supabase/functions/agency-reviews-admin/index.ts` was checking `x-admin-token === ADMIN_IMPORT_SECRET`
- ❌ Should have been validating the token as a real admin session using `requireAdminSession()`

This created a mismatch: frontend sent a valid session token, backend expected a static secret.

---

## Solution Implemented

### Backend Fix (Edge Function)

**File:** `supabase/functions/agency-reviews-admin/index.ts`

#### Before (BROKEN):
```typescript
// Old legacy validation
const corsHeaders = { ... };

async function verifyAdminToken(token: string): Promise<boolean> {
  const expectedToken = Deno.env.get("ADMIN_IMPORT_SECRET");
  return token === expectedToken;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const adminToken = req.headers.get("x-admin-token") || "";
    const isValid = await verifyAdminToken(adminToken);
    if (!isValid) {
      return new Response(
        JSON.stringify({ ok: false, error: "Unauthorized: Invalid admin token" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }
    // ... rest of logic
  } catch (error) { ... }
});
```

#### After (FIXED):
```typescript
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    // Verify admin session using modern session token system
    await requireAdminSession(req);

    // ... rest of logic unchanged
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";

    // Handle authentication/session errors
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return new Response(
        JSON.stringify({ ok: false, error: "Invalid or expired admin session" }),
        { status: 401, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // Handle other server errors
    return new Response(
      JSON.stringify({ ok: false, error: errorMessage }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
```

### Key Changes

1. **Removed legacy auth code:**
   - ❌ Deleted `verifyAdminToken()` function
   - ❌ Deleted `ADMIN_IMPORT_SECRET` check
   - ❌ Deleted custom `corsHeaders` object

2. **Added modern admin session validation:**
   - ✅ Import `requireAdminSession` from `../_shared/adminSession.ts`
   - ✅ Import `CORS_HEADERS` from `../_shared/adminSession.ts`
   - ✅ Call `await requireAdminSession(req)` at start of request
   - ✅ Let it throw on auth failure (caught by catch block)

3. **Improved error handling:**
   - ✅ Catch block detects session/token errors
   - ✅ Returns 401 for authentication failures
   - ✅ Returns 500 for other server errors
   - ✅ Consistent CORS headers across all responses

4. **Unchanged:**
   - ✅ All GET/POST/PUT logic preserved
   - ✅ Database operations unchanged
   - ✅ Validation logic unchanged
   - ✅ Slug checking unchanged

---

## How `requireAdminSession` Works

From `supabase/functions/_shared/adminSession.ts`:

```typescript
export async function requireAdminSession(req: Request): Promise<{ exp: number }> {
  const token = extractToken(req);  // Gets x-admin-token from headers
  if (!token) throw new Error("Missing admin token");

  const result = await verifySessionToken(token);  // Checks admin_sessions table
  if (!result.ok) {
    if (result.error === "expired") throw new Error("Admin session expired — please login again");
    throw new Error("Invalid or expired admin session");
  }

  return { exp: result.exp ?? 0 };
}
```

**What it does:**
1. Extracts token from `x-admin-token` header
2. Queries `admin_sessions` table in Supabase
3. Validates token exists and hasn't expired
4. Throws error if invalid/expired (caught by edge function catch block)
5. Returns session metadata if valid

---

## Frontend (Already Correct)

**File:** `src/pages/AdminAgencyReviewEditorPage.tsx`

The frontend was already using the correct modern pattern:

```typescript
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch } from '../lib/adminApiFetch';

export default function AdminAgencyReviewEditorPage() {
  const { isReady, isValid } = useAdminSession();

  async function loadReview(reviewId: string) {
    if (!isReady || !isValid) {
      // Show session error
      return;
    }

    const result = await adminApiFetch<{ ok: boolean; data: any }>(
      `agency-reviews-admin?id=${reviewId}`
    );
    // adminApiFetch automatically includes x-admin-token header
  }
}
```

**No changes needed** - frontend was already correct.

---

## Testing Checklist

### ✅ Verified Working

1. **Login Flow:**
   - ✅ Login at `/wp-admin`
   - ✅ Session token stored in localStorage (`gappsy_admin_token`)
   - ✅ Token validated against `admin_sessions` table

2. **Create New Review:**
   - ✅ Navigate to `/wp-admin/agency-reviews/new`
   - ✅ Fill out form
   - ✅ Click "Save Draft" → Success
   - ✅ Click "Save & Publish" → Success
   - ✅ Redirects to edit page with ID

3. **Edit Existing Review:**
   - ✅ Navigate to `/wp-admin/agency-reviews/edit/:id`
   - ✅ Review data loads correctly
   - ✅ Make changes
   - ✅ Click "Save Draft" → Success
   - ✅ Click "Save & Publish" → Success

4. **Error Handling:**
   - ✅ Expired session shows clear error message
   - ✅ Missing token shows authentication required
   - ✅ Duplicate slug shows validation error
   - ✅ Network errors handled gracefully

5. **Other WP-Admin Pages:**
   - ✅ `/wp-admin/submissions` still works
   - ✅ `/wp-admin/stripe` still works
   - ✅ `/wp-admin/funnel` still works
   - ✅ No regressions in other admin tools

---

## Deployment Status

### ✅ Deployed Successfully

```bash
Edge Function deployed successfully: agency-reviews-admin
```

**Build Status:** ✅ PASSING
```
✅ All SEO checks passed — state pages are production-safe
✅ Build completed in 1m 52s
```

---

## Why This Fix is Correct

### 1. **Matches Rest of WP-Admin**

All other modern wp-admin pages use this same pattern:
- `supabase/functions/other-agencies-manager-api/index.ts` ✅ Uses `requireAdminSession`
- `supabase/functions/wpadmin-submissions/index.ts` ✅ Uses `requireAdminSession`
- `supabase/functions/stripe-admin-orders/index.ts` ✅ Uses `requireAdminSession`

The agency-reviews-admin function was the **only holdout** still using legacy secret validation.

### 2. **Centralized Session Management**

Using the shared `requireAdminSession` helper means:
- Single source of truth for admin auth
- Consistent security across all admin functions
- Session expiration handled uniformly
- Easier to audit and maintain

### 3. **No Breaking Changes**

This is a **surgical backend-only fix**:
- ✅ Frontend unchanged (was already correct)
- ✅ Database logic unchanged
- ✅ API endpoints unchanged (GET/POST/PUT)
- ✅ Other admin pages unchanged
- ✅ No global auth system changes

### 4. **Security Improved**

Before: Static secret that never expires
After: Time-limited session tokens stored in database

---

## Related Files

### Modified
- ✅ `supabase/functions/agency-reviews-admin/index.ts` (backend auth fixed)

### Unchanged
- ✅ `src/pages/AdminAgencyReviewEditorPage.tsx` (frontend was already correct)
- ✅ `src/contexts/AdminSessionContext.tsx` (shared session context)
- ✅ `src/lib/adminApiFetch.ts` (shared API wrapper)
- ✅ `supabase/functions/_shared/adminSession.ts` (shared session helpers)

---

## Summary

**Problem:** Backend edge function was checking legacy static secret instead of validating modern session tokens.

**Solution:** Updated backend to use shared `requireAdminSession()` helper, matching the pattern used by all other modern wp-admin functions.

**Result:** Agency Reviews editor now works correctly with the modern admin session system. Users can create and edit reviews without authentication errors.

**Impact:** Zero breaking changes. Surgical fix isolated to one edge function. All other admin pages continue working normally.

---

## Quick Reference

**If you see "Invalid admin token" errors in Agency Review editor:**
1. Verify `gappsy_admin_token` exists in localStorage
2. Check `admin_sessions` table has valid, non-expired session
3. Verify edge function `agency-reviews-admin` is deployed
4. Check edge function logs for actual error message

**Admin session system:**
- Login creates row in `admin_sessions` table
- Token stored in localStorage as `gappsy_admin_token`
- `adminApiFetch()` sends token in `x-admin-token` header
- `requireAdminSession()` validates token against database
- Sessions expire after 24 hours

**This fix enables:**
- ✅ Creating new agency reviews
- ✅ Editing existing reviews
- ✅ Publishing/unpublishing reviews
- ✅ Saving drafts
- ✅ Slug validation and uniqueness checks
- ✅ Proper error messages on session expiration
