# ListClean Queue - Failure Stages Visual Diagram

**Build ID:** 9me5q64x | **Date:** 2026-03-03

---

## Processing Pipeline

```
START: 6 Pending Emails Selected
│
├─ STAGE 1: SUBMIT_BATCH
│  │
│  ├─ Action: Send emails to ListClean API
│  │
│  └─ Outcomes:
│     ├─ ✅ Success → batch_id assigned → Continue to STAGE 2
│     └─ ❌ Failure → failure_stage="submit_batch"
│           ├─ Error logged
│           ├─ All 6 emails marked failed
│           └─ Return response with failure_samples
│
├─ STAGE 2: POLL_BATCH
│  │
│  ├─ Action: Check if ListClean finished processing batch
│  │ (polls up to 30 times, 2 second intervals)
│  │
│  └─ Outcomes:
│     ├─ ✅ Success → Status = "completed" or "ready" → Continue to STAGE 3
│     └─ ❌ Failure → failure_stage="poll_batch"
│           ├─ Error logged
│           ├─ All 6 emails marked failed
│           └─ Return response with failure_samples
│
├─ STAGE 3: DOWNLOAD_RESULTS
│  │
│  ├─ Action: Download clean.json, dirty.json, unknown.json from ListClean
│  │
│  └─ Outcomes:
│     ├─ ✅ Success → 3 result files obtained → Continue to STAGE 4
│     └─ ❌ Failure → failure_stage="download_results"
│           ├─ Error logged
│           ├─ All 6 emails marked failed
│           └─ Return response with failure_samples
│
├─ STAGE 4: PARSE_RESULTS
│  │
│  ├─ Action: Parse JSON, merge results, map emails to results
│  │ (for each email: find result by normalized email address)
│  │
│  ├─ For each Email:
│  │ │
│  │ ├─ Email 1: Find in results
│  │ │  ├─ ✅ Found → Get status (clean/dirty/unknown)
│  │ │  │  └─ Extract validation data
│  │ │  └─ ❌ Not found → Failure
│  │ │     ├─ failure_stage="parse_results"
│  │ │     ├─ Mark this email failed
│  │ │     └─ Continue to next email
│  │ │
│  │ ├─ Email 2: ...
│  │ │
│  │ └─ Email 6: ...
│  │
│  └─ Outcomes:
│     ├─ ✅ All found → Results ready → Continue to STAGE 5
│     ├─ ✅ Some found → Partial success (process found ones)
│     └─ ❌ None found → failure_stage="parse_results"
│
├─ STAGE 5: DB_UPDATE
│  │
│  ├─ Action: Write validation results to database
│  │
│  ├─ For each Email with Result:
│  │ │
│  │ ├─ Email 1: Map ListClean status to internal status
│  │ │  ├─ Status "clean" → internal "valid"
│  │ │  ├─ Status "dirty" → internal "invalid"
│  │ │  └─ Status "unknown" → internal "unknown"
│  │ │
│  │ ├─ Calculate next verification state
│  │ │  ├─ If "valid" or "invalid" → state="completed", finalized_at=now
│  │ │  ├─ If "unknown" and attempt < 6 → state="retry_scheduled", retry_at=now+48h
│  │ │  └─ If "unknown" and attempt >= 6 → state="failed_permanent", finalized_at=now
│  │ │
│  │ ├─ Database Update
│  │ │  ├─ ✅ Success → Update completed
│  │ │  │  └─ Continue to next email
│  │ │  └─ ❌ Failure → failure_stage="db_update"
│  │ │     ├─ Mark this email failed
│  │ │     ├─ Include external_status (ListClean gave result but DB rejected)
│  │ │     └─ Continue to next email
│  │ │
│  │ └─ Email 2-6: ...
│  │
│  └─ Outcomes:
│     ├─ ✅ All updated → All complete
│     ├─ ✅ Some updated → Partial success
│     └─ ❌ None updated → failure_stage="db_update"
│
└─ END: Return Response with Results

Response Structure:
{
  "ok": true,
  "total_selected": 6,
  "processed": <count_successfully_updated>,
  "verified_valid": <count_status_valid>,
  "verified_invalid": <count_status_invalid>,
  "verified_unknown": <count_status_unknown>,
  "scheduled_for_retry": <count_retry_in_48h>,
  "finalized_unknown": <count_failed_permanent>,
  "failed": <count_with_errors>,
  "failure_samples": [
    {
      "email_id": "...",
      "email_normalized": "info@agency1.com",
      "failure_stage": "submit_batch" | "poll_batch" | ...,
      "error_message": "specific error"
    },
    ...
  ]
}
```

