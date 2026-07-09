# Vazagency Rank #1 System Rule

## Overview

This document describes the automatic system rule that ensures **Vazagency is ALWAYS rank #1 in EVERY state** and is **ALWAYS paid**.

This rule works automatically for:
- All existing states (52 states/territories)
- All future state imports
- Manual edits
- Any database operations

## Core Architecture

### 1. Canonical Vazagency Entity

**Table**: `other_agencies`

**Record**:
```sql
id:                            c190b5c0-0378-460f-9a90-86374e0a6a76
name:                          Vazagency
slug:                          vazagency-global
state_slug:                    all-states
state_name:                    All States
website_url:                   https://vazagency.com
is_paid_listing:               true
availability_redirect_enabled: true
availability_redirect_url:     https://vazagency.com
logo_url:                      /images/vazagency_logo_-_top_25_gappsy.webp
```

**Key Points**:
- ✅ **Stable UUID**: `c190b5c0-0378-460f-9a90-86374e0a6a76` (never changes)
- ✅ **Global slug**: `vazagency-global` (unique identifier)
- ✅ **State-agnostic**: `state_slug = 'all-states'` (not tied to one state)
- ✅ **Always paid**: `is_paid_listing = true`
- ✅ **Redirect enabled**: Points to vazagency.com

### 2. Automatic Enforcement Mechanisms

#### Mechanism A: Database Trigger

**Trigger**: `trigger_enforce_rank1_vazagency`
**Function**: `enforce_rank1_vazagency()`

**When it fires**:
- BEFORE INSERT on `top25_slots`
- BEFORE UPDATE on `top25_slots`

**What it does**:
```sql
-- For ANY row where rank = 1
IF NEW.rank = 1 THEN
  -- Automatically set these fields:
  NEW.agency_id       := 'c190b5c0-0378-460f-9a90-86374e0a6a76'
  NEW.agency_name     := 'Vazagency'
  NEW.website         := 'https://vazagency.com'
  NEW.is_paid         := true
  NEW.is_available    := false
END IF;
```

**Example**:
```sql
-- Developer tries to insert wrong data for rank #1
INSERT INTO top25_slots (state_slug, rank, agency_name, website, is_paid, is_available)
VALUES ('new-state', 1, 'Wrong Agency', 'https://wrong.com', false, true);

-- Trigger automatically corrects it to:
-- agency_id: c190b5c0-0378-460f-9a90-86374e0a6a76
-- agency_name: Vazagency
-- website: https://vazagency.com
-- is_paid: true
-- is_available: false
```

**Result**: Impossible to create rank #1 with wrong agency.

#### Mechanism B: State Import Function

**Edge Function**: `state-json-import`

**Enhancement**:
```typescript
// Before importing agencies, get canonical Vazagency ID
const { data: canonicalVazagency } = await supabaseAdmin
  .from("other_agencies")
  .select("id")
  .eq("slug", "vazagency-global")
  .maybeSingle();

const canonicalVazagencyId = canonicalVazagency?.id || null;

// For each agency in import
for (const agency of agencies) {
  const rank = Number(agency.rank);

  const payload: any = {
    state_slug: stateSlug,
    rank: rank,
    agency_name: agency.name,
    website: agency.websiteUrl || "",
    // ... other fields
  };

  // ENFORCE: If rank #1, override with Vazagency
  if (rank === 1 && canonicalVazagencyId) {
    payload.agency_id = canonicalVazagencyId;
    payload.agency_name = "Vazagency";
    payload.website = "https://vazagency.com";
    payload.is_paid = true;
    payload.is_available = false;
  }

  // Upsert to database
  await supabaseAdmin.from("top25_slots").upsert(payload);
}
```

**Result**: State imports automatically assign rank #1 to Vazagency.

#### Mechanism C: Historical Backfill Migration

**Migration**: `create_canonical_vazagency_and_enforce_rank1.sql`

