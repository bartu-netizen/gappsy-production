# End-to-End Paid Detection System

## Overview

This document describes the complete, deterministic paid detection system for Top25 agency listings. The system ensures that paid agencies ALWAYS receive positive "Good news — available" flow, while placeholders ALWAYS receive negative "better fit" flow.

## Core Principle

**A paid Top25 listing MUST always have a real database agency_id (UUID).**

- No agency_id → placeholder → cannot be reliably paid
- With agency_id AND is_paid=true → paid → positive flow

## Database Schema

### top25_slots Table

Source of truth for slot ownership and sellability.

**Key Columns**:
```sql
id                          uuid PRIMARY KEY
state_slug                  text NOT NULL
rank                        integer NOT NULL
agency_id                   uuid REFERENCES other_agencies(id)  -- NEW
is_paid                     boolean NOT NULL DEFAULT false
is_available                boolean NOT NULL DEFAULT true        -- NEW
purchased_at                timestamptz                          -- NEW
stripe_checkout_session_id  text                                 -- NEW
stripe_payment_intent_id    text                                 -- NEW
updated_at                  timestamptz DEFAULT now()            -- NEW
agency_name                 text (denormalized for display)
website                     text
logo_url                    text
description                 text
services                    text[]
short_description           text
show_lightning              boolean DEFAULT false
```

**Constraints**:
- UNIQUE(state_slug, rank) - prevents duplicate ranks
- INDEX(state_slug, is_available, is_paid) - for availability queries
- INDEX(agency_id) - for joins
- INDEX(updated_at DESC) - for cache invalidation

**Slot States**:

1. **Available for Purchase**:
   - agency_id = NULL
   - is_paid = false
   - is_available = true

2. **Claimed/Paid**:
   - agency_id = `<UUID>` (required)
   - is_paid = true
   - is_available = false
   - purchased_at = `<timestamp>`

3. **Reserved (admin placeholder)**:
   - agency_id = NULL
   - is_paid = false
   - is_available = false (optional - can reserve without payment)

### other_agencies Table

Source of truth for agencies.

**Key Columns**:
```sql
id                          uuid PRIMARY KEY
name                        text NOT NULL
slug                        text UNIQUE NOT NULL
state_slug                  text NOT NULL
state_name                  text NOT NULL
website_url                 text
is_paid_listing             boolean NOT NULL DEFAULT false
paid_listing_type           text (top25|spotlight|other_listing)
paid_listing_rank           integer
availability_redirect_enabled boolean NOT NULL DEFAULT false
availability_redirect_url   text
logo_url                    text
intro                       text
services                    text[]
```

## Data Flow

### 1. wp-Admin Manual Edit

**Edge Function**: `top25-admin-update`

**Process**:

1. Admin provides:
   - state_slug
   - rank
   - agency_name
   - website
   - logo_url (optional)
   - description (optional)
   - services (optional)

2. Function resolves agency_id:
   ```typescript
   // Try to find existing agency
   SELECT id FROM other_agencies
   WHERE state_slug = :stateSlug
     AND lower(name) = lower(:agencyName)
   LIMIT 1;

   // If not found, create new agency
   INSERT INTO other_agencies (
     name, slug, state_slug, state_name,
     website_url, is_paid_listing
   ) VALUES (
     :name, :slug, :stateSlug, :stateName,
     :website, true
   )
   RETURNING id;
   ```

3. Update top25_slots:
   ```typescript
   UPDATE top25_slots
   SET agency_id = :agencyId,
       agency_name = :agencyName,
       website = :website,
       logo_url = :logoUrl,
       description = :description,
       services = :services,
       is_paid = true,
       is_available = false,
       claimed_at = now(),
       updated_at = now()
   WHERE state_slug = :stateSlug
     AND rank = :rank;
   ```

4. Mark agency as paid:
   ```typescript
   UPDATE other_agencies
   SET is_paid_listing = true
   WHERE id = :agencyId;
   ```

