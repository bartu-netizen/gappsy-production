# ListClean Queue Processor - Enhanced Diagnostics

**Build ID:** 9me5q64x | **Date:** 2026-03-03 | **Status:** Deployed

---

## Summary

The ListClean queue processor has been significantly enhanced to provide detailed failure diagnostics. Instead of silently reporting "Failed: 6" with no explanation, the queue now tracks exactly which stage each failure occurred in and provides specific error messages for troubleshooting.

---

## What Changed

### 1. Failure Stage Tracking

Each failure now includes a `failure_stage` label indicating where in the pipeline it failed:

- **submit_batch** - Failed to submit emails to ListClean API
- **poll_batch** - Failed while polling for batch completion status
- **download_results** - Failed to download clean/dirty/unknown result files
- **parse_results** - Failed while parsing results or mapping emails
- **db_update** - Failed while writing results back to database
- **other** - Unexpected error (catch-all)

### 2. Response Structure

**New Response Fields:**

```typescript
interface ProcessResult {
  ok: boolean;
  total_selected: number;        // ← NEW: How many pending emails were selected
  processed: number;              // Successful completions
  verified_valid: number;         // Now marked as 'valid'
  verified_invalid: number;       // Now marked as 'invalid'
  verified_unknown: number;       // Still marked as 'unknown'
  scheduled_for_retry: number;    // Scheduled for retry in 48 hours
  finalized_unknown: number;      // Finalized as unknown (max retries reached)
  failed: number;                 // Total failures
  errors: string[];               // Error messages (up to 50)
  failure_samples?: FailureSample[]; // ← NEW: First 5 failures with details
  paused?: boolean;
  pause_reason?: string | null;
}

interface FailureSample {
  email_id: string;
  email_normalized: string;
  validation_status_before: string;
  verification_attempt_count: number;
  failure_stage: "submit_batch" | "poll_batch" | "download_results" | "parse_results" | "db_update" | "other";
  error_message: string;          // Sanitized, max 200 chars
  external_status?: string;       // ListClean status if available
  batch_id?: string;              // ListClean batch ID
}
```

### 3. Failure Detection Flow

```
Pending Email Selected
  ↓
[Submit Batch to ListClean API]
  ├─ Success → Poll for completion
  └─ Failure → failure_stage: "submit_batch" ✗
              Add to failure_samples with error message
              Mark email as failed
              Return detailed error info

[Poll for Batch Completion]
  ├─ Success → Download results
  └─ Failure → failure_stage: "poll_batch" ✗
              Add to failure_samples with error message
              Mark emails as failed
              Return detailed error info

[Download Clean/Dirty/Unknown Files]
  ├─ Success → Parse and map results
  └─ Failure → failure_stage: "download_results" ✗
              Add to failure_samples with error message
              Mark emails as failed
              Return detailed error info

[Parse Results & Map to Emails]
  ├─ Success → Update database
  └─ Failure → failure_stage: "parse_results" ✗
              Add to failure_samples with error message
              Mark emails as failed
              Return detailed error info

[Write Verification Results to Database]
  ├─ Success → Mark processed
  └─ Failure → failure_stage: "db_update" ✗
              Add to failure_samples with error message
              Mark email as failed
              Include ListClean status if received
              Return detailed error info
```

---

## Example Responses

### Success Response (All 6 Emails Processed)

```json
{
  "ok": true,
  "total_selected": 6,
  "processed": 6,
  "verified_valid": 3,
  "verified_invalid": 2,
  "verified_unknown": 0,
  "scheduled_for_retry": 0,
  "finalized_unknown": 1,
  "failed": 0,
  "errors": [],
  "failure_samples": null
}
```

### Failure Response with Diagnostics (All 6 Emails Failed)

```json
{
  "ok": true,
  "total_selected": 6,
  "processed": 0,
  "verified_valid": 0,
  "verified_invalid": 0,
  "verified_unknown": 0,
  "scheduled_for_retry": 0,
  "finalized_unknown": 0,
  "failed": 6,
  "errors": [
    "Batch submit failed: ListClean batch submit failed (401): Invalid authentication token"
  ],
  "failure_samples": [
    {
      "email_id": "550e8400-e29b-41d4-a716-446655440001",
      "email_normalized": "info@agency1.com",
      "validation_status_before": "pending",
      "verification_attempt_count": 0,
      "failure_stage": "submit_batch",
      "error_message": "ListClean batch submit failed (401): Invalid authentication token",
      "batch_id": null
    },
    {
      "email_id": "550e8400-e29b-41d4-a716-446655440002",
      "email_normalized": "contact@agency2.com",
      "validation_status_before": "pending",
      "verification_attempt_count": 0,
      "failure_stage": "submit_batch",
      "error_message": "ListClean batch submit failed (401): Invalid authentication token",
      "batch_id": null
    },
    {
      "email_id": "550e8400-e29b-41d4-a716-446655440003",
      "email_normalized": "hello@agency3.com",
      "validation_status_before": "pending",
      "verification_attempt_count": 0,
      "failure_stage": "submit_batch",
      "error_message": "ListClean batch submit failed (401): Invalid authentication token",
      "batch_id": null
    },
    {
      "email_id": "550e8400-e29b-41d4-a716-446655440004",
      "email_normalized": "sales@agency4.com",
      "validation_status_before": "pending",
      "verification_attempt_count": 0,
      "failure_stage": "submit_batch",
      "error_message": "ListClean batch submit failed (401): Invalid authentication token",
      "batch_id": null
    },
    {
      "email_id": "550e8400-e29b-41d4-a716-446655440005",
      "email_normalized": "support@agency5.com",
      "validation_status_before": "pending",
      "verification_attempt_count": 0,
      "failure_stage": "submit_batch",
      "error_message": "ListClean batch submit failed (401): Invalid authentication token",
      "batch_id": null
    }
  ]
}
```

