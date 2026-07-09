# ListClean Diagnostic - Fixed Code Blocks

**Build ID:** tyb1i2yc | **Date:** 2026-03-03

---

## Code Block 1: Diagnostic Edge Function - Auth Fix

**File:** `supabase/functions/listclean-unknown-diagnostic/index.ts`
**Lines:** 1-49

### BEFORE (Weak Auth)
```typescript
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const adminToken = req.headers.get("x-admin-token");
    if (!adminToken) {
      return new Response(
        JSON.stringify({ ok: false, error: "Admin token required" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }
```

### AFTER (Proper Auth)
```typescript
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) {
      return authResult;
    }
```

**Security Improvements:**
- ✅ Uses proper HMAC-signed session token validation
- ✅ Checks token expiration
- ✅ Returns proper error messages (NO_TOKEN, INVALID_TOKEN)
- ✅ Uses centralized CORS_HEADERS

---

## Code Block 2: Diagnostic Response - Add analysis_basis

**File:** `supabase/functions/listclean-unknown-diagnostic/index.ts`
**Lines:** 22-38, 127-143

### BEFORE (No Context)
```typescript
interface DiagnosticResponse {
  ok: boolean;
  filters: {
    state_slug?: string;
    limit: number;
  };
  total_unknown_count: number;
  sample_count: number;
  samples: UnknownEmailRow[];
  analysis: {
    stale_unknown_indicators: number;
    potential_real_unknown: number;
    has_clean_bucket_source: number;
    high_retry_count: number;
  };
}
```

### AFTER (With Context)
```typescript
interface DiagnosticResponse {
  ok: boolean;
  filters: {
    state_slug?: string;
    limit: number;
  };
  total_unknown_count: number;
  sample_count: number;
  analysis_basis: "sample_only";  // ← NEW
  samples: UnknownEmailRow[];
  analysis: {
    stale_unknown_indicators: number;
    potential_real_unknown: number;
    has_clean_bucket_source: number;
    high_retry_count: number;
  };
}

// Response building:
const response: DiagnosticResponse = {
  ok: true,
  filters: {
    state_slug: stateSlug,
    limit,
  },
  total_unknown_count: count || 0,
  sample_count: samples.length,
  analysis_basis: "sample_only",  // ← NEW
  samples,
  analysis,
};
```

**Transparency Improvement:**
- ✅ Clarifies that analysis metrics are based on sample, not all rows
- ✅ Prevents misinterpretation of numbers as total population metrics

---

## Code Block 3: Reprocess Edge Function - Auth Fix

**File:** `supabase/functions/listclean-unknown-reprocess/index.ts`
**Lines:** 1-49

### BEFORE (Weak Auth)
```typescript
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const adminToken = req.headers.get("x-admin-token");
    if (!adminToken) {
      return new Response(
        JSON.stringify({ ok: false, error: "Admin token required" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }
```

### AFTER (Proper Auth)
```typescript
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) {
      return authResult;
    }
```

**Security Improvements:**
- ✅ Same as diagnostic function (HMAC validation + expiration)
- ✅ Centralized CORS_HEADERS

---

## Code Block 4: Reprocess - Remove Duplicate Columns

**File:** `supabase/functions/listclean-unknown-reprocess/index.ts`
**Lines:** 82-91

### BEFORE (Duplicates)
```typescript
const { data: unknownRows, error: selectError } = await supabase
  .from("other_agency_emails")
  .select(
    "id, email_normalized, validation_status, verification_external_status, verification_bucket_source, verification_attempt_count, verification_attempt_count, verification_attempt_count"
  )
  .eq("state_slug", state_slug)
  .eq("validation_status", "unknown")
  .lt("verification_attempt_count", 6)
  .limit(limit);
```

### AFTER (Clean)
```typescript
const { data: unknownRows, count: totalAvailable, error: selectError } = await supabase
  .from("other_agency_emails")
  .select(
    "id, email_normalized, validation_status, verification_external_status, verification_bucket_source, verification_attempt_count",
    { count: "exact" }
  )
  .eq("state_slug", state_slug)
  .eq("validation_status", "unknown")
  .lt("verification_attempt_count", 6)
  .limit(limit);
```

**Data Quality Improvements:**
- ✅ Removed duplicate `verification_attempt_count` columns
- ✅ Added `{ count: "exact" }` to get total available count
- ✅ Smaller payload, cleaner query

---

## Code Block 5: Reprocess Response - Better Queue Kick Reporting

