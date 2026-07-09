# Availability Modal - Strict Paid Detection Fix

## Problem

The positive "Good news — available..." message was incorrectly showing for **placeholder (non-paid)** agencies. This created a poor user experience and violated the business rule that only truly paid Top-25 agencies should receive positive treatment.

### Root Cause

The previous implementation was too permissive in its paid detection:

1. **Name-based matching**: Queried `top25_slots` by agency name, which could match any record
2. **No ID validation**: Did not require a valid `agencyId` to be provided
3. **Assumed all top25_slots matches were paid**: If a record was found in `top25_slots`, it used the `is_paid` flag directly without validating the agency identity

This led to false positives where placeholder agencies (which have no real `agencyId`) could be incorrectly classified as paid.

## Solution: Strict Paid Detection

The new implementation uses **deterministic, ID-based paid classification** with these rules:

### 1. Agency ID is REQUIRED for Paid Status

```typescript
if (!finalAgencyId) {
  console.log('[AvailabilityModal] No agencyId provided - treating as placeholder (non-paid)');
  isPaidFlag = false;
  paidCheckReason = 'no-agency-id-placeholder';
  setIsPaidAvailability(false);
  // ... route to fallback agency
  return;
}
```

**Rule**: If `agencyId` is not provided (null/undefined), the agency is ALWAYS treated as non-paid, regardless of name or any other factors.

### 2. ID-Based Database Lookup

```typescript
// Query by exact ID match only
const { data: otherAgencyData } = await supabase
  .from('other_agencies')
  .select('...')
  .eq('id', finalAgencyId)
  .maybeSingle();

const { data: top25SlotData } = await supabase
  .from('top25_slots')
  .select('...')
  .eq('id', finalAgencyId)  // ← ID match only, not name
  .maybeSingle();
```

**Rule**: Agencies are looked up by their UUID only. Name-based lookups are NOT used for paid classification.

### 3. Explicit Paid Flag Check

```typescript
if (otherAgencyData) {
  isPaidFlag = !!otherAgencyData.is_paid_listing;
  paidCheckReason = isPaidFlag
    ? 'other-agencies-is-paid-listing-true'
    : 'other-agencies-is-paid-listing-false';
} else if (top25SlotData) {
  isPaidFlag = !!top25SlotData.is_paid;
  paidCheckReason = isPaidFlag
    ? 'top25-slots-is-paid-true'
    : 'top25-slots-is-paid-false';
}
```

**Rule**: Paid status is determined ONLY by the boolean flags in the database:
- `other_agencies.is_paid_listing`
- `top25_slots.is_paid`

### 4. Comprehensive Debug Logging

```typescript
console.log('[AvailabilityModal] paid check', {
  sourceAgencyId: finalAgencyId,
  sourceIsPaidFlag: displayAgency?.is_paid_listing ?? null,
  paidSlotMatch: top25SlotData ? { id: top25SlotData.id, is_paid: top25SlotData.is_paid } : null,
  finalIsPaid: isPaidFlag,
  reason: paidCheckReason
});
```

**Purpose**: Makes it easy to debug and verify paid classification in browser console.

## How Agency Types are Handled

### Paid Agencies (Vazagency, etc.)

**Data Flow**:
1. User clicks "Check Availability" on Vazagency (rank 1)
2. `agencyId` = `"2ddd4ded-6937-42d9-b17f-5859904d5b59"` (UUID from top25_slots)
3. Modal queries `top25_slots` by this ID
4. Finds record with `is_paid = true`
5. Sets `isPaidFlag = true`, reason: `"top25-slots-is-paid-true"`

**Result**:
- ✅ **Positive message**: "Good news — based on your project details, Vazagency is available and ready to connect."
- ✅ **Same agency card**: Shows Vazagency
- ✅ **Auto-redirect**: Redirects to `https://vazagency.com`
- ✅ **CTA button**: Opens Vazagency website

### Placeholder Agencies (JSON-based)

**Data Flow**:
1. User clicks "Check Availability" on "Garden State Digital" (rank 2, placeholder)
2. `agencyId` = `undefined` (placeholders have no ID in MergedAgency)
3. Modal detects `!finalAgencyId`
4. Sets `isPaidFlag = false`, reason: `"no-agency-id-placeholder"`