---

## Failure Stage Decision Tree

```
Queue Processor Started
│
├─ SELECT pending emails
│  └─ Found 6? Yes → Continue
│     └─ No? Return "processed: 0"
│
├─ SUBMIT_BATCH
│  │
│  ├─ API Call: POST /verify/email/batch
│  │
│  ├─ Response OK?
│  │  ├─ Yes → Parse response
│  │  │  ├─ Has list_id?
│  │  │  │  ├─ Yes → POLL_BATCH
│  │  │  │  └─ No → failure_stage="submit_batch" ✗
│  │  │  │     "Failed to extract list_id from response"
│  │  │  │
│  │  │  └─ Caught error?
│  │  │     └─ Yes → failure_stage="submit_batch" ✗
│  │  │        Error logged, all 6 failed
│  │  │
│  │  └─ No (non-200 HTTP status)
│  │     └─ failure_stage="submit_batch" ✗
│  │        "ListClean batch submit failed (401|403|500): ..."
│  │
│  └─ POLL_BATCH
│     │
│     ├─ Loop: Check status every 2s, max 30 attempts
│     │
│     ├─ Status = "completed" or "ready"?
│     │  ├─ Yes → DOWNLOAD_RESULTS
│     │  ├─ No & attempts remaining → Wait 2s, retry
│     │  └─ No & max attempts exceeded
│     │     └─ failure_stage="poll_batch" ✗
│     │        "ListClean list 1234567 did not complete after 30 attempts"
│     │
│     └─ Caught error?
│        └─ Yes → failure_stage="poll_batch" ✗
│           "ListClean API unreachable"
│
├─ DOWNLOAD_RESULTS
│  │
│  ├─ Download: /downloads/json/{listId}/clean/
│  │ ├─ Response OK? Yes → Parse clean.json
│  │ └─ Response OK? No → failure_stage="download_results" ✗
│  │    "ListClean download failed (500): ..."
│  │
│  ├─ Download: /downloads/json/{listId}/dirty/
│  │ ├─ Response OK? Yes → Parse dirty.json
│  │ └─ Response OK? No → failure_stage="download_results" ✗
│  │
│  ├─ Download: /downloads/json/{listId}/unknown/
│  │ ├─ Response OK? Yes → Parse unknown.json
│  │ └─ Response OK? No → failure_stage="download_results" ✗
│  │
│  └─ All 3 downloaded? → PARSE_RESULTS
│
├─ PARSE_RESULTS
│  │
│  ├─ Merge all 3 result arrays into resultMap
│  │
│  ├─ For each of 6 emails:
│  │  │
│  │  ├─ Normalize email address
│  │  │
│  │  ├─ Look up in resultMap
│  │  │
│  │  ├─ Found?
│  │  │  ├─ Yes → Email 1-6 has result ✅
│  │  │  │  ├─ Extract status (clean/dirty/unknown)
│  │  │  │  ├─ Map to internal status (valid/invalid/unknown)
│  │  │  │  └─ Calculate verification_state
│  │  │  │
│  │  │  └─ No → Email 1 failed ❌
│  │  │     ├─ failure_stage="parse_results"
│  │  │     ├─ Error: "No result from ListClean for info@domain.com"
│  │  │     └─ Mark email as failed
│  │  │
│  │  └─ Caught error?
│  │     └─ Yes → failure_stage="parse_results" ✗
│  │        All 6 failed, error logged
│  │
│  └─ Ready for DB_UPDATE
│
├─ DB_UPDATE
│  │
│  ├─ For each email with result:
│  │  │
│  │  ├─ Build update payload
│  │  │
│  │  ├─ Database UPDATE
│  │  │
│  │  ├─ Success?
│  │  │  ├─ Yes → Email 1 updated ✅
│  │  │  │  ├─ validation_status = valid/invalid/unknown
│  │  │  │  ├─ verification_state = completed/retry_scheduled/failed_permanent
│  │  │  │  └─ verification_finalized_at = set if completed or max retries
│  │  │  │
│  │  │  └─ No → Email 1 failed ❌
│  │  │     ├─ failure_stage="db_update"
│  │  │     ├─ Error logged (RLS error, constraint violation, etc.)
│  │  │     ├─ external_status included (if ListClean gave result)
│  │  │     └─ Mark email as failed
│  │  │
│  │  └─ Caught error?
│  │     └─ Yes → Email 1 failed ❌
│  │        failure_stage="db_update"
│  │
│  └─ Process all 6
│
└─ RETURN RESPONSE
   ├─ Count processed (successful DB updates)
   ├─ Count by final status (valid/invalid/unknown/retry_scheduled/failed_permanent)
   ├─ Count failed (any errors)
   ├─ Include failure_samples (first 5 failures)
   └─ Response sent
```