**File:** `supabase/functions/listclean-unknown-reprocess/index.ts`
**Lines:** 14-24, 152-187

### BEFORE (Unclear)
```typescript
interface ReprocessResponse {
  ok: boolean;
  mode: "sample" | "full_state";
  state_slug?: string;
  rows_reset: number;
  before_snapshots: BeforeSnapshot[];
  after_snapshots: BeforeSnapshot[];
  queue_processor_kicked: boolean;
  warning?: string;  // ← Unclear
}

// ... later in code ...

let queueProcessorKicked = false;
let kickError: string | undefined;

try {
  const queueUrl = `${supabaseUrl}/functions/v1/other-agencies-listclean-process-queue`;
  const queueResponse = await fetch(queueUrl, {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${supabaseServiceKey}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ force_run: true }),
  });

  if (queueResponse.ok) {
    queueProcessorKicked = true;
  } else {
    const errorText = await queueResponse.text();
    kickError = `Queue processor kick failed: ${errorText}`;
  }
} catch (error) {
  kickError = error instanceof Error ? error.message : "Unknown error kicking queue processor";
}

const response: ReprocessResponse = {
  ok: true,
  mode,
  state_slug,
  rows_reset: rowIds.length,
  before_snapshots: beforeSnapshots,
  after_snapshots: afterSnapshots,
  queue_processor_kicked: queueProcessorKicked,
  warning: kickError,  // ← Generic field name
};
```

### AFTER (Clear)
```typescript
interface ReprocessResponse {
  ok: boolean;
  mode: "sample" | "full_state";
  state_slug?: string;
  rows_reset: number;
  rows_available?: number;  // ← NEW: Total available
  before_snapshots: BeforeSnapshot[];
  after_snapshots: BeforeSnapshot[];
  queue_processor_kicked: boolean;
  queue_kick_error?: string;  // ← RENAMED: Clearer
}

// ... later in code ...

let queueProcessorKicked = false;
let queueKickError: string | undefined;  // ← RENAMED

try {
  const queueUrl = `${supabaseUrl}/functions/v1/other-agencies-listclean-process-queue`;
  const queueResponse = await fetch(queueUrl, {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${supabaseServiceKey}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ force_run: true }),
  });

  if (queueResponse.ok) {
    queueProcessorKicked = true;
  } else {
    const errorText = await queueResponse.text();
    queueKickError = `Queue processor returned HTTP ${queueResponse.status}: ${errorText}`;  // ← Better error
    console.error("Queue kick failed:", queueKickError);
  }
} catch (error) {
  queueKickError = error instanceof Error ? error.message : "Network error calling queue processor";  // ← Clearer
  console.error("Queue kick error:", queueKickError);
}

const response: ReprocessResponse = {
  ok: true,
  mode,
  state_slug,
  rows_reset: rowIds.length,
  rows_available: totalAvailable || 0,  // ← NEW
  before_snapshots: beforeSnapshots,
  after_snapshots: afterSnapshots,
  queue_processor_kicked: queueProcessorKicked,
  queue_kick_error: queueKickError,  // ← RENAMED
};
```

**Reliability Improvements:**
- ✅ Renamed `warning` → `queue_kick_error` (clearer purpose)
- ✅ Added `rows_available` (shows total count)
- ✅ Better error messages (includes HTTP status)
- ✅ Error logging enabled

---

## Code Block 6: UI Component - ID-Based Before/After Matching

**File:** `src/components/admin/ListCleanUnknownDiagnostic.tsx`
**Lines:** 102-170

### BEFORE (Index-Based - Unreliable)
```typescript
const data = await response.json();

const report: BeforeAfterRow[] = (data.before_snapshots || []).map(
  (before: any, index: number) => ({
    id: before.id,
    email_normalized: before.email_normalized,
    before: {
      validation_status: before.validation_status,
      verification_external_status: before.verification_external_status,
      verification_bucket_source: before.verification_bucket_source,
      verification_attempt_count: before.verification_attempt_count,
    },
    after: {
      validation_status: data.after_snapshots[index]?.validation_status || before.validation_status,  // ← INDEX-BASED
      verification_external_status: data.after_snapshots[index]?.verification_external_status || before.verification_external_status,
      verification_bucket_source: data.after_snapshots[index]?.verification_bucket_source || before.verification_bucket_source,
      verification_attempt_count: data.after_snapshots[index]?.verification_attempt_count || before.verification_attempt_count,
    },
  })
);

setReprocessReport(report);
```