**Result**:
- Slot has agency_id ✓
- Slot is marked is_paid=true, is_available=false ✓
- Agency marked as paid ✓
- Site immediately shows paid agency ✓

### 2. Stripe Purchase Flow

**Edge Function**: `stripe-webhook` (enhanced)

**Webhook Event**: `checkout.session.completed`

**Metadata Required**:
```typescript
{
  agencyId?: string,          // Optional - will be resolved if not provided
  agencyName: string,         // Required for resolution
  websiteUrl: string,         // Required
  stateSlug: string,          // Required
  rank: number,               // Required
  listingType: 'top25',       // Required
  checkoutSessionId: string,  // Stripe session ID
  upsellCardVisual?: boolean,
  upsellGetMatched?: boolean
}
```

**Process**:

1. Resolve agency_id (same logic as wp-admin):
   ```typescript
   if (!metadata.agencyId) {
     // Find or create agency in other_agencies
     // Return resolved agencyId
   }
   ```

2. Atomically claim slot:
   ```typescript
   UPDATE top25_slots
   SET agency_id = :agencyId,
       is_paid = true,
       is_available = false,
       purchased_at = now(),
       stripe_checkout_session_id = :sessionId,
       stripe_payment_intent_id = :paymentIntentId,
       updated_at = now()
   WHERE state_slug = :stateSlug
     AND rank = :rank
     AND is_available = true    -- Prevent double-sell
     AND is_paid = false         -- Prevent double-sell
     AND agency_id IS NULL;      -- Prevent double-sell
   ```

3. If UPDATE affected_rows = 0:
   - Log "slot already claimed"
   - Alert admin
   - Do NOT charge customer (Stripe handles this)

4. Mark agency as paid:
   ```typescript
   UPDATE other_agencies
   SET is_paid_listing = true,
       availability_redirect_enabled = true,
       availability_redirect_url = :websiteUrl
   WHERE id = :agencyId;
   ```

**Result**:
- Slot claimed atomically (prevents double-sell) ✓
- Slot has agency_id ✓
- Slot marked as paid and unavailable ✓
- Agency marked as paid ✓
- Site shows paid agency immediately ✓

### 3. Top25 Page Rendering

**File**: `src/utils/agencyMerger.ts`

**Function**: `getStateAgencies(stateSlug: string)`

**Query**:
```typescript
const paidAgencies = await supabase
  .from('top25_slots')
  .select('*')
  .eq('state_slug', stateSlug)
  .eq('is_paid', true)           // STRICT: must be paid
  .eq('is_available', false)      // STRICT: must be claimed
  .not('agency_id', 'is', null)   // STRICT: must have agency_id
  .order('rank', { ascending: true });
```

**Merge Logic**:
```typescript
for (rank = 1; rank <= 25; rank++) {
  const paid = paidAgencies.find(a => a.rank === rank);

  if (paid) {
    // PAID AGENCY - has slot ID
    return {
      rank: paid.rank,
      name: paid.agency_name,
      website: paid.website,
      logoUrl: paid.logo_url,
      description: paid.description,
      services: paid.services,
      isPaid: true,
      id: paid.id,              // ← top25_slots.id (slot UUID)
      claimedAt: paid.claimed_at
    };
  }

  const placeholder = placeholderData.agencies.find(a => a.rank === rank);

  if (placeholder) {
    // PLACEHOLDER - NO ID
    return {
      rank: placeholder.rank,
      name: placeholder.name,
      website: placeholder.website,
      logoUrl: placeholder.logoUrl,
      description: placeholder.description,
      services: placeholder.services,
      isPaid: false,
      // id: undefined          // ← NO ID for placeholders
    };
  }
}
```

**Result**:
- Paid agencies have `id` = top25_slots.id (slot UUID) ✓
- Placeholders have `id` = undefined ✓

### 4. Availability Modal Paid Detection

**File**: `src/AvailabilityModal.tsx`

**Input**: `agencyId` prop (passed from grid component)

**Detection Logic**:

