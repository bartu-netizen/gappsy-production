# Agency Reviews System Architecture

## Overview
Agency Reviews is a pure Supabase PostgreSQL system (NOT WordPress CPT). Reviews are stored in a custom table with RLS-based visibility control.

## Storage

### Table: `agency_reviews` (Supabase)
**Location**: Public schema
**Type**: PostgreSQL table
**Rows**: ~8 active reviews (expandable)

**Key Columns**:
- `id` - UUID primary key
- `agency_slug` - Unique identifier (upsert key)
- `agency_name` - Display name
- `state_slug`, `state_name` - Geographic
- `review_type` - 'positive' or 'negative'
- `is_published` - Boolean (CRITICAL: controls visibility)
- `is_top_25_ranked` - Boolean
- `uniqueness_score` - 0-100 (content quality)
- `about_description` - Main review text
- `strengths` / `concerns` - JSON arrays
- `fit_for` - JSON array
- Plus 15+ other fields for detailed review content
- `created_at`, `updated_at` - Timestamps

**Indexes**:
```
idx_agency_reviews_is_published (is_published, created_at DESC)
idx_agency_reviews_state_slug (state_slug)
idx_agency_reviews_review_type (review_type)
idx_agency_reviews_uniqueness_score (uniqueness_score DESC)
```

## Access Control (RLS Policies)

### Policy 1: Public Read
```sql
-- Anyone (including unauthenticated) can read ONLY published reviews
SELECT: WHERE is_published = true
```

**Effect**: Public pages `/agency-reviews/{slug}/` only load records with `is_published = true`

### Policy 2: Authenticated Read
```sql
-- Admins (authenticated) can read ALL reviews
SELECT: WHERE true
```

**Effect**: Admin panel shows all reviews regardless of publish status

### Policy 3: Admin-Only Insert
```sql
-- Only users with is_admin() = true can insert
INSERT: WHERE is_admin()
```

**Effect**: Only admins can create new reviews

### Policy 4: Admin-Only Update
```sql
-- Only admins can update their own records
UPDATE: WHERE is_admin() WITH CHECK is_admin()
```

**Effect**: Only admins can change publish status

### Policy 5: Service Role Full Access
```sql
-- Service role (edge functions) bypass RLS
ALL: WHERE true
```

**Effect**: Edge functions can import/update without auth checks

## Visibility Flows

### Public Page Request
```
User visits /agency-reviews/hozio-new-york/
  ↓
AgencyReviewPage.tsx loads review
  ↓
Supabase query: SELECT * WHERE agency_slug = 'hozio-new-york'
  ↓
RLS Policy applies (anon user)
  ↓
Policy checks: is_published = true?
  ↓
If true → Page renders content
If false → Query returns null → Page shows 404
```

### Admin Page Request
```
Admin visits /wp-admin/agency-reviews
  ↓
AdminAgencyReviewsPage.tsx loads reviews
  ↓
Supabase query: SELECT * FROM agency_reviews
  ↓
RLS Policy applies (authenticated user)
  ↓
Policy allows: SELECT WHERE true
  ↓
Admin sees ALL reviews (published + unpublished)
  ↓
Admin panel shows stats for all records
```

### Import Process
```
Admin imports CSV/JSON
  ↓
POST /functions/v1/agency-reviews-import
  ↓
Function verifies ADMIN_IMPORT_SECRET token
  ↓
Service role client created (bypasses RLS)
  ↓
For each row:
  - Check if agency_slug exists (upsert key)
  - If exists: UPDATE record
  - If new: INSERT record
  - Set is_published based on quality checks:
    * uniqueness_score >= 60?
    * about_description >= 400 chars?
    * services_offered >= 4 items?
    * strengths/concerns >= 4 items?
    * fit_for >= 3 items?
  ↓
Success: Return stats (inserted, updated, failed)
  ↓
Imported reviews may start as draft (is_published=false) until they meet publish eligibility
```

## The Incident

### What Caused It
Unknown trigger set ALL reviews to `is_published = false`

