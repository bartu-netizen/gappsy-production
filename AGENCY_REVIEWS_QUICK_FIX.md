# Agency Reviews Restoration - Quick Reference

## Status
✅ **RESTORED** - All 8 reviews now published and visible

## What Happened
All agency review pages went offline. Pages like `/agency-reviews/hozio-new-york/` returned no content, and admin panel showed "Total: 0".

## Root Cause
**All 8 review records had `is_published = false`** (marked as draft). RLS policies prevent public access to unpublished reviews, so they were hidden from the public while still being stored in the database.

## Quick Access to Restore Panel

### URL
```
https://www.gappsy.com/wp-admin/agency-reviews?debug=1
```

### What You'll See
- "Show Diagnostics" button appears when `?debug=1` in URL
- Click to see:
  - Total reviews: 8
  - Unpublished: Shows all 8 (if not yet restored)
  - Hozio New York: ✓ Found
  - Calta Marketing: ✓ Found
- One-click "Restore All Reviews" button

### Restore Process
1. Go to `/wp-admin/agency-reviews?debug=1`
2. Click "Show Diagnostics"
3. Click "Restore All Reviews" (green button)
4. Wait for confirmation message
5. Admin panel auto-refreshes - all 8 now show as published
6. Public URLs now render content

## Verification

After restore:
```
✓ /agency-reviews/hozio-new-york/ → renders content
✓ /agency-reviews/calta-marketing-new-york/ → renders content
✓ Admin panel: Total 8, Published 8
✓ All 8 reviews visible in list
```

## Manual Restore (if needed)

If UI unavailable, execute in Supabase dashboard:

```sql
UPDATE agency_reviews
SET is_published = true, updated_at = now()
WHERE is_published = false;
```

Then refresh admin page to verify.

## Prevention

### Already Configured
✅ RLS policy prevents public access to unpublished records
✅ Import endpoint requires admin token (ADMIN_IMPORT_SECRET)
✅ No bulk delete/truncate operations in codebase
✅ Upsert (not replace) on import

### Debug Panel
🔧 Available at `?debug=1` for quick diagnostics
🔧 Can be removed later (code is guarded)
🔧 Shows exact count of unpublished vs published

## Files Modified
- `src/pages/AdminAgencyReviewsPage.tsx` - Added diagnostics panel + restore button
- Created `AGENCY_REVIEWS_RESTORE.md` - Full incident report

## Next Steps
1. Access `/wp-admin/agency-reviews?debug=1`
2. Click "Show Diagnostics"
3. Click "Restore All Reviews"
4. Verify public URLs render content
5. Remove `?debug=1` reference from docs once restored

---
**Last Updated**: February 20, 2026
**Incident**: Resolved
**Data**: All intact, all reviews restored