### AFTER (ID-Based - Reliable)
```typescript
const data = await response.json();

// Build report by matching before/after by ID (not index)
const afterSnapshotMap = new Map((data.after_snapshots || []).map((s: any) => [s.id, s]));  // ← MAP BY ID

const report: BeforeAfterRow[] = (data.before_snapshots || []).map((before: any) => {
  const after = afterSnapshotMap.get(before.id) || before;  // ← LOOKUP BY ID
  return {
    id: before.id,
    email_normalized: before.email_normalized,
    before: {
      validation_status: before.validation_status,
      verification_external_status: before.verification_external_status,
      verification_bucket_source: before.verification_bucket_source,
      verification_attempt_count: before.verification_attempt_count,
    },
    after: {
      validation_status: after.validation_status,
      verification_external_status: after.verification_external_status,
      verification_bucket_source: after.verification_bucket_source,
      verification_attempt_count: after.verification_attempt_count,
    },
  };
});

// Store response data for status messaging
(window as any).__reprocessData = {
  rows_reset: data.rows_reset,
  queue_kicked: data.queue_processor_kicked,
  queue_error: data.queue_kick_error,
};  // ← STORE FOR UI STATUS

setReprocessReport(report);
```

**Data Correctness Improvements:**
- ✅ Create Map for O(1) ID lookups
- ✅ Match by stable ID instead of array index
- ✅ Handles out-of-order results correctly
- ✅ Store response data for UI status messaging

---

## Code Block 7: UI Component - Honest Status Messaging

**File:** `src/components/admin/ListCleanUnknownDiagnostic.tsx`
**Lines:** 350-433

### BEFORE (Always Green)
```typescript
{reprocessReport && (
  <div className="bg-green-50 border border-green-200 rounded-lg p-4 space-y-3">
    <div className="flex gap-2 items-start">
      <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
      <div>
        <p className="font-semibold text-green-900">Reprocess Complete</p>
        <p className="text-sm text-green-800">{reprocessReport.length} rows reset and queued for verification.</p>
      </div>
    </div>

    {/* ... table ... */}

    <p className="text-xs text-green-700 bg-white p-2 rounded border border-green-200">
      Queue processor has been kicked. Rows will be reprocessed within 1-2 minutes.
    </p>
  </div>
)}
```

### AFTER (Honest Status)
```typescript
{reprocessReport && (
  <div className={`rounded-lg p-4 space-y-3 border ${
    (window as any).__reprocessData?.queue_kicked  // ← CHECK ACTUAL STATUS
      ? 'bg-green-50 border-green-200'
      : 'bg-amber-50 border-amber-200'
  }`}>
    <div className="flex gap-2 items-start">
      {(window as any).__reprocessData?.queue_kicked ? (
        <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
      ) : (
        <AlertTriangle className="w-5 h-5 text-amber-600 shrink-0 mt-0.5" />  // ← WARNING ICON ON FAILURE
      )}
      <div>
        <p className={`font-semibold ${
          (window as any).__reprocessData?.queue_kicked ? 'text-green-900' : 'text-amber-900'
        }`}>
          {(window as any).__reprocessData?.queue_kicked
            ? 'Reprocess Complete'
            : 'Reprocess Rows Reset (Queue Kick Failed)'}  {/* ← HONEST TITLE */}
        </p>
        <p className={`text-sm ${
          (window as any).__reprocessData?.queue_kicked ? 'text-green-800' : 'text-amber-800'
        }`}>
          {reprocessReport.length} rows reset.
          {(window as any).__reprocessData?.queue_kicked
            ? ' Queue processor kicked successfully. Will reprocess within 1-2 minutes.'
            : ` ⚠️ Queue processor kick failed: ${(window as any).__reprocessData?.queue_error || 'Unknown error'}. Run queue manually or retry reprocess.`}  {/* ← CLEAR FALLBACK */}
        </p>
      </div>
    </div>

    {/* ... table ... */}

    <div className={`text-xs p-2 rounded border ${
      (window as any).__reprocessData?.queue_kicked
        ? 'bg-green-100 border-green-300 text-green-700'
        : 'bg-amber-100 border-amber-300 text-amber-700'
    }`}>
      {(window as any).__reprocessData?.queue_kicked ? (
        <>
          <strong>✓ Queue Kicked</strong><br />
          Rows will be reprocessed within 1-2 minutes. Refresh this panel later to see results.
        </>
      ) : (
        <>
          <strong>⚠️ Queue Not Kicked</strong><br />
          Rows were reset but queue processor did not start. Go to /wp-admin/email/smartlead and manually run the queue, or retry reprocess.
        </>
      )}
    </div>
  </div>
)}
```