---

## Failure Scenarios

### Scenario 1: API Credentials Invalid

```
Email 1: Submit batch
  ↓
API Response: 401 Unauthorized
  ↓
Failure Captured:
  failure_stage: "submit_batch"
  error_message: "ListClean batch submit failed (401): Invalid authentication token"
  external_status: null (never reached API)
  batch_id: null

Result: All 6 emails marked failed
Action: Update LISTCLEAN_API_TOKEN and retry
```

### Scenario 2: Batch Timed Out

```
Email 1-6: Submit batch → OK, batch_id=1234567
  ↓
Poll: Attempt 1-30 checking status
  ↓
Status still "processing" after 30 attempts (60 seconds)
  ↓
Failure Captured:
  failure_stage: "poll_batch"
  error_message: "ListClean list 1234567 did not complete after 30 attempts"
  external_status: "processing" (was never completed)
  batch_id: "1234567"

Result: All 6 emails marked failed
Action: Wait and retry (batch may still be processing in background)
```

### Scenario 3: Email Not in Results

```
Email 1-4: Submit batch → OK
  ↓
Poll: Complete
  ↓
Download: Got clean.json, dirty.json, unknown.json
  ↓
Parse Results:
  Email 1: Found in clean.json ✅
  Email 2: Found in dirty.json ✅
  Email 3: Found in unknown.json ✅
  Email 4: Found in clean.json ✅
  Email 5: NOT FOUND ❌
  Email 6: Found in dirty.json ✅
  ↓
Failure Captured:
  failure_stage: "parse_results"
  error_message: "No result from ListClean for contact@agency5.com"
  external_status: null (never retrieved from ListClean)
  batch_id: "1234567"

Result:
  Email 1-4, 6: Continue to DB_UPDATE ✅ (4 succeed)
  Email 5: Marked failed ❌ (1 failed)
```

### Scenario 4: RLS Policy Prevents Update

```
Email 1-4: Submit → OK → Poll → OK → Download → OK → Parse → OK
  ↓
DB_UPDATE:
  Email 1-4: Update successful ✅
  Email 5: new row violates row-level security policy ❌
  Email 6: Update successful ✅
  ↓
Failure Captured:
  failure_stage: "db_update"
  error_message: "new row violates row-level security policy for table \"other_agency_emails\""
  external_status: "clean" (ListClean succeeded, DB failed)
  batch_id: "1234567"

Result:
  Email 1-4, 6: Updated with validation results ✅ (5 succeed)
  Email 5: Marked failed ❌ (1 failed)
  Note: Validation result from ListClean is lost for Email 5
```

