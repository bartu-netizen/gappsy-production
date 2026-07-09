# Quick Test Guide: Alabama Vazagency Fix

## Issue Fixed
Alabama was showing NEGATIVE conclusion ("better fit") when clicking "Check Availability" on Vazagency. Now it shows POSITIVE conclusion like New Jersey.

## Root Cause
The `agency_id` (UUID) was not being passed from the state page to the availability modal, causing the modal to treat Vazagency as a non-paid placeholder.

## What Was Changed

1. **StatePageTemplate.tsx**: Added `id: slot.agency_id` to agency objects
   - Database path: Line 309
   - Legacy path: Lines 175-208

2. **NewJerseyAgencyGrid.tsx**: Added console logging for debugging

## Quick Test Steps

### Test 1: Alabama Vazagency (MUST PASS)

1. Navigate to: `/marketing-agencies-in-alabama-united-states`
2. Open browser DevTools console (F12)
3. Scroll to rank #1 (Vazagency)
4. Click "Check Availability" button

**Expected Result**:

**Console Output**:
```
[Top25 Click] {
  stateSlug: "alabama",
  agencyId: "c190b5c0-0378-460f-9a90-86374e0a6a76",  ← ✅ UUID present
  agencyName: "Vazagency",
  rank: 1
}

[AvailabilityModal] paid check {
  sourceAgencyId: "c190b5c0-0378-460f-9a90-86374e0a6a76",
  finalIsPaid: true,  ← ✅ Paid detected
  reason: "other-agencies-is-paid-listing-true"
}
```

**Modal UI**:
- ✅ Headline: "Good news — based on your project details, Vazagency is available and ready to connect."
- ✅ Shows Vazagency card (not a different agency)
- ✅ Auto-redirect countdown to https://vazagency.com
- ✅ Button: "Visit Website →"
- ❌ NO "better fit" message
- ❌ NO fallback agency

### Test 2: New Jersey Vazagency (MUST STILL WORK)

1. Navigate to: `/marketing-agencies-in-new-jersey-united-states`
2. Click "Check Availability" on Vazagency (rank #1)

**Expected**: Same as Alabama (POSITIVE conclusion)

### Test 3: Alabama Placeholder (MUST SHOW NEGATIVE)

1. On Alabama page, find a placeholder agency (rank 2-25, not paid)
2. Click "Check Availability"

**Expected Console**:
```
[Top25 Click] {
  agencyId: "",  ← ✅ Empty for placeholder
  ...
}

[AvailabilityModal] paid check {
  finalIsPaid: false,  ← ✅ Not paid
  reason: "no-agency-id-placeholder"
}
```

**Modal UI**:
- ✅ Headline: "This Alabama Agency is a better fit..."
- ✅ Shows fallback recommended agency
- ❌ NO "Good news" message

## If Test Fails

### Symptom: Alabama still shows "better fit" for Vazagency

**Check 1**: Verify agencyId in console
```
[Top25 Click] { agencyId: "" }  ← ❌ Bad (empty string)
[Top25 Click] { agencyId: "c190b5c0-0378-460f-9a90-86374e0a6a76" }  ← ✅ Good
```

If agencyId is empty:
- Clear browser cache
- Hard refresh (Ctrl+Shift+R or Cmd+Shift+R)
- Rebuild: `npm run build`

**Check 2**: Verify database
```sql
SELECT agency_id, is_paid FROM top25_slots
WHERE state_slug='alabama' AND rank=1;

-- Should return:
-- agency_id: c190b5c0-0378-460f-9a90-86374e0a6a76
-- is_paid: true
```

**Check 3**: Verify code changes
- File: `src/pages/StatePageTemplate.tsx`
- Line 309: Should have `id: slot.agency_id || undefined`
- Line 208: Should have `id: agencyIdMap.get(agency.rank) || undefined`

### Symptom: Console shows correct UUID but still negative

**Check**: Verify canonical Vazagency
```sql
SELECT id, is_paid_listing FROM other_agencies
WHERE id = 'c190b5c0-0378-460f-9a90-86374e0a6a76';

-- Should return:
-- is_paid_listing: true
```

If false, run:
```sql
UPDATE other_agencies
SET is_paid_listing = true
WHERE id = 'c190b5c0-0378-460f-9a90-86374e0a6a76';
```

## Success Criteria

All 3 tests must pass:
- [ ] Alabama Vazagency: POSITIVE conclusion ✅
- [ ] New Jersey Vazagency: POSITIVE conclusion ✅
- [ ] Alabama placeholder: NEGATIVE conclusion ✅

## Additional States to Test

After Alabama and New Jersey work, test any other imported state:

- California
- Texas
- Florida
- New York

All should show POSITIVE conclusion for Vazagency (rank #1).

## Related Documentation

- Full technical details: `ALABAMA_FIX_VAZAGENCY_PAID_DETECTION.md`
- Rank #1 system rule: `VAZAGENCY_RANK1_SYSTEM_RULE.md`
- End-to-end paid detection: `END_TO_END_PAID_DETECTION.md`
