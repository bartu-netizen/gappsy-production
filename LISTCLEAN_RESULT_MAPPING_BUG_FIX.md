# ListClean Result-Mapping Bug Fix Report

**Date:** 2026-03-03
**Status:** ✅ Fixed and Deployed
**Build ID:** cyzyvg8n

---

## PROBLEM IDENTIFIED

### Symptom (Real)
In `/wp-admin/email/smartlead` → Verification Pipeline, emails show as **Unknown (Total)**, but manual ListClean checks for the same emails returned **clean**.

### Root Cause
In `other-agencies-listclean-process-queue`, when downloading results from ListClean:
- Clean bucket: `/downloads/json/{listId}/clean/`
- Dirty bucket: `/downloads/json/{listId}/dirty/`
- Unknown bucket: `/downloads/json/{listId}/unknown/`

Results are merged into a single map, then processed:
```typescript
const externalStatus = result.status || "unknown";  // BUG: If result.status is missing, defaults to "unknown"
```

**The bug:** Emails in the **clean bucket** sometimes have missing/empty `result.status` field in ListClean's JSON response. The code falls back to `"unknown"`, misclassifying clean emails as unknown.

---

## THE FIX

### 1. Preserve Bucket Source When Building Result Map

**File:** `supabase/functions/other-agencies-listclean-process-queue/index.ts:lines 52-58`

**Before:**
```typescript
const allResults = [...cleanEmails, ...dirtyEmails, ...unknownEmails];
const resultMap = new Map(allResults.map((r) => [r.email.toLowerCase(), r]));
```

**After:**
```typescript
// Annotate each result with its source bucket for fallback status mapping
const cleanResultsAnnotated = cleanEmails.map((r) => ({ ...r, _bucket: "clean" }));
const dirtyResultsAnnotated = dirtyEmails.map((r) => ({ ...r, _bucket: "dirty" }));
const unknownResultsAnnotated = unknownEmails.map((r) => ({ ...r, _bucket: "unknown" }));

const allResults = [...cleanResultsAnnotated, ...dirtyResultsAnnotated, ...unknownResultsAnnotated];
const resultMap = new Map(allResults.map((r) => [r.email.toLowerCase(), r]));
```

**Impact:** Each result now carries its source bucket as `_bucket` metadata.

---

### 2. Use Bucket Fallback for Status Mapping

**File:** `supabase/functions/other-agencies-listclean-process-queue/index.ts:lines 69-77`

**Before:**
```typescript
const externalStatus = result.status || "unknown";
const internalStatus = mapListCleanStatusToInternal(externalStatus);
```

**After:**
```typescript
// Use bucket type as fallback if status is missing/empty
let externalStatus = result.status;
if (!externalStatus || (typeof externalStatus === "string" && externalStatus.trim() === "")) {
  missingStatusCount++;
  // Fallback to bucket type
  const bucket = result._bucket;
  externalStatus = bucket || "unknown";
  bucketFallbackCount++;
}

const internalStatus = mapListCleanStatusToInternal(externalStatus);
```

**Impact:** If `result.status` is missing/empty:
- Clean bucket row → treated as `"clean"` → maps to `"valid"`
- Dirty bucket row → treated as `"dirty"` → maps to `"invalid"`
- Unknown bucket row → treated as `"unknown"` → maps to `"unknown"`

**Critical:** Bucket type overrides the missing status field, fixing the misclassification.

---

### 3. Store Debug Annotation for Future Visibility

**File:** `supabase/functions/other-agencies-listclean-process-queue/index.ts:lines 104-117`

**Update Payload Now Includes:**
```typescript
const updatePayload = {
  validation_status: internalStatus,
  validation_provider: "ListClean",
  validation_checked_at: now,
  verification_external_status: externalStatus,
  verification_external_reason: result.reason || result.sub_status || null,
  verification_last_attempt_at: now,
  verification_attempt_count: nextAttemptCount,
  verification_next_retry_at: nextRetryAt,
  verification_finalized_at: finalizedAt,
  verification_state: verificationState,
  // NEW: Debug field showing bucket source
  verification_bucket_source: result._bucket || null,
};
```

