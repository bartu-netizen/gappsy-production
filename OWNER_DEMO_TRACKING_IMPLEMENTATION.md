# Owner Demo Tracking Implementation

## Overview

Implemented privacy-first analytics tracking for agency owner availability demo simulations. This system tracks funnel progression without storing any personally identifiable information (PII) from the demo inputs.

## Purpose

- Track which agency owners view and complete the demo funnel
- Analyze funnel usage patterns and completion rates
- Identify which agencies are exploring the availability feature
- **Critical**: Do NOT store any demo submission data (email, name, messages)
- **Privacy**: Only log events and non-PII metadata

## Database Schema

### Table: `owner_demo_events`

**Location**: `supabase/migrations/[timestamp]_create_owner_demo_events_table.sql`

```sql
CREATE TABLE public.owner_demo_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz NOT NULL DEFAULT now(),
  event_name text NOT NULL,
  agency_id uuid REFERENCES public.other_agencies(id) ON DELETE CASCADE,
  state_slug text,
  agency_name text,
  source_page text,
  owner_user_id uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  metadata jsonb
);
```

**Columns**:
- `id` - Unique event identifier
- `created_at` - Timestamp when event occurred
- `event_name` - Type of event: `demo_opened`, `demo_submitted`, `demo_completed`
- `agency_id` - Optional agency UUID being demoed
- `state_slug` - State identifier (e.g., 'new-jersey')
- `agency_name` - Agency name for easier debugging/filtering
- `source_page` - URL pathname where event occurred
- `owner_user_id` - Optional authenticated user ID
- `metadata` - JSON object with non-PII data only

**Indexes**:
```sql
-- For agency-specific queries
idx_owner_demo_events_agency_id (agency_id, created_at DESC)

-- For user-specific queries
idx_owner_demo_events_user_id (owner_user_id, created_at DESC)

-- For event-type queries
idx_owner_demo_events_event_name (event_name, created_at DESC)

-- For chronological queries
idx_owner_demo_events_created_at (created_at DESC)
```

### Row Level Security (RLS)

**Status**: Enabled

**Policies**:

1. **Insert Policy**: "Authenticated users can log demo events"
   ```sql
   FOR INSERT TO authenticated
   WITH CHECK (true)
   ```
   - Only authenticated users can create events
   - Owner demos require authentication

2. **Select Policy**: "Authenticated users can view demo events"
   ```sql
   FOR SELECT TO authenticated
   USING (true)
   ```
   - Allows admins/owners to query their demo usage
   - Can be restricted further if needed

## Frontend Implementation

### Helper Utility

**File**: `src/utils/ownerDemoTracking.ts`

**Key Function**: `logOwnerDemoEvent(eventName, payload)`

**Event Types**:
```typescript
type DemoEventName = 'demo_opened' | 'demo_submitted' | 'demo_completed';
```

**Payload Interface**:
```typescript
interface DemoEventPayload {
  agencyId?: string | null;
  stateSlug?: string;
  agencyName?: string;
  service?: string;      // Dropdown value only
  budget?: string;       // Dropdown value only
  timeline?: string;     // Dropdown value only
  mode?: string;         // System value: 'owner-sim'
}
```

**PII Protection**:
- ✅ **Allowed**: Dropdown selections (service, budget, timeline)
- ✅ **Allowed**: System metadata (agencyId, stateSlug, agencyName, mode)
- ❌ **NEVER**: Email addresses
- ❌ **NEVER**: Names
- ❌ **NEVER**: Messages or free-text input
- ❌ **NEVER**: Any user-entered text fields

**Error Handling**:
```typescript
try {
  // Insert event
  const { error } = await supabase
    .from('owner_demo_events')
    .insert(eventData);

  if (error) {
    console.warn('[Demo Tracking] Failed to log event:', eventName, error);
    // Silent failure - does NOT break demo experience
  }
} catch (err) {
  console.warn('[Demo Tracking] Error logging event:', eventName, err);
  // Silent failure - does NOT break demo experience
}
```