### Mixed Response (Some Success, Some Failures)

```json
{
  "ok": true,
  "total_selected": 6,
  "processed": 4,
  "verified_valid": 2,
  "verified_invalid": 2,
  "verified_unknown": 0,
  "scheduled_for_retry": 0,
  "finalized_unknown": 0,
  "failed": 2,
  "errors": [
    "Error processing marketing@agency5.com: new row violates row-level security policy for table \"other_agency_emails\"",
    "Error processing team@agency6.com: duplicate key value violates unique constraint \"other_agency_emails_agency_id_email_normalized_key\""
  ],
  "failure_samples": [
    {
      "email_id": "550e8400-e29b-41d4-a716-446655440005",
      "email_normalized": "marketing@agency5.com",
      "validation_status_before": "pending",
      "verification_attempt_count": 0,
      "failure_stage": "db_update",
      "error_message": "new row violates row-level security policy for table \"other_agency_emails\"",
      "external_status": "clean",
      "batch_id": "1234567"
    },
    {
      "email_id": "550e8400-e29b-41d4-a716-446655440006",
      "email_normalized": "team@agency6.com",
      "validation_status_before": "pending",
      "verification_attempt_count": 0,
      "failure_stage": "db_update",
      "error_message": "duplicate key value violates unique constraint \"other_agency_emails_agency_id_email_normalized_key\"",
      "external_status": "clean",
      "batch_id": "1234567"
    }
  ]
}
```

---

## Troubleshooting by Failure Stage

### submit_batch Failures

**Indicates:** Problem communicating with ListClean API

**Common Causes:**
- Invalid or expired API credentials (LISTCLEAN_API_TOKEN)
- ListClean API temporarily unavailable
- Network connectivity issue
- Invalid base URL (LISTCLEAN_API_BASE_URL)

**Error Example:**
```
ListClean batch submit failed (401): Invalid authentication token
```

**Action:** Check ListClean API credentials and connectivity

---

### poll_batch Failures

**Indicates:** Batch was submitted but checking status failed

**Common Causes:**
- ListClean API timeout during polling
- Batch ID became invalid
- API rate limiting

**Error Example:**
```
ListClean list 1234567 did not complete after 30 attempts
```

**Action:** Wait and retry, or check ListClean API status

---

### download_results Failures

**Indicates:** Results weren't available for download

**Common Causes:**
- Batch processing failed on ListClean side
- Results expired before download
- API returned invalid response format

**Error Example:**
```
ListClean download failed (500): Internal Server Error
```

**Action:** Retry batch processing or contact ListClean support

---

### parse_results Failures

**Indicates:** Results downloaded but parsing failed

**Common Causes:**
- Email not found in results (mismatch)
- Unexpected response format from ListClean
- Memory/processing error

**Error Example:**
```
No result from ListClean for info@domain.com
```

**Action:** Check if emails were actually submitted, verify email normalization

---

### db_update Failures

**Indicates:** ListClean results received but database update failed

**Common Causes:**
- RLS policy prevents update
- Duplicate key constraint violation
- Validation status not allowed by constraint
- Concurrent modification

**Error Example:**
```
new row violates row-level security policy for table "other_agency_emails"
```

**Action:** Check RLS policies and database constraints

---

### other Failures

**Indicates:** Unexpected error in outer try/catch

**Common Causes:**
- Unhandled exception
- Environment variable missing
- Supabase client initialization failed

**Error Example:**
```
Missing Supabase environment variables
```

**Action:** Check server logs and environment configuration

---

## Pending Row Selection Logic

The queue processor selects emails matching BOTH conditions:

```sql
SELECT id, email_normalized, verification_attempt_count
FROM other_agency_emails
WHERE (
  validation_status = 'pending'          -- Not yet verified
  OR validation_status = 'unknown'       -- Needs retry
)
AND verification_next_retry_at <= now()  -- Due for verification
AND verification_attempt_count < 6      -- Haven't exceeded max retries
ORDER BY verification_next_retry_at ASC  -- Process oldest first
LIMIT 3000
```

**For your 6 newly imported emails:**
- ✅ validation_status = 'pending'
- ✅ verification_state = 'queued'
- ✅ verification_next_retry_at = NULL (treated as due immediately)
- ✅ verification_attempt_count = 0
- ✅ All 6 should be selected for processing

---

## Database Update Validation

