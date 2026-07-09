# Owner Demo Tracking - Quick Test Guide

## Quick Verification (2 minutes)

### Step 1: Open Owner Demo
1. Navigate to an agency owner preview page (mode='owner-sim')
2. Click "Check Availability" button
3. Modal opens

### Step 2: Check First Event
```sql
-- Verify demo_opened event was logged
SELECT
  event_name,
  agency_name,
  state_slug,
  created_at
FROM owner_demo_events
WHERE event_name = 'demo_opened'
ORDER BY created_at DESC
LIMIT 1;
```

**Expected**: One row with current timestamp

### Step 3: Submit Demo Form
1. Fill form:
   - Service: SEO
   - Budget: $5,000–$10,000
   - Timeline: Within 30 days
   - Email: fake@example.com (won't be stored)
   - Name: Test User (won't be stored)
2. Click "Check Availability"
3. Animation plays

### Step 4: Check Second Event
```sql
-- Verify demo_submitted event was logged
SELECT
  event_name,
  agency_name,
  metadata->>'service' as service,
  metadata->>'budget' as budget,
  metadata->>'timeline' as timeline,
  metadata,
  created_at
FROM owner_demo_events
WHERE event_name = 'demo_submitted'
ORDER BY created_at DESC
LIMIT 1;
```

**Expected**:
- One row with service/budget/timeline in metadata
- **NO email or name in metadata**

### Step 5: Wait for Result
1. Let animation complete
2. Result screen shows recommendation

### Step 6: Check Third Event
```sql
-- Verify demo_completed event was logged
SELECT
  event_name,
  agency_name,
  created_at
FROM owner_demo_events
WHERE event_name = 'demo_completed'
ORDER BY created_at DESC
LIMIT 1;
```

**Expected**: One row with current timestamp

### Step 7: Verify Complete Funnel
```sql
-- Check all three events for latest session
WITH latest_session AS (
  SELECT owner_user_id, MAX(created_at) as last_event
  FROM owner_demo_events
  GROUP BY owner_user_id
  ORDER BY last_event DESC
  LIMIT 1
)
SELECT
  ode.event_name,
  ode.agency_name,
  ode.metadata,
  ode.created_at
FROM owner_demo_events ode
JOIN latest_session ls ON ode.owner_user_id = ls.owner_user_id
WHERE ode.created_at > ls.last_event - interval '5 minutes'
ORDER BY ode.created_at ASC;
```

**Expected**: 3 rows (opened → submitted → completed)

## Critical Checks

### ✅ NO PII Stored
```sql
-- This should return ZERO rows
SELECT *
FROM owner_demo_events
WHERE
  metadata::text ILIKE '%@%' OR  -- email addresses
  metadata::text ILIKE '%test user%' OR  -- names
  metadata::text ILIKE '%fake%';  -- fake data
```

**Expected**: 0 rows (no PII in metadata)

### ✅ NO Demo Submissions in Requests Table
```sql
-- This should return ZERO rows
SELECT *
FROM agency_availability_requests
WHERE source_page LIKE '%owner%'
  OR source_page LIKE '%preview%'
  OR source_page LIKE '%simulate%'
  AND created_at > now() - interval '1 hour';
```

**Expected**: 0 rows (demos don't create real requests)

### ✅ Build Passes
```bash
npm run build
```

**Expected**: ✓ built in ~12s (no errors)

## Quick Stats Query

```sql
-- Overall demo funnel stats (last 7 days)
WITH stats AS (
  SELECT
    COUNT(*) FILTER (WHERE event_name = 'demo_opened') as opens,
    COUNT(*) FILTER (WHERE event_name = 'demo_submitted') as submits,
    COUNT(*) FILTER (WHERE event_name = 'demo_completed') as completions
  FROM owner_demo_events
  WHERE created_at > now() - interval '7 days'
)
SELECT
  opens,
  submits,
  completions,
  ROUND(100.0 * submits / NULLIF(opens, 0), 1) || '%' as submit_rate,
  ROUND(100.0 * completions / NULLIF(opens, 0), 1) || '%' as completion_rate
FROM stats;
```

## Troubleshooting

### No Events Appearing?

1. **Check authentication**:
   ```sql
   SELECT auth.uid();
   -- Should return UUID, not NULL
   ```

2. **Check RLS policies**:
   ```sql
   SELECT policyname, cmd
   FROM pg_policies
   WHERE tablename = 'owner_demo_events';
   -- Should show INSERT and SELECT policies
   ```

3. **Check browser console**:
   - Look for `[Demo Tracking]` logs
   - Check for any warnings/errors

### Events Missing owner_user_id?

**Issue**: User not authenticated during demo

**Fix**: Ensure owner demo pages require authentication

### Events Missing metadata?

**Issue**: All fields were undefined

**Verify**: At least one of service/budget/timeline has a value

## Success Checklist

- [ ] Three events appear in sequence (opened → submitted → completed)
- [ ] No email/name in metadata column
- [ ] No demo submissions in agency_availability_requests table
- [ ] Build passes without errors
- [ ] Console shows no [Demo Tracking] errors
- [ ] owner_user_id is populated (not NULL)
- [ ] metadata contains service/budget/timeline
- [ ] source_page shows correct pathname
- [ ] created_at timestamps are chronological

## Clean Up Test Data (Optional)

```sql
-- Delete test events (be careful!)
DELETE FROM owner_demo_events
WHERE
  agency_name LIKE '%test%' OR
  metadata->>'service' = 'Test Service' OR
  created_at < now() - interval '1 day';
```

## Admin Dashboard Query Ideas

### Today's Demo Activity
```sql
SELECT
  event_name,
  COUNT(*) as count,
  COUNT(DISTINCT owner_user_id) as unique_users
FROM owner_demo_events
WHERE created_at > CURRENT_DATE
GROUP BY event_name
ORDER BY
  CASE event_name
    WHEN 'demo_opened' THEN 1
    WHEN 'demo_submitted' THEN 2
    WHEN 'demo_completed' THEN 3
  END;
```

### Top Demoed Agencies
```sql
SELECT
  agency_name,
  state_slug,
  COUNT(*) FILTER (WHERE event_name = 'demo_opened') as demo_opens
FROM owner_demo_events
WHERE created_at > now() - interval '7 days'
  AND agency_name IS NOT NULL
GROUP BY agency_name, state_slug
ORDER BY demo_opens DESC
LIMIT 10;
```

### Service Interest
```sql
SELECT
  metadata->>'service' as service,
  COUNT(*) as selections
FROM owner_demo_events
WHERE event_name = 'demo_submitted'
  AND created_at > now() - interval '7 days'
  AND metadata->>'service' IS NOT NULL
GROUP BY metadata->>'service'
ORDER BY selections DESC;
```