**Key Features**:
- Silent failures (console.warn only)
- Never throws errors that could break the demo
- Automatically captures authenticated user ID if available
- Automatically captures current pathname as source_page

### Integration in AvailabilityModal

**File**: `src/AvailabilityModal.tsx`

**Import**:
```typescript
import { logOwnerDemoEvent } from './utils/ownerDemoTracking';
```

**Event 1: demo_opened**

**When**: Modal opens in owner-sim mode

**Location**: `useEffect` when `isOpen` changes to `true`

```typescript
useEffect(() => {
  if (isOpen) {
    // Reset form state...

    if (isOwnerSimulation) {
      logOwnerDemoEvent('demo_opened', {
        agencyId,
        stateSlug,
        agencyName,
        mode: 'owner-sim'
      });
    }
  }
}, [isOpen, isOwnerSimulation, agencyId, stateSlug, agencyName]);
```

**Data Captured**:
- Agency ID (if available)
- State slug
- Agency name
- Mode indicator
- Source page (automatic)
- User ID (automatic if authenticated)

**Event 2: demo_submitted**

**When**: Form is submitted (before animation starts)

**Location**: `resolveIdsAndSubmit()` function, before `setStep('animating')`

```typescript
if (isOwnerSimulation) {
  logOwnerDemoEvent('demo_submitted', {
    agencyId: finalAgencyId,
    stateSlug: finalStateSlug,
    agencyName,
    service: formData.service,      // Dropdown value
    budget: formData.budget,        // Dropdown value
    timeline: formData.timeline,    // Dropdown value
    mode: 'owner-sim'
  });
}

setIsResolvingIds(false);
setIsSubmitting(true);
setStep('animating');
```

**Data Captured**:
- All data from demo_opened, plus:
- Service selected (dropdown)
- Budget selected (dropdown)
- Timeline selected (dropdown)
- **NOT captured**: email, name (these are PII)

**Event 3: demo_completed**

**When**: Result screen is displayed

**Location**: `useEffect` when `step` changes to `'result'`

```typescript
useEffect(() => {
  if (step === 'result' && contentRef.current) {
    contentRef.current.scrollTop = 0;

    if (isOwnerSimulation) {
      logOwnerDemoEvent('demo_completed', {
        agencyId: frozenAgencyIdRef.current,
        stateSlug: frozenStateSlugRef.current,
        agencyName,
        service: formData.service,
        budget: formData.budget,
        timeline: formData.timeline,
        mode: 'owner-sim'
      });
    }
  }
}, [step, isOwnerSimulation, agencyName, formData.service, formData.budget, formData.timeline]);
```

**Data Captured**:
- Same as demo_submitted
- Confirms owner saw the final recommendation screen

## Data Flow

### Normal Owner Demo Sequence

```
1. Owner opens demo modal (mode='owner-sim')
   ↓
   EVENT: demo_opened
   - Record: agency_id, state_slug, agency_name, mode

2. Owner fills form: service, budget, timeline (and fake email/name for UX)
   ↓
   Owner clicks "Check Availability"
   ↓
   EVENT: demo_submitted
   - Record: service, budget, timeline (dropdown values only)
   - NOT recorded: email, name (PII)

3. Animation plays
   ↓
   Result screen shown with recommendation
   ↓
   EVENT: demo_completed
   - Record: completion of funnel
   - NOT recorded: any actual submission data
```

### What Gets Stored

**In owner_demo_events**:
```json
{
  "id": "uuid",
  "created_at": "2025-12-24T19:00:00Z",
  "event_name": "demo_submitted",
  "agency_id": "agency-uuid",
  "state_slug": "new-jersey",
  "agency_name": "Example Agency",
  "source_page": "/availability/owner/preview/example-agency",
  "owner_user_id": "user-uuid",
  "metadata": {
    "service": "SEO",
    "budget": "$5,000–$10,000",
    "timeline": "Within 30 days",
    "mode": "owner-sim"
  }
}
```

**NOT in owner_demo_events**:
- ❌ client_email (PII)
- ❌ client_name (PII)
- ❌ message or free-text fields (PII)
- ❌ Any actual form submission to agency_availability_requests

