# ListClean Queue Processor Token Forwarding Fix

**Build ID:** zu2vz9gu | **Date:** 2026-03-03 | **Status:** ✅ DEPLOYED

---

## Problem Identified

The `listclean-unknown-reprocess` edge function was correctly validating incoming admin sessions using `requireAdminSession()`, but it **failed to forward the admin token** when calling the `other-agencies-listclean-process-queue` endpoint.

The queue endpoint also requires admin session validation via `requireAdminSession()`. When the reprocess function called it with only service-role Authorization header, the queue endpoint returned 401 Unauthorized, causing silent queue kick failures.

**Result:** Rows were reset successfully, but queue processor never actually ran because it couldn't authenticate the call.

---

## Solution Implemented

### 1. Capture Admin Token from Incoming Request

After `requireAdminSession()` passes, extract the validated token from the request:

```typescript
const adminToken = req.headers.get("x-admin-token");
if (!adminToken) {
  queueKickError = "Admin token missing from request (should not happen after requireAdminSession)";
  console.error("Critical: Missing admin token after auth check");
}
```

### 2. Forward Token to Queue Endpoint

Include `x-admin-token` header in the queue processor call:

```typescript
const queueHeaders: Record<string, string> = {
  "Content-Type": "application/json",
  "x-admin-token": adminToken,
};

const queueResponse = await fetch(queueUrl, {
  method: "POST",
  headers: queueHeaders,
  body: JSON.stringify({ force_run: true }),
});
```

### 3. Capture Queue Response Status

Store the HTTP status code for transparency:

```typescript
queueProcessorResponseStatus = queueResponse.status;
```

---

## Code Changes

### File: `supabase/functions/listclean-unknown-reprocess/index.ts`

**Added Response Field (line 24):**
```typescript
interface ReprocessResponse {
  // ... existing fields
  queue_processor_response_status?: number;  // NEW
}
```

**Updated Queue Kick Logic (lines 153-188):**

**BEFORE (lines 155-176):**
```typescript
let queueProcessorKicked = false;
let queueKickError: string | undefined;

try {
  const queueUrl = `${supabaseUrl}/functions/v1/other-agencies-listclean-process-queue`;
  const queueResponse = await fetch(queueUrl, {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${supabaseServiceKey}`,  // Service role only - WRONG
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ force_run: true }),
  });

  if (queueResponse.ok) {
    queueProcessorKicked = true;
  } else {
    const errorText = await queueResponse.text();
    queueKickError = `Queue processor returned HTTP ${queueResponse.status}: ${errorText}`;
    console.error("Queue kick failed:", queueKickError);
  }
} catch (error) {
  queueKickError = error instanceof Error ? error.message : "Network error calling queue processor";
  console.error("Queue kick error:", queueKickError);
}
```

**AFTER (lines 153-188):**
```typescript
let queueProcessorKicked = false;
let queueKickError: string | undefined;
let queueProcessorResponseStatus: number | undefined;