**Result**:
- ✅ **Negative message**: "This New Jersey Agency is a better fit for your project."
- ✅ **Fallback agency card**: Shows state's recommended agency
- ✅ **No auto-redirect to placeholder**: Redirects to fallback agency

### Non-Paid Real Agencies (other_agencies with is_paid_listing = false)

**Data Flow**:
1. User clicks on agency with real ID but `is_paid_listing = false`
2. `agencyId` = valid UUID
3. Modal queries `other_agencies` by ID
4. Finds record with `is_paid_listing = false`
5. Sets `isPaidFlag = false`, reason: `"other-agencies-is-paid-listing-false"`

**Result**:
- ✅ **Negative message**: "This [State] Agency is a better fit for your project."
- ✅ **Fallback routing**: Shows state's recommended agency

## Database Verification

### Vazagency (Paid)

```sql
SELECT id, state_slug, rank, agency_name, is_paid, website
FROM top25_slots
WHERE agency_name = 'Vazagency'
  AND state_slug = 'new-jersey';
```

**Result**:
```
id: 2ddd4ded-6937-42d9-b17f-5859904d5b59
state_slug: new-jersey
rank: 1
agency_name: Vazagency
is_paid: true
website: https://vazagency.com
```

✅ **Has valid UUID**
✅ **is_paid = true**
✅ **Will show positive message**

### Placeholder Slots

```sql
SELECT id, state_slug, rank, agency_name, is_paid
FROM top25_slots
WHERE state_slug = 'new-jersey'
  AND rank > 1
LIMIT 5;
```

**Result**:
```
id: 7f1a6a25-f2e0-41cf-a887-5391a5522f0e
state_slug: new-jersey
rank: 2
agency_name: NULL
is_paid: false
```

✅ **agency_name is NULL** (merged with JSON placeholder data)
✅ **is_paid = false**
✅ **MergedAgency has no `id` field**
✅ **Will show negative message**

## Agency Merger Integration

The `agencyMerger.ts` creates `MergedAgency` objects:

```typescript
// Paid agencies (from top25_slots where is_paid = true)
const paid = paidAgencies.data?.find((a) => a.rank === rank);
if (paid) {
  return {
    rank: paid.rank,
    name: paid.agency_name,
    website: paid.website,
    logoUrl: paid.logo_url,
    isPaid: true,
    id: paid.id,  // ← UUID present for paid agencies
    claimedAt: paid.claimed_at
  };
}

// Placeholder agencies (from JSON file)
const placeholder = placeholderData.agencies.find((a) => a.rank === rank);
if (placeholder) {
  return {
    rank: placeholder.rank,
    name: placeholder.name,
    website: placeholder.website,
    logoUrl: placeholder.logoUrl,
    isPaid: false,
    // ← NO id field for placeholders
  };
}
```

**Key Difference**:
- Paid agencies have `id: string` (UUID)
- Placeholder agencies have no `id` field (`id: undefined`)

When `openAvailabilityModal` is called:

```typescript
// For paid agency
openAvailabilityModal(
  agency.id,          // ← "2ddd4ded-6937-42d9-b17f-5859904d5b59"
  agency.name,        // ← "Vazagency"
  agency.rank,
  agency.website
);

// For placeholder
openAvailabilityModal(
  agency.id,          // ← undefined
  agency.name,        // ← "Garden State Digital"
  agency.rank,
  agency.website
);
```

The `agencyId` prop determines paid classification.

## Acceptance Tests

### Test 1: Vazagency (Paid) - New Jersey

**Steps**:
1. Go to `/marketing-agencies-in-new-jersey-united-states`
2. Find "Vazagency" at rank 1
3. Click "Check Availability"
4. Fill form and submit

**Expected Console Log**:
```
[AvailabilityModal] paid check {
  sourceAgencyId: "2ddd4ded-6937-42d9-b17f-5859904d5b59",
  sourceIsPaidFlag: true,
  paidSlotMatch: { id: "2ddd4ded-6937-42d9-b17f-5859904d5b59", is_paid: true },
  finalIsPaid: true,
  reason: "top25-slots-is-paid-true"
}
```

**Expected UI**:
- ✅ Headline: "Good news — based on your project details, Vazagency is available and ready to connect."
- ✅ Card shows: Vazagency
- ✅ Auto-redirect countdown to vazagency.com
- ✅ Button: "Visit Website →" (opens vazagency.com)