**NOT in agency_availability_requests**:
- ❌ Demo submissions are blocked (see `saveAvailabilityRequest()`)
- ❌ Early return when `mode === 'owner-sim'`

## Privacy Guarantees

### What We Track
✅ Funnel events (opened, submitted, completed)
✅ Which agency/state was being demoed
✅ Dropdown selections (service, budget, timeline)
✅ System metadata (mode, source_page)
✅ Authenticated user ID (to link events to owner)

### What We NEVER Track
❌ Email addresses entered in demo form
❌ Names entered in demo form
❌ Any free-text input
❌ Messages or descriptions
❌ Any PII from the demo inputs
❌ Actual availability request submissions

### Code Safeguards

1. **Type Safety**: TypeScript interface only allows non-PII fields
2. **Explicit Filtering**: Helper function only accepts specific fields
3. **No Submission**: `saveAvailabilityRequest()` returns early for demos
4. **Metadata Whitelisting**: Only allowed values go into metadata JSON

## Analytics Use Cases

### Funnel Analysis

**Question**: What's the completion rate of the owner demo?

**Query**:
```sql
WITH funnel AS (
  SELECT
    COUNT(*) FILTER (WHERE event_name = 'demo_opened') as opened,
    COUNT(*) FILTER (WHERE event_name = 'demo_submitted') as submitted,
    COUNT(*) FILTER (WHERE event_name = 'demo_completed') as completed
  FROM owner_demo_events
  WHERE created_at > now() - interval '30 days'
)
SELECT
  opened,
  submitted,
  completed,
  ROUND(100.0 * submitted / NULLIF(opened, 0), 1) as submit_rate,
  ROUND(100.0 * completed / NULLIF(opened, 0), 1) as completion_rate
FROM funnel;
```

### Agency-Specific Usage

**Question**: Which agencies are using the demo most?

**Query**:
```sql
SELECT
  agency_name,
  state_slug,
  COUNT(*) FILTER (WHERE event_name = 'demo_opened') as opens,
  COUNT(*) FILTER (WHERE event_name = 'demo_completed') as completions,
  ROUND(100.0 *
    COUNT(*) FILTER (WHERE event_name = 'demo_completed') /
    NULLIF(COUNT(*) FILTER (WHERE event_name = 'demo_opened'), 0),
  1) as completion_rate_pct
FROM owner_demo_events
WHERE created_at > now() - interval '30 days'
  AND agency_id IS NOT NULL
GROUP BY agency_name, state_slug
ORDER BY opens DESC
LIMIT 20;
```

### Drop-off Analysis

**Question**: Where do owners drop off in the funnel?

**Query**:
```sql
SELECT
  event_name,
  COUNT(*) as event_count,
  COUNT(DISTINCT owner_user_id) as unique_users
FROM owner_demo_events
WHERE created_at > now() - interval '7 days'
GROUP BY event_name
ORDER BY
  CASE event_name
    WHEN 'demo_opened' THEN 1
    WHEN 'demo_submitted' THEN 2
    WHEN 'demo_completed' THEN 3
  END;
```

### Service Interest

**Question**: What services are owners demoing?

**Query**:
```sql
SELECT
  metadata->>'service' as service,
  COUNT(*) as demo_count
FROM owner_demo_events
WHERE event_name = 'demo_submitted'
  AND created_at > now() - interval '30 days'
  AND metadata->>'service' IS NOT NULL
GROUP BY metadata->>'service'
ORDER BY demo_count DESC;
```

## Testing Guide

### Manual Test Flow

1. **Setup**: Ensure you're authenticated as an agency owner
2. **Open Demo**: Navigate to availability owner preview page
3. **Check Console**: Should see `[Demo Tracking]` logs
4. **Verify `demo_opened`**:
   ```sql
   SELECT * FROM owner_demo_events
   WHERE event_name = 'demo_opened'
   ORDER BY created_at DESC LIMIT 5;
   ```