```typescript
// STEP 1: Early return if no agency_id (placeholder)
if (!finalAgencyId) {
  isPaidFlag = false;
  paidCheckReason = 'no-agency-id-placeholder';
  setIsPaidAvailability(false);
  // Route to fallback recommended agency
  return;
}

// STEP 2: Query by ID (strict)
const { data: otherAgencyData } = await supabase
  .from('other_agencies')
  .select('id, name, website_url, is_paid_listing, ...')
  .eq('id', finalAgencyId)      // ← ID match only
  .maybeSingle();

const { data: top25SlotData } = await supabase
  .from('top25_slots')
  .select('id, agency_name, website, logo_url, description, is_paid, ...')
  .eq('id', finalAgencyId)      // ← ID match only
  .maybeSingle();

// STEP 3: Determine paid status from explicit flags
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
} else {
  isPaidFlag = false;
  paidCheckReason = 'agency-id-not-found-in-db';
}

// STEP 4: Debug log
console.log('[AvailabilityModal] paid check', {
  sourceAgencyId: finalAgencyId,
  sourceIsPaidFlag: displayAgency?.is_paid_listing ?? null,
  paidSlotMatch: top25SlotData ? { id: top25SlotData.id, is_paid: top25SlotData.is_paid } : null,
  finalIsPaid: isPaidFlag,
  reason: paidCheckReason
});

// STEP 5: Route based on paid status
if (isPaidFlag) {
  // POSITIVE FLOW
  setRoutedAgency(sourceAgency);
  // Show: "Good news — [Agency] is available and ready to connect."
  // Card: Source agency
  // Redirect: Agency website
} else {
  // NEGATIVE FLOW
  setRoutedAgency(fallbackRecommendedAgency);
  // Show: "This [State] Agency is a better fit for your project."
  // Card: Recommended agency
  // Redirect: Recommended agency website
}
```

**What Changed**:
1. ❌ Removed name-based fallback query
2. ❌ Removed fuzzy matching
3. ✅ Added strict early return for no agency_id
4. ✅ Added explicit paid flag checking
5. ✅ Added comprehensive debug logging
6. ✅ Added reason tracking

## Acceptance Tests

### Test 1: Vazagency (Paid) - New Jersey

**Setup**:
```sql
-- Verify Vazagency data
SELECT
  ts.id as slot_id,
  ts.agency_id,
  ts.is_paid,
  ts.is_available,
  oa.is_paid_listing
FROM top25_slots ts
JOIN other_agencies oa ON ts.agency_id = oa.id
WHERE ts.state_slug = 'new-jersey' AND ts.rank = 1;

-- Expected:
-- slot_id: 2ddd4ded-6937-42d9-b17f-5859904d5b59
-- agency_id: 86784964-0378-4654-a5a2-738a2f86a7a9
-- is_paid: true
-- is_available: false
-- is_paid_listing: true
```

**Test Steps**:
1. Navigate to `/marketing-agencies-in-new-jersey-united-states`
2. Find "Vazagency" at rank #1
3. Click "Check Availability"
4. Fill form (service, budget, timeline, email)
5. Submit

**Expected Console Log**:
```javascript
[AvailabilityModal] paid check {
  sourceAgencyId: "2ddd4ded-6937-42d9-b17f-5859904d5b59",
  sourceIsPaidFlag: true,
  paidSlotMatch: {
    id: "2ddd4ded-6937-42d9-b17f-5859904d5b59",
    is_paid: true
  },
  finalIsPaid: true,
  reason: "top25-slots-is-paid-true"
}
```

**Expected UI**:
- ✅ Headline: "Good news — based on your project details, Vazagency is available and ready to connect."
- ✅ Card: Vazagency (same agency clicked)
- ✅ Auto-redirect countdown to `https://vazagency.com`
- ✅ Button: "Visit Website →" (opens vazagency.com)

### Test 2: Placeholder Agency (Non-Paid)

**Setup**:
- Any placeholder agency (rank 2-25 without agency_id)
- Example: "Garden State Digital" at rank 2 in New Jersey

