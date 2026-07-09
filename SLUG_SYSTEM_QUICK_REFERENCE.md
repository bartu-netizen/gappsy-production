# Your Agency Slug System - Quick Reference

## API Endpoints

### 1. Import Agencies with Email Splitting
```
POST /functions/v1/other-agencies-import-v2

Body: {
  state_slug: "new-york",
  filename: "agencies.csv",
  mode: "csv",
  data: "name;website;email;phone\nAcme;acme.com;info@acme.com,sales@acme.com;555-1234",
  generate_slugs: true,
  split_emails: true
}

Response: {
  ok: true,
  total_agencies: 1,
  total_emails: 2,
  agencies_created: 1,
  emails_created: 2,
  emails_skipped: 0
}
```

### 2. Export for Email Cleaning
```
GET /functions/v1/other-agencies-export-for-cleaning?state=new-york&validation_status=unknown&format=csv

Response: CSV file with columns:
- agency_id (UUID)
- email_id (UUID for re-import)
- agency_name
- email
- validation_status (current value)
```

### 3. Re-import Cleaned Results
```
POST /functions/v1/other-agencies-import-cleaned-results

Body: {
  filename: "cleaned.csv",
  mode: "csv",
  data: "email_id,validation_status,validation_provider,validation_score\n{uuid},valid,zerobounce,0.95",
  provider: "zerobounce"
}

Response: {
  ok: true,
  total_rows: 150,
  rows_matched: 145,
  rows_updated: 145,
  rows_unmatched: 5
}
```

---

## Frontend URLs

### Pretty Slug URLs
```
/your-agency/acme-marketing-new-york
/your-agency/digital-pro-california
/your-agency/brand-builders-texas
```

### Legacy UUID URLs (Still Supported)
```
/your-agency/89b91678-b7ae-4adf-9247-e5f16341d9f7
```

### Token Preview Links (Unchanged)
```
/your-agency/t/eyJhbGciOiJIUzI1NiIs...
```

---

## Slug Generation

### Format Rules
```typescript
// Format: {name}-{state}
// All lowercase, hyphens replace spaces
// Special chars removed except hyphens
// Example: "Calta & Co." + "new-york" → "calta-and-co-new-york"

generateAgencySlug("Calta & Co.", "new-york")
// Returns: "calta-and-co-new-york"
```

### Collision Handling
```typescript
// If slug already exists, append numeric suffix
// calta-marketing-new-york → calta-marketing-new-york-2
// calta-marketing-new-york-2 → calta-marketing-new-york-3

generateUniqueSlug("calta-marketing-new-york", existingSlugs)
// Returns: "calta-marketing-new-york-2" if collision detected
```

---

## Email Splitting

### Supported Delimiters
- Comma: `info@acme.com, sales@acme.com`
- Semicolon: `info@acme.com; sales@acme.com`
- Newline: `info@acme.com\nsales@acme.com`

### Result
```
Input: info@acme.com, sales@acme.com, support@acme.com
Output: 3 rows in other_agency_emails table
  - Row 1: email_normalized = info@acme.com
  - Row 2: email_normalized = sales@acme.com
  - Row 3: email_normalized = support@acme.com
```

### Deduplication
```
Input: info@acme.com, Info@Acme.com, INFO@ACME.COM
Output: 1 row (all normalized to same email)
  - Duplicates skipped with: UNIQUE (agency_id, email_normalized)
```

---

## CSV Formats

### Import Format (Input)
```csv
name,website,email,phone
Acme Marketing,acme.com,info@acme.com;sales@acme.com,555-1234
Brand Builders,brand.com,contact@brand.com,555-5678
```

### Export Format (Output - One Row Per Email)
```csv
agency_id,email_id,agency_name,state_slug,email,validation_status
a1b2c3d4-...,e5f6g7h8-...,Acme Marketing,new-york,info@acme.com,unknown
a1b2c3d4-...,i9j0k1l2-...,Acme Marketing,new-york,sales@acme.com,unknown
```

### Re-import Format (Input)
```csv
email_id,validation_status,validation_provider,validation_reason,validation_score
e5f6g7h8-...,valid,zerobounce,,0.95
i9j0k1l2-...,invalid,zerobounce,role_account,0.10
```