Possibilities:
1. Manual database update
2. Failed import with no auto-publish flag
3. Bulk action in admin (if one existed)
4. Data sync gone wrong

### Why It Looked Like Deletion
- Public pages: No content → appeared deleted (actually RLS blocking)
- Admin panel: Showed 0 published (but 8 total in draft)
- Confusing because data existed but was invisible

### Why It Was Safe
- ✅ All database rows intact
- ✅ No content lost
- ✅ RLS prevented public access (correct behavior)
- ✅ Simple flag flip to restore: `is_published = true`

## Restoration

### Automatic (Recommended)
```
1. Visit /wp-admin/agency-reviews?debug=1
2. Click "Show Diagnostics"
3. Click "Restore All Reviews"
4. Wait for success message
5. Auto-refresh happens
```

**What happens behind the scenes**:
```sql
UPDATE agency_reviews
SET is_published = true, updated_at = now()
WHERE is_published = false;
```

### Manual (if UI unavailable)
Execute in Supabase dashboard:
```sql
-- Check status
SELECT COUNT(*) FROM agency_reviews WHERE is_published = false;

-- Restore
UPDATE agency_reviews SET is_published = true WHERE is_published = false;

-- Verify
SELECT COUNT(*) FROM agency_reviews WHERE is_published = false; -- Should be 0
```

## Prevention

### Built-In Safeguards
1. **RLS Enforcement**: Public always sees only published
2. **Admin Token**: Import requires ADMIN_IMPORT_SECRET
3. **No Destructive Ops**: No DELETE/TRUNCATE in codebase
4. **Upsert Not Replace**: Import uses upsert (safe)
5. **Quality Gates**: Auto-publish only if content meets standards

### Monitoring (Recommended Future)
- [ ] Audit log for `is_published` changes
- [ ] Alert if published count drops > 50% in 1 hour
- [ ] Version history of content changes
- [ ] Scheduled backup exports

## Testing RLS

### Verify Public Access Blocked
```bash
curl -H "Authorization: Bearer $ANON_KEY" \
  "$SUPABASE_URL/rest/v1/agency_reviews?is_published=eq.false" \
  # Should return empty result set
```

### Verify Admin Access Allowed
```bash
curl -H "Authorization: Bearer $SERVICE_ROLE_KEY" \
  "$SUPABASE_URL/rest/v1/agency_reviews?is_published=eq.false" \
  # Should return unpublished records
```

### Verify Public Can Read Published
```bash
curl -H "Authorization: Bearer $ANON_KEY" \
  "$SUPABASE_URL/rest/v1/agency_reviews?is_published=eq.true" \
  # Should return published records
```

## System Health Checks

Run periodically to ensure system is working:

```sql
-- Check RLS policies exist
SELECT COUNT(*) FROM pg_policies
WHERE tablename = 'agency_reviews'
  AND policyname LIKE '%published%';
-- Should return 1 or 2

-- Check index on is_published
SELECT COUNT(*) FROM pg_indexes
WHERE tablename = 'agency_reviews'
  AND indexname LIKE '%published%';
-- Should return >= 1

-- Check review counts
SELECT
  COUNT(*) as total,
  COUNT(CASE WHEN is_published THEN 1 END) as published,
  COUNT(CASE WHEN NOT is_published THEN 1 END) as draft
FROM agency_reviews;

-- Check for orphaned reviews (should be 0)
SELECT COUNT(*) as orphaned
FROM agency_reviews
WHERE agency_slug IS NULL OR agency_slug = '';
```

## Deployment Checklist

When deploying changes to this system:
- [ ] RLS policies unchanged (critical)
- [ ] ADMIN_IMPORT_SECRET configured in env
- [ ] Test import with sample data
- [ ] Verify public page can't access unpublished
- [ ] Verify admin panel shows all reviews
- [ ] Test restore button (if modified)
- [ ] Run health checks above

---
**Last Updated**: February 20, 2026
**System Status**: Operational
**RLS**: Enforced ✓
**Public Access**: Safe (only published) ✓