5. **Fill Form**: Enter service, budget, timeline (fake email/name OK)
6. **Submit**: Click "Check Availability"
7. **Verify `demo_submitted`**:
   ```sql
   SELECT * FROM owner_demo_events
   WHERE event_name = 'demo_submitted'
   ORDER BY created_at DESC LIMIT 5;
   ```

8. **Wait for Result**: Let animation complete
9. **Verify `demo_completed`**:
   ```sql
   SELECT * FROM owner_demo_events
   WHERE event_name = 'demo_completed'
   ORDER BY created_at DESC LIMIT 5;
   ```

10. **Check No PII Leaked**:
    ```sql
    SELECT
      event_name,
      metadata
    FROM owner_demo_events
    ORDER BY created_at DESC
    LIMIT 10;
    -- Verify no email/name in metadata
    ```

11. **Verify No Real Submission**:
    ```sql
    SELECT COUNT(*)
    FROM agency_availability_requests
    WHERE source_page LIKE '%owner%'
      AND created_at > now() - interval '1 hour';
    -- Should be 0 for demo submissions
    ```

### Automated Test Scenarios

**Test 1: Events Fire in Sequence**
```typescript
// Mock test pseudocode
test('owner demo logs all three events', async () => {
  await openDemoModal({ mode: 'owner-sim' });
  expect(logOwnerDemoEvent).toHaveBeenCalledWith('demo_opened', ...);

  await fillForm({ service: 'SEO', budget: '$5k', timeline: 'ASAP' });
  await submit();
  expect(logOwnerDemoEvent).toHaveBeenCalledWith('demo_submitted', ...);

  await waitForResult();
  expect(logOwnerDemoEvent).toHaveBeenCalledWith('demo_completed', ...);
});
```

**Test 2: No PII in Metadata**
```typescript
test('never logs PII', async () => {
  await openDemoModal({ mode: 'owner-sim' });
  await fillForm({
    email: 'test@example.com',  // Should NOT be logged
    name: 'Test User',          // Should NOT be logged
    service: 'SEO'
  });
  await submit();

  const calls = logOwnerDemoEvent.mock.calls;
  calls.forEach(call => {
    const payload = call[1];
    expect(payload).not.toHaveProperty('email');
    expect(payload).not.toHaveProperty('name');
    expect(payload).not.toHaveProperty('clientEmail');
    expect(payload).not.toHaveProperty('clientName');
  });
});
```

**Test 3: Silent Failures Don't Break UX**
```typescript
test('logging errors do not prevent demo completion', async () => {
  // Mock Supabase to fail
  mockSupabaseInsert.mockRejectedValue(new Error('Network error'));

  await openDemoModal({ mode: 'owner-sim' });
  await fillForm({ service: 'SEO' });
  await submit();

  // Should complete despite logging failure
  expect(getResultScreen()).toBeVisible();
  expect(console.warn).toHaveBeenCalledWith(
    expect.stringContaining('[Demo Tracking] Failed')
  );
});
```

## Monitoring

### Key Metrics to Track

1. **Total Demo Opens** (last 24h, 7d, 30d)
2. **Demo Completion Rate** (completed / opened)
3. **Drop-off Rate** (submitted but not completed)
4. **Most Demoed Agencies** (by opens)
5. **Service Interest Distribution** (from submitted events)
6. **Average Time to Complete** (created_at of opened → completed)

### Alert Conditions

- ⚠️ Completion rate drops below 50% (potential UX issue)
- ⚠️ Zero demo events in last 24h (potential tracking failure)
- ⚠️ PII detected in metadata (data leak - CRITICAL)

## Files Modified/Created

### New Files
1. `supabase/migrations/[timestamp]_create_owner_demo_events_table.sql` - Database schema
2. `src/utils/ownerDemoTracking.ts` - Logging helper utility

### Modified Files
1. `src/AvailabilityModal.tsx` - Added event logging calls

## Security Considerations

### Data Retention

**Recommendation**: Consider implementing automatic cleanup of old events:

