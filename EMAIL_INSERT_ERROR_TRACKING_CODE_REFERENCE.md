# Email Insert Error Tracking - Code Reference

## Database Migration (Constraint Fix)

**File:** `supabase/migrations/20260303_fix_validation_status_check_constraint.sql`

```sql
-- Drop the old restrictive CHECK constraint
ALTER TABLE other_agency_emails
DROP CONSTRAINT other_agency_emails_validation_status_check;
```

**What it does:**
- Removes constraint that blocked 'pending' status
- Allows inserts with validation_status='pending' to succeed
- Preserves new comprehensive constraint with full allowed statuses

---

## Error Tracking Variables

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (lines 635-642)

```typescript
let totalEmailInsertAttempts = 0;
let emailInsertErrorsCount = 0;
const emailInsertErrorSamples: Array<{
  row_number: number;
  agency_name: string;
  first_email: string;
  error_message: string;
}> = [];
```

---

## Email Insert with Error Capture

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (lines 835-881)

```typescript
} else {
  // Insert emails with pending status (not yet verified)
  const emailRows = emails.map((email) => ({
    agency_id: agencyId,
    email_raw: record.email,
    email_normalized: email,
    validation_status: "pending",
    verification_state: "queued",
    source: "import",
  }));

  totalEmailInsertAttempts += emails.length;

  const { data: insertedEmails, error: emailError } = await supabase
    .from("other_agency_emails")
    .upsert(emailRows, {
      onConflict: "agency_id,email_normalized",
    })
    .select("id");

  if (emailError) {
    emailInsertErrorsCount += emails.length;

    // Collect error sample (first 5 errors)
    if (emailInsertErrorSamples.length < 5) {
      emailInsertErrorSamples.push({
        row_number: rowNum,
        agency_name: record.name || "unknown",
        first_email: emails[0] || "unknown",
        error_message: emailError.message.substring(0, 200), // Sanitize, max 200 chars
      });
    }

    emailsSkipped += emails.length;
    console.error(
      `Email insert failed for agency ${agencyId} (${record.name}) row ${rowNum}: ${emailError.message}`
    );
  } else {
    emailsCreated += emails.length;
    // Collect email IDs for verification enqueuing
    if (insertedEmails && Array.isArray(insertedEmails)) {
      insertedEmails.forEach((row: any) => {
        if (row.id) {
          emailIdsToEnqueue.push(row.id);
        }
      });
    }
  }
}
```

**Key Features:**
1. **Attempt Tracking:** `totalEmailInsertAttempts += emails.length`
2. **Error Detection:** Checks `emailError` after upsert
3. **Error Counting:** `emailInsertErrorsCount += emails.length`
4. **Sample Collection:** Stores first 5 errors with full context:
   - Row number
   - Agency name
   - First email attempted
   - Sanitized error message (max 200 chars)
5. **Logging:** Logs to console for debugging
6. **Skip Tracking:** Still increments `emailsSkipped` for accurate counters

---

## Response with Email Insert Diagnostics

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (lines 943-980)

```typescript
const result: ImportResult = {
  ok: true,
  jobId,
  total_agencies: records.length,
  total_emails: emailsCreated + emailsSkipped,
  agencies_created: agenciesCreated,
  agencies_updated: agenciesUpdated,
  emails_created: emailsCreated,
  emails_skipped: emailsSkipped,
  agencies_with_no_email: agenciesWithNoEmail,
  phones_created: phonesCreated,
  phones_skipped: phonesSkipped,
  agencies_with_no_phone: agenciesWithNoPhone,
  agencies_with_multiple_phones: agenciesWithMultiplePhones,
  failed,
  emails_enqueued_for_verification: emailsEnqueuedForVerification,
  listclean_auto_kick_attempted: autoKickResult.attempted,
  listclean_auto_kick_started: autoKickResult.started,
  listclean_auto_kick_already_running: autoKickResult.already_running,
  listclean_auto_kick_error: autoKickResult.error,
  errors: errors.slice(0, 50),
  metadata_counts: {
    rows_with_email: rowsWithEmail,
    rows_with_full_address: rowsWithFullAddress,
    rows_with_maps_url: rowsWithMapsUrl,
    rows_with_coords: rowsWithCoords,
    rows_with_social_urls: rowsWithSocialUrls,
  },
  parser_diagnostics: parserDiagnostics ? {
    ...parserDiagnostics,
    total_emails_inserted: emailsCreated,
  } : undefined,

  // NEW: Email insert diagnostics (only if errors occurred)
  email_insert_diagnostics: emailInsertErrorsCount > 0 ? {
    total_email_insert_attempts: totalEmailInsertAttempts,
    email_insert_errors_count: emailInsertErrorsCount,
    email_insert_error_samples: emailInsertErrorSamples,
  } : undefined,
};
```

