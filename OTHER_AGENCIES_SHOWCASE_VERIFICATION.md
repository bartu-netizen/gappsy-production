# Other Agencies Showcase - Quick Verification Guide

## 🎯 What Was Fixed

1. ✅ **Backend**: Proper paid status resolution from `agency_listings` table
2. ✅ **Backend**: Showcase priority sorting algorithm implemented
3. ✅ **Admin**: Email lookup now uses linked emails (consistent with agency-lookup tool)
4. ✅ **Frontend**: Already displaying 12 agencies (was already correct)
5. ✅ **Owner Mode**: Preserved - forced-first behavior unchanged

## 🚀 Quick Tests

### Test 1: Verify 12 Cards Display

```bash
# Open any state page in browser
# Count cards in "Other Agencies" section
# Expected: 12 cards visible
```

Example states to test:
- North Carolina: 6,317 agencies (plenty to test with)
- New York: 7,984 agencies
- New Jersey: 8,538 agencies

### Test 2: Email Lookup Consistency

```bash
# Open both admin tools and search for same email

# Tool 1: Agency Lookup
http://localhost:5173/wp-admin/email/agency-lookup
Search: info@clickset.com

# Tool 2: Other Agencies Manager
http://localhost:5173/wp-admin/other-agencies-manager
Search: info@clickset.com (no state selection needed)

# Expected: Both find the same agency
```

### Test 3: Admin Pinning Works

```sql
-- First, let's pin an agency manually in the database to test

-- Find an agency in North Carolina
SELECT id, name, showcase_pinned, showcase_position
FROM other_agencies
WHERE state_slug = 'north-carolina'
AND is_active = true
LIMIT 5;

-- Pin one to position 1
UPDATE other_agencies
SET showcase_pinned = true,
    showcase_position = 1,
    showcase_updated_by = 'test',
    showcase_updated_at = NOW()
WHERE id = '[AGENCY_ID_FROM_ABOVE]';

-- Now open the state page and verify it appears first in Other Agencies
```

Or use the admin UI:
1. Open `/wp-admin/other-agencies-manager`
2. Search for an agency
3. Expand row → Showcase tab
4. Toggle "Pin in Showcase" ON
5. Set position to 1
6. Save
7. Open state page → verify it's first

### Test 4: API Returns Proper Sorting

```bash
# Test the API directly
curl "http://localhost:54321/functions/v1/other-agencies-list?state=north-carolina&limit=20" \
  -H "Authorization: Bearer [ANON_KEY]" | jq '.agencies[] | {name, is_paid_listing}'

# Should see paid agencies first, then non-paid
```

### Test 5: Owner Mode Still Works

```bash
# Get an owner preview URL for an agency
# Open it in browser
# Expected:
# - Owner's agency appears FIRST in Other Agencies
# - Remaining 11 slots filled with normal showcase order
# - No duplication
```

## 📊 Database Queries for Verification

### Check Showcase Pinning

```sql
-- See all pinned agencies
SELECT state_slug, name, showcase_position, showcase_updated_at
FROM other_agencies
WHERE showcase_pinned = true
ORDER BY state_slug, showcase_position NULLS LAST;
```

### Check Paid Listings

```sql
-- See which agencies have active paid listings in North Carolina
SELECT oa.name, al.listing_tier, al.paid_active, oa.showcase_pinned, oa.showcase_position
FROM agency_listings al
JOIN other_agencies oa ON oa.id::text = al.agency_id
WHERE al.state_slug = 'north-carolina'
AND al.paid_active = true
ORDER BY oa.showcase_pinned DESC, oa.showcase_position NULLS LAST;
```

### Check Agency by Email (Linked Emails)

```sql
-- Verify email lookup works with linked emails table
SELECT oa.id, oa.name, oa.state_slug, oae.email_normalized, oae.is_primary
FROM other_agency_emails oae
JOIN other_agencies oa ON oa.id = oae.agency_id
WHERE oae.email_normalized = 'info@clickset.com'
AND oa.is_active = true;
```

## 🔧 Edge Functions Deployed

These functions have been deployed with the fixes:

1. **other-agencies-list**
   - Resolves effective paid status from agency_listings
   - Applies showcase priority sorting
   - Returns sorted agencies

2. **other-agencies-manager-api**
   - Email lookup now uses other_agency_emails table
   - Matches linked emails correctly
   - Consistent with agency-lookup tool

## ✅ Acceptance Criteria

All criteria have been met:

- [x] Display 12 agencies on state pages (not 4)
- [x] Showcase priority algorithm working
- [x] Admin pinning persists to database
- [x] Admin pinning affects live pages
- [x] Email lookup consistent across tools
- [x] Owner mode preserved (forced-first)
- [x] No duplication in owner mode
- [x] Works across all states
- [x] Build succeeds
- [x] Edge functions deployed

## 🐛 Troubleshooting

### Problem: Changes not appearing on state page

**Solution**: Clear cache or wait 2 minutes (cache TTL)

```javascript
// Cache is set in OtherAgenciesSection.tsx line 217
setCache(cacheKey, transformed, 120_000); // 2 minutes
```

### Problem: Agency not found by email in admin

**Check**:
1. Email exists in `other_agency_emails` table
2. Email is normalized correctly (lowercase, trimmed)
3. `exclude_from_agency_lookup` is false
4. Agency `is_active` is true

```sql
SELECT * FROM other_agency_emails
WHERE email_normalized = LOWER(TRIM('email@example.com'));
```

### Problem: Pinning doesn't seem to work

**Check**:
1. Database fields are set correctly
2. API is returning sorted results
3. Frontend isn't overriding the order (except for owner mode)

```sql
-- Verify database
SELECT showcase_pinned, showcase_position FROM other_agencies WHERE id = '[ID]';

-- Check API response
curl "localhost:54321/functions/v1/other-agencies-list?state=north-carolina&limit=5" \
  -H "Authorization: Bearer [KEY]" | jq '.agencies[0:5] | .[] | .name'
```

## 📝 Notes

### Cache Behavior

- **Cache Key**: `other-agencies-${stateSlug}`
- **TTL**: 2 minutes (120,000ms)
- **Location**: Frontend only (using dataCache utility)
- **Invalidation**: Automatic after TTL

### Owner Mode Override

When `priorityAgencyId` is set (owner preview or /your-agency funnel):
1. That agency is forced to position 0
2. Remaining 11 slots use normal showcase order
3. Priority agency is removed from normal pool (no duplication)

This is BY DESIGN and should NOT be changed.

### Showcase Position Conflicts

If multiple agencies have the same `showcase_position`:
- Both appear in showcase
- Sorted by position value
- Then by DB order (created_at DESC)
- Deterministic but not user-controllable

**Recommendation**: Use unique positions 1-12 to avoid conflicts.

## 📚 Documentation

Full documentation: `OTHER_AGENCIES_SHOWCASE_SYSTEM_COMPLETE.md`

## 🆘 Support

If issues persist:
1. Check edge function logs in Supabase dashboard
2. Verify database schema matches migration
3. Clear all caches (browser + CDN if applicable)
4. Check admin audit log for save events
5. Verify environment variables are set correctly
