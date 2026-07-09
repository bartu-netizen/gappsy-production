# Exact Code Blocks - Email Import Constraint Fix

**Build ID:** nga2k2qk | **Date:** 2026-03-03

---

## 1. Database Migration (Applied)

**File:** `supabase/migrations/20260303_fix_validation_status_check_constraint.sql`

```sql
/*
  # Fix: Remove Conflicting validation_status CHECK Constraint

  1. Problem
    - Two CHECK constraints exist on other_agency_emails.validation_status:
      (a) other_agency_emails_validation_status_check: ['unknown', 'valid', 'invalid', 'catch_all', 'risky', 'duplicate'] (OLD, no 'pending')
      (b) valid_statuses_including_pending: ['pending', 'valid', 'invalid', 'unknown', 'risky', 'catch_all', 'blocked', 'opted_out'] (NEW, has 'pending')
    - Inserts with validation_status='pending' fail the old constraint
    - This breaks email imports that use validation_status='pending'

  2. Solution
    - Drop the old restrictive constraint
    - Keep the new comprehensive constraint
    - Email inserts with 'pending' status will now succeed

  3. Impact
    - Fixes email insert failures in other-agencies-import-v2
    - Allows validation_status='pending' for newly imported emails
    - No data migration needed (no existing rows use 'pending' status)
    - Backward compatible with existing rows

  4. Allowed validation_status values after this fix
    - pending (new imports, not yet verified)
    - valid (passed validation, send-ready)
    - invalid (failed validation, do not send)
    - unknown (ListClean returned unknown, treat as invalid for send)
    - risky (ListClean flagged as risky, do not send)
    - catch_all (catch-all address, treat as invalid for send)
    - blocked (explicitly blocked, do not send)
    - opted_out (user opted out, do not send)
*/

-- Drop the old restrictive CHECK constraint
ALTER TABLE other_agency_emails
DROP CONSTRAINT other_agency_emails_validation_status_check;
```

---

## 2. Error Tracking Variables

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (Lines 635-642)

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

## 3. Enhanced Email Insert with Error Capture

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (Lines 835-881)

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

---

## 4. ImportResult Interface Update

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (Lines 92-101)

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

## 5. Response with Email Insert Diagnostics

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (Lines 943-980)

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
  email_insert_diagnostics: emailInsertErrorsCount > 0 ? {
    total_email_insert_attempts: totalEmailInsertAttempts,
    email_insert_errors_count: emailInsertErrorsCount,
    email_insert_error_samples: emailInsertErrorSamples,
  } : undefined,
};
```

---

## 6. Validation Status Constraint (Before)

```sql
-- OLD CONSTRAINT (removed)
CHECK (validation_status IN ('unknown', 'valid', 'invalid', 'catch_all', 'risky', 'duplicate'))

