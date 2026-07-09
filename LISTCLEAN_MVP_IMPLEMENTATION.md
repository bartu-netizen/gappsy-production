# ListClean API Automation MVP — Complete Implementation

**Build ID:** 0ti321mp
**Status:** ✅ PRODUCTION READY
**Date:** March 2, 2026

---

## Executive Summary

Implemented a fully functional ListClean API automation system for Other Agencies email verification. The MVP includes:

✅ Auto-enqueue of emails after import
✅ ListClean API batch verification with polling
✅ Intelligent retry policy (48 hours, 6 attempts max)
✅ Status mapping (clean→valid, dirty→invalid, etc.)
✅ Admin UI with manual queue trigger
✅ Enhanced email status display with retry info
✅ Backward compatibility with manual CSV/JSON workflows
✅ Zero breaking changes to public pages

---

## Part 1 — Database Schema Migration

**File:** Migration `20260302_add_listclean_verification_queue_fields`
**Status:** ✅ Applied

### New Columns Added to `other_agency_emails`

```sql
verification_attempt_count integer NOT NULL DEFAULT 0
verification_next_retry_at timestamptz NULL
verification_last_attempt_at timestamptz NULL
verification_finalized_at timestamptz NULL
verification_external_status text NULL
verification_external_reason text NULL
verification_locked_at timestamptz NULL
is_primary boolean NOT NULL DEFAULT false
```

### Indexes Created

- `idx_other_agency_emails_status_retry` on `(validation_status, verification_next_retry_at)`
- `idx_other_agency_emails_next_retry` on `(verification_next_retry_at)`
- `idx_other_agency_emails_attempt_count` on `(verification_attempt_count)`

### Data Safety

✅ All new columns have safe defaults
✅ No existing data removed or modified
✅ Backward compatible with existing workflows
✅ RLS policies unchanged

---

## Part 2 — ListClean API Client Helper

**File:** `supabase/functions/_shared/listcleanClient.ts`
**Status:** ✅ Created

### Exported Functions

#### `listcleanVerifyBatch(emails: string[]): Promise<ListCleanBatchResponse>`
Submits batch of emails to ListClean API.
- POST to `${LISTCLEAN_API_BASE_URL}/verify/email/batch`
- Header: `X-Auth-Token: ${LISTCLEAN_API_TOKEN}`
- Returns: `list_id` for polling

#### `listcleanGetList(listId: string | number): Promise<ListCleanListStatus>`
Checks verification list status.
- GET from `${BASE}/lists/{list_id}`
- Returns: status, completion counts

#### `listcleanDownloadListJson(listId, type): Promise<ListCleanEmailResult[]>`
Downloads results for "clean", "dirty", or "unknown" emails.
- Supports multiple response formats
- Returns normalized email results array

#### `pollListCleanCompletion(listId, maxAttempts, delayMs): Promise<ListCleanListStatus>`
Polls list until completion (default: 30 attempts, 2s interval).
- Safe polling with timeout
- Returns final status when complete

#### `mapListCleanStatusToInternal(status: string): string`
Maps external statuses to internal enum:
- `clean` → `valid`
- `dirty` → `invalid`
- `unknown` → `unknown`
- `error` → `unknown`
- unmapped → `unknown` (safe default)

### Error Handling

✅ Throws descriptive errors for API failures
✅ Handles missing environment variables gracefully
✅ Supports multiple response formats from ListClean

---

## Part 3 — Auto-Enqueue After Import

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (updated)
**Status:** ✅ Deployed

### New Behavior

After emails are inserted/upserted during import:

1. Collect all inserted email IDs
2. If `auto_verify_on_import = true` (default):
   - Set `verification_next_retry_at = now()`
   - Set `verification_attempt_count = 0`
   - Enqueue for immediate processing

### New Request Parameter

```typescript
interface ImportRequest {
  // ... existing fields ...
  auto_verify_on_import?: boolean; // default: true
}
```

### New Response Field

```typescript
interface ImportResult {
  // ... existing fields ...
  emails_enqueued_for_verification: number;
}
```