---

## Admin Interface

### Access
- URL: `/wp-admin/email-cleaning`
- Search: "email cleaning" in admin command palette
- Group: Content tools

### Export Tab
1. Select state
2. Choose validation filter (unknown/valid/invalid/all)
3. Click "Download CSV for Cleaning"
4. Gets CSV with one row per email

### Import Tab
1. Upload CSV/JSON with cleaned results
2. Enter provider name (zerobounce, neverbounce, etc.)
3. Click "Import Cleaned Results"
4. View matched/unmatched/error counts

---

## Database Schema

### other_agency_emails Table
```sql
CREATE TABLE other_agency_emails (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id uuid NOT NULL REFERENCES other_agencies(id),
  email_raw text,                         -- Original input
  email_normalized text NOT NULL,         -- Lowercase, trimmed
  validation_status text DEFAULT 'unknown',
  validation_provider text,               -- zerobounce, neverbounce, etc.
  validation_reason text,                 -- role_account, catch_all, etc.
  validation_score numeric(3,2),          -- 0.00 to 1.00
  validation_checked_at timestamptz,      -- When last validated
  outreach_status text DEFAULT 'pending', -- For Smartlead integration
  last_outreach_at timestamptz,
  outreach_count int DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  UNIQUE(agency_id, email_normalized)
);

CREATE INDEX idx_other_agency_emails_agency_id ON other_agency_emails(agency_id);
CREATE INDEX idx_other_agency_emails_validation_status ON other_agency_emails(validation_status);
CREATE INDEX idx_other_agency_emails_id ON other_agency_emails(id);
```

---

## Common Queries

### Find All Valid Emails for an Agency
```sql
SELECT email_normalized FROM other_agency_emails
WHERE agency_id = 'a1b2c3d4-...'
  AND validation_status = 'valid';
```

### Find Agencies with No Valid Emails
```sql
SELECT DISTINCT oa.id, oa.name
FROM other_agencies oa
WHERE NOT EXISTS (
  SELECT 1 FROM other_agency_emails oae
  WHERE oae.agency_id = oa.id
    AND oae.validation_status = 'valid'
);
```

### Count Emails by Status per State
```sql
SELECT
  oa.state_slug,
  oae.validation_status,
  COUNT(*) as count
FROM other_agencies oa
JOIN other_agency_emails oae ON oa.id = oae.agency_id
GROUP BY oa.state_slug, oae.validation_status
ORDER BY oa.state_slug;
```

---

## Troubleshooting

### UUID Detection
- Pattern: `^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$`
- If parameter matches: Treats as UUID (legacy support)
- If doesn't match: Treats as slug

### Email Not Matched During Re-import
- Check if `email_id` is present and correct
- If using fallback: Ensure `agency_id + email_normalized` provided
- Verify email was actually created during import

### Slug Collision Detection
- System automatically appends numeric suffix
- Check `find_duplicate_agency_slugs()` function in database

### Export Returns 0 Rows
- Verify state_slug is correct
- Check validation_status filter
- Confirm agencies/emails exist in database

---

## Performance Notes

### Import (other-agencies-import-v2)
- Batch size: 250 agencies per batch
- Email splitting: O(n) where n = number of emails
- Slug generation: O(1) with collision detection
- Expected: 1000 agencies/second on typical hardware

### Export (other-agencies-export-for-cleaning)
- Join: other_agencies + other_agency_emails
- Indexed fields: state_slug, validation_status
- Expected: <500ms for 50k emails with proper indexes

### Re-import (other-agencies-import-cleaned-results)
- Batch size: 250 rows per batch
- Lookup: O(1) on email_id, O(1) on (agency_id, email_normalized)
- Expected: <100ms per 250 rows

---

## Future Integration: Smartlead

### Ready For
- Outreach status tracking (already in schema)
- Email click tracking (email_id in URLs)
- Unsubscribe management (validation_status updates)
- Campaign performance (outreach_count field)

### No Schema Changes Needed
- Fields already present in other_agency_emails
- URL format perfect for tracking: `/your-agency/{slug}`
- Email validation prerequisite satisfied

---

**Last Updated:** March 1, 2026
**Status:** Production Ready
