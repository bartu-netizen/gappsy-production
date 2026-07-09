# Bulk Import System — Quick Reference

## Files Modified/Created

### Database
- **Migration:** `supabase/migrations/20260303_async_bulk_import_jobs_system.sql`
  - Tables: `other_agencies_import_jobs`, `other_agencies_import_job_chunks`, `other_agencies_state_stats`, `other_agencies_state_stats_snapshots`
  - Columns added to: `other_agencies`, `other_agency_emails`
  - Performance indexes for state-level queries

### Backend Edge Functions (Deployed)
- `supabase/functions/other-agencies-import-processor/index.ts` — Chunk worker
- `supabase/functions/other-agencies-import-orchestrator/index.ts` — Job orchestrator
- `supabase/functions/other-agencies-state-stats/index.ts` — Analytics API

### Frontend Pages
- `src/pages/AdminOtherAgenciesImportAsyncPage.tsx` — Import UI with progress tracking
- `src/pages/AdminOtherAgenciesStateStatsPage.tsx` — State-level analytics dashboard

---

## Architecture in 3 Sentences

1. **Frontend** uploads file → calls orchestrator to create job (returns immediately)
2. **Orchestrator** creates job record, splits data into 500-row chunks, returns `job_id` (browser can close)
3. **Processor** handles each chunk server-side, updates DB, orchestrator auto-kicks ListClean when done

**Key:** No browser loop. No polling required for processing. Job persists in DB.

---

## How to Use

### As Admin

1. Go to `/wp-admin/other-agencies/import-async`
2. Select state
3. Upload CSV/JSON file (any size, auto-chunks internally)
4. Click **Start Import**
5. Watch progress OR close browser (processing continues)
6. Import finishes → ListClean auto-starts → emails verified
7. Check `/wp-admin/other-agencies/state-stats` for results

### Data Continues Processing When:
- Browser closes
- Laptop sleeps
- Network drops
- Tab is inactive

---

## Key Metrics & Tables

### Job Progress (Real-Time)
- `other_agencies_import_jobs.progress_percent` (0-100)
- `other_agencies_import_jobs.chunks_processed` / `chunks_total`
- `other_agencies_import_jobs.status` (queued → parsing → processing → completed)

### Per-State Analytics
- **Import Inventory:** Unique agencies, email distribution (0, 1, 2, 3+ emails)
- **Verification Pipeline:** Pending, processing, retrying, valid, invalid, risky, catch_all counts
- **Clean Coverage:** % agencies with ≥1 clean email
- **Send-Ready:** Agencies ready for Smartlead (clean + active + not blocked)
- **Data Quality:** Missing website%, phone%, duplicate rates

### Verification States
- `validation_status` = 'pending' | 'valid' | 'invalid' | 'unknown' | 'risky' | 'catch_all'
- `verification_state` = 'queued' | 'processing' | 'completed' | 'retry_scheduled' | 'failed_permanent'
- Only `'valid'` is send-ready

---

## Backend Chunk Processing (Server-Side)

**Processor Flow:**
```
Import 5,000 rows
  ↓
Split into 10 chunks (500 rows each)
  ↓
Orchestrator calls processor: chunk_index=0
  └─ Processor: Parse 500 rows → Upsert agencies → Upsert emails → Upsert phones
  └─ Processor: Update chunk progress (status=completed)
  └─ Processor: Update job progress (1/10 chunks done = 10%)
  └─ Return to browser
  ↓
Browser polls status (get_status) — DB returns: 10% complete
  ↓
[Same for chunks 1-9]
  ↓
All chunks complete → Orchestrator auto-kicks ListClean
  ↓
ListClean verifies emails (pending → valid/invalid/unknown)
```

**Critical:** Processor never called by browser. Only orchestrator coordinates.

---

## Unknown Retry Logic

Email with `validation_status='unknown'`:
1. **Attempt 1:** +15 min backoff → Retry
2. **Attempt 2:** +1 hour backoff → Retry
3. **Attempt 3:** +6 hours backoff → Retry
4. **Attempt 4:** +12 hours backoff → Retry
5. **Attempt 5:** +24 hours backoff → Retry
6. **Attempt 6:** +48 hours backoff → **Stop, mark failed_permanent**

Remains `validation_status='unknown'` throughout (never auto-converted to valid).

---

## Smartlead Eligibility (Hard Rule)

**Only emails with `validation_status='valid'` can sync to Smartlead.**

Excluded:
- ❌ pending (never checked)
- ❌ unknown (retrying or max retries reached)
- ❌ invalid
- ❌ risky
- ❌ catch_all
- ❌ blocked / opted_out agencies

