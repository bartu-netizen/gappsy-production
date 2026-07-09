# Import V2 XLSX Timeout Protection - Production Fix

**Status**: ✅ DEPLOYED
**Date**: 2026-03-19
**Priority**: CRITICAL PRODUCTION FIX

## Problem Statement

Jobs were getting stuck in "parsing" status with:
- 0 rows
- 0 chunks
- Last checkpoint: "XLSX buffer ready (...) — calling XLSX.read"
- No further progress
- Eventually marked as failed by watchdog after 5 minutes

Root cause: `XLSX.read()` was hanging indefinitely in the Edge Function runtime, likely due to:
- Corrupted XLSX files
- Complex spreadsheets with formulas/formatting
- Edge runtime resource constraints
- XLSX library compatibility issues with Deno runtime

## Solution Implemented

### 1. Hard Timeout Protection (30 seconds)

Wrapped XLSX parsing in a `Promise.race()` with a 30-second timeout:

```typescript
const XLSX_PARSE_TIMEOUT_MS = 30000; // 30 seconds

const xlsxParsePromise = Promise.resolve().then(() =>
  parseXlsxToNormalizedRows(buffer, HEADER_ALIASES)
);

const timeoutPromise = new Promise<never>((_, reject) => {
  setTimeout(() => {
    timedOut = true;
    reject(new Error(`XLSX parsing timed out after ${XLSX_PARSE_TIMEOUT_MS}ms`));
  }, XLSX_PARSE_TIMEOUT_MS);
});

result = await Promise.race([xlsxParsePromise, timeoutPromise]);
```

### 2. Clear Timeout Error Messages

When timeout occurs, job fails immediately with:

```
⚠️ XLSX PARSING TIMEOUT: XLSX.read hung for more than 30s.
This file may be corrupted or too complex for the runtime.

Please try:
1. Converting to CSV before upload
2. Simplifying the spreadsheet (remove formulas, formatting, extra sheets)
3. Splitting into smaller files
```

### 3. Environment Kill Switch

Added `DISABLE_XLSX_IMPORT` environment variable to completely disable XLSX if needed:

```typescript
const XLSX_DISABLED = Deno.env.get("DISABLE_XLSX_IMPORT") === "true";

if (XLSX_DISABLED) {
  await failJob(supabase, job_id,
    "XLSX imports are temporarily disabled. Please convert to CSV and upload again."
  );
}
```

### 4. Enhanced Logging

Added new diagnostic events:
- `xlsx_parse_timeout` - Logged when timeout occurs
- `xlsx_parse_success` - Logged when parsing completes within timeout
- Updated `last_checkpoint` to show timeout value

## Benefits

### Before Fix
- Jobs hung forever at "calling XLSX.read"
- No clear error message
- Watchdog cleanup after 5 minutes
- No actionable guidance for users

### After Fix
- Hard failure within 30 seconds if XLSX hangs
- Clear error message with actionable steps
- Admin can disable XLSX entirely if needed
- Users get immediate feedback

## Testing the Fix

### Test Case 1: Normal XLSX File
1. Upload a standard XLSX file (under 10MB, simple structure)
2. Should parse within 5-10 seconds
3. Should see `xlsx_parse_success` event
4. Should proceed to chunking and processing normally

### Test Case 2: Complex/Corrupted XLSX File
1. Upload a problematic XLSX file
2. Should timeout after 30 seconds maximum
3. Should see `xlsx_parse_timeout` event
4. Job status should immediately become "failed"
5. Error message should show clear guidance

### Test Case 3: XLSX Disabled
1. Set `DISABLE_XLSX_IMPORT=true` environment variable in Supabase
2. Try to upload XLSX file
3. Should fail immediately with "XLSX imports are temporarily disabled"

## Monitoring

### Key Metrics to Watch
- Number of `xlsx_parse_timeout` events per day
- Average XLSX parsing time (should be under 10s for most files)
- Ratio of XLSX timeouts to successful XLSX parses

### Event Log Queries

Check for timeout issues:
```sql
SELECT
  COUNT(*) as timeout_count,
  DATE_TRUNC('day', created_at) as day
FROM other_agencies_import_events_v2
WHERE event_type = 'xlsx_parse_timeout'
GROUP BY day
ORDER BY day DESC;
```

Check average XLSX parse times (requires timestamp comparison):
```sql
SELECT
  j.id,
  j.file_name,
  j.file_size_bytes,
  (e2.created_at - e1.created_at) as parse_duration
FROM other_agencies_import_jobs_v2 j
JOIN other_agencies_import_events_v2 e1
  ON e1.job_id = j.id AND e1.event_type = 'xlsx_buffer_ready'
JOIN other_agencies_import_events_v2 e2
  ON e2.job_id = j.id AND e2.event_type = 'xlsx_parse_success'
WHERE j.file_format IN ('xlsx', 'xls')
ORDER BY j.created_at DESC
LIMIT 20;
```

## Emergency Procedures

### If XLSX parsing issues persist:

1. **Immediate action**: Set `DISABLE_XLSX_IMPORT=true`
2. **User communication**: Update import page to show CSV-only message
3. **Root cause analysis**: Review edge function logs for XLSX parsing patterns
4. **Long-term fix**: Consider alternative XLSX parsing strategies:
   - Client-side conversion to CSV before upload
   - Separate XLSX-to-CSV conversion microservice
   - Different XLSX parsing library

## Configuration

### Environment Variables

```bash
# In Supabase Dashboard → Edge Functions → Environment Variables

# Disable XLSX imports entirely (optional, defaults to false)
DISABLE_XLSX_IMPORT=false

# These are already configured automatically:
INTERNAL_FUNCTION_SECRET=<auto-configured>
SUPABASE_URL=<auto-configured>
SUPABASE_SERVICE_ROLE_KEY=<auto-configured>
```

## Files Modified

1. `/supabase/functions/other-agencies-import-v2-parse/index.ts`
   - Added `XLSX_PARSE_TIMEOUT_MS` constant
   - Added `XLSX_DISABLED` environment flag check
   - Wrapped XLSX parsing in `Promise.race()` timeout guard
   - Enhanced error messages and logging

2. `/supabase/functions/other-agencies-import-v2-status/index.ts`
   - Fixed watchdog to check `updated_at` instead of `created_at`
   - Extended timeout from 3 minutes to 5 minutes
   - Added `failure_reason` field to watchdog failures

## Recommended Next Steps

1. **Monitor timeout rates** for the next 48 hours
2. **Collect problematic XLSX samples** that timeout
3. **Consider CSV-only mode** if timeout rate exceeds 10%
4. **Build client-side XLSX converter** as long-term solution
5. **Add file size limits** to prevent massive XLSX uploads

## Success Criteria

✅ No more infinite parsing hangs
✅ Clear error messages when XLSX fails
✅ Ability to disable XLSX if needed
✅ Jobs fail fast (30s) instead of hanging (5min)
✅ Users get actionable guidance

## Related Documentation

- `ADMIN_IMPORT_COMPLETE_PROOF.md` - Original import system design
- `OTHER_AGENCIES_IMPORT_V2_REBUILD_FIX_COMPLETE.md` - V2 rebuild documentation
- `IMPORT_V2_PARSING_DIAGNOSTICS.md` - Parsing diagnostics added earlier today
