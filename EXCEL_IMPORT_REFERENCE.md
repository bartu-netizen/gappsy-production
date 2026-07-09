# Excel Import - Column Mapping Reference

For admins importing scraper files via `/wp-admin/other-agencies-import`

---

## Quick Start

1. Export your scrape to Excel (`.xlsx`)
2. Upload to admin import page
3. System auto-maps columns
4. Import succeeds

---

## Column Mapping

### Automatically Recognized Columns

These column names (case-insensitive) are auto-mapped:

#### **Required**
- `Name` → agency name ✅
  - Aliases: `name`, `Agency Name`, `Business Name`
  - If missing: Import will fail

#### **Website**
- `Website` → website_url
  - Aliases: `website_url`, `Website URL`, `Web`, `Website URL`
  - Format: Full URL (http/https optional)

#### **Phone**
- `Phone` → phone
  - Aliases: `phone`, `Phone Number`, `Tel`, `Telephone`
  - Format: Any format accepted (10-digit, +1-format, etc.)

#### **Email**
- `Email` → email
  - Aliases: `email`, `Email Address`, `Contact Email`
  - Format: Multiple emails separated by comma or semicolon
  - Example: `jobs@express.com,Jobs@expresspros.com`
  - Backend will dedupe and store each unique email

#### **City**
- `City` → city (validated, may be skipped if invalid)
  - Aliases: `city`, `City Name`, `Location`
  - Validation: Must be 2-50 chars, letters/spaces/hyphens only
  - Rejected: State abbreviations (NJ, CA, etc.), digits-only values, invalid chars

#### **Zip Code**
- `Zip` → zip_code (validated, may be skipped if invalid)
  - Aliases: `zip`, `zip_code`, `Postal Code`, `Zip Code`
  - Validation: 5-digit (12345) or 9-digit (12345-6789) format
  - Rejected: Non-standard formats

#### **Description**
- `Description` → description
  - Aliases: `description`, `About`, `About Agency`
  - Format: Free text
  - Length: Any

#### **Services**
- `Services` → services
  - Aliases: `services`, `Service`
  - Format: Comma-separated list or single string
  - Example: `Web Design, Social Media, SEO`

---

## Column Behavior

### Matched Columns
Successfully mapped and imported:
```
Name = "ACME Marketing"
Website = "acme.com"
Email = "contact@acme.com"
Phone = "(555) 123-4567"
City = "New York"
Zip = "10001"
Description = "Full-service digital agency"
Services = "Web Design, SEO, PPC"

↓

✅ Agency created with all fields
```

### Extra Columns (Unknown)
Safely ignored:
```
Headers: Name, Website, Phone, Email, Keyword, Position, Lat, Lng, URL

Unknown columns: Keyword, Position, Lat, Lng, URL

↓

✅ Ignored safely - no errors
✅ Name, Website, Phone, Email imported
```

### Missing Optional Columns
No error - just not imported:
```
Headers: Name, Website, Email
(Missing: Phone, City, Zip, Description, Services)

↓

✅ Imports Name, Website, Email
✅ Other fields left blank
```

### Missing Required Columns
Import fails:
```
Headers: Website, Phone, Email
(Missing: Name)

↓

❌ Error: "No "Name" or similar column found in Excel sheet"
```

---

## Data Quality Examples

### City Validation

| Value | Status | Reason |
|-------|--------|--------|
| "New York" | ✅ Import | Valid city name |
| "Los Angeles" | ✅ Import | Valid city name |
| "Jersey City" | ✅ Import | Valid (spaces ok) |
| "Saint-Louis" | ✅ Import | Valid (hyphens ok) |
| "  Trenton  " | ✅ Import | Valid (trimmed) |
| "NJ" | ❌ Skip | State abbreviation |
| "CA" | ❌ Skip | State abbreviation |
| "07735" | ❌ Skip | Digits only |
| "123 Main St" | ❌ Skip | Contains digits/invalid |
| "" | ❌ Skip | Empty |
| NULL | ❌ Skip | Missing |

### Zip Code Validation

| Value | Status | Reason |
|-------|--------|--------|
| "12345" | ✅ Import | Valid 5-digit |
| "12345-6789" | ✅ Import | Valid 9-digit |
| "1234" | ❌ Skip | Too short |
| "123456" | ❌ Skip | Too long |
| "1234a" | ❌ Skip | Invalid character |
| "NJ 07735" | ❌ Skip | Invalid format |
| "" | ❌ Skip | Empty |
| NULL | ❌ Skip | Missing |

---

## Email Handling

### Single Email Per Cell
```
Email: "contact@acme.com"

↓

1 email row created:
- contact@acme.com (ACME Marketing)
```

### Multiple Emails Per Cell
```
Email: "jobs@express.com,Jobs@expresspros.com"

↓

2 email rows created:
- jobs@express.com (EXPRESS PROS)
- Jobs@expresspros.com (EXPRESS PROS)

Then backend dedupes by normalized email
→ 1 unique email stored if case-insensitive match
```

### Semicolon Separator
```
Email: "contact@example.com;sales@example.com"

↓

2 email rows created (backend handles both comma and semicolon)
```

### Newline Separator
```
Email: "contact@example.com
sales@example.com"

↓

2 email rows created (backend handles newlines)
```

### Bad Email Formats
Backend validation handles:
- Missing @ symbol → skipped
- Malformed format → skipped
- Whitespace trimmed
- Case normalized (lowercased)
- Duplicates deduped

---

## Import Process Flow