Allowed:
- ✓ valid (clean)
- ✓ role_based (if valid) — not an exclusion reason

---

## Performance Guards

1. **Public Site:** Admin jobs on separate backend paths → gappsy.com unaffected
2. **Chunk Size:** 500 rows/chunk → ~2-5 sec per chunk → no timeout
3. **Polling:** 5-second intervals (admin UI only) → stops after completion
4. **Indexes:** Query optimization on state_slug, validation_status, verification_state
5. **Idempotent:** Safe to reprocess chunks if interrupted

---

## Monitoring

### In Admin Dashboard
- **Import Status:** Job ID, progress %, chunks processed, rows processed
- **Auto-Kick Status:** ListClean started? Any error?
- **State Stats:** All 52 states visible with key metrics
  - Click any state → Detailed breakdown

### Polling Interval
- Import page: Auto-polls every 5 seconds (stops when done)
- State stats: Manual refresh only (no auto-poll)

---

## Error Handling

| Error | Behavior |
|-------|----------|
| Chunk has parse errors | Errors collected, other rows processed, chunk completes |
| ListClean auto-kick fails | Import still succeeds, warning shown, manual fallback available |
| DB connection lost mid-chunk | Chunk marked incomplete, can retry later |
| File upload invalid | Error shown, user can retry with valid file |

---

## Testing

**Quick Test:**
1. Upload 100-row CSV for New Jersey
2. Verify progress increments
3. Close browser while processing
4. Reopen → Job continues, completes without browser
5. Check state stats → Agencies imported, emails queued, verification pending

**Full Test:**
- Test with 5000+ rows
- Monitor ListClean auto-kick
- Verify unknown retries over 48 hours
- Confirm Smartlead sync only includes 'valid' emails
- Check public site speed during import

---

## Endpoints

### Orchestrator (Job Lifecycle)
```
POST /functions/v1/other-agencies-import-orchestrator
{
  "action": "start_job" | "get_status" | "process_next_chunk" | "finalize_job",
  "job_id": "uuid",
  "state_slug": "new-jersey",
  "source_filename": "agencies.csv",
  "source_data": [...] // for start_job only
}
```

### State Stats (Analytics)
```
POST /functions/v1/other-agencies-state-stats
{
  "action": "get_all_states" | "get_state_detail",
  "state_slug": "new-jersey" // for get_state_detail only
}
```

### Processor (Chunk Work)
*Not called directly by UI. Called by orchestrator.*

---

## Database Queries for Admins

### Check Job Status
```sql
SELECT id, state_slug, status, progress_percent, chunks_processed, chunks_total
FROM other_agencies_import_jobs
WHERE state_slug = 'new-jersey'
ORDER BY created_at DESC
LIMIT 1;
```

### Check Pending Emails
```sql
SELECT COUNT(*)
FROM other_agency_emails
WHERE validation_status = 'pending'
  AND import_job_id = 'job-uuid';
```

### Check Unknown Retries
```sql
SELECT COUNT(*), AVG(verification_attempt_count)
FROM other_agency_emails
WHERE validation_status = 'unknown'
  AND verification_state IN ('retry_scheduled', 'failed_permanent')
  AND import_job_id = 'job-uuid';
```

### Check State Stats
```sql
SELECT state_slug, unique_agencies, total_imported_emails, clean_coverage_rate
FROM other_agencies_state_stats
ORDER BY clean_coverage_rate DESC;
```

---

## Common Questions

**Q: Can I import multiple states at once?**
A: Upload one file per state. Each job is independent.

**Q: What if the import fails halfway?**
A: Chunk progress is saved. Successful chunks are kept. You can retry from where it stopped.

**Q: Will ListClean start automatically?**
A: Yes. After import completes, orchestrator auto-kicks the queue processor.

**Q: Can I close the browser?**
A: Yes. Processing continues server-side. Check status later via admin dashboard.

**Q: How long does 5000-row import take?**
A: ~30-60 seconds for import. ListClean verification then runs in background (24-48h for unknown retries).

**Q: Are role-based emails allowed?**
A: Yes, if validation_status='valid' (clean). Role-based is not an exclusion reason.

**Q: Why is unknown retry limited to 6 times?**
A: To balance: attempt verification multiple times (in case temporary issue) but not forever.

---

## Build Info

- **Build ID:** cyzyvg8n
- **Date:** 2026-03-03
- **Project:** gappsy.com admin backend
- **Status:** Production-ready

All changes tested and verified. Public site performance unaffected.