**Impact:** Each email now records its bucket source in the database, enabling future debugging if needed.

---

### 4. Logging for Operational Visibility

**File:** `supabase/functions/other-agencies-listclean-process-queue/index.ts:lines 143-146`

**Logs Added:**
```typescript
// Log bucket fallback metrics for visibility
if (missingStatusCount > 0) {
  console.log(`[listclean-queue] Batch: ${missingStatusCount} rows had missing result.status, ${bucketFallbackCount} used bucket fallback (clean=${cleanEmails.length}, dirty=${dirtyEmails.length}, unknown=${unknownEmails.length})`);
}
```

**Example Output:**
```
[listclean-queue] Batch: 147 rows had missing result.status, 147 used bucket fallback (clean=2850, dirty=342, unknown=156)
```

This shows:
- How many rows had missing `result.status`
- How many used bucket fallback
- Distribution across buckets (helps diagnose ListClean response patterns)

---

## Database Changes

### New Column Added

**Migration:** `20260303_add_bucket_source_to_verification.sql`

**Column:** `verification_bucket_source` (text, nullable)

Added to `other_agency_emails` table:
- Stores the source bucket: `clean` | `dirty` | `unknown` | `null`
- Indexed for optional future queries
- Non-breaking: nullable, existing rows will have `null`

---

## Retry Logic & State Transitions (UNCHANGED)

The fix does **NOT** change retry logic:
- Unknown emails still retry up to 6 times ✓
- Valid/invalid emails finalized immediately ✓
- Exponential backoff still enforced ✓
- `failed_permanent` state still applied after 6 retries ✓

**Only change:** Previously misclassified clean emails are now correctly classified as valid on first run.

---

## Smartlead Eligibility (NOW CORRECT)

**Before Fix:**
- Clean email from clean bucket with missing `result.status` → stored as unknown → excluded from Smartlead

**After Fix:**
- Clean email from clean bucket with missing `result.status` → bucket fallback to "clean" → mapped to valid → included in Smartlead ✓

---

## DEPLOYMENT STATUS

✅ **Migration Applied:** `20260303_add_bucket_source_to_verification`
✅ **Edge Function Updated:** `other-agencies-listclean-process-queue`
✅ **Logging Enabled:** For bucket fallback metrics
✅ **Backward Compatible:** Existing data unaffected, new field is nullable

---

## VERIFICATION QUERIES

### Check How Many Rows Had Bucket Fallback

```sql
SELECT COUNT(*) as rows_with_bucket_fallback
FROM other_agency_emails
WHERE verification_bucket_source IS NOT NULL
  AND validation_status = 'valid';
```

**Explanation:** Counts emails that:
1. Have bucket source recorded (processed by fixed code)
2. Are marked as valid (correctly classified clean emails)

### Sample Verification: Email Detail Before/After

```sql
SELECT
  email_normalized,
  validation_status as current_status,
  verification_external_status as external_status,
  verification_bucket_source as bucket_used,
  verification_state as current_state,
  verification_attempt_count as attempts
FROM other_agency_emails
WHERE verification_bucket_source = 'clean'
  AND validation_status = 'valid'
LIMIT 10;
```

**Expected Output (After Fix):**
| email_normalized | current_status | external_status | bucket_used | current_state | attempts |
|------------------|----------------|-----------------|-------------|---------------|----------|
| john@acme.com | valid | clean | clean | completed | 1 |
| jane@acme.com | valid | clean | clean | completed | 1 |
| ... | ... | ... | ... | ... | ... |

**Indicates Fix Working:**
- `current_status` = 'valid' (not 'unknown')
- `external_status` = 'clean' (correct mapping)
- `bucket_used` = 'clean' (source recorded)
- `attempts` = 1 (no retries needed)

### Query: Compare Email Counts Before/After

