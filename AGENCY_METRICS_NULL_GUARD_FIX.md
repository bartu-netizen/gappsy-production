# Agency Metrics NULL Guard Fix - Complete

## Problem Statement

**Error**: `Database error (23502): null value in column "agency_id" of relation "agency_metrics" violates not-null constraint`

**Root Cause**: The `update_agency_metrics()` trigger function was attempting to INSERT into `agency_metrics` table even when `agency_id` was NULL (placeholder agencies). The `agency_metrics.agency_id` column has a NOT NULL constraint, causing the insert to fail.

**Impact**: Availability request submissions for placeholder agencies (where no specific agency is selected, or agency doesn't exist in database) were failing completely.

## Solution

Added a NULL guard at the beginning of the `update_agency_metrics()` trigger function to return early when `agency_id` is NULL, skipping all metrics updates for placeholder agencies.

## Implementation

### Migration File
**File**: `supabase/migrations/20251224185054_fix_agency_metrics_null_guard.sql`

### Key Changes

```sql
CREATE OR REPLACE FUNCTION public.update_agency_metrics()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
BEGIN
  -- ✅ NEW: Early return if agency_id is NULL (placeholder agencies)
  -- Placeholder agencies should not update metrics
  IF NEW.agency_id IS NULL THEN
    RETURN NEW;
  END IF;

  -- Rest of function continues as before (only for real agencies)
  INSERT INTO public.agency_metrics (agency_id)
  VALUES (NEW.agency_id)
  ON CONFLICT (agency_id) DO NOTHING;

  -- Update metrics based on trigger table...
  IF TG_TABLE_NAME = 'agency_views' THEN
    -- Update view metrics
  ELSIF TG_TABLE_NAME = 'agency_availability_requests' THEN
    -- Update request metrics
  END IF;

  RETURN NEW;
END;
$$;
```

## What This Fixes

### Before Fix ❌
1. User submits availability request for placeholder agency
2. Frontend inserts into `agency_availability_requests` with `agency_id = NULL`
3. Trigger `update_metrics_on_request` fires
4. Function `update_agency_metrics()` attempts: `INSERT INTO agency_metrics (agency_id) VALUES (NULL)`
5. **ERROR**: NOT NULL constraint violation
6. Transaction rolls back
7. User sees: "Database error (23502): null value in column 'agency_id'..."

### After Fix ✅
1. User submits availability request for placeholder agency
2. Frontend inserts into `agency_availability_requests` with `agency_id = NULL`
3. Trigger `update_metrics_on_request` fires
4. Function `update_agency_metrics()` checks: `IF NEW.agency_id IS NULL THEN RETURN NEW`
5. **Function exits early** - no metrics update attempted
6. Transaction completes successfully
7. User sees: Success screen with recommendation

## Testing Performed

### Test 1: Placeholder Agency (NULL agency_id) ✅

**SQL Test**:
```sql
INSERT INTO public.agency_availability_requests (
  agency_id,
  state_slug,
  client_email,
  client_name,
  service,
  budget,
  timeline,
  source_page
)
VALUES (
  NULL,  -- placeholder agency
  'test-state-placeholder',
  'test-placeholder@example.com',
  'Test Placeholder User',
  'SEO',
  '$1,000–$5,000',
  'ASAP',
  '/test-placeholder'
)
RETURNING id, agency_id, client_email;
```

**Result**:
```
✅ Insert succeeded
✅ Row created with agency_id = NULL
✅ No row created in agency_metrics
✅ No error thrown
```

**Verification**:
```sql
SELECT COUNT(*) FROM agency_metrics WHERE agency_id IS NULL;
-- Result: 0 (correct - no metrics for NULL agency_id)
```

### Test 2: Real Agency (Valid agency_id) ✅

**SQL Test**:
```sql
INSERT INTO public.agency_availability_requests (
  agency_id,
  state_slug,
  client_email,
  client_name,
  service,
  budget,
  timeline,
  source_page
)
VALUES (
  'e748c792-3bc0-4c05-8eaa-33320f2d97e1',  -- real agency
  'new-jersey',
  'test-real@example.com',
  'Test Real User',
  'Web Design / Development',
  '$5,000–$10,000',
  'Within 30 days',
  '/test-real'
)
RETURNING id, agency_id, client_email;
```

**Result**:
```
✅ Insert succeeded
✅ Row created with agency_id = 'e748c792-3bc0-4c05-8eaa-33320f2d97e1'
✅ agency_metrics row created/updated
✅ availability_requests_last_30_days = 1
✅ last_request_at updated to timestamp
✅ No error thrown
```

**Verification**:
```sql
SELECT
  agency_id,
  availability_requests_last_30_days,
  last_request_at
FROM agency_metrics
WHERE agency_id = 'e748c792-3bc0-4c05-8eaa-33320f2d97e1';

-- Result: Row exists with count = 1 and timestamp updated
```

## Affected Triggers

The fixed function is used by these triggers:

1. **`update_metrics_on_view`** - Fires after INSERT on `agency_views`
   - Now skips if `agency_id` is NULL
   - Still updates metrics for real agencies

2. **`update_metrics_on_request`** - Fires after INSERT on `agency_availability_requests`
   - Now skips if `agency_id` is NULL (placeholder agencies)
   - Still updates metrics for real agencies

## Database Schema Context

### agency_availability_requests Table
```sql
Column                  Type        Nullable
--------------------------------------------------
id                      uuid        NO (default: gen_random_uuid())
agency_id               uuid        YES  ← Can be NULL for placeholders
state_slug              text        YES
client_email            text        YES
client_name             text        YES
service                 text        YES
budget                  text        YES
timeline                text        YES
source_page             text        YES
routed_to_agency_id     uuid        YES
agency_name             text        YES
agency_website          text        YES
agency_slug             text        YES
created_at              timestamptz YES (default: now())
```

### agency_metrics Table
```sql
Column                              Type        Nullable
----------------------------------------------------------
id                                  uuid        NO (default: gen_random_uuid())
agency_id                           uuid        NO  ← NOT NULL (requires valid agency)
view_count_last_30_days            integer     YES (default: 0)
availability_requests_last_30_days integer     YES (default: 0)
last_view_at                       timestamptz YES
last_request_at                    timestamptz YES
created_at                         timestamptz YES (default: now())
updated_at                         timestamptz YES (default: now())
```

**Key Constraint**: `agency_metrics.agency_id` has:
- `NOT NULL` constraint
- `UNIQUE` constraint
- `FOREIGN KEY` to `other_agencies(id) ON DELETE CASCADE`

## Use Cases

### Placeholder Agency Scenarios
Placeholder agencies occur when:
1. User submits request from a state page without selecting specific agency
2. Agency name provided doesn't exist in database
3. Agency lookup fails or returns no results
4. Generic "get matched" form submissions

**These are VALID use cases** - we want to collect these leads even if we don't have a specific agency match yet. The backend can later route these to appropriate agencies.

### Real Agency Scenarios
Real agencies occur when:
1. User clicks "Check Availability" on a specific agency card
2. Agency is successfully looked up by slug or name
3. Agency exists in `other_agencies` table
4. `agency_id` is a valid UUID reference

**These should update metrics** - we want to track how many availability requests each agency receives.

## Security Considerations

✅ No security changes - function still runs with `SECURITY DEFINER`
✅ RLS policies unchanged
✅ Trigger permissions unchanged
✅ Early return is safe - just skips metrics update

## Performance Considerations

✅ **Improved performance for placeholder agencies** - Function exits immediately instead of attempting failed INSERT
✅ **No performance impact for real agencies** - Same logic path as before
✅ **Reduced error overhead** - No rollback/retry cycles for NULL agency_id

## Frontend Behavior

The frontend code in `src/AvailabilityModal.tsx` remains unchanged. It already handles both scenarios:

```javascript
const payload = {
  agency_id: finalAgencyId || null,  // NULL for placeholders
  state_slug: finalStateSlug,
  client_email: formData.email,
  // ... other fields
};

const { error } = await supabase
  .from('agency_availability_requests')
  .insert(payload);
```

The fix is entirely database-side, making it transparent to the frontend.

## Rollback Plan

If issues arise, the previous version of the function can be restored by removing the NULL guard:

```sql
CREATE OR REPLACE FUNCTION public.update_agency_metrics()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
BEGIN
  -- Remove the IF NEW.agency_id IS NULL check
  -- Function continues with original logic
  INSERT INTO public.agency_metrics (agency_id)
  VALUES (NEW.agency_id)
  ON CONFLICT (agency_id) DO NOTHING;
  -- ...
END;
$$;
```

**However**, this would re-introduce the original bug where placeholder agencies fail to submit.

## Files Modified

1. `supabase/migrations/20251224185054_fix_agency_metrics_null_guard.sql` - New migration with NULL guard

## Verification Checklist

✅ Placeholder agency submission succeeds (agency_id = null)
✅ No row created in agency_metrics for NULL agency_id
✅ Real agency submission succeeds (agency_id = valid UUID)
✅ agency_metrics row created/updated for real agency
✅ Trigger still fires for both scenarios
✅ Function exits early for NULL, continues normally for valid UUID
✅ No 23502 error
✅ Build passes
✅ Frontend code unchanged (database-only fix)
✅ Performance improved for placeholder agencies

## Next Steps

1. ✅ Test in development using the dev test button
2. ✅ Test with real form submissions for both scenarios
3. Monitor production logs for any related errors
4. Consider adding similar NULL guards to other trigger functions if needed
5. Document placeholder agency routing logic in admin dashboard

## Related Documentation

- `AVAILABILITY_MODAL_FIX_COMPLETE.md` - Previous fix for RLS policies
- `AVAILABILITY_FLOW.md` - Overall availability system documentation
- Database migration: `20251202032329_create_other_agencies_tracking.sql` - Original table creation
- Database migration: `20251202211451_20251202_fix_security_and_performance_issues.sql` - Previous function update

## Success Criteria Met

✅ Placeholder agencies (agency_id = null) → Insert succeeds, no metrics write, user sees success
✅ Real agencies (agency_id set) → Insert succeeds, metrics updated, user sees success
✅ No more error 23502
✅ Build passes
✅ Tests confirm both scenarios work correctly