**Test Steps**:
1. Navigate to `/marketing-agencies-in-new-jersey-united-states`
2. Find placeholder agency (e.g., rank 2)
3. Click "Check Availability"
4. Fill form
5. Submit

**Expected Console Log**:
```javascript
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
- ✅ Card: Fallback recommended agency (NOT the clicked placeholder)
- ✅ Auto-redirect to fallback agency website
- ✅ NEVER shows "Good news" message

### Test 3: wp-Admin Manual Edit

**Test Steps**:
1. Admin navigates to wp-admin Top25 editor
2. Selects state: "Alabama"
3. Selects rank: #2
4. Fills in:
   - Agency Name: "Test Marketing Co"
   - Website: "https://testmarketing.com"
   - Description: "Great agency"
5. Saves

**Expected Backend Log**:
```
[top25-admin-update] Processing update for alabama rank 2: Test Marketing Co
[top25-admin-update] Creating new agency in other_agencies
[top25-admin-update] Created new agency: [uuid]
[top25-admin-update] Updating top25_slots with agency_id: [uuid]
[top25-admin-update] ✅ Successfully updated slot alabama rank 2 with agency_id [uuid]
```

**Expected Database State**:
```sql
-- top25_slots
SELECT * FROM top25_slots
WHERE state_slug = 'alabama' AND rank = 2;

-- agency_id: [new-uuid]
-- agency_name: "Test Marketing Co"
-- website: "https://testmarketing.com"
-- is_paid: true
-- is_available: false
-- claimed_at: [timestamp]

-- other_agencies
SELECT * FROM other_agencies WHERE id = [new-uuid];

-- name: "Test Marketing Co"
-- slug: "test-marketing-co-alabama"
-- is_paid_listing: true
```

**Expected Frontend**:
- Refresh Alabama page
- Rank #2 shows "Test Marketing Co"
- Click "Check Availability" → POSITIVE message

### Test 4: Stripe Purchase

**Test Steps**:
1. Customer clicks "Buy Slot #3" for California
2. Fills checkout form:
   - Agency Name: "Pacific Digital"
   - Email: "owner@pacificdigital.com"
   - Website: "https://pacificdigital.com"
3. Completes Stripe payment
4. Webhook fires

**Expected Webhook Log**:
```
[stripe-webhook] No agencyId provided, resolving from name and state
[stripe-webhook] Creating new agency in other_agencies
[stripe-webhook] Created new agency: [uuid]
[stripe-webhook] Claiming top25_slot: california rank 3
[stripe-webhook] ✅ Successfully claimed slot california rank 3 for agency [uuid]
```

**Expected Database State**:
```sql
-- top25_slots
SELECT * FROM top25_slots
WHERE state_slug = 'california' AND rank = 3;

-- agency_id: [new-uuid]
-- is_paid: true
-- is_available: false
-- purchased_at: [timestamp]
-- stripe_checkout_session_id: [session-id]

-- other_agencies
SELECT * FROM other_agencies WHERE id = [new-uuid];

-- name: "Pacific Digital"
-- is_paid_listing: true
-- availability_redirect_enabled: true
-- availability_redirect_url: "https://pacificdigital.com"
```

**Expected Frontend**:
- Refresh California page
- Rank #3 shows "Pacific Digital"
- Click "Check Availability" → POSITIVE message
- Auto-redirects to pacificdigital.com

### Test 5: Double-Sell Prevention

**Test Steps**:
1. Two customers simultaneously try to buy the same slot
2. Both complete Stripe checkout for California rank #4
3. Both webhooks fire at nearly the same time

**Expected Behavior**:
- First webhook UPDATE succeeds (affected_rows = 1)
- Second webhook UPDATE fails (affected_rows = 0)
- Second customer logs: "Slot california rank 4 already claimed or not available"
- Second customer NOT charged (Stripe handles refund)
- Admin receives alert about failed claim

**Database Verification**:
```sql
SELECT * FROM top25_slots
WHERE state_slug = 'california' AND rank = 4;