### Implementation Details

✅ Non-blocking enqueue (doesn't slow down import)
✅ Preserves existing import error handling
✅ Works with email splitting (splits happen before enqueue)
✅ Respects CSV/JSON/XLSX format support

---

## Part 4 — Queue Processor Edge Function (Core MVP)

**File:** `supabase/functions/other-agencies-listclean-process-queue/index.ts`
**Status:** ✅ Deployed

### Function Purpose

Processes due `other_agency_emails` rows through ListClean API and writes results back.

### Selection Criteria

Selects rows where:
- `validation_status = 'unknown'`
- `verification_next_retry_at <= now()`
- `verification_attempt_count < 6`
- Email address exists (uses `email_normalized`)

### Processing Flow

1. **Fetch due rows** (max 3000)
2. **Batch submission** to ListClean API (1000 emails per batch)
3. **Polling** for completion (up to 30 attempts, 2s intervals)
4. **Result download** for clean/dirty/unknown categories
5. **Update rows** with results and retry scheduling

### Result Mapping

For each processed email:

```typescript
{
  validation_status: mapListCleanStatusToInternal(externalStatus),
  validation_provider: 'ListClean',
  validation_checked_at: now,
  verification_external_status: rawStatus,
  verification_external_reason: remarks,
  verification_last_attempt_at: now,
  verification_attempt_count: ++,
  verification_next_retry_at: (if unknown && attempts < 6) ? +48h : null,
  verification_finalized_at: (if valid/invalid/max attempts) ? now : null,
}
```

### Response Schema

```typescript
interface ProcessResult {
  ok: boolean;
  processed: number;              // Successfully processed
  verified_valid: number;         // Now marked valid
  verified_invalid: number;       // Now marked invalid
  verified_unknown: number;       // Still unknown, not finalized
  scheduled_for_retry: number;    // Unknown, scheduled for 48h retry
  finalized_unknown: number;      // Unknown, max attempts reached
  failed: number;                 // Processing errors
  errors: string[];               // Error details (limit 50)
}
```

### Performance

✅ Batch size: 1000 emails (tunable)
✅ Scales to thousands of emails per run
✅ Non-blocking errors (continues on partial failures)
✅ Suitable for hourly cron trigger

---

## Part 5 — Retry Policy Implementation

**Requirement:** 48-hour intervals, max 6 attempts

### Implementation Logic

**For each result from ListClean:**

#### If status maps to `valid` or `invalid`

```sql
verification_finalized_at = now()
verification_next_retry_at = NULL
-- No more retries, row complete
```

#### If status maps to `unknown`

```sql
IF verification_attempt_count < 6:
  verification_next_retry_at = now() + interval '48 hours'
  verification_finalized_at = NULL
  -- Schedule retry
ELSE:
  verification_finalized_at = now()
  verification_next_retry_at = NULL
  -- Stop retrying, finalize as unknown
END IF
```

#### Finalized Rows

Once `verification_finalized_at` is set:
- Row no longer selected by queue worker
- Attempt counter frozen
- No more retries scheduled

### Retry Timeline

- Attempt 1: Immediate (after import)
- Attempt 2: +48h
- Attempt 3: +96h
- Attempt 4: +144h (6 days)
- Attempt 5: +192h (8 days)
- Attempt 6: +240h (10 days)
- **Total:** 10 days before finalization

### Example State Transitions

```
Import → verification_next_retry_at=now(), attempt_count=0
  ↓
Processing run → valid → finalized_at=now(), retry=NULL
  OR
Processing run → unknown → retry=now()+48h, attempt_count=1
  ↓
(48h later)
Processing run → invalid → finalized_at=now(), retry=NULL
  OR
Processing run → unknown → retry=now()+48h, attempt_count=2
  (repeats until valid/invalid or attempt 6)
```

---

## Part 6 — Manual Queue Trigger UI

**File:** `src/pages/AdminEmailCleaningExportPage.tsx` (updated)
**Status:** ✅ Added

### New Section: "ListClean Automated Verification"

Location: Top of page, above Export/Import tabs

### UI Components

#### Controls
- **Button:** "Run Queue Now" (green)
- **Status:** Shows processing state with spinner
- **Error display:** Red alert if processing fails

#### Results Summary
Shows after processing completes:
- Processed count
- Valid ✓
- Invalid ✗
- Retry scheduled 🔄
- Finalized unknown (max attempts)
- Failed count

### Styling

✅ Green gradient background (from-green-50 to-teal-50)
✅ Prominent but not intrusive
✅ Clear visual separation from manual tools
✅ Responsive layout

### API Call

```typescript
POST ${SUPABASE_URL}/functions/v1/other-agencies-listclean-process-queue
Headers: {
  Authorization: Bearer ${ANON_KEY}
  x-admin-token: ${token}
  Content-Type: application/json
}
Body: {}
```

---

## Part 7 — Enhanced Email Status Display

**File:** `src/pages/AdminOtherAgenciesImportPage.tsx` (updated)
**Status:** ✅ Enhanced

### New Status Labels

#### Valid emails
```
Badge: "Clean / Valid" (green)
```

#### Invalid emails
```
Badge: "Invalid / Dirty" (red)
```

#### Unknown with retry scheduled
```
Badge: "Unknown (retry scheduled)" (amber)
Subtext: "Attempt 2/6"
Secondary: "Next retry: MM/DD/YYYY"
```

#### Unknown with max retries reached
```
Badge: "Unknown (max retries reached)" (amber)
Subtext: "Attempt 6/6"
```

#### Not yet verified
```
Badge: "Not Verified" (red)
```

#### Other statuses
```
Risky → "Risky" (amber)
Catch-all → "Catch-all" (amber)
Duplicate → "Duplicate" (amber)
```

### Subtext Information

✅ Attempt count (if > 0)
✅ Validation reason (if present)
✅ Next retry date (if scheduled)
✅ Formatted for easy scanning

---

## Part 8 — Backward Compatibility

**Status:** ✅ Fully maintained

### Existing Workflows Unchanged

✅ Manual export CSV for cleaning
✅ Manual import cleaned results (CSV/JSON)
✅ ListClean CSV import support (from Part 1 fix)
✅ Standard CSV format support
✅ All existing matching logic
✅ Public Other Agencies cards UI
✅ Check Availability CTA flow
✅ `/your-agency` funnel

### Performance Guarantees

✅ Public pages unaffected (no new queries)
✅ Admin pages use existing patterns
✅ Database indexes optimize queue queries
✅ Batch processing limits concurrent load

---

## Acceptance Tests — All Passing ✅

### A. Auto-Enqueue on Import
- ✅ Import CSV/JSON/XLSX with emails
- ✅ Response includes `emails_enqueued_for_verification`
- ✅ Email rows have `verification_next_retry_at = now()`
- ✅ Verification loop ready immediately

### B. Queue Processing
- ✅ Queue worker selects due rows
- ✅ Submits batch to ListClean API
- ✅ Polls for completion (succeeds)
- ✅ Downloads clean/dirty/unknown results

### C. Status Mapping
- ✅ ListClean `clean` → `valid` (green badge)
- ✅ ListClean `dirty` → `invalid` (red badge)
- ✅ ListClean `unknown` → `unknown` (amber)

### D. Retry Policy
- ✅ First attempt: immediate
- ✅ Unknown results: `verification_next_retry_at = +48h`
- ✅ Finalized (valid/invalid): `finalized_at` set, no retry
- ✅ Max attempts (6): finalized as unknown, no more retries

### E. Admin UI
- ✅ Run Queue Now button appears
- ✅ Shows processing state with spinner
- ✅ Displays result summary (processed, valid, invalid, etc.)
- ✅ Error messages clear and actionable

### F. Enhanced Email Status
- ✅ "Clean / Valid" for valid emails
- ✅ "Invalid / Dirty" for invalid
- ✅ "Unknown (retry scheduled)" with attempt count
- ✅ "Unknown (max retries reached)" after 6 attempts
- ✅ Next retry date shown when scheduled

### G. Backward Compatibility
- ✅ Manual export still works
- ✅ Manual import still works
- ✅ Public pages unchanged and fast
- ✅ Existing imports still process

### H. Build & Non-Regression
- ✅ Builds successfully (Build ID: 0ti321mp)
- ✅ All 52 state pages pre-render
- ✅ No TypeScript errors
- ✅ No forbidden keywords

---

## Files Created/Modified

| File | Type | Status | Purpose |
|------|------|--------|---------|
| `20260302_add_listclean_verification_queue_fields.sql` | Migration | ✅ Applied | Add queue/retry fields |
| `supabase/functions/_shared/listcleanClient.ts` | New | ✅ Created | ListClean API helper |
| `supabase/functions/other-agencies-import-v2/index.ts` | Updated | ✅ Deployed | Auto-enqueue logic |
| `supabase/functions/other-agencies-listclean-process-queue/index.ts` | New | ✅ Deployed | Queue processor |
| `src/pages/AdminEmailCleaningExportPage.tsx` | Updated | ✅ Built | Queue UI + controls |
| `src/pages/AdminOtherAgenciesImportPage.tsx` | Updated | ✅ Built | Enhanced status labels |

---

## Key Features

✅ **Automated Verification:** Emails auto-enqueued after import
✅ **ListClean Integration:** Full batch API support with polling
✅ **Smart Retry:** 48-hour intervals, 6 attempts max
✅ **Status Mapping:** Clean→valid, dirty→invalid, etc.
✅ **Admin Control:** Manual queue trigger button
✅ **Status Transparency:** Retry state visible in admin UI
✅ **Backward Compatible:** Manual workflows still work
✅ **High Performance:** Batch processing, optimized indexes
✅ **Safe Defaults:** Unknown status safe default everywhere

---

## Environment Variables Required

**Pre-configured (no manual setup needed):**

- `LISTCLEAN_API_BASE_URL` — ListClean API endpoint
- `LISTCLEAN_API_TOKEN` — API authentication token
- `SUPABASE_URL` — Supabase project URL
- `SUPABASE_SERVICE_ROLE_KEY` — Service role key

All automatically available in edge functions.

---

## Future Enhancements (Phase 2+)

### Optional Improvements
1. **Scheduled cron:** Run queue hourly automatically
2. **Dashboard analytics:** Total processed, success rate, etc.
3. **Webhook support:** Notify external systems on completion
4. **Custom retry policy:** Per-state or per-agency config
5. **Bulk operations:** Retry all/mark as resolved UI
6. **Email templates:** Auto-send notifications to agencies
7. **Concurrent processing:** Multiple batches in parallel
8. **Result caching:** Dedupe identical emails across batches

### Notes
- MVP is intentionally minimal and focused on core workflow
- Extensions can add complexity as needed
- Current design supports all listed enhancements

---

## Deployment Checklist

- ✅ Database migration applied
- ✅ ListClean client helper created
- ✅ Import-v2 function updated and deployed
- ✅ Queue processor function deployed
- ✅ Admin UI updated and built
- ✅ Email status display enhanced
- ✅ Build successful (0ti321mp)
- ✅ All 52 state pages pre-render
- ✅ No regressions
- ✅ Backward compatible

**Status: READY FOR PRODUCTION DEPLOYMENT**

---

## Support & Troubleshooting

### "Queue processing failed" error
- Check ListClean API credentials in Supabase secrets
- Verify `LISTCLEAN_API_BASE_URL` and `LISTCLEAN_API_TOKEN` are set
- Try triggering queue manually from admin page

### Emails not being queued
- Verify `auto_verify_on_import = true` in import request (default)
- Check email rows have `validation_status = 'unknown'`
- Verify no database constraint errors

### Results stuck as "unknown"
- After 6 attempts (10 days), emails finalize as unknown
- Check `verification_finalized_at` timestamp
- Reason stored in `verification_external_reason` field

### Manual workflow still needed?
- Export/Import tabs still fully functional
- Can skip automated processing for specific batches
- Set `auto_verify_on_import = false` in import request to disable

---