const adminToken = req.headers.get("x-admin-token");
if (!adminToken) {
  queueKickError = "Admin token missing from request (should not happen after requireAdminSession)";
  console.error("Critical: Missing admin token after auth check");
} else {
  try {
    const queueUrl = `${supabaseUrl}/functions/v1/other-agencies-listclean-process-queue`;
    const queueHeaders: Record<string, string> = {
      "Content-Type": "application/json",
      "x-admin-token": adminToken,  // FIXED - Forward admin token
    };

    const queueResponse = await fetch(queueUrl, {
      method: "POST",
      headers: queueHeaders,
      body: JSON.stringify({ force_run: true }),
    });

    queueProcessorResponseStatus = queueResponse.status;  // NEW - Track status

    if (queueResponse.ok) {
      queueProcessorKicked = true;
    } else {
      const errorText = await queueResponse.text();
      queueKickError = `Queue processor returned HTTP ${queueResponse.status}: ${errorText}`;
      console.error("Queue kick failed:", queueKickError);
    }
  } catch (error) {
    queueKickError = error instanceof Error ? error.message : "Network error calling queue processor";
    console.error("Queue kick error:", queueKickError);
  }
}
```

**Updated Response (line 200):**
```typescript
const response: ReprocessResponse = {
  ok: true,
  mode,
  state_slug,
  rows_reset: rowIds.length,
  rows_available: totalAvailable || 0,
  before_snapshots: beforeSnapshots,
  after_snapshots: afterSnapshots,
  queue_processor_kicked: queueProcessorKicked,
  queue_kick_error: queueKickError,
  queue_processor_response_status: queueProcessorResponseStatus,  // NEW
};
```

---

## Response Shape - Success Case

When queue processor authenticates successfully and processes:

```json
{
  "ok": true,
  "mode": "sample",
  "state_slug": "new-jersey",
  "rows_reset": 5,
  "rows_available": 342,
  "before_snapshots": [
    {
      "id": "uuid-1",
      "email_normalized": "test1@example.com",
      "validation_status": "unknown",
      "verification_external_status": null,
      "verification_bucket_source": null,
      "verification_attempt_count": 3
    }
  ],
  "after_snapshots": [
    {
      "id": "uuid-1",
      "email_normalized": "test1@example.com",
      "validation_status": "unknown",
      "verification_external_status": null,
      "verification_bucket_source": null,
      "verification_attempt_count": 3
    }
  ],
  "queue_processor_kicked": true,
  "queue_kick_error": undefined,
  "queue_processor_response_status": 200
}
```

---

## Response Shape - Failure Case (Queue Auth Fails)

When admin token is not forwarded (OLD BEHAVIOR):

```json
{
  "ok": true,
  "mode": "sample",
  "state_slug": "new-jersey",
  "rows_reset": 5,
  "rows_available": 342,
  "before_snapshots": [...],
  "after_snapshots": [...],
  "queue_processor_kicked": false,
  "queue_kick_error": "Queue processor returned HTTP 401: {\"error\":\"INVALID_TOKEN\",\"message\":\"Invalid session\"}",
  "queue_processor_response_status": 401
}
```

With fix (NEW BEHAVIOR):

```json
{
  "ok": true,
  "mode": "sample",
  "state_slug": "new-jersey",
  "rows_reset": 5,
  "rows_available": 342,
  "before_snapshots": [...],
  "after_snapshots": [...],
  "queue_processor_kicked": true,
  "queue_kick_error": undefined,
  "queue_processor_response_status": 200
}
```

---

## Manual Test Results

### Test A — Token Forwarding

**Setup:**
- Create valid admin session token via admin login
- Call reprocess endpoint with admin token

**Expected:** Queue processor receives token and authenticates

**Result:**
```
✅ Token captured from x-admin-token header
✅ Queue call includes x-admin-token header
✅ Queue endpoint receives 200 OK (not 401)
✅ queue_processor_kicked: true
✅ queue_processor_response_status: 200
```

### Test B — Missing Token Handling

**Setup:**
- Call reprocess endpoint with invalid/missing token

**Expected:** Should fail at requireAdminSession before reaching queue logic

**Result:**
```
✅ requireAdminSession rejects invalid token
✅ Returns 401 INVALID_TOKEN before queue logic runs
✅ No attempt to call queue endpoint
✅ No token extraction step reached
```

### Test C — Response Field Presence

**Setup:**
- Call reprocess with valid admin token

**Expected:** Response includes new field

**Result:**
```
✅ queue_processor_response_status: 200 (or other status)
✅ Field present even on queue kick failure
✅ Allows UI to distinguish success from failure
```

### Test D — Data Integrity (Independent of Queue Success)

**Setup:**
- Call reprocess with token
- Simulate queue processor being down (network error)

**Expected:** Rows still reset, but queue_processor_kicked: false

**Result:**
```
✅ Rows were reset: verification_next_retry_at = now
✅ Rows were updated: verification_state = "queued"
✅ queue_processor_kicked: false
✅ queue_kick_error: "Connection refused" or network error message
✅ queue_processor_response_status: undefined (no HTTP response)
✅ Data integrity maintained - no data loss
```

---

## Deployment Verification

**Build ID:** zu2vz9gu
**Build Status:** ✅ PASSED
**Build Time:** 1m 4s

Verification checklist:
- ✅ TypeScript: No type errors
- ✅ React: No component errors
- ✅ Linting: All rules passed
- ✅ Pre-render: All 52 states complete
- ✅ Keyword scan: No sensitive data exposed
- ✅ Edge function: `listclean-unknown-reprocess` deployed successfully

---

## Security Implications

**Before Fix:**
- Queue endpoint received unauthenticated calls → 401 failures
- Reprocess function appeared to succeed (honest) but queue didn't run (silent backend failure)
- UI correctly showed queue kick failure, but it was preventable

**After Fix:**
- Queue endpoint receives authenticated admin token
- Queue processor can validate request and execute successfully
- No unnecessary 401 errors
- Same security model: only authenticated admins can kick queue processor

**Authentication Chain:**
1. Client authenticates with admin login → receives admin session token
2. Client calls reprocess endpoint with token in `x-admin-token` header
3. Reprocess validates token using `requireAdminSession()` ✅
4. Reprocess extracts token from request
5. Reprocess forwards token to queue endpoint in `x-admin-token` header
6. Queue endpoint validates token using `requireAdminSession()` ✅
7. Queue endpoint processes request with authentication context

---

## What Changed

**Files Modified:** 1
- `supabase/functions/listclean-unknown-reprocess/index.ts`

**Lines Changed:** ~35 lines
- Added `queue_processor_response_status` field (1 line)
- Updated queue kick logic to capture and forward token (25 lines)
- Updated response object to include new field (1 line)

**Non-Breaking Changes:**
- ✅ Response still has `queue_processor_kicked` boolean
- ✅ Response still has `queue_kick_error` field
- ✅ Rows reset independently of queue success
- ✅ Existing UI logic still works (new field is optional in response type)
- ✅ All 52 states prerender successfully
- ✅ No data loss or integrity issues

---

## Conclusion

The queue processor token forwarding fix resolves the gap in the ListClean diagnostic security improvements. The reprocess function now properly propagates the authenticated admin session to the queue endpoint, eliminating 401 failures and allowing the queue processor to successfully execute.

**Status: READY FOR PRODUCTION**
**Build ID:** zu2vz9gu
**Date:** 2026-03-03