-- NEW CONSTRAINT (kept)
CHECK (validation_status IN ('pending', 'valid', 'invalid', 'unknown', 'risky', 'catch_all', 'blocked', 'opted_out'))
```

---

## 7. Validation Status Constraint (After)

```sql
-- ONLY CONSTRAINT REMAINS
CHECK (validation_status IN ('pending', 'valid', 'invalid', 'unknown', 'risky', 'catch_all', 'blocked', 'opted_out'))
```

---

## 8. Verification State Constraint

```sql
-- Always existed, no changes
CHECK (verification_state IN ('queued', 'processing', 'completed', 'retry_scheduled', 'failed_permanent'))
```

---

## 9. Example Response: Success

```json
{
  "ok": true,
  "jobId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  "total_agencies": 150,
  "total_emails": 187,
  "agencies_created": 150,
  "agencies_updated": 0,
  "emails_created": 187,
  "emails_skipped": 0,
  "agencies_with_no_email": 0,
  "phones_created": 143,
  "phones_skipped": 0,
  "agencies_with_no_phone": 7,
  "agencies_with_multiple_phones": 18,
  "failed": 0,
  "emails_enqueued_for_verification": 187,
  "listclean_auto_kick_attempted": true,
  "listclean_auto_kick_started": true,
  "listclean_auto_kick_already_running": false,
  "listclean_auto_kick_error": null,
  "errors": [],
  "metadata_counts": {
    "rows_with_email": 150,
    "rows_with_full_address": 145,
    "rows_with_maps_url": 140,
    "rows_with_coords": 135,
    "rows_with_social_urls": 45
  },
  "parser_diagnostics": {
    "detected_sheet_name": "Sheet1",
    "detected_headers": ["id", "keyword", "name", "full_address", "street_address", "city", "state", "zip", "website", "phone", "email", "url", "position"],
    "header_mapping_used": {
      "email": "Email",
      "name": "Name",
      "website": "Website",
      "phone": "Phone",
      "url": "URL"
    },
    "rows_total": 150,
    "rows_with_email_cell_present": 150,
    "rows_with_extracted_emails": 145,
    "total_emails_extracted_before_dedupe": 187,
    "total_emails_inserted": 187,
    "sample_email_extraction_debug": [
      {
        "row_index": 2,
        "raw_email_cell_value": "info@domain.com",
        "extracted_emails": ["info@domain.com"],
        "reason": "Success"
      }
    ]
  },
  "email_insert_diagnostics": null
}
```

---

## 10. Example Response: With Errors

```json
{
  "ok": true,
  "jobId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
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
        "error_message": "duplicate key value violates unique constraint \"other_agency_emails_agency_id_email_normalized_key\""
      },
      {
        "row_number": 23,
        "agency_name": "Tech Solutions",
        "first_email": "contact@techsolutions.io",
        "error_message": "new row violates row-level security policy for table \"other_agency_emails\""
      },
      {
        "row_number": 31,
        "agency_name": "Global Enterprises",
        "first_email": "sales@globalenterprises.com",
        "error_message": "new row violates row-level security policy for table \"other_agency_emails\""
      },
      {
        "row_number": 42,
        "agency_name": "Digital Marketing Inc",
        "first_email": "hello@digitalbiz.net",
        "error_message": "duplicate key value violates unique constraint \"other_agency_emails_agency_id_email_normalized_key\""
      },
      {
        "row_number": 58,
        "agency_name": "Creative Studios",
        "first_email": "info@creativestudios.org",
        "error_message": "new row violates row-level security policy for table \"other_agency_emails\""
      }
    ]
  }
}
```

---

## 11. Sample Inserted Email Row

After successful import, a row in `other_agency_emails` looks like:

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "agency_id": "6ba7b810-9dad-11d1-80b4-00c04fd430c8",
  "email_raw": "info@domain.com,sales@domain.com",
  "email_normalized": "info@domain.com",
  "validation_status": "pending",
  "verification_state": "queued",
  "validation_provider": null,
  "validation_reason": null,
  "validation_checked_at": null,
  "validation_score": null,
  "source": "import",
  "outreach_status": "not_sent",
  "last_outreach_at": null,
  "outreach_count": 0,
  "created_at": "2026-03-03T03:41:55.000Z",
  "updated_at": "2026-03-03T03:41:55.000Z"
}
```

**Key Values:**
- `validation_status`: "pending" ← Now works after constraint fix!
- `verification_state`: "queued" ← Ready for ListClean processing

---

## 12. SQL to Verify Fix

**Check validation_status constraints:**
```sql
SELECT constraint_name, check_clause
FROM information_schema.check_constraints
WHERE constraint_schema = 'public'
  AND check_clause LIKE '%validation_status%';
```

**Expected Result:**
```
constraint_name: 2200_126480_5_not_null
check_clause: validation_status IS NOT NULL

constraint_name: valid_statuses_including_pending
check_clause: (validation_status = ANY (ARRAY['pending'::text, 'valid'::text, 'invalid'::text, 'unknown'::text, 'risky'::text, 'catch_all'::text, 'blocked'::text, 'opted_out'::text]))
```

**NOT present (successfully removed):**
```
constraint_name: other_agency_emails_validation_status_check
check_clause: (validation_status = ANY (ARRAY['unknown'::text, 'valid'::text, 'invalid'::text, 'catch_all'::text, 'risky'::text, 'duplicate'::text]))
```

---

## Summary

| Component | Code | Status |
|---|---|---|
| Migration SQL | ✅ Applied | Lines above |
| Error vars | ✅ Added | 7 lines |
| Email insert | ✅ Enhanced | 47 lines |
| Response type | ✅ Updated | 7 lines |
| Sample response | ✅ Works | See above |

**Total Changes:** ~70 lines of code + 1 SQL statement
**Build ID:** nga2k2qk
**Status:** DEPLOYED ✅
