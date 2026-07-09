# ListClean Queue - Quick Test Guide

**Build ID:** 9me5q64x | **Date:** 2026-03-03

---

## Current Situation

You have:
- ✅ 24 agencies created
- ✅ 6 emails created with validation_status='pending', verification_state='queued'
- ❌ Queue processor failing all 6 with "Failed: 6" (no details)

**Goal:** Deploy enhanced queue processor with detailed failure diagnostics

**Status:** ✅ DEPLOYED

---

## What Changed

### Before
```json
{
  "ok": true,
  "processed": 0,
  "verified_valid": 0,
  "verified_invalid": 0,
  "failed": 6,
  "errors": ["Error processing..."]
}
```
No visibility into WHY the 6 emails failed.

### After
```json
{
  "ok": true,
  "total_selected": 6,
  "processed": 0,
  "verified_valid": 0,
  "verified_invalid": 0,
  "failed": 6,
  "failure_samples": [
    {
      "email_id": "550e8400-e29b-41d4-a716-446655440001",
      "email_normalized": "info@agency1.com",
      "failure_stage": "submit_batch",
      "error_message": "ListClean batch submit failed (401): Invalid authentication token"
    },
    ...
  ]
}
```
Clear visibility into failure stage and exact error message!

---

## Failure Stage Reference

| Stage | Meaning | Common Cause |
|-------|---------|--------------|
| submit_batch | Failed to send emails to ListClean API | Bad credentials, API down |
| poll_batch | Failed checking if batch completed | Timeout, rate limit |
| download_results | Failed to download results files | API error, results expired |
| parse_results | Failed parsing results data | Email not found, format error |
| db_update | Failed writing to database | RLS policy, constraint violation |
| other | Unexpected error | Env var missing, crash |

---

## Test Path

### 1. Check Pending Rows

```sql
SELECT COUNT(*) as pending_count
FROM other_agency_emails
WHERE validation_status = 'pending'
  AND verification_state = 'queued';

-- Expected: 6 rows
```

### 2. Run Queue Processor

```bash
curl -X POST https://your-domain/functions/v1/other-agencies-listclean-process-queue \
  -H "Authorization: Bearer <admin-token>" \
  -H "Content-Type: application/json" \
  -d '{"force_run": true}'
```

### 3. Check Response

Look for `failure_samples` array:

- **submit_batch** → Check ListClean API credentials
- **poll_batch** → Wait and retry
- **download_results** → Check ListClean API status
- **parse_results** → Check email normalization
- **db_update** → Check RLS policies
- **other** → Check server logs

### 4. Fix & Retry

Once you identify and fix the issue, run step 2 again.

---

## Expected Outcomes

### Scenario A: API Credentials Invalid
```
failure_stage: "submit_batch"
error_message: "ListClean batch submit failed (401): Invalid authentication token"

Action: Update LISTCLEAN_API_TOKEN secret and retry
```

### Scenario B: All Emails Valid
```
processed: 6
verified_valid: 6
failed: 0
failure_samples: null

Result: All 6 emails now ready for Smartlead (validation_status='valid')
```

### Scenario C: Mixed Results
```
processed: 4
verified_valid: 2
verified_invalid: 2
failed: 2
failure_samples: [
  {
    email_id: "...",
    email_normalized: "marketing@agency5.com",
    failure_stage: "db_update",
    error_message: "RLS policy prevents update"
  }
]

Action: 4 emails processed, 2 had DB errors - fix RLS and retry
```

---

## Key Insights

**total_selected:** How many emails matched the criteria for processing
```
Selects: validation_status IN ('pending', 'unknown')
  AND verification_next_retry_at <= now()
  AND verification_attempt_count < 6
```

**processed:** Successfully completed (includes valid, invalid, unknown, retry_scheduled, failed_permanent)

**verified_valid:** Now ready to send via Smartlead (validation_status='valid')

**verified_invalid:** Should not be sent (validation_status='invalid')

**verified_unknown:** Scheduled for retry in 48 hours (unless max retries reached)

**failed:** Could not be processed due to error (see failure_samples)

**failure_samples:** Detailed info on first 5 failures (email_id, email, failure_stage, error_message, external_status, batch_id)

---

## Deployment Details

```
Edge Function: other-agencies-listclean-process-queue
Changes: Enhanced failure tracking with 6 failure stages
Build ID: 9me5q64x
Timestamp: 2026-03-03 04:09:51 UTC
Status: ✅ Deployed & Ready
```

---

## Summary

The queue processor now provides detailed failure diagnostics instead of silent failures. Each failure includes:

1. **Which email** (email_id, email_normalized)
2. **What failed** (failure_stage)
3. **Why it failed** (error_message)
4. **Context** (external_status if available, batch_id if applicable)

This makes it immediately clear what needs to be fixed to get email processing working.

**Next Action:** Run the queue processor and check failure_samples to diagnose the issue.