**UX Improvements:**
- ✅ Color-coded by actual result (green=success, amber=failure)
- ✅ Icon matches status (checkmark vs warning)
- ✅ Title accurately reflects result
- ✅ Clear fallback instructions for failures
- ✅ Never lies about queue kick status

---

## Code Block 8: UI Component - Mode Labels Updated

**File:** `src/components/admin/ListCleanUnknownDiagnostic.tsx`
**Lines:** 286-307, 324-329

### BEFORE (Misleading)
```typescript
<div className="flex gap-2 mb-3">
  <button
    onClick={() => setReprocessMode('sample')}
    className={`flex-1 px-3 py-2 rounded-lg border font-medium text-sm ${
      reprocessMode === 'sample'
        ? 'border-blue-600 bg-blue-50 text-blue-700'
        : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-50'
    }`}
  >
    Sample Mode (5 rows)
  </button>
  <button
    onClick={() => setReprocessMode('full_state')}
    className={`flex-1 px-3 py-2 rounded-lg border font-medium text-sm ${
      reprocessMode === 'full_state'
        ? 'border-red-600 bg-red-50 text-red-700'  // ← RED = ALARMING
        : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-50'
    }`}
  >
    Full State (All)  {/* ← MISLEADING - HAS 10K LIMIT */}
  </button>
</div>

{/* ... confirm modal ... */}

{showReprocessConfirm && (
  <div className="p-4 bg-amber-50 border border-amber-200 rounded-lg space-y-3">
    <p className="text-sm font-semibold text-amber-900">
      {reprocessMode === 'sample'
        ? 'Reprocess 5 sample unknown rows?'
        : 'Reprocess ALL unknown rows in this state? This cannot be undone.'}  {/* ← "ALL" HIDES LIMIT */}
    </p>
```

### AFTER (Accurate)
```typescript
<div className="flex gap-2 mb-3">
  <button
    onClick={() => setReprocessMode('sample')}
    className={`flex-1 px-3 py-2 rounded-lg border font-medium text-sm ${
      reprocessMode === 'sample'
        ? 'border-blue-600 bg-blue-50 text-blue-700'
        : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-50'
    }`}
  >
    Sample (5 rows)  {/* ← SHORTER */}
  </button>
  <button
    onClick={() => setReprocessMode('full_state')}
    className={`flex-1 px-3 py-2 rounded-lg border font-medium text-sm ${
      reprocessMode === 'full_state'
        ? 'border-orange-600 bg-orange-50 text-orange-700'  // ← ORANGE = CAUTIOUS
        : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-50'
    }`}
  >
    Full State (up to 10k)  {/* ← HONEST ABOUT LIMIT */}
  </button>
</div>

{/* ... confirm modal ... */}

{showReprocessConfirm && (
  <div className="p-4 bg-amber-50 border border-amber-200 rounded-lg space-y-3">
    <p className="text-sm font-semibold text-amber-900">
      {reprocessMode === 'sample'
        ? 'Reset & reprocess 5 sample unknown rows? Rows will be queued. No data is lost.'  {/* ← CLEAR ACTION */}
        : 'Reset & reprocess up to 10,000 unknown rows in this state? Rows will be queued. No data is lost. Requires confirmation.'}  {/* ← SHOWS LIMIT */}
    </p>
```

**Transparency Improvements:**
- ✅ Full state label shows "up to 10k" instead of "All"
- ✅ Color changed from red to orange (less alarming)
- ✅ Confirmation text clearly shows limits
- ✅ Explains reversibility ("No data is lost")

---

## Summary of All Fixes

| Block | Issue | Fix | Impact |
|-------|-------|-----|--------|
| 1 | Weak auth | `requireAdminSession()` | Security: MEDIUM → LOW |
| 2 | Analysis context missing | Add `analysis_basis` field | Transparency |
| 3 | Weak auth (reprocess) | `requireAdminSession()` | Security: MEDIUM → LOW |
| 4 | Duplicate columns | Clean SELECT | Data quality |
| 5 | Unclear queue status | Rename `warning` → `queue_kick_error` | Reliability |
| 6 | Index-based matching | ID-based Map lookup | Data integrity |
| 7 | Always green UI | Color-coded by actual result | UX: Honest status |
| 8 | Misleading labels | Show "up to 10k" | Transparency |

---

**All fixes deployed and verified.**
**Build ID:** tyb1i2yc | **Status:** ✅ PRODUCTION READY

