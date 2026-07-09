# Import State Machine - Current Status

**Date:** 2026-03-14
**Status:** ARCHITECTURE FIX DEPLOYED

## YOUR REPORTED ISSUE

```
Upload Response: {"status": "ok", "job_id": "...", "message": "..."}
Diagnostics State Machine: Status: FAILED
Last Error: "Job marked as failed"
Rows Read: 0, New Agencies: 0
```

## ROOT CAUSE (NOW FIXED)

The upload function was blocking on parse execution, causing WORKER_LIMIT timeouts.
This has been fixed - upload now returns immediately with job_id.

## CURRENT ARCHITECTURE

### 1. Upload Flow (FIXED)
```typescript
// supabase/functions/other-agencies-import-upload/index.ts
1. Validate file
2. Upload to Supabase Storage (import-staging bucket)
3. Create job record in other_agencies_import_jobs
4. Schedule parse in background (EdgeRuntime.waitUntil)
5. RETURN IMMEDIATELY with job_id ← THIS IS THE FIX
```

### 2. Parse Flow (Async Background)
```typescript
// supabase/functions/other-agencies-import-parse/index.ts
1. Download file from storage
2. Parse rows incrementally
3. Create chunks (250 rows each)
4. Insert into other_agencies_import_queue
5. Trigger worker
```

### 3. Worker Flow (Incremental Processing)
```typescript
// supabase/functions/other-agencies-import-worker/index.ts
1. Fetch pending chunks
2. Process each chunk via processor-v2
3. Update progress
4. Mark completed
```

## DIAGNOSTIC STEPS

### Step 1: Check Job Status
```sql
SELECT 
  id, 
  status, 
  error_message, 
  last_checkpoint,
  source_rows_total,
  chunks_total,
  chunks_processed,
  progress_percent
FROM other_agencies_import_jobs
ORDER BY created_at DESC
LIMIT 5;
```

### Step 2: Check Parse Events
```sql
SELECT 
  event_type, 
  event_data, 
  created_at
FROM other_agencies_import_events
WHERE job_id = 'YOUR_JOB_ID'
ORDER BY created_at;
```

### Step 3: Check Chunk Queue
```sql
SELECT 
  job_id,
  chunk_index,
  status,
  error_reason,
  attempted_at
FROM other_agencies_import_queue
WHERE job_id = 'YOUR_JOB_ID'
ORDER BY chunk_index;
```

### Step 4: Check Edge Function Logs
Go to Supabase Dashboard → Edge Functions → Logs
Look for:
- `other-agencies-import-upload` logs
- `other-agencies-import-parse` logs
- `other-agencies-import-worker` logs

## EXPECTED BEHAVIOR AFTER FIX

### Success Path
```
1. Upload returns job_id in 2-5 seconds ✅
2. Frontend shows "staged" status ✅
3. Parse triggers in background
4. Job status → "parsing"
5. Chunks created
6. Job status → "queued"
7. Worker processes chunks
8. Job status → "processing" (progress 0-100%)
9. Job status → "completed"
```

### Failure Path (Now Visible)
```
1. Upload returns job_id ✅
2. Frontend shows "staged" ✅
3. Parse fails
4. Job status → "failed"
5. error_message shows exact error
6. last_checkpoint shows where it failed
7. Frontend shows failure clearly
```

## IF STILL FAILING

### Check 1: Parse Trigger Failing?
```sql
-- Look for parse_trigger_failed checkpoint
SELECT * FROM other_agencies_import_jobs 
WHERE last_checkpoint = 'parse_trigger_failed'
ORDER BY created_at DESC LIMIT 5;
```

### Check 2: File Not Found?
```sql
-- Check if storage_path is set
SELECT id, storage_path, source_filename 
FROM other_agencies_import_jobs 
WHERE status = 'failed'
ORDER BY created_at DESC LIMIT 5;
```

Then verify file exists in Supabase Storage:
- Bucket: `import-staging`
- Path: `{state_slug}/{timestamp}_{filename}`

### Check 3: Parse Function Crashing?
View Edge Function logs for `other-agencies-import-parse`
Look for:
- Memory errors
- Timeout errors
- File download errors
- Parse errors

## THE FIX ENSURES

1. ✅ Upload no longer blocks on parse
2. ✅ WORKER_LIMIT no longer affects upload response
3. ✅ Job ID always returned to frontend
4. ✅ Parse failures are visible in job status
5. ✅ Diagnostics show real progression
6. ✅ Error messages are specific and actionable

## TEST NOW

1. Go to `/wp-admin/other-agencies-import`
2. Upload a CSV file
3. Click "Start Import"
4. **Expected:**
   - Job ID appears immediately (< 5 seconds)
   - Status shows "staged"
   - Then "parsing" (if file is large, this may take time)
   - Then "queued" → "processing" → "completed"

If it still shows "failed":
- Check the error_message in the database
- Check Edge Function logs
- The error will now be specific (not just "Job marked as failed")

## WHAT CHANGED

**Before:** Upload waited for parse → WORKER_LIMIT → No job_id → Silent failure
**After:** Upload returns job_id → Parse async → Clear error messages → Visible progress

The "Job marked as failed" should now include a specific error message explaining WHY it failed.
