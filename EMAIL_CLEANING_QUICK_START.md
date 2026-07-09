# Email Cleaning Workflow - Quick Start

## Goal
Clean and validate agency email lists using external services like ZeroBounce or NeverBounce.

---

## Step 1: Import Agencies (with email splitting)

**Where:** Admin Panel → `/wp-admin/other-agencies-import`

1. Select state (e.g., "New Jersey")
2. Choose CSV or JSON file
3. File format: semicolon-delimited CSV
   ```
   state_slug;name;website;email;phone
   new-jersey;Acme Marketing;acme.com;info@acme.com,sales@acme.com;555-1234
   ```
4. Click "Upload"
5. **Result:** 1 agency row + 2 email rows created

**Multiple emails in one field automatically split on:** `,` `;` or newline

---

## Step 2: Export for Email Cleaning

**Where:** Admin Panel → `/wp-admin/email-cleaning` → "Export for Cleaning" tab

1. Select state (e.g., "New Jersey")
2. Choose validation filter:
   - **"Unknown"** = emails not yet validated (recommended for first pass)
   - **"Valid"** = already validated as good
   - **"Invalid"** = already marked bad
   - **"All"** = everything
3. Click "Download CSV"
4. **You get:** CSV file with one row per email

### CSV Columns

```
agency_id          → Internal ID (ignore)
email_id           → IMPORTANT: Use for re-import mapping
agency_name        → Agency name (for context)
state_slug         → State (for context)
website_url        → Agency website
phone              → Agency phone
agency_slug        → Used in /your-agency/{slug}
your_agency_path   → /your-agency/acme-marketing-new-jersey
email              → The email address to validate
validation_status  → Current status (usually "unknown")
```

---

## Step 3: Validate with Email Service

**Options:** ZeroBounce, NeverBounce, Hunter.io, or similar

### ZeroBounce Example

1. Upload your CSV to ZeroBounce
2. Select validation option (comprehensive recommended)
3. Wait for validation to complete
4. Download results CSV

### Expected Result CSV

```
email_id,validation_status,validation_provider,validation_reason,validation_score
a1b2c3d4-...,valid,zerobounce,,0.95
e5f6g7h8-...,invalid,zerobounce,role_account,0.10
i9j0k1l2-...,catch_all,zerobounce,catch_all_mailbox,0.50
```

**Status values:** `valid` `invalid` `catch_all` `risky` `duplicate` `unknown`

---

## Step 4: Import Cleaned Results Back

**Where:** Admin Panel → `/wp-admin/email-cleaning` → "Import Cleaned Results" tab

1. Select your cleaned CSV/JSON file
2. Enter provider name: `zerobounce`, `neverbounce`, `hunter`, etc.
3. Click "Import Cleaned Results"
4. **Result:** Your email validation status updated in system

### Success Response

```
✅ Import successful!
145 of 150 rows updated

5 rows unmatched (email_id not found)
0 rows had validation errors
```

**If some rows unmatched:** Check that email_id column matches exactly

---

## Step 5: Use Validated Emails

### Find Valid Emails

Query: Emails with `validation_status = 'valid'` in state

These are ready for:
- Email campaigns
- Cold outreach
- Lead targeting

### Query Examples (Supabase)

```sql
-- Get all valid emails for an agency
SELECT * FROM other_agency_emails
WHERE agency_id = 'a1b2c3d4-...'
  AND validation_status = 'valid';

-- Get all valid agencies in a state
SELECT DISTINCT oa.id, oa.name, COUNT(oae.id) as valid_emails
FROM other_agencies oa
JOIN other_agency_emails oae ON oa.id = oae.agency_id
WHERE oa.state_slug = 'new-jersey'
  AND oae.validation_status = 'valid'
GROUP BY oa.id, oa.name;

-- Find invalid emails for follow-up
SELECT * FROM other_agency_emails
WHERE validation_status = 'invalid'
  AND validation_reason IS NOT NULL;
```

---

## Common Issues

### "Email not found" during re-import

**Problem:** Some rows say "unmatched"

**Solution:**
- Verify `email_id` column in cleaned file matches export
- Check that email cleaner didn't modify the ID column
- Use `agency_id + email` as fallback if IDs changed

### Multiple emails from one import row created duplicates

**Not a problem!** This is by design:
- One import row with 3 emails = 1 agency + 3 email rows
- System correctly splits them
- Duplicates prevented by `UNIQUE (agency_id, email_normalized)`

### My cleaned CSV has different columns

**Minimum required:**
- Column: `email_id` OR (`agency_id` + `email`)
- Column: `validation_status` (required)
- Optional: `validation_provider`, `validation_reason`, `validation_score`

### Export file is huge (100k+ rows)

**This is normal!** If you imported 10 agencies with 100 emails each:
- Import: 1 file with 10 rows
- Export: 1 file with 100 rows (one per email)

This is designed for email cleaners that want one email per line.

---

## Workflow Summary

```
┌─────────────────────────────────────┐
│ 1. IMPORT                           │
│ Agencies + emails (split on comma)  │
└────────────┬────────────────────────┘
             │
             ↓
┌─────────────────────────────────────┐
│ 2. EXPORT FOR CLEANING              │
│ One row per email (flattened)       │
└────────────┬────────────────────────┘
             │
             ↓
┌─────────────────────────────────────┐
│ 3. VALIDATE EXTERNALLY              │
│ ZeroBounce / NeverBounce / etc.     │
└────────────┬────────────────────────┘
             │
             ↓
┌─────────────────────────────────────┐
│ 4. RE-IMPORT RESULTS                │
│ Update validation_status per email  │
└────────────┬────────────────────────┘
             │
             ↓
┌─────────────────────────────────────┐
│ 5. USE FOR CAMPAIGNS                │
│ Filter by validation_status = valid │
└─────────────────────────────────────┘
```

---

## Tips & Best Practices

### 1. Validate in Batches
- Import 100 agencies first
- Export and validate before next batch
- Easier to track and troubleshoot

### 2. Keep Original File
- Save your pre-validation export CSV
- Reference for debugging if something goes wrong

### 3. Track Provider
- Always enter the validation service name
- Creates audit trail for future reference
- Helps if you validate with multiple services

### 4. Regular Re-validation
- Email lists get stale (people change jobs)
- Re-export annually or after 6 months
- Use same provider for consistency

### 5. Archive Cleaned Results
- Keep cleaned CSV files in archive
- Reference for past campaigns
- Useful for deduplication

---

## Support

### Check Import Summary
After import, see:
- Total agencies created
- Total emails created
- Agencies with no email (skipped)
- Rows with errors (details provided)

### Check Export
File should have:
- One header row
- One data row per email
- `email_id` column populated (CRITICAL for re-import)

### Check Re-import
Result should show:
- Rows matched count
- Rows updated count
- Errors (if any)

If updated count doesn't match rows provided, some rows didn't match by email_id.

---

## Admin Page Location

- **Import agencies:** `/wp-admin/other-agencies-import`
- **Export & re-import emails:** `/wp-admin/email-cleaning`
- **All admin tools:** `/wp-admin` (search "email cleaning")