```sql
-- Optional: Create cleanup function (run monthly)
CREATE OR REPLACE FUNCTION cleanup_old_demo_events()
RETURNS void AS $$
BEGIN
  DELETE FROM owner_demo_events
  WHERE created_at < now() - interval '90 days';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
```

### Access Control

**Current**: All authenticated users can view all demo events

**Optional Restriction**: Limit to admins only
```sql
DROP POLICY "Authenticated users can view demo events" ON owner_demo_events;

CREATE POLICY "Only admins can view demo events"
  ON owner_demo_events
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM admin_users
      WHERE admin_users.user_id = auth.uid()
    )
  );
```

### Audit Trail

All events have:
- `created_at` timestamp (immutable)
- `owner_user_id` (who performed action)
- `source_page` (where it occurred)
- No UPDATE or DELETE policies (append-only log)

## Troubleshooting

### No Events Appearing

**Check 1**: Is user authenticated?
```sql
SELECT auth.uid();
-- Should return a UUID, not NULL
```

**Check 2**: Is RLS enabled?
```sql
SELECT tablename, rowsecurity
FROM pg_tables
WHERE tablename = 'owner_demo_events';
-- rowsecurity should be 't' (true)
```

**Check 3**: Check browser console for warnings
```
Look for: [Demo Tracking] Failed to log event
```

**Check 4**: Verify INSERT policy
```sql
SELECT * FROM pg_policies
WHERE tablename = 'owner_demo_events'
  AND cmd = 'INSERT';
```

### Events Missing Metadata

**Issue**: `metadata` column is NULL

**Cause**: All metadata fields were undefined/null

**Solution**: Ensure at least one metadata field has a value:
- service, budget, timeline, or mode

### Events Not Linked to User

**Issue**: `owner_user_id` is NULL

**Cause**: User not authenticated when event fired

**Solution**: Owner demos should only be accessible to authenticated users
- Check authentication flow before demo access
- Verify auth.users session is active

## Future Enhancements

### Potential Additions

1. **Session Tracking**: Group events by session ID
2. **Time Metrics**: Calculate time between events
3. **A/B Testing**: Track different demo variations
4. **Conversion Tracking**: Link demo to actual activation
5. **Heatmap Data**: Track which services/budgets are most common
6. **Exit Pages**: Track if owners leave before completing

### Schema Extensions

```sql
-- Optional: Add session tracking
ALTER TABLE owner_demo_events
  ADD COLUMN session_id text,
  ADD COLUMN device_type text,
  ADD COLUMN user_agent text;

-- Optional: Add timing data
ALTER TABLE owner_demo_events
  ADD COLUMN event_duration_ms integer;
```

## Compliance Notes

### GDPR Compliance

✅ **Compliant**: No PII stored in owner_demo_events
✅ **User Control**: Users can request deletion via owner_user_id
✅ **Transparency**: Owners can view their own events
✅ **Data Minimization**: Only necessary analytics data collected

### Data Subject Access Requests (DSAR)

**Query user's demo events**:
```sql
SELECT * FROM owner_demo_events
WHERE owner_user_id = '[user-uuid]'
ORDER BY created_at DESC;
```

**Delete user's demo events**:
```sql
DELETE FROM owner_demo_events
WHERE owner_user_id = '[user-uuid]';
```

**Note**: User deletion will cascade due to foreign key constraint:
```sql
owner_user_id uuid REFERENCES auth.users(id) ON DELETE SET NULL
```

## Success Criteria

✅ Demo events tracked without storing PII
✅ No email/name captured from demo inputs
✅ All three events (opened, submitted, completed) fire correctly
✅ Silent failures don't break demo experience
✅ Build passes without errors
✅ RLS policies protect data appropriately
✅ Database schema supports analytics queries
✅ Documentation complete for future maintenance

## Contact & Support

For questions about this implementation:
- See: `AVAILABILITY_FLOW.md` for overall system context
- See: `AGENCY_METRICS_NULL_GUARD_FIX.md` for related fix
- Database: `owner_demo_events` table
- Code: `src/utils/ownerDemoTracking.ts`
- Integration: `src/AvailabilityModal.tsx`
