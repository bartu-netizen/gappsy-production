# Agency Review Manual Editor - Implementation Summary

## What Was Fixed

The wp-admin Agency Reviews create/edit flow was completely broken because the routes and pages didn't exist.

### The Bug

- Clicking "Add New" in `/wp-admin/agency-reviews` opened `/wp-admin/agency-reviews/new` → **404**
- Clicking "Edit" opened `/wp-admin/agency-reviews/edit/:id` → **404**
- No manual editor existed for creating or editing agency reviews
- Users could only bulk import via CSV/Excel, not manually create or edit individual reviews

### Root Cause

The routes were pointing to pages that were never created:
- `AdminAgencyReviewsPage.tsx` had working "Add New" and "Edit" buttons (lines 326, 678)
- Both buttons linked to non-existent routes
- No editor page component existed
- No admin API endpoint existed for CRUD operations

---

## Files Added

### 1. `/src/pages/AdminAgencyReviewEditorPage.tsx`
**Purpose:** Unified create/edit page for agency reviews

**Features:**
- ✅ Works in both "new" and "edit" modes (based on URL param)
- ✅ Auto-generates slug from agency name + state
- ✅ Supports manual slug override
- ✅ Validates slug uniqueness inline
- ✅ All 25+ agency_reviews fields supported
- ✅ Array fields (services, strengths, etc.) use newline-separated textarea input
- ✅ State dropdown auto-populates state_name
- ✅ Review type validation (required)
- ✅ Save Draft vs Save & Publish actions
- ✅ View Public Page link (edit mode only)
- ✅ Redirects to edit mode after creating new review
- ✅ Success/error banners
- ✅ Uses WpAdminLayout for consistent admin UI

**Validation:**
- agency_name required
- state_slug required
- review_type required (positive/negative)
- agency_slug required + unique check
- about_description required

### 2. `/supabase/functions/agency-reviews-admin/index.ts`
**Purpose:** Admin-authenticated API for CRUD operations on agency_reviews

**Endpoints:**
- `GET ?id=<uuid>` - Fetch single review by id
- `POST` - Create new review
- `PUT ?id=<uuid>` - Update existing review

**Security:**
- ✅ Requires `x-admin-token` header (same as bulk import)
- ✅ Uses `ADMIN_IMPORT_SECRET` for verification
- ✅ Uses `SUPABASE_SERVICE_ROLE_KEY` (bypasses RLS)
- ✅ CORS headers include `x-admin-token`
- ✅ Validates slug uniqueness before save
- ✅ Returns clear error messages

---

## Files Modified

### 1. `/src/App.tsx`
**Changes:**
- Added lazy import: `AdminAgencyReviewEditorPage`
- Added route: `/wp-admin/agency-reviews/new` (wrapped in `AdminRoute`)
- Added route: `/wp-admin/agency-reviews/edit/:id` (wrapped in `AdminRoute`)
- Routes placed **before** the catch-all `DatabaseRoutedPage` route

**Why these positions matter:**
The new routes must be registered before the final catch-all `*` route (DatabaseRoutedPage) to prevent 404s.

---

## How It Works

### Creating a New Review
1. Navigate to `/wp-admin/agency-reviews`
2. Click "Add New" button
3. Opens `/wp-admin/agency-reviews/new`
4. Fill out form (agency_name, state, review_type are required)
5. Slug auto-generates from name + state (e.g., "Hozio" + "new-york" → "hozio-new-york")
6. Click "Save Draft" or "Save & Publish"
7. Edge function validates uniqueness, creates row
8. Redirects to `/wp-admin/agency-reviews/edit/{id}`
9. Can now view public page via "View Public Page" button

### Editing Existing Review
1. Navigate to `/wp-admin/agency-reviews`
2. Click "Edit" button on any review
3. Opens `/wp-admin/agency-reviews/edit/{id}`
4. Edge function fetches review data
5. Form pre-fills all fields
6. Arrays (services, strengths, etc.) convert to newline-separated text
7. Make changes
8. Click "Save Draft" or "Save & Publish"
9. Success banner shows with link to public page

### Slug Generation Logic
- **Auto mode** (default for new): `{agency-name-slug}-{state-slug}`
- Example: "Hozio Digital" + "new-york" → "hozio-digital-new-york"
- Manual override: Click "Auto" button to re-enable auto-generation
- Edit mode: Auto-slug disabled by default (preserves existing slug)

### Array Field UX
Form stores arrays as newline-separated strings:
```
Input (textarea):
SEO
PPC
Web Design

Saved to DB:
["SEO", "PPC", "Web Design"]
```

When loading for edit, arrays convert back:
```
DB: ["SEO", "PPC", "Web Design"]

Textarea displays:
SEO
PPC
Web Design
```

---

## Security & Admin Auth

The edge function uses the same auth pattern as `agency-reviews-import`:

1. Frontend stores `admin_token` in localStorage (set during login)
2. All requests include `x-admin-token` header
3. Edge function verifies token against `ADMIN_IMPORT_SECRET` env var
4. Uses `SUPABASE_SERVICE_ROLE_KEY` to bypass RLS policies
5. Service role can read/write all rows regardless of published status

**No white screens possible:**
- All errors return proper JSON with `ok: false`
- No failed-to-fetch dead ends (CORS headers include x-admin-token)
- Clear validation messages before API call
- Loading states prevent double-submit

---

## Verification Checklist

All of these now work:

✅ `/wp-admin/agency-reviews` (list page - unchanged)
✅ `/wp-admin/agency-reviews/new` (create new review)
✅ `/wp-admin/agency-reviews/edit/:id` (edit existing review)
✅ "Add New" button opens manual editor
✅ "Edit" button opens editor with pre-filled data
✅ Creating a draft saves as `is_published: false`
✅ Publishing sets `is_published: true`
✅ Preview URL opens public review page
✅ No 404 for admin routes
✅ No console errors
✅ No failed-to-fetch (proper CORS + auth)
✅ Slug uniqueness validated before save
✅ Public `/agency-reviews/:slug` pages still work
✅ Bulk import `/wp-admin/agency-reviews/import` still works

---

## Design Choices

### Why Not Direct Client-Side Supabase?

The anon client cannot:
- Bypass RLS to read unpublished drafts
- Guarantee insert/update permissions
- Access service_role-only operations

Admin session uses custom token auth, not Supabase auth.jwt(). Using an edge function:
- Centralizes auth logic
- Uses service_role safely
- Returns clear errors
- Prevents direct DB exposure

### Why Unified Create/Edit Page?

One component handles both modes:
- Shared validation logic
- Consistent UX
- Less code duplication
- isEditMode flag controls behavior

### Why Newline-Separated Array Input?

Alternative was tag-input component library (extra dependency).
Textarea is:
- Simple
- Fast
- No external dependencies
- Easy to copy/paste lists
- Familiar UX for admins

---

## Testing the Flow

### Quick Test - Create New Review

```bash
# 1. Login to wp-admin
# Navigate to https://your-domain/wp-admin

# 2. Go to Agency Reviews
# Click "Agency Reviews" in sidebar

# 3. Create new review
# Click "Add New"
# Fill: Agency Name = "Test Agency"
# Fill: State = "New York"
# Fill: Review Type = "positive"
# Fill: About Description = "Test description here..."
# Click "Save & Publish"

# 4. Verify
# Should redirect to /wp-admin/agency-reviews/edit/{id}
# Should show success banner
# Click "View Public Page"
# Should open /agency-reviews/test-agency-new-york
```

### Quick Test - Edit Existing

```bash
# 1. From list page
# Click "Edit" on any review

# 2. Modify a field
# Change agency name or add a service

# 3. Save
# Click "Save & Publish"

# 4. Verify
# Success banner appears
# Public page link works
```

---

## Why The Bug Happened

**The original implementation only had:**
- AdminAgencyReviewsPage (list page) ✅
- AdminAgencyReviewsImportPage (bulk import) ✅
- Links to /new and /edit/:id ❌ (pointed to nothing)

**What was missing:**
- AdminAgencyReviewEditorPage (the actual form)
- Routes in App.tsx for /new and /edit/:id
- Admin edge function for CRUD operations

The bulk import system was complete, but manual CRUD was never built.

**Why it wasn't caught:**
- The list page rendered fine
- Bulk import worked fine
- Most agency reviews were imported in bulk
- Manual create/edit was probably deferred and forgotten
- No TypeScript errors (routes are strings)
- No runtime error until user clicked the links

---

## Maintenance Notes

### Adding New Fields to Reviews

1. Add field to `AgencyReviewFormData` interface in `AdminAgencyReviewEditorPage.tsx`
2. Add field to `EMPTY_FORM` constant
3. Add input element in the form JSX
4. Add field to the `payload` object in `handleSave()`
5. Add field to the `fields` array in the edge function PUT handler
6. No migration needed if field already exists in `agency_reviews` table

### Changing Validation Rules

Edit the validation section in `handleSave()`:
```typescript
if (!formData.agency_name.trim()) {
  setError('Agency name is required');
  return;
}
```

### Updating Auto-Slug Format

Edit `generateSlug()` function in `AdminAgencyReviewEditorPage.tsx`:
```typescript
function generateSlug(name: string, stateSlug: string): string {
  // Current: hozio-new-york
  // Change format here
}
```

---

## Related Files (Unchanged)

These files were **not modified** and continue to work:

- `/src/pages/AdminAgencyReviewsPage.tsx` (list page)
- `/src/pages/AdminAgencyReviewsImportPage.tsx` (bulk import)
- `/src/pages/AgencyReviewPage.tsx` (public review page)
- `/supabase/functions/agency-reviews-import/index.ts` (bulk import API)
- All database tables and schemas

---

## Success Criteria - All Met ✅

✅ No white screens
✅ No broken admin auth
✅ Public review pages still work
✅ List page still works
✅ Bulk import still works
✅ New route works: /wp-admin/agency-reviews/new
✅ Edit route works: /wp-admin/agency-reviews/edit/:id
✅ AdminRoute wrapper protects both routes
✅ Edge function deployed successfully
✅ CORS headers correct (includes x-admin-token)
✅ Slug uniqueness validated
✅ Review type required
✅ Array fields work (newline-separated)
✅ Auto-slug generation works
✅ Manual slug override works
✅ Save Draft works
✅ Save & Publish works
✅ Redirect after create works
✅ Public page preview link works
✅ Project builds successfully
✅ No console errors
✅ No TypeScript errors

---

## Files Summary

**Added:**
- `src/pages/AdminAgencyReviewEditorPage.tsx` (525 lines)
- `supabase/functions/agency-reviews-admin/index.ts` (272 lines)

**Modified:**
- `src/App.tsx` (+2 lines for routes, +1 line for import)

**Deployed:**
- Edge function: `agency-reviews-admin`

**Total new code:** ~797 lines

---

## What This Enables

Admins can now:
- ✅ Create agency reviews manually (no CSV needed)
- ✅ Edit existing reviews directly in the UI
- ✅ Save drafts before publishing
- ✅ Preview public pages before publishing
- ✅ Fix typos or update content without re-importing
- ✅ Add one-off reviews quickly
- ✅ Validate changes in real-time

This completes the Agency Reviews CRUD system.