**Logic:**
- If `emailInsertErrorsCount > 0`, include diagnostics
- Otherwise, `email_insert_diagnostics` is `undefined` (omitted from response)
- Provides complete visibility into email insert failures

---

## ImportResult Interface Update

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (lines 92-101)

```typescript
email_insert_diagnostics?: {
  total_email_insert_attempts: number;
  email_insert_errors_count: number;
  email_insert_error_samples: Array<{
    row_number: number;
    agency_name: string;
    first_email: string;
    error_message: string;
  }>;
};
```

---

## Example Response: Success (No Errors)

```json
{
  "ok": true,
  "jobId": "uuid-123",
  "total_agencies": 150,
  "agencies_created": 150,
  "emails_created": 187,
  "emails_skipped": 0,
  "failed": 0,
  "email_insert_diagnostics": null
}
```

---

## Example Response: With Errors

```json
{
  "ok": true,
  "jobId": "uuid-123",
  "total_agencies": 150,
  "agencies_created": 150,
  "emails_created": 140,
  "emails_skipped": 7,
  "failed": 0,
  "email_insert_diagnostics": {
    "total_email_insert_attempts": 147,
    "email_insert_errors_count": 7,
    "email_insert_error_samples": [
      {
        "row_number": 15,
        "agency_name": "Acme Corporation",
        "first_email": "info@acmecorp.com",
        "error_message": "duplicate key value violates unique constraint \"other_agency_emails_agency_id_email_key\""
      },
      {
        "row_number": 23,
        "agency_name": "Tech Solutions",
        "first_email": "contact@techsolutions.io",
        "error_message": "new row violates row-level security policy for table \"other_agency_emails\""
      }
    ]
  }
}
```

---

## What's Tracked

| Metric | Meaning |
|---|---|
| `total_email_insert_attempts` | Total number of email inserts tried (sum of all email counts for agencies with emails) |
| `email_insert_errors_count` | Total number of failed email inserts |
| `email_insert_error_samples[].row_number` | Source row number in XLSX/CSV file |
| `email_insert_error_samples[].agency_name` | Name of agency where insert failed |
| `email_insert_error_samples[].first_email` | First email attempted in that batch |
| `email_insert_error_samples[].error_message` | Database error message (sanitized, max 200 chars) |

---

## Console Logging

When email insert fails, logged to stdout/stderr:

```
Email insert failed for agency uuid-456 (Acme Corp) row 15: duplicate key value violates unique constraint...
```

This appears in:
- Cloud Function logs
- Docker container stdout
- Application monitoring systems
- Error tracking services

---

## Impact on Existing Behavior

✅ **Preserved:**
- Agency inserts still tracked the same way
- Phone inserts unaffected
- Upsert deduplication logic unchanged
- ListClean queue workflow identical
- RLS policies untouched

**Added:**
- Email insert error visibility
- Diagnostic counters
- Sample error collection
- Enhanced logging

---

## Testing the Fix

**Test Case 1: Successful Imports**
```
POST /other-agencies-import-v2
{
  "state_slug": "new-jersey",
  "mode": "xlsx",
  "data": <arrayBuffer>
}

Expected: email_insert_diagnostics is undefined or null
```

**Test Case 2: With Constraint Violation**
```
POST /other-agencies-import-v2 (with RLS policy blocking inserts)

Expected:
{
  "email_insert_diagnostics": {
    "total_email_insert_attempts": X,
    "email_insert_errors_count": X,
    "email_insert_error_samples": [...]
  }
}
```

---

## Summary

**Changes Made:**
1. Database: Dropped old CHECK constraint blocking 'pending'
2. Importer: Added error tracking with 3 new variables
3. Email insert: Capture errors with full context
4. Response: Include diagnostics when errors occur
5. Logging: Enhanced console output for debugging

**Result:**
- ✅ Email inserts with 'pending' status now succeed
- ✅ Insert failures are immediately visible in diagnostics
- ✅ First 5 errors stored with full context
- ✅ Console logging for real-time debugging
- ✅ No breaking changes to existing code

**Build ID:** nga2k2qk