```
1. Select State (required)
   ↓
2. Select/Upload Excel File
   ├─ System detects .xlsx/.xls extension
   ├─ Mode auto-set to "xlsx"
   ├─ File input filters to Excel only
   └─ Shows "Parsing Excel..." status
   ↓
3. Client-Side Processing
   ├─ Read file → XLSX.read()
   ├─ Parse first sheet → sheet_to_json()
   ├─ Extract headers → [Name, Website, Phone, Email, ...]
   ├─ Map to schema → Name→name, Website→website_url, etc.
   ├─ Validate data → City/Zip format checks
   ├─ Trim strings → Remove leading/trailing whitespace
   ├─ Convert to CSV → For consistency
   └─ Prepare payload
   ↓
4. Send to Backend
   ├─ Endpoint: /other-agencies-import-v2
   ├─ Mode: "csv" (internally converted)
   ├─ State: Selected state slug
   ├─ Data: CSV-formatted rows
   ├─ Flags: generate_slugs=true, split_emails=true
   └─ Auth: x-admin-token header
   ↓
5. Backend Processing
   ├─ Parse CSV rows
   ├─ Validate/sanitize data
   ├─ Create/update agencies
   ├─ Split emails (multi-email support)
   ├─ Store in DB
   ├─ Sync to agency_listings_index
   └─ Return results
   ↓
6. Show Results
   ├─ Agencies Created: X
   ├─ Agencies Updated: Y
   ├─ Emails Created: Z
   ├─ Failed: N
   └─ Errors (if any)
```

---

## Common Questions

### Q: What if column name is slightly different?

**A:** Fuzzy matching handles case and underscore variants:
- "name", "Name", "NAME" all work
- "website", "Website", "Website URL" all work
- Normalized: lowercase, replace spaces/underscores

### Q: What about extra columns I don't use?

**A:** Safe to include. Unknown columns ignored without error:
- Keep: Google Maps scraper output as-is
- Ignored: `Keyword`, `Position`, `Lat`, `Lng`, `Plus_Code`, `URL`, etc.

### Q: Can I use multiple sheets?

**A:** No. System uses first sheet only.
- If workbook has multiple sheets, first is imported
- Other sheets ignored

### Q: How many rows can I import?

**A:** No hard limit. Performance tested with 1000+ rows.
- Recommend <5000 for reasonable UX
- Each row creates agency + email(s)

### Q: What if City is "NJ 07735"?

**A:** City is rejected (contains digits, state abbrev).
- Selected state (from dropdown) is used as source of truth
- Bad City data doesn't break import
- Agency still created without City field

### Q: What if Email column has duplicates?

**A:** Backend handles:
```
Email: "test@example.com, Test@Example.Com, test@example.com"

↓

Backend processes:
1. Lowercase + trim each
2. Dedupe by exact match after normalize
3. Create one email row per unique

Result: 1 email stored
```

### Q: Does state slug validation fail import?

**A:** No. State slug is:
- Pre-validated by admin dropdown
- Used as source of truth for all agencies
- Cannot be "bad" (only valid state options available)

### Q: Can I import same agency twice?

**A:** Yes. System behavior:
- First import: Create
- Second import (same state + name): Update
- Slug-based lookup prevents duplicates

### Q: Do existing agencies get overwritten?

**A:** Only if they match on (`slug`, `state_slug`).
- New/different agencies: Created
- Matching existing: Fields updated
- Safe upsert logic

---

## Troubleshooting

### Import Error: "Excel sheet is empty"
**Cause:** File has no data rows (only headers or nothing)
**Fix:** Add data rows to Excel and try again

### Import Error: "No "Name" or similar column found"
**Cause:** Missing Name/name/Agency Name column
**Fix:** Add Name column to Excel file

### Import Error: "Failed to parse Excel file: ..."
**Cause:** File corrupted or not valid Excel
**Fix:**
- Re-export from Google Maps (or data source)
- Verify file opens in Excel
- Try saving as `.xlsx` (not `.xls`)

### Import shows 0 agencies created
**Possible causes:**
1. All rows had empty Name field → all skipped
2. Import failed silently → check console for errors
3. Already imported same agencies → showing as "updated" not "created"

**Fix:** Check Import History tab for details

### Some emails not appearing
**Possible causes:**
1. Email format invalid → backend validation failed
2. Duplicate with case difference → deduped
3. Already existed in DB → skipped

**Fix:** Check error log in Import History for details

### City field blank for valid-looking city
**Cause:** City failed validation (digits, state abbrev, etc.)
**Fix:**
- Check City values against validation rules
- These are safely skipped (not required)
- Selected state is used instead

---

## Best Practices

1. **Verify data before import**
   - Check for empty Name cells
   - Fix email formatting
   - Review City/Zip values

2. **Start with small batch**
   - Test 10-20 rows first
   - Review results
   - Then do bulk import

3. **Use consistent email format**
   - "email@example.com" (lowercase recommended)
   - If multiple: separate by comma or semicolon
   - System normalizes automatically

4. **City/State notes**
   - State from dropdown is authoritative
   - City field is optional/nice-to-have
   - Don't worry if City data is messy

5. **Name is critical**
   - Must be present
   - Must be non-empty
   - Unique per state (typically)

6. **Keep scraper extra columns**
   - `Position`, `Keyword`, etc. safely ignored
   - No need to manually clean before import
   - Upload as-is

---

## Example Files

### Google Maps Scrape Export (Book3.xlsx)

Expected structure:
```
Name               | Website            | Phone          | Email                      | Zip   | City
ACME Marketing     | acme.com           | (555) 123-4567 | contact@acme.com          | 10001 | New York
Express Pros       | expresspros.com    | 555-456-7890   | jobs@express.com,...      | 07735 | Union City
...
```

All columns will be auto-mapped. System ignores any extra columns from the scraper.

---

## Support

For issues or questions:
1. Check this reference guide
2. Review import history (admin page)
3. Check console errors (F12)
4. Verify Excel file format
5. Try with smaller test batch

✅ **Excel import is now live and ready to use!**