-- Only ONE agency_id set
-- Only ONE stripe_checkout_session_id
```

## Anti-Regression Safeguards

### 1. Database Constraints

```sql
-- Prevent duplicate ranks
UNIQUE(state_slug, rank)

-- Ensure proper indexing
INDEX(state_slug, is_available, is_paid)
INDEX(agency_id)
```

### 2. Query Strictness

```typescript
// agencyMerger.ts - STRICT paid query
.eq('is_paid', true)
.eq('is_available', false)
.not('agency_id', 'is', null)

// AvailabilityModal.tsx - STRICT ID-only queries
.eq('id', finalAgencyId)  // Never .eq('name', ...)
```

### 3. Early Return Guards

```typescript
// AvailabilityModal.tsx
if (!finalAgencyId) {
  // Immediately non-paid, prevent further logic
  return;
}
```

### 4. Atomic Operations

```typescript
// stripe-webhook - Atomic claim with conflict detection
UPDATE top25_slots
SET agency_id = :agencyId, ...
WHERE state_slug = :stateSlug
  AND rank = :rank
  AND is_available = true      // Atomic check
  AND is_paid = false          // Atomic check
  AND agency_id IS NULL;       // Atomic check
```

### 5. Comprehensive Logging

```typescript
// Every paid check logs reason
console.log('[AvailabilityModal] paid check', {
  sourceAgencyId,
  sourceIsPaidFlag,
  paidSlotMatch,
  finalIsPaid,
  reason  // Always present
});
```

## Debugging Guide

### Issue: Paid agency showing negative message

**Steps**:
1. Open browser console
2. Navigate to state page
3. Click "Check Availability" on the agency
4. Look for: `[AvailabilityModal] paid check`

**If reason = "no-agency-id-placeholder"**:
- Problem: Agency ID not being passed from grid
- Check: agencyMerger is setting `id: paid.id`
- Verify: Grid component passing `agencyId` prop

**If reason = "other-agencies-is-paid-listing-false"**:
- Problem: Agency exists but not marked paid
- Fix: Run `UPDATE other_agencies SET is_paid_listing = true WHERE id = '[uuid]'`

**If reason = "top25-slots-is-paid-false"**:
- Problem: Slot exists but not marked paid
- Fix: Run `UPDATE top25_slots SET is_paid = true, is_available = false WHERE id = '[uuid]'`

### Issue: Placeholder showing positive message

**Steps**:
1. Check console for `[AvailabilityModal] paid check`
2. If `sourceAgencyId` is NOT null, placeholder incorrectly has an ID

**Fix**:
- Check agencyMerger is NOT setting `id` for placeholders
- Verify placeholder data doesn't have `id` field in JSON
- Ensure merger only sets `id` for `paid` agencies

### Issue: Stripe purchase not showing up

**Steps**:
1. Check webhook logs for: `[stripe-webhook] ✅ Successfully claimed slot`
2. If missing, check for error logs
3. Verify metadata includes all required fields

**Common causes**:
- Missing `stateSlug` in metadata
- Missing `rank` in metadata
- Slot already claimed (affected_rows = 0)

**Fix**:
- Ensure checkout session includes complete metadata
- Check slot availability before payment
- Verify webhook receiving correct data

## Files Modified

### Database Migrations

**File**: `supabase/migrations/add_top25_slots_agency_id_and_tracking.sql`

- Added `agency_id` column (FK to other_agencies)
- Added `is_available` column (tracks sellability)
- Added Stripe tracking columns
- Created indexes
- Backfilled agency_id for existing paid slots
- Set is_available based on is_paid

### Edge Functions

**File**: `supabase/functions/top25-admin-update/index.ts` (NEW)

- Resolves or creates agency_id from name/state
- Updates top25_slots with agency_id
- Marks slot as paid and unavailable
- Marks agency as paid

**File**: `supabase/functions/stripe-webhook/index.ts` (ENHANCED)

- Enhanced `updateAgencyPaidStatus()` function
- Resolves or creates agency_id
- Atomically claims top25_slots
- Prevents double-sell with WHERE clause
- Logs comprehensive status

### Frontend

**File**: `src/utils/agencyMerger.ts` (ENHANCED)

- `getStateAgencies()`: Added strict filters (is_paid, is_available, agency_id NOT NULL)
- `getAvailableSpots()`: Changed to use `is_available` instead of `is_paid`
- `checkSpotAvailability()`: Changed to use `is_available`

**File**: `src/AvailabilityModal.tsx` (ALREADY FIXED in previous task)

- Removed name-based fallback query
- Added early return for no agency_id
- Added strict ID-only queries
- Added comprehensive debug logging
- Added reason tracking

## Benefits

### 1. Deterministic Paid Detection

- No fuzzy matching
- No name-based lookups for paid classification
- ID-based only = predictable results

### 2. Prevents False Positives

- Placeholders can NEVER be classified as paid
- Requires explicit agency_id + is_paid flag

### 3. Prevents Double-Sell

- Atomic UPDATE with WHERE clause
- Only one customer can claim each slot
- affected_rows check prevents race conditions

### 4. Easy Debugging

- Comprehensive console logs
- Reason strings for every decision
- Clear error messages

### 5. Future-Proof

- Works for all current and future state pages
- Schema supports any number of states
- Consistent behavior across all pages

### 6. Admin-Friendly

- wp-admin editor automatically resolves agency_id
- No manual database work required
- Changes appear immediately on site

### 7. Customer-Friendly

- Stripe purchase auto-assigns slot
- Immediate visibility on site
- No manual activation needed

## Maintenance

### Adding New States

1. Create state JSON file (for placeholders)
2. Initialize 25 slots in `top25_slots`:
   ```sql
   INSERT INTO top25_slots (state_slug, rank, is_paid, is_available)
   SELECT 'new-state', generate_series(1, 25), false, true;
   ```
3. No code changes needed - system auto-detects

### Marking Agency as Paid (Manual)

```sql
-- Step 1: Ensure agency exists in other_agencies
INSERT INTO other_agencies (name, slug, state_slug, state_name, website_url, is_paid_listing)
VALUES ('Agency Name', 'agency-name-state', 'state-slug', 'State Name', 'https://agency.com', true)
ON CONFLICT (slug) DO UPDATE SET is_paid_listing = true
RETURNING id;

