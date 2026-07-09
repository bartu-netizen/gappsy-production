# Client-Side XLSX Parser — Quick Test Guide

## What Changed

XLSX files are now parsed **in your browser** before upload, eliminating server timeouts.

## Test in 60 Seconds

### 1. Navigate to Import V2

```
https://your-domain.com/wp-admin/other-agencies-import-v2
```

### 2. Drop a Scraper XLSX File

Any XLSX from Instant Data Scraper, Outscraper, Bright Data, etc.

### 3. Watch for These UI Changes

**NEW — You'll see:**

```
┌─────────────────────────────────────────────────────┐
│ 🔄 Parsing Excel file in browser...                │
│                                                     │
│    Parsed 24,892 valid rows with names             │
│                                                     │
│    Detected 24,892 valid agencies with names       │
└─────────────────────────────────────────────────────┘
```

**Then upload proceeds normally** with no timeout.

### 4. Verify Import Completes

- Progress bar reaches 100%
- Chunks process successfully
- Metrics show accurate counts
- No "stuck at XLSX.read" error

## What to Test

### ✅ XLSX Parsing

- [ ] Drop 1K row XLSX → parses in <1 second
- [ ] Drop 10K row XLSX → parses in 2-3 seconds
- [ ] Drop 50K row XLSX → parses in 5-10 seconds
- [ ] Drop malformed XLSX → shows clear error message

### ✅ Column Mapping

Test these common scraper column names:

| Scraper Column     | Maps To      |
|--------------------|--------------|
| `company_name`     | `name`       |
| `website`          | `website_url`|
| `phone_number`     | `phone`      |
| `email_address`    | `email`      |
| `location_city`    | `city`       |

**Expected**: All variations recognized automatically.

### ✅ Error Handling

- [ ] Drop XLSX with no "name" column → immediate error with detected headers
- [ ] Drop corrupted XLSX → parse error before upload
- [ ] Drop empty XLSX → "No valid agency rows found"

### ✅ CSV/JSON Still Work

- [ ] Upload CSV → no parsing UI, uploads directly
- [ ] Upload JSON → no parsing UI, uploads directly

## Expected Behavior

### XLSX Flow

```
User drops XLSX
    ↓
"Parsing Excel file in browser..." (2-5s)
    ↓
"Parsed X valid rows with names"
    ↓
Upload normalized JSON (fast)
    ↓
Backend processes chunks
    ↓
Import completes successfully
```

### CSV/JSON Flow (Unchanged)

```
User drops CSV/JSON
    ↓
Upload file directly
    ↓
Backend processes
    ↓
Import completes
```

## Success Indicators

### ✅ Good

- Blue box says "Parsing Excel file in browser..."
- Row count appears within seconds
- Upload starts after parsing
- Progress bar moves smoothly
- Job completes with accurate metrics

### ❌ Bad

- Parsing takes >30 seconds (should be <10s for 50K rows)
- "XLSX parsing failed" error appears
- Upload starts before parsing completes
- Progress freezes at 0 rows/0 chunks

## Common Issues & Fixes

### Issue: "No agency/company name column found"

**Cause**: XLSX missing required "name" column.

**Fix**: The error message shows detected headers. User needs to rename one column to "name" or use an accepted alias: `company_name`, `business_name`, `agency_name`, `title`, etc.

### Issue: "XLSX parsing failed: Failed to read file"

**Cause**: Corrupted or password-protected XLSX.

**Fix**: User should open in Excel and "Save As" a fresh XLSX.

### Issue: Parsing takes 20+ seconds

**Cause**: File has 100K+ rows or complex formulas.

**Fix**: Normal. Browser can handle it. If >30s, consider pre-filtering in Excel.

## Verification Commands

### Check Parsed Row Count

After import completes, verify in Recent Jobs table:

- **Rows read**: Should match file row count
- **Agencies created**: Should be close to row count (minus duplicates)
- **Emails added**: Should match agencies with valid emails

### Backend Logs (Optional)

Edge function logs should show:

```
[XLSX Parser] Parsed 24892 agencies from my-scraper-file.xlsx
[XLSX Parser] First row sample: { name: "ABC Agency", website_url: "abc.com", ... }
```

## What NOT to Test

- ❌ Don't test password-protected XLSX (not supported, will fail)
- ❌ Don't test XLSM (macros not supported, save as XLSX first)
- ❌ Don't test ODS (LibreOffice format, use XLSX)
- ❌ Don't test >100MB files (browser may struggle, split into batches)

## Rollback Plan (If Needed)

If client-side parsing causes issues:

1. Revert `src/pages/AdminOtherAgenciesImportV2Page.tsx` to previous version
2. Redeploy
3. Users fall back to manual CSV conversion

**Risk**: Very low. Parser is battle-tested and used in V1 (just not in the upload path).

## Summary

- **Before**: XLSX upload → server timeout at 30s → manual CSV conversion required
- **After**: XLSX dropped → parsed in browser in 2-5s → normalized JSON uploaded → import succeeds

**Expected Outcome**: Zero XLSX timeout errors in production.

---

**Last Updated**: 2026-03-19
**Status**: ✅ Ready for testing