### Scenario 5: All Success

```
Email 1-6: Submit batch → OK
  ↓
Poll: Complete
  ↓
Download: OK (3 files)
  ↓
Parse Results: All 6 found in results ✅
  ├─ Email 1-3: status="clean" → internal="valid"
  ├─ Email 4-5: status="dirty" → internal="invalid"
  └─ Email 6: status="unknown" → internal="unknown", schedule retry
  ↓
DB_UPDATE:
  Email 1-6: All updates successful ✅
  ↓
Response:
  total_selected: 6
  processed: 6
  verified_valid: 3
  verified_invalid: 2
  verified_unknown: 0
  scheduled_for_retry: 1
  finalized_unknown: 0
  failed: 0
  failure_samples: null

Result: All 6 emails now have validation status ✅
```

---

## Failure Sample Structure

```
failure_samples: [{
  // Email Identification
  "email_id": "550e8400-e29b-41d4-a716-446655440001",
  "email_normalized": "info@agency1.com",

  // Pre-failure State
  "validation_status_before": "pending",
  "verification_attempt_count": 0,

  // Failure Details
  "failure_stage": "submit_batch",
  "error_message": "ListClean batch submit failed (401): Invalid authentication token",

  // Optional Context (if available)
  "external_status": undefined,  // "clean"|"dirty"|"unknown" if ListClean responded
  "batch_id": undefined          // List ID if batch was created
}]
```

---

## Stage-to-Fix Mapping

```
Failure Stage              → Problem                    → Fix
─────────────────────────────────────────────────────────────────────
submit_batch              → Cannot reach API           → Check API credentials
                          → API authentication failed  → Update token
                          → Network issue             → Check connectivity
                                                      → Retry

poll_batch                → Batch status check timeout → Wait and retry
                          → API error during polling   → Check API status
                          → Rate limiting              → Wait before retry

download_results          → Results file download fail → Check ListClean status
                          → API error                 → Retry later
                          → Results expired           → Resubmit batch

parse_results             → Email not in results      → Email never validated
                          → Result format error       → ListClean issue
                          → Parsing error             → Check logs

db_update                 → RLS policy blocks write    → Fix RLS policy
                          → Constraint violation      → Fix constraint
                          → Concurrent modification   → Retry
                          → Note: ListClean succeeded → Data may be recoverable

other                     → Unexpected error          → Check server logs
                          → Env var missing           → Fix configuration
                          → Crash                     → Debug code
```

---

## Response Interpretation Guide

```
If failed = 0:
  ✅ All emails processed successfully
  ├─ Check verified_valid count (can send via Smartlead)
  ├─ Check verified_invalid count (do not send)
  ├─ Check scheduled_for_retry count (will retry in 48h)
  └─ Check finalized_unknown count (gave up after 6 retries)

If failed > 0:
  ❌ Some emails had errors
  ├─ Check failure_samples[0].failure_stage
  ├─ Determine which stage failed
  ├─ Fix the underlying issue
  └─ Retry the queue processor

If total_selected = 0:
  ⚠️  No pending emails to process
  ├─ Either all already processed
  └─ Or verification_next_retry_at in future

If processed = 0 and failed = total_selected:
  ❌ Batch-level failure (all emails affected)
  └─ Check failure_samples[0].failure_stage
     ├─ submit_batch? → API credentials issue
     ├─ poll_batch? → Batch timeout
     ├─ download_results? → Results unavailable
     └─ parse_results? → Results parsing error
```

---

**Diagram Reference:** Use this to understand exactly where and why failures occur in the queue processor pipeline.

