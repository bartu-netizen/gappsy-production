# Alaska Import - Quick Test Guide

## ✅ Ready to Test

**Status**: Alaska data cleared, import function fixed, build successful

## 5-Minute Test

### 1. Upload Alaska JSON (1 min)

1. Go to `/admin/bulk-state-import`
2. Enter admin secret
3. Upload `alaska.json`
4. ✅ **CRITICAL: Check "Override Existing Data"**
5. Click "Import State"

### 2. Verify Response (30 seconds)

**Expected**:
```json
{
  "stateContentInserted": true,
  "intro_length": 287,
  "intro_preview": "Discover Alaska's leading...",
  "faqs_inserted": 5,
  "first_faq_question": "Which Services do Marketing Agencies in Alaska Offer?",
  "raw_json_hash": "a3f2b1c4...",
  "override_mode": true,
  "top25Created": 25
}
```

**Red flags**:
- ❌ `stateContentInserted: false` → Import failed
- ❌ `intro_length: 0` → No content imported
- ❌ `override_mode: false` → Override NOT enabled (recheck checkbox)

### 3. Check Database (1 min)

**Run this SQL**:
```sql
SELECT
  LEFT(hero_intro, 80) as intro_preview,
  LENGTH(hero_intro) as intro_length,
  raw_json_hash
FROM state_content
WHERE state_slug = 'alaska';
```

**Expected**:
- ✅ intro_preview: "Discover Alaska's leading marketing agencies..."
- ✅ intro_length: 287 (matches import response)
- ✅ raw_json_hash: matches import response

### 4. Test Page (1 min)

**Visit**: `/marketing-agencies-in-alaska-united-states/`

**Visual check**:
- ✅ Hero shows: "Discover Alaska's leading marketing agencies..."
- ✅ FAQs mention Alaska (not New Jersey)
- ❌ NO "Click to expand"
- ❌ NO AI template text

### 5. String Compare (1 min)

**CRITICAL TEST**:

1. Open `alaska.json`
2. Copy `stateContent.hero_intro` value
3. Open DevTools Console on Alaska page
4. Run: `document.querySelector('.hero h1').textContent`
5. Compare: **MUST BE EXACT MATCH**

**Example**:
```
JSON:  "Discover Alaska's leading marketing agencies..."
Page:  "Discover Alaska's leading marketing agencies..."
Match: ✅ YES → TEST PASSED
```

## If Import Fails

### Check 1: Override enabled?

**Problem**: intro doesn't change

**Fix**: Re-import with ✅ "Override Existing Data" checked

### Check 2: Required fields?

**Problem**: Validation error

**Fix**: Ensure JSON has:
- `stateContent.hero_intro` (not empty)
- `faqs[]` (at least 1 FAQ)

### Check 3: Database error?

**Problem**: stateContentInserted = false

**Fix**:
1. Check edge function logs in Supabase Dashboard
2. Look for error message in response
3. Verify admin secret is correct

## Success Criteria

✅ **stateContentInserted = true**
✅ **intro_length > 0**
✅ **faqs_inserted > 0**
✅ **Page shows Alaska text (exact match)**
✅ **No NJ mentions**
✅ **No "Click to expand"**

## Quick SQL Verification

```sql
-- 1. Content exists?
SELECT COUNT(*) FROM state_content WHERE state_slug = 'alaska';
-- Expected: 1

-- 2. Intro not blank?
SELECT LENGTH(hero_intro) FROM state_content WHERE state_slug = 'alaska';
-- Expected: >0 (e.g., 287)

-- 3. FAQs inserted?
SELECT COUNT(*) FROM state_faqs WHERE state_slug = 'alaska';
-- Expected: >=5

-- 4. No placeholders?
SELECT COUNT(*) FROM state_faqs
WHERE state_slug = 'alaska' AND question ILIKE '%click to expand%';
-- Expected: 0

-- 5. No NJ leakage?
SELECT COUNT(*) FROM state_faqs
WHERE state_slug = 'alaska' AND question LIKE '%New Jersey%';
-- Expected: 0
```

## What Changed

### Before (BROKEN)
- ❌ Upsert kept old data
- ❌ Partial imports common
- ❌ Stale content persisted

### After (FIXED)
- ✅ Atomic DELETE + INSERT
- ✅ Complete replacement
- ✅ Fresh content guaranteed

## Key Insight

**MUST CHECK "Override Existing Data"**

Without this checkbox:
- Uses UPSERT mode (keeps old fields)
- May have stale data
- Not recommended for re-imports

With this checkbox:
- Uses DELETE + INSERT mode
- Complete replacement
- Guaranteed fresh content

---

## Ready to Import Alaska ✅

**Next Action**: Upload alaska.json with override enabled

**Expected Time**: 5 minutes total

**Success Indicator**: intro_preview shows "Discover Alaska's leading..." in database and on page