The queue processor updates only these fields on success:

```typescript
{
  validation_status: "valid" | "invalid" | "unknown",
  validation_provider: "ListClean",
  validation_checked_at: "2026-03-03T04:09:51Z",
  verification_external_status: "clean" | "dirty" | "unknown",
  verification_external_reason: "reason or sub_status",
  verification_last_attempt_at: "2026-03-03T04:09:51Z",
  verification_attempt_count: 1-6,
  verification_next_retry_at: null | "2026-03-05T04:09:51Z",
  verification_finalized_at: "2026-03-03T04:09:51Z" | null,
  verification_state: "completed" | "retry_scheduled" | "failed_permanent",
  verification_bucket_source: "clean" | "dirty" | "unknown"
}
```

All these statuses are allowed by constraints:
- ✅ validation_status: pending, valid, invalid, unknown, risky, catch_all, blocked, opted_out
- ✅ verification_state: queued, processing, completed, retry_scheduled, failed_permanent

---

## Real Testing Your 6 Emails

### Step 1: Verify Pending Rows in Database

```sql
SELECT
  id,
  email_normalized,
  validation_status,
  verification_state,
  verification_attempt_count,
  verification_next_retry_at,
  created_at
FROM other_agency_emails
WHERE validation_status = 'pending'
  AND verification_state = 'queued'
ORDER BY created_at DESC
LIMIT 10;
```

Expected result: Shows 6 rows from your import with all pending/queued values

### Step 2: Run Queue Processor

Call the queue processor:
```
POST /functions/v1/other-agencies-listclean-process-queue
Authorization: Bearer <admin-token>
Body: { "force_run": true }
```

### Step 3: Check Response

The response will show:
- `total_selected`: Should be 6 (or more if you have older pending emails)
- `processed`: Number successfully completed
- `failed`: Number that failed
- `failure_samples`: Detailed info on first 5 failures

### Step 4: Query Results After Processing

```sql
SELECT
  id,
  email_normalized,
  validation_status,
  verification_state,
  verification_attempt_count,
  verification_external_status,
  verification_finalized_at,
  updated_at
FROM other_agency_emails
WHERE validation_status IN ('valid', 'invalid', 'unknown')
ORDER BY updated_at DESC
LIMIT 10;
```

---

## What to Expect

### If ListClean API Works

```
Scenario: All 6 emails processed successfully
├─ total_selected: 6
├─ processed: 6
├─ verified_valid: ? (depends on email validity)
├─ verified_invalid: ? (depends on email validity)
├─ failed: 0
└─ failure_samples: null ← No failures!

Result: Email rows updated with validation results
```

### If ListClean API Fails

```
Scenario: Authentication token invalid or API down
├─ total_selected: 6
├─ processed: 0
├─ failed: 6
├─ failure_stage: "submit_batch"
├─ error_message: "ListClean batch submit failed (401): Invalid token"
└─ failure_samples: [
    {
      email_id: "...",
      email_normalized: "...",
      failure_stage: "submit_batch",
      error_message: "ListClean batch submit failed (401): Invalid token"
    },
    ...
  ]

Result: Email rows remain pending, no updates made
Action: Fix API credentials and retry
```

### If Database Update Fails

```
Scenario: RLS policy prevents insert
├─ total_selected: 6
├─ processed: 0
├─ failed: 6
├─ failure_stage: "db_update"
├─ error_message: "new row violates row-level security policy"
├─ external_status: "clean" ← ListClean succeeded
└─ failure_samples: [
    {
      email_id: "...",
      email_normalized: "...",
      failure_stage: "db_update",
      error_message: "new row violates row-level security policy",
      external_status: "clean"
    },
    ...
  ]

Result: Email rows remain pending, validation results lost
Action: Fix RLS policy or constraint, retry
```

---

## Build Status

```
✅ TypeScript Compilation: Success
✅ All 52 States Prerendered: Success
✅ Build ID: 9me5q64x
✅ Deployment Time: 2026-03-03 04:09:51
```

---

## Files Modified

**supabase/functions/other-agencies-listclean-process-queue/index.ts**
- Added FailureSample interface
- Enhanced ProcessResult interface with total_selected and failure_samples
- Added failure_stage tracking to processQueueBatch
- Added try/catch blocks for each stage: submit_batch, poll_batch, download_results, parse_results, db_update
- Collect up to 5 failure samples with full diagnostic info
- Updated response to include failure_samples array

**Changes Summary:**
- ~200 lines added for enhanced error tracking
- Backward compatible - all existing code paths preserved
- No breaking changes to database schema
- No changes to importer (as requested)

---

## Next Steps

1. **Run the queue processor** with your 6 pending emails
2. **Check the response** for failure_samples
3. **Diagnose** based on failure_stage and error_message
4. **Fix** the underlying issue (API credentials, RLS policy, etc.)
5. **Retry** the queue processor
6. **Monitor** pending email count to ensure they're being processed

The enhanced diagnostics will make it immediately clear what's failing and why.

---

**Status:** ✅ DEPLOYED | **Build ID:** 9me5q64x | **Date:** 2026-03-03