### Test 2: Vazagency (Paid) - Alabama

**Steps**:
1. Go to `/marketing-agencies-in-alabama-united-states`
2. Find "Vazagency" at rank 1
3. Click "Check Availability"
4. Fill form and submit

**Expected Console Log**:
```
[AvailabilityModal] paid check {
  sourceAgencyId: "fcab4e80-9c9b-490c-8de4-e6755d848e41",
  sourceIsPaidFlag: false,  ← Note: Alabama Vazagency is not paid
  paidSlotMatch: { id: "fcab4e80-...", is_paid: false },
  finalIsPaid: false,
  reason: "top25-slots-is-paid-false"
}
```

**Expected UI** (because is_paid = false in Alabama):
- ✅ Headline: "This Alabama Agency is a better fit for your project."
- ✅ Card shows: Fallback recommended agency (not Vazagency)

### Test 3: Placeholder Agency (Non-Paid)

**Steps**:
1. Go to New Jersey state page
2. Find any placeholder agency (e.g., rank 2-25 that's not paid)
3. Click "Check Availability"
4. Fill form and submit

**Expected Console Log**:
```
[AvailabilityModal] paid check {
  sourceAgencyId: null,
  sourceIsPaidFlag: null,
  paidSlotMatch: null,
  finalIsPaid: false,
  reason: "no-agency-id-placeholder"
}
```

**Expected UI**:
- ✅ Headline: "This New Jersey Agency is a better fit for your project."
- ✅ Card shows: Fallback recommended agency
- ✅ No auto-redirect to placeholder website

### Test 4: Other Agency (Non-Paid)

**Prerequisite**: Create test agency in `other_agencies` with `is_paid_listing = false`

```sql
INSERT INTO other_agencies (
  id, name, state_slug, is_paid_listing, website_url, city, state
) VALUES (
  gen_random_uuid(), 'Test Agency', 'new-jersey', false,
  'https://test.com', 'Newark', 'New Jersey'
);
```

**Expected Console Log**:
```
[AvailabilityModal] paid check {
  sourceAgencyId: "[uuid]",
  sourceIsPaidFlag: false,
  paidSlotMatch: null,
  finalIsPaid: false,
  reason: "other-agencies-is-paid-listing-false"
}
```

**Expected UI**:
- ✅ Headline: "This New Jersey Agency is a better fit for your project."
- ✅ Card shows: Fallback recommended agency

## Anti-Regression Safeguards

### 1. Early Return for No Agency ID

```typescript
if (!finalAgencyId) {
  // Immediately set non-paid and return
  // Prevents any further logic from running
  return;
}
```

**Guarantee**: Placeholders can NEVER be treated as paid.

### 2. ID-Only Queries

```typescript
// NEVER query by name
.eq('id', finalAgencyId)  // ✓ Correct
// .eq('agency_name', agencyName)  // ✗ Never use this for paid check
```

**Guarantee**: Name similarity cannot cause false positives.

### 3. Explicit Boolean Coercion

```typescript
isPaidFlag = !!otherAgencyData.is_paid_listing;
```

**Guarantee**: Only `true` values result in paid status; `null`, `undefined`, `false`, `0`, `''` all result in non-paid.

### 4. Reason Tracking

Every paid check logs a specific reason string:
- `"no-agency-id-placeholder"`
- `"other-agencies-is-paid-listing-true"`
- `"other-agencies-is-paid-listing-false"`
- `"top25-slots-is-paid-true"`
- `"top25-slots-is-paid-false"`
- `"agency-id-not-found-in-db"`

**Guarantee**: Can always trace why an agency was classified as paid or non-paid.

### 5. Null Safety

```typescript
setSourceAgency(displayAgency);  // Could be null
setIsPaidAvailability(isPaidFlag);  // Always boolean

if (!displayAgency) {
  // Handle gracefully
  setIsPaidAvailability(false);
  return;
}
```

**Guarantee**: Missing data defaults to non-paid (safe fallback).

## Files Modified

### `src/AvailabilityModal.tsx` (Lines 229-444)

**Changes**:
1. Removed name-based fallback query for agencies
2. Added explicit early return for missing `agencyId`
3. Changed paid detection to strict ID-based lookup
4. Added comprehensive debug logging
5. Separated display data fetching from paid classification
6. Added reason tracking for all paid check paths

## Debugging Tips

### Check Browser Console

When the modal reaches the "animating" step, look for:

```
[AvailabilityModal] paid check { ... }
```

**Key Fields**:
- `sourceAgencyId`: Should be a UUID for paid agencies, `null` for placeholders
- `finalIsPaid`: The final paid/non-paid decision
- `reason`: Explains why the decision was made

### Verify Agency Data

```sql
-- Check if an agency should be paid
SELECT id, name, is_paid_listing
FROM other_agencies
WHERE id = '[uuid-from-console]';

-- OR

SELECT id, agency_name, is_paid
FROM top25_slots
WHERE id = '[uuid-from-console]';
```

### Common Issues

**Issue**: Paid agency showing negative message
**Debug**: Check console log reason. If reason is `"no-agency-id-placeholder"`, the agency ID is not being passed correctly from the grid.

**Issue**: Placeholder showing positive message
**Debug**: Check if placeholder has an `id` field in MergedAgency. If it does, the agencyMerger is incorrectly assigning IDs to placeholders.

**Issue**: Agency exists but showing "agency-id-not-found-in-db"
**Debug**: Verify the UUID in the database. The ID passed from the grid may not match any record.

## Future Improvements

### 1. Remove Unused top25_slots Rows

The empty slots (agency_name = NULL) in `top25_slots` are not used by the merger. Consider:

```sql
-- Clean up empty placeholder slots
DELETE FROM top25_slots
WHERE agency_name IS NULL
  AND is_paid = false;
```

**Benefit**: Clearer data model, no confusion about what slots represent.

### 2. Add Database Constraint

Ensure all paid agencies have required fields:

```sql
-- Validate paid agencies have necessary data
CREATE OR REPLACE FUNCTION validate_paid_agency()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.is_paid = true THEN
    IF NEW.agency_name IS NULL OR NEW.agency_name = '' THEN
      RAISE EXCEPTION 'Paid agencies must have an agency_name';
    END IF;
    IF NEW.website IS NULL OR NEW.website = '' THEN
      RAISE EXCEPTION 'Paid agencies must have a website';
    END IF;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_paid_agency_data
  BEFORE INSERT OR UPDATE ON top25_slots
  FOR EACH ROW
  EXECUTE FUNCTION validate_paid_agency();
```

### 3. Unified Agency Table

Consider merging `top25_slots` and `other_agencies` into a single source of truth:

```sql
CREATE TABLE agencies (
  id uuid PRIMARY KEY,
  name text NOT NULL,
  state_slug text NOT NULL,
  rank integer,
  is_paid boolean DEFAULT false,
  website_url text,
  -- ... other fields
);
```

**Benefits**:
- Single lookup path for paid detection
- No dual-table query logic
- Easier to maintain data consistency

## Performance Considerations

### Database Queries

The current implementation makes **2 queries** per availability check:

1. Query `other_agencies` by ID
2. Query `top25_slots` by ID

**Optimization**: Since most clicks will be on top25_slots agencies, we could query top25_slots first and only fall back to other_agencies if not found.

### Caching

The `frozenAgencyIdRef` ensures the agency ID doesn't change during the modal session, preventing redundant lookups.

## Security Notes

### No User Input in ID Lookup

The `finalAgencyId` comes from:
1. Props passed from the parent component
2. Initial database lookup by slug/name (in `resolveIdsAndSubmit`)

User input (agency name) is NOT directly used in the final paid detection query, preventing injection attacks.

### RLS Policies

Paid detection queries respect Supabase RLS policies:
- `top25_slots`: Public read access (safe for paid flag checks)
- `other_agencies`: Public read access for basic fields
- `agency_availability_requests`: Restricted writes

## Related Documentation

- `AVAILABILITY_PAID_FLOW_FIX.md` - Initial paid flow implementation
- `PAID_AVAILABILITY_IMPLEMENTATION.md` - Business requirements
- `agencyMerger.ts` - How paid/placeholder agencies are merged

## Support

For issues with paid detection:

1. Open browser console
2. Navigate to state page
3. Click "Check Availability" on the agency
4. Look for `[AvailabilityModal] paid check` log
5. Share the console output with the development team

The `reason` field will indicate exactly why the agency was classified as paid or non-paid.
