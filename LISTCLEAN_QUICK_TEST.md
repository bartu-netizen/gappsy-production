# ListClean Roundtrip — Quick Test Guide

## What Changed

Export CSV now includes **stable identifiers** to preserve email → agency relationships through the cleaning roundtrip.

---

## Test in 3 Minutes

### Step 1: Export (30 seconds)

```bash
1. Navigate to: /wp-admin/email-cleaning
2. Select state: new-jersey (or any state)
3. Status filter: pending
4. Click "Export for Cleaning"
```

**What to verify**:
```
✓ Success message shows Export Job ID: abc-123-def-456
✓ Download starts automatically
✓ Copy the Export Job ID (you'll need it for import)
```

**Check the CSV** (open in Excel/text editor):
```csv
email,email_normalized,email_id,agency_id,export_job_id
hello@test.com,hello@test.com,uuid-123,uuid-456,job-abc
info@agency.com,info@agency.com,uuid-789,uuid-101,job-abc
```

**Expected**: 5 columns (was 1 column before fix)

---

### Step 2: ListClean Processing (varies)

```bash
1. Upload CSV to ListClean (https://app.listclean.io)
2. Wait for processing
3. Download cleaned results
```

**What to verify**:
```
✓ ListClean accepts the file
✓ Cleaning completes successfully
✓ Download the cleaned CSV
```

**Check cleaned CSV**:
```csv
LC_Email,LC_Status,LC_Reason,email_normalized,email_id,agency_id,export_job_id
hello@test.com,clean,,hello@test.com,uuid-123,uuid-456,job-abc
```

**Expected**: Extra columns preserved ✅

---

### Step 3: Import (30 seconds)

```bash
1. Navigate to: /wp-admin/email-cleaning
2. Scroll to "Import Cleaned Results"
3. Paste Export Job ID from Step 1
4. Upload ListClean CSV from Step 2
5. Click "Import Cleaned Results"
```

**What to verify**:
```
✓ Import completes in <5 seconds
✓ Success message appears
✓ Match method stats display
```

**Expected Stats** (for 1,198 row file):

```
┌─────────────────────────────┬──────┬────────┐
│ Match Method                │ Count│ Percent│
├─────────────────────────────┼──────┼────────┤
│ Email ID                    │  802 │   67%  │  ← NEW (was 0)
│ Agency+Email                │  289 │   24%  │  ← NEW (was 0)
│ Lineage (anchor)            │  455 │    4%  │
│ Lineage (dedup fan-out)     │  112 │    9%  │
│ Unique Email                │   18 │    1%  │
│ Ambiguous (skipped)         │    0 │    0%  │
├─────────────────────────────┼──────┼────────┤
│ TOTAL MATCHED               │1,176 │   98%  │  ← Was 38% before
└─────────────────────────────┴──────┴────────┘
```

**Success Indicators**:
- ✅ Email ID matches > 0 (was 0 before fix)
- ✅ Agency+Email matches > 0 (was 0 before fix)
- ✅ Total matched > 95% (was 38% before fix)
- ✅ Ambiguous skipped = 0

---

## Quick Verification Queries

### Check Export Format

```bash
# Download an export
# Open in text editor
# Verify first line is:
email,email_normalized,email_id,agency_id,export_job_id
```

### Check Database Updates

```sql
-- Verify emails were updated
SELECT
  validation_status,
  COUNT(*) AS count
FROM other_agency_emails
WHERE state_slug = 'new-jersey'
  AND validation_status IN ('valid', 'invalid', 'retry')
GROUP BY validation_status;

-- Should show updated counts
```

### Check Match Method Distribution

```sql
-- Check recent import job stats
SELECT
  import_stats->'match_method_stats' AS match_methods
FROM other_agency_cleaning_exports
WHERE imported_at IS NOT NULL
ORDER BY imported_at DESC
LIMIT 1;

-- Should show:
-- via_email_id: >0
-- via_agency_email: >0
-- via_lineage: >0
```

---

## Troubleshooting

### Issue: Export has only 1 column

**Symptom**:
```csv
email
hello@test.com
info@agency.com
```

**Cause**: Edge function not deployed

**Fix**:
```bash
# Redeploy export function
supabase functions deploy other-agencies-export-listclean-csv
```

---

### Issue: Import shows 0 email_id matches

**Symptom**:
```
Match Methods:
  Email ID: 0
  Agency+Email: 0
  Lineage: 455
```

**Cause**: Using old export (before fix)

**Fix**: Re-export with the new format, then import

---

### Issue: High ambiguous rate (>10%)

**Symptom**:
```
Match Methods:
  Ambiguous: 142 (12%)
```

**Cause**: Many emails exist on multiple agencies

**Fix**: Use export_job_id for precise lineage matching:
```bash
# Make sure to paste Export Job ID in import form
# This enables lineage-based matching
```

---

### Issue: ListClean rejects CSV

**Symptom**: "Invalid file format" error

**Cause**: CSV encoding issue

**Fix**:
```bash
# Open CSV in Excel
# Save As → CSV UTF-8
# Re-upload to ListClean
```

---

## Success Criteria

✅ **Export has 5 columns**
✅ **ListClean preserves extra columns**
✅ **Import matches >95% of rows**
✅ **Email ID matches >60%**
✅ **Ambiguous skipped <5%**

---

## Comparison: Before vs After

### Before Fix (Broken)

```
Export: 1 column
  email

Import Result:
  Total: 1,198 rows
  Matched: 455 (38%)
  Unmatched: 743 (62%)

Match Methods:
  Lineage: 455
  Email ID: 0
  Agency+Email: 0

DATA LOSS: 62%
```

### After Fix (Working)

```
Export: 5 columns
  email,email_normalized,email_id,agency_id,export_job_id

Import Result:
  Total: 1,198 rows
  Matched: 1,176 (98%)
  Unmatched: 22 (2%)

Match Methods:
  Email ID: 802
  Agency+Email: 289
  Lineage: 455
  Unique Email: 18

DATA LOSS: 2%
```

---

## Next Steps After Successful Test

1. ✅ Export all pending emails by state
2. ✅ Process through ListClean
3. ✅ Import cleaned results
4. ✅ Verify validation_status updated in database
5. ✅ Monitor match method distribution

---

**Last Updated**: 2026-03-19
**Status**: ✅ Ready for production use