-- Step 2: Claim the slot
UPDATE top25_slots
SET agency_id = '[agency-uuid-from-step-1]',
    agency_name = 'Agency Name',
    website = 'https://agency.com',
    is_paid = true,
    is_available = false,
    claimed_at = now(),
    updated_at = now()
WHERE state_slug = 'state-slug' AND rank = 1;
```

### Removing Paid Agency (Manual)

```sql
-- Step 1: Release the slot
UPDATE top25_slots
SET agency_id = NULL,
    agency_name = NULL,
    website = NULL,
    logo_url = NULL,
    description = NULL,
    is_paid = false,
    is_available = true,
    claimed_at = NULL,
    stripe_checkout_session_id = NULL,
    stripe_payment_intent_id = NULL,
    updated_at = now()
WHERE state_slug = 'state-slug' AND rank = 1;

-- Step 2: Mark agency as unpaid (optional - if removing completely)
UPDATE other_agencies
SET is_paid_listing = false
WHERE id = '[agency-uuid]';
```

## Summary

This end-to-end system ensures:

1. ✅ Paid agencies ALWAYS show positive "available" message
2. ✅ Placeholders ALWAYS show negative "better fit" message
3. ✅ No false positives from name matching
4. ✅ No double-selling of slots
5. ✅ Automatic wp-admin resolution of agency_id
6. ✅ Automatic Stripe purchase assignment
7. ✅ Immediate visibility on site after payment
8. ✅ Works for all current and future states
9. ✅ Comprehensive debugging with reason tracking
10. ✅ Easy maintenance and troubleshooting

The system is deterministic, predictable, and production-ready.