**What it did**:
1. Created canonical Vazagency (if didn't exist)
2. Linked ALL existing rank #1 slots to canonical Vazagency
3. Deleted duplicate state-specific Vazagency entries
4. Created the trigger for future enforcement

**SQL**:
```sql
-- Update ALL rank #1 slots to canonical Vazagency
UPDATE top25_slots
SET agency_id = 'c190b5c0-0378-460f-9a90-86374e0a6a76',
    agency_name = 'Vazagency',
    website = 'https://vazagency.com',
    is_paid = true,
    is_available = false,
    updated_at = now()
WHERE rank = 1;
```

**Result**: All 52 existing rank #1 slots now link to canonical Vazagency.

## Verification Results

### Test 1: All Existing States

**Query**:
```sql
SELECT COUNT(*) as total_rank1_slots,
       COUNT(CASE WHEN agency_id = 'c190b5c0-0378-460f-9a90-86374e0a6a76' THEN 1 END) as vazagency_slots
FROM top25_slots
WHERE rank = 1;
```

**Result**:
```
total_rank1_slots: 52
vazagency_slots:   52
```

✅ **100% of rank #1 slots are Vazagency**

### Test 2: Sample States Verification

**Query**:
```sql
SELECT
  state_slug,
  rank,
  agency_name,
  is_paid,
  is_available,
  agency_id,
  CASE
    WHEN agency_id = 'c190b5c0-0378-460f-9a90-86374e0a6a76'
    THEN '✅ Canonical Vazagency'
    ELSE '❌ Wrong agency'
  END as status
FROM top25_slots
WHERE rank = 1
  AND state_slug IN ('new-jersey', 'alabama', 'california', 'texas', 'florida', 'new-york')
ORDER BY state_slug;
```

**Results**:
| State | Agency | Is Paid | Status |
|-------|--------|---------|--------|
| alabama | Vazagency | true | ✅ Canonical Vazagency |
| california | Vazagency | true | ✅ Canonical Vazagency |
| florida | Vazagency | true | ✅ Canonical Vazagency |
| new-jersey | Vazagency | true | ✅ Canonical Vazagency |
| new-york | Vazagency | true | ✅ Canonical Vazagency |
| texas | Vazagency | true | ✅ Canonical Vazagency |

### Test 3: Trigger Enforcement Test

**Test**:
```sql
-- Try to insert rank #1 with wrong data
INSERT INTO top25_slots (state_slug, rank, agency_name, website, is_paid, is_available)
VALUES ('test-state', 1, 'Wrong Agency', 'https://wrong.com', false, true)
RETURNING agency_name, website, agency_id, is_paid, is_available;
```

**Result**:
```
agency_name:   Vazagency
website:       https://vazagency.com
agency_id:     c190b5c0-0378-460f-9a90-86374e0a6a76
is_paid:       true
is_available:  false
```

✅ **Trigger automatically corrected the data**

### Test 4: Non-Vazagency Rank #1 Count

**Query**:
```sql
SELECT COUNT(*) as non_vazagency_rank1_count
FROM top25_slots
WHERE rank = 1
  AND (
    agency_id IS NULL
    OR agency_id != 'c190b5c0-0378-460f-9a90-86374e0a6a76'
    OR is_paid = false
    OR is_available = true
  );
```

**Result**:
```
non_vazagency_rank1_count: 0
```

✅ **Zero non-Vazagency rank #1 slots**

## Availability Modal Behavior

### For Vazagency (Rank #1, All States)

**When user clicks "Check Availability" on Vazagency**:

1. **Agency ID Detection**:
   ```typescript
   // Top25 page passes agency_id from slot
   agencyId = 'c190b5c0-0378-460f-9a90-86374e0a6a76'
   ```

2. **Database Query**:
   ```typescript
   // Query by ID (not name)
   const { data } = await supabase
     .from('other_agencies')
     .select('*')
     .eq('id', 'c190b5c0-0378-460f-9a90-86374e0a6a76')
     .maybeSingle();

   // Result:
   // is_paid_listing: true
   // availability_redirect_enabled: true
   // availability_redirect_url: https://vazagency.com
   ```

3. **Paid Detection**:
   ```typescript
   isPaidFlag = true
   paidCheckReason = 'other-agencies-is-paid-listing-true'
   ```

4. **UI Flow** (POSITIVE):
   - ✅ Headline: "Good news — based on your project details, Vazagency is available and ready to connect."
   - ✅ Card: Vazagency (source agency)
   - ✅ Auto-redirect: https://vazagency.com
   - ✅ Button: "Visit Website →" (opens vazagency.com)

### For Other Paid Agencies (Rank 2-25)

**When user clicks on ANY agency with agency_id**:

1. **Agency ID Detection**:
   ```typescript
   agencyId = '[some-uuid]'  // Must exist
   ```

2. **Paid Check**:
   ```typescript
   isPaidFlag = (agency.is_paid_listing === true)
             OR (top25_slot.is_paid === true)
   ```

3. **If Paid** (POSITIVE):
   - Show "Good news" message
   - Show SOURCE agency card (the one clicked)
   - Redirect to agency's website

4. **If Not Paid** (NEGATIVE):
   - Show "better fit" message
   - Show FALLBACK recommended agency card
   - Redirect to recommended agency website

### For Placeholders (No agency_id)

**When user clicks on placeholder**:

1. **Early Detection**:
   ```typescript
   if (!agencyId) {
     isPaidFlag = false;
     paidCheckReason = 'no-agency-id-placeholder';
     // ALWAYS negative flow
   }
   ```

2. **UI Flow** (NEGATIVE):
   - Show "This [State] Agency is a better fit"
   - Show FALLBACK recommended agency
   - Never shows "Good news"

## How It Works for Future State Imports

### Scenario: Import Oklahoma State

**Step 1**: Developer runs bulk import for Oklahoma

**Step 2**: Import function executes:
```typescript
// Get canonical Vazagency ID
const canonicalVazagencyId = 'c190b5c0-0378-460f-9a90-86374e0a6a76';

// Import rank #1 (might be any agency in source data)
const payload = {
  state_slug: 'oklahoma',
  rank: 1,
  agency_name: 'Some Agency',  // Ignored
  website: 'https://some.com',  // Ignored
  // ...
};

// OVERRIDE for rank #1
payload.agency_id = canonicalVazagencyId;
payload.agency_name = 'Vazagency';
payload.website = 'https://vazagency.com';
payload.is_paid = true;
payload.is_available = false;

// Insert
await supabase.from('top25_slots').upsert(payload);
```

**Step 3**: If import somehow skips enforcement, trigger catches it:
```sql
-- Trigger fires BEFORE INSERT
NEW.agency_id := 'c190b5c0-0378-460f-9a90-86374e0a6a76'
NEW.agency_name := 'Vazagency'
NEW.website := 'https://vazagency.com'
NEW.is_paid := true
NEW.is_available := false
```

**Step 4**: Result
- Oklahoma state imported
- Rank #1 is Vazagency (paid)
- Ranks 2-25 are from import data
- User clicks Vazagency → POSITIVE message

✅ **Works automatically without per-state patching**

## Benefits

### 1. Zero Manual Work
- No need to manually set rank #1 for each state
- Import function handles it automatically
- Trigger catches any edge cases

### 2. Impossible to Break
- Database trigger prevents incorrect rank #1
- Even direct SQL can't bypass it
- Works for INSERT, UPDATE, and imports

### 3. Consistent Behavior
- Vazagency ALWAYS gets positive message
- Works identically across all 52 states
- Future states work the same way

### 4. Single Source of Truth
- One canonical Vazagency record
- All rank #1 slots point to same UUID
- No duplicate or conflicting data

### 5. Easy Debugging
```sql
-- Check rank #1 for any state
SELECT * FROM top25_slots
WHERE state_slug = 'your-state' AND rank = 1;

-- Should ALWAYS show:
-- agency_id: c190b5c0-0378-460f-9a90-86374e0a6a76
-- agency_name: Vazagency
-- is_paid: true
-- is_available: false
```

## Maintenance

### To Verify System Health

```sql
-- Should return 0
SELECT COUNT(*) as broken_rank1_slots
FROM top25_slots
WHERE rank = 1
  AND (
    agency_id != 'c190b5c0-0378-460f-9a90-86374e0a6a76'
    OR is_paid = false
    OR is_available = true
  );
```

If this returns > 0, something is seriously wrong.

### To Update Vazagency Info

```sql
-- Update canonical Vazagency
UPDATE other_agencies
SET website_url = 'https://new-vazagency-url.com',
    logo_url = '/new-logo.png',
    intro = 'Updated description'
WHERE slug = 'vazagency-global';

-- Changes automatically apply to all states
```

### To Add New State Manually

```sql
-- Just insert rank #1 slot (trigger handles the rest)
INSERT INTO top25_slots (state_slug, rank)
VALUES ('new-state', 1);

-- Trigger automatically sets:
-- agency_id, agency_name, website, is_paid, is_available
```

## Edge Cases Handled

### Edge Case 1: Import with rank #1 = different agency
✅ **Handled by import function** - Overwrites with Vazagency before insert

### Edge Case 2: Direct SQL INSERT with wrong rank #1
✅ **Handled by trigger** - Corrects data before insert

### Edge Case 3: UPDATE existing rank #1 to different agency
✅ **Handled by trigger** - Prevents change, keeps Vazagency

### Edge Case 4: New state added without rank #1
✅ **Handled by trigger** - First insert of rank #1 becomes Vazagency

### Edge Case 5: Canonical Vazagency deleted
⚠️ **WARNING**: Don't delete canonical Vazagency record
- Trigger will skip enforcement if not found
- Import will log warning but continue
- Ranks will be wrong until canonical is restored

**Recovery**:
```sql
-- Re-run the migration
-- Or manually recreate with exact UUID:
INSERT INTO other_agencies (
  id, name, slug, state_slug, state_name, website_url, is_paid_listing
) VALUES (
  'c190b5c0-0378-460f-9a90-86374e0a6a76',
  'Vazagency',
  'vazagency-global',
  'all-states',
  'All States',
  'https://vazagency.com',
  true
);
```

## Files Modified

### Database Migrations
- `supabase/migrations/create_canonical_vazagency_and_enforce_rank1.sql` (NEW)
  - Creates canonical Vazagency
  - Links all rank #1 slots
  - Creates trigger
  - Deletes duplicates

### Edge Functions
- `supabase/functions/state-json-import/index.ts` (ENHANCED)
  - Added canonical Vazagency ID lookup
  - Added rank #1 enforcement in import loop
  - Logs enforcement actions

### Verification
- All rank #1 slots verified (52/52 ✅)
- Trigger tested and working ✅
- Import function updated ✅
- Build passes ✅

## Summary

The Vazagency rank #1 system rule ensures:

1. ✅ **Vazagency is ALWAYS rank #1 in EVERY state**
2. ✅ **Vazagency is ALWAYS paid and shows positive message**
3. ✅ **Works automatically for all future state imports**
4. ✅ **Impossible to break via manual edits or SQL**
5. ✅ **Single canonical Vazagency entity (stable UUID)**
6. ✅ **Zero manual work per state**
7. ✅ **Consistent behavior across all pages**

This is a permanent, self-enforcing system rule that requires no maintenance.