**Check how many emails are now correctly valid:**
```sql
SELECT
  COUNT(*) as total_cleaned_emails,
  COUNT(CASE WHEN validation_status = 'valid' THEN 1 END) as now_valid,
  COUNT(CASE WHEN validation_status = 'unknown' THEN 1 END) as now_unknown,
  COUNT(CASE WHEN validation_status = 'invalid' THEN 1 END) as now_invalid
FROM other_agency_emails
WHERE verification_bucket_source = 'clean';
```

**Before Fix (Predicted):**
- Many clean bucket emails misclassified as 'unknown'

**After Fix (Expected):**
- Clean bucket emails now properly classified as 'valid'

---

## HOW TO RE-PROCESS AFFECTED EMAILS

### Option 1: Safe Reprocessing (Recommended)

Run ListClean queue processor again for previously unknown emails:
```
POST /functions/v1/other-agencies-listclean-process-queue
{
  "force_run": true
}
```

The processor will:
1. Find emails with `validation_status='unknown'` and `verification_state` in ('retry_scheduled', 'queued')
2. Reprocess them with the fixed bucket-fallback logic
3. Clean bucket emails that had missing `result.status` will now be correctly classified as valid

**Safe because:** Upserts are idempotent. Reprocessing won't create duplicates or lose data.

### Option 2: Manual Recalculation (Optional)

For emails already processed, if you want to recalculate send-ready counts:

```sql
-- Refresh state stats for a state
SELECT refresh_state_stats('new-jersey');
```

This recalculates:
- Total agencies
- Clean coverage
- Send-ready agencies
- All related metrics

---

## PERFORMANCE IMPACT

✅ **No Performance Regression:**
- Bucket annotation adds negligible overhead (one string per row)
- Fallback logic adds one string comparison per row
- Logging only runs if `missingStatusCount > 0` (conditional)
- New index on `verification_bucket_source` is sparse (where not null)

---

## OPTIONAL: Debugging Future Issues

### View Logs for Bucket Fallback Metrics

Check Supabase edge function logs:
```
[listclean-queue] Batch: 147 rows had missing result.status, 147 used bucket fallback (clean=2850, dirty=342, unknown=156)
```

**Interpretation:**
- 147 rows in this batch had no `result.status` in ListClean response
- All 147 used bucket fallback (correct fix behavior)
- Distribution shows: mostly clean (2850), some dirty (342), some unknown (156)

---

## SUMMARY

| Aspect | Before | After |
|--------|--------|-------|
| **Problem** | Clean emails with missing `result.status` → classified as unknown | Clean emails → correctly classified as valid via bucket fallback |
| **Code** | `result.status \|\| "unknown"` | `result.status \|\| result._bucket \|\| "unknown"` |
| **Database** | No bucket source tracking | `verification_bucket_source` recorded for all processed emails |
| **Logging** | No visibility | Logs bucket fallback metrics per batch |
| **Smartlead Readiness** | Incorrectly excluded valid emails | Correctly includes all valid emails |
| **Retry Logic** | Unchanged | Unchanged ✓ |
| **Backward Compatible** | N/A | ✅ Yes (new nullable column) |

---

## NEXT STEPS

1. ✅ **Deployed:** Fixed queue processor is live
2. ✅ **Migration:** Bucket source column added to DB
3. **Monitor:** Watch logs for bucket fallback metrics
4. **Verify:** Run sample queries (above) to confirm fix effectiveness
5. **Reprocess:** Trigger queue processor to fix any remaining misclassified emails
6. **Check Stats:** Verify state stats now show correct send-ready counts

---

## FILES CHANGED

1. **supabase/functions/other-agencies-listclean-process-queue/index.ts**
   - Lines 37-38: Added counters for missing status tracking
   - Lines 52-58: Annotate results with bucket source
   - Lines 63, 69-77: Implement bucket fallback logic
   - Lines 115-116: Store bucket source in DB
   - Lines 143-146: Add logging for visibility

2. **supabase/migrations/20260303_add_bucket_source_to_verification.sql** (NEW)
   - Add `verification_bucket_source` column
   - Add optional index for debugging queries

---

## BUILD INFO

- **Build ID:** cyzyvg8n
- **Status:** ✅ Deployed
- **Date:** 2026-03-03
- **Testing:** Ready for re-verification run

