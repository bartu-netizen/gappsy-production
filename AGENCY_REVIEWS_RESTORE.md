# Agency Reviews Critical Restore - Incident Report

**Date**: February 20, 2026
**Status**: RESOLVED
**Severity**: HIGH

## Incident Summary

All 8 agency review pages went offline (showing 0 total in admin panel, URLs returning no content):
- `/agency-reviews/hozio-new-york/` (negative review)
- `/agency-reviews/calta-marketing-new-york/` (positive review)
- 6 additional state reviews across MA, CA, TX, WA, FL, IL

## Root Cause

**Database records existed but were marked as UNPUBLISHED (`is_published = false`)**

All 8 reviews were stored in the Supabase `agency_reviews` table but had `is_published = false`. Due to Row-Level Security (RLS) policies, only published reviews (`is_published = true`) are visible to the public. The admin UI queries all rows regardless of publish status, so admin panel showed them, but public pages could not access them.

### Storage System Architecture
- **Table**: `agency_reviews` (Supabase PostgreSQL)
- **Visibility Control**: `is_published` boolean column
- **RLS Policy**: Public SELECT only returns rows where `is_published = true`
- **No WordPress CPT**: This is NOT a WordPress post_type - it's a pure Supabase table

### Data Integrity
- ✅ No data was deleted or lost
- ✅ All 8 review records remained intact with full content
- ✅ UUIDs, timestamps, and metadata preserved
- ✅ Hozio and Calta Marketing reviews both found with full content

## Diagnostics

```
Total Reviews in Database:     8
Published (Public):            0
Unpublished (Draft):           8
Top 25 Ranked:                 4
Strong Content (≥80 score):    0

Reviews Status:
- Boston Marketing Collective (Massachusetts)
- Calta Marketing (New York) - review_type: positive
- Digital Wave Marketing (California)
- Hozio (New York) - review_type: negative
- Lone Star Digital Solutions (Texas)
- Pacific Northwest Digital (Washington)
- Sunshine Marketing Group (Florida)
- Windy City Marketing Partners (Illinois)
```

## Resolution Applied

### Step 1: Diagnostics Panel Added
Added debug mode diagnostics panel at `/wp-admin/agency-reviews?debug=1`:
- Shows total reviews in database
- Lists all unpublished reviews
- Checks for specific critical reviews (Hozio, Calta)
- Provides root cause analysis

### Step 2: Automatic Restore
Implemented one-click restore button:
```sql
UPDATE agency_reviews SET is_published = true WHERE is_published = false
```
Result: All 8 reviews set to `is_published = true` and restored to public visibility.

### Step 3: Verification
After restore:
- `/agency-reviews/hozio-new-york/` → renders content ✓
- `/agency-reviews/calta-marketing-new-york/` → renders content ✓
- Admin panel shows all 8 reviews published ✓
- Stats updated correctly ✓

## Code Changes

### Frontend (AdminAgencyReviewsPage.tsx)
- Added `?debug=1` query parameter gate for diagnostics UI
- "Show Diagnostics" button appears only when `?debug=1` active
- Diagnostics modal shows:
  - Database counts (total, published, unpublished)
  - Critical review status (Hozio & Calta)
  - List of all unpublished reviews
  - One-click "Restore All Reviews" button
- Success/error messages displayed after restore action

### Database
- No schema changes (existing RLS policies work correctly)
- RLS already prevents public access to unpublished reviews
- Restore is simply a `is_published` flag update

## Prevention Measures Implemented

### 1. Diagnostics for Quick Detection
- Debug panel accessible at `/wp-admin/agency-reviews?debug=1`
- Shows published vs unpublished count immediately
- Lists specific affected reviews
- No admin UI clutter when debug=1 not active

### 2. One-Click Restore
- Available in diagnostics modal
- Restores all unpublished reviews with single click
- Shows success/failure message
- Auto-refreshes admin page after restore

### 3. Protected Import Endpoint
- Agency Reviews import already requires `x-admin-token` header (ADMIN_IMPORT_SECRET)
- Token verified before any import proceeds
- No bulk delete/truncate operations in import logic
- Future imports use upsert (not replace) by default

### 4. RLS Provides Fail-Safe
- RLS policy ensures public cannot see `is_published = false` records
- Even if `is_published` mistakenly set to false, no data lost
- Records always recoverable via admin panel restore

## Manual Restore Procedure (if needed)

If diagnostics panel unavailable:

```sql
-- Check current status
SELECT COUNT(*) as total,
  COUNT(CASE WHEN is_published THEN 1 END) as published,
  COUNT(CASE WHEN NOT is_published THEN 1 END) as unpublished
FROM agency_reviews;

-- Restore all unpublished
UPDATE agency_reviews
SET is_published = true, updated_at = now()
WHERE is_published = false;

-- Verify restore
SELECT id, agency_slug, is_published, created_at
FROM agency_reviews
ORDER BY updated_at DESC
LIMIT 8;
```

## Access the Diagnostics Panel

**URL**: `https://www.gappsy.com/wp-admin/agency-reviews?debug=1`

**Who**: Admins only (blocked if not authenticated)
**What**: Shows database diagnostics + restore button
**When**: Use when reviews go missing or to verify publish status
**Remove**: Can be deleted later (code is guarded by `?debug=1` check)

## Future Safeguards

### Already In Place
✅ RLS policies enforce publish visibility
✅ Import endpoint requires admin token
✅ No destructive operations in codebase
✅ No auto-publish on import (manual or explicit)

### Recommended Additions (Out of scope for now)
- [ ] Audit log for `is_published` flag changes
- [ ] Admin notification if published count drops suddenly
- [ ] Version history of review content
- [ ] Export backup before bulk import operations

## Testing

Verified restore with:

**Before Restore**:
```
Admin Panel: Total: 8, Published: 0
Public URL (hozio-new-york): No content (404 via RLS)
Public URL (calta-marketing-new-york): No content (404 via RLS)
```

**After Restore**:
```
Admin Panel: Total: 8, Published: 8
Public URL (hozio-new-york): Full content visible ✓
Public URL (calta-marketing-new-york): Full content visible ✓
```

## Summary

- **Root Cause**: Reviews marked as unpublished (draft) by unknown trigger
- **Impact**: 8 public review pages went offline, admin panel still showed them
- **Data Loss**: None - all records and content intact
- **Resolution**: One-click restore button set `is_published = true`
- **Prevention**: Diagnostics panel for quick detection + RLS fail-safe
- **Status**: COMPLETE - All 8 reviews restored and public
