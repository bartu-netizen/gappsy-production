# Import V2 Quick Reference - Admin Guide

## Current Status: PRODUCTION READY ✅

All critical issues resolved as of 2026-03-19.

## What Got Fixed Today

### 1. Parsing Diagnostics Added
- Full visibility into XLSX parsing process
- Step-by-step event logging
- Sample row output for debugging
- Header detection verification

### 2. Timeout Protection Deployed
- 30-second hard timeout on XLSX parsing
- No more infinite hangs
- Clear error messages when timeouts occur
- Environment kill switch available

### 3. Watchdog Logic Fixed
- Checks `updated_at` (heartbeat) instead of `created_at` (age)
- Only marks jobs as stuck if truly inactive
- Extended timeout from 3 to 5 minutes

## How to Use

### Upload and Monitor

1. Go to `/wp-admin/other-agencies-import-v2`
2. Select state
3. Upload file (CSV or XLSX)
4. Click job row to see details
5. Watch event log for progress

### What You'll See (Normal Flow)

```
✅ parse_file_downloaded - File size and type confirmed
✅ xlsx_buffer_ready - ArrayBuffer created successfully
✅ xlsx_parse_success - XLSX parsing completed
✅ xlsx_sheet_info - Sheet name, row counts
✅ xlsx_headers_detected - Headers found, Name column verified
✅ xlsx_sample_rows - First 3 rows shown
✅ xlsx_rows_extracted - Valid row count
✅ normalization_complete - Final validation
✅ validation_success - Ready for chunking
✅ chunk_creation_complete - Chunks created
✅ processing started - Workers dispatched
```

### If XLSX Times Out

Event log will show:
```
❌ xlsx_parse_timeout - XLSX.read timed out after 30s
```

Job will immediately fail with message:
```
⚠️ XLSX PARSING TIMEOUT: XLSX.read hung for more than 30s.
This file may be corrupted or too complex for the runtime.

Please try:
1. Converting to CSV before upload
2. Simplifying the spreadsheet
3. Splitting into smaller files
```

**What to do:**
- Download the original XLSX
- Open in Excel/Google Sheets
- Save As → CSV format
- Upload the CSV instead

### If You Need to Disable XLSX

In Supabase Dashboard:
1. Go to Edge Functions → Environment Variables
2. Add: `DISABLE_XLSX_IMPORT=true`
3. Save
4. All XLSX uploads will immediately fail with clear message

## File Format Recommendations

### ✅ CSV (Recommended)
- Fast parsing
- No timeout issues
- No corruption risk
- Works 100% reliably

### ⚠️ XLSX (Supported with Caveats)
- Works for simple files
- May timeout on complex files
- 30-second timeout protection
- Can be disabled if problematic

### Required Columns

Minimum required:
- **Name** (or "Agency Name", "Company Name", etc.)

Recommended:
- Email
- Phone
- Website
- City
- State

## Troubleshooting

### Job stuck in "parsing"?

**Old behavior**: Hung forever, watchdog cleanup after 5 min
**New behavior**: Times out after 30s with clear error OR watchdog after 5 min if no heartbeat

Check event log:
- Last event = `xlsx_buffer_ready` → Timeout protection will kick in
- Last event = `xlsx_parse_timeout` → File too complex, convert to CSV
- No events for 5 min → Runtime crash, try smaller file

### Job shows 0 rows, 0 chunks?

Check event log for:
- `xlsx_headers_detected` → See what headers were found
- If "nameCol=false" → File missing Name column
- If normalization shows 0 rows → All Name fields are empty

### Workers not processing chunks?

1. Check chunks tab - do chunks exist?
2. Check chunk status - are they "queued" or "processing"?
3. Click "Resume Processing" button to re-dispatch workers
4. Status endpoint auto-recovers stale chunks every poll

### Watchdog marked job as failed?

Check `last_checkpoint` and `updated_at`:
- If updated_at hasn't changed in 5 min → True inactivity
- If last_checkpoint shows progress → False positive (rare now)

## Metrics to Monitor

### Healthy System
- CSV imports: 95%+ success rate
- XLSX imports: 80%+ success rate (lower is expected)
- Average parse time: Under 10 seconds
- Timeout rate: Under 5%

### Warning Signs
- XLSX timeout rate above 10%
- Parse times increasing over time
- Frequent watchdog failures
- Chunks stuck in "processing" for >10 min

## Quick Commands

### Check recent jobs
```
Visit: /wp-admin/other-agencies-import-v2
```

### Check timeout rate
```sql
SELECT
  COUNT(CASE WHEN event_type = 'xlsx_parse_timeout' THEN 1 END) as timeouts,
  COUNT(CASE WHEN event_type = 'xlsx_parse_success' THEN 1 END) as successes,
  ROUND(
    100.0 * COUNT(CASE WHEN event_type = 'xlsx_parse_timeout' THEN 1 END) /
    NULLIF(COUNT(CASE WHEN event_type IN ('xlsx_parse_timeout', 'xlsx_parse_success') THEN 1 END), 0),
    2
  ) as timeout_pct
FROM other_agencies_import_events_v2
WHERE created_at > NOW() - INTERVAL '24 hours';
```

### Resume stuck job
```
Click the job row → Click "Resume Processing" button
```

### Delete failed job
```
Click the job row → Click "Delete Job" button
```

## Emergency Contacts

If imports are completely broken:

1. Set `DISABLE_XLSX_IMPORT=true` immediately
2. Update import page to show "CSV only" message
3. Review edge function logs for error patterns
4. Check Supabase dashboard for quota/rate limits

## Success Indicators

✅ Jobs complete within 2-5 minutes for typical files
✅ Event logs show clear progression
✅ No jobs stuck in parsing >30 seconds
✅ Watchdog triggers are rare (<1%)
✅ Clear error messages when failures occur
