# Bulk State JSON Import System

## Overview

The bulk state JSON import system allows you to upload 1-52 state JSON files at once and automatically:
- Populate the database (top25_slots, other_agencies tables)
- Save JSON files to /public/data/{state-slug}.json
- Create state pages at /marketing-agencies-in-{state-slug}-united-states
- Validate data before import
- Track progress and show results

## Access

Navigate to: **`/admin/bulk-state-import`**

## Features

### 1. File Upload
- **Multi-file upload**: Select 1-52 JSON files at once
- **Drag & drop**: Drag files directly into the upload area
- **File validation**: Only .json files accepted
- **Instant feedback**: Shows number of files selected

### 2. Automatic Validation
- Validates JSON syntax
- Checks required fields (state_name, state_slug, agencies)
- Verifies state_slug is a valid US state
- Validates Top 25 agencies (ranks 1-25)
- Detects duplicate ranks
- Shows validation results with clear error messages

### 3. Import Options

#### Import to Database
✅ **Enabled by default**

Imports agencies to database tables:
- **Top 25 agencies** → `top25_slots` table (ranks 1-25)
- **Other agencies** → `other_agencies` table (no rank or rank > 25)

#### Save JSON to /public/data/
✅ **Enabled by default**

Uses Edge Function to save JSON files to `/public/data/{state-slug}.json`
- These files are fetched by StatePageTemplate.tsx
- Required for state pages to work

#### Download JSON Files
❌ **Disabled by default**

Downloads JSON files to your computer for manual placement

#### Mark as Placeholders
✅ **Enabled by default**

Sets:
- `is_paid = false`
- `is_placeholder = true`

Use this when importing unpaid/free listings.

#### Override Existing Data
❌ **Disabled by default** (DANGEROUS)

Deletes existing state data before import.

**⚠️ WARNING**: This will permanently delete all existing agencies for the state!

### 4. Bulk Import Process

1. **Validation Phase**: All files validated simultaneously
2. **Import Phase**: States imported one by one
3. **Progress Tracking**: Real-time status updates
4. **Results Summary**: Shows success/failure for each state

### 5. Results Display

Shows:
- ✅ Successfully imported states
- ❌ Failed states with error messages
- Direct links to view each state page

---

## JSON File Format

### Required Fields

```json
{
  "state_name": "Wyoming",
  "state_slug": "wyoming",
  "agencies": [
    {
      "rank": 1,
      "name": "Agency Name",
      "websiteUrl": "https://example.com"
    }
  ]
}
```

### Complete Format

```json
{
  "state_name": "Wyoming",
  "state_slug": "wyoming",
  "source_url": "https://www.gappsy.com/marketing-agencies-in-wyoming-united-states/",

  "seo": {
    "title": "Top 25 Marketing Agencies in Wyoming",
    "meta_description": "Looking for Marketing Agencies in Wyoming? Explore the best in the state...",
    "focus_keyword": "Marketing Agencies in Wyoming",
    "canonical_url": "https://www.gappsy.com/marketing-agencies-in-wyoming-united-states/",
    "og_title": "Marketing Agencies in Wyoming",
    "og_description": "...",
    "og_image": "",
    "og_url": "https://www.gappsy.com/marketing-agencies-in-wyoming-united-states/"
  },

  "state_intro_short": "Selecting the ideal marketing agency in Wyoming...",
  "state_intro_full": "Full intro text with details about Wyoming cities and the marketing landscape...",

  "agencies": [
    {
      "rank": 1,
      "name": "Vazagency",
      "city": "Cheyenne",
      "state": "Wyoming",
      "pricing": "$5,000+",
      "websiteUrl": "https://vazagency.com",
      "logo": {
        "localPath": "logos/wyoming/vazagency-Top-25-Marketing-Agencies-in-Wyoming-by-Gappsy.webp",
        "altText": "Vazagency - Top 25 Marketing Agencies in Wyoming by Gappsy",
        "width": 336,
        "height": 91,
        "boltUrl": null
      },
      "shortDescription": "Brief description of the agency...",
      "fullDescription": "Detailed description with more information...",
      "services": ["SEO", "PPC", "Social Media Marketing"]
    }
  ],

  "faqs": [
    {
      "question": "Which Services do Marketing Agencies in Wyoming Offer?",
      "answer": "Marketing agencies in Wyoming specialize in..."
    }
  ]
}
```

---

## Field Descriptions

### Top Level

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `state_name` | string | ✅ | Full state name (e.g., "Wyoming") |
| `state_slug` | string | ✅ | URL-safe slug (e.g., "wyoming") |
| `source_url` | string | ❌ | Original WordPress URL |
| `seo` | object | ❌ | SEO metadata |
| `state_intro_short` | string | ❌ | Brief state introduction |
| `state_intro_full` | string | ❌ | Full state introduction |
| `agencies` | array | ✅ | Array of agency objects |
| `faqs` | array | ❌ | Array of FAQ objects |

### Agency Object

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `rank` | number | ✅ | Position in Top 25 (1-25) or omit for "Other Agencies" |
| `name` | string | ✅ | Agency name |
| `city` | string | ❌ | City location |
| `state` | string | ❌ | State name |
| `pricing` | string | ❌ | Pricing range (e.g., "$5,000+") |
| `websiteUrl` | string | ✅ | Agency website URL |
| `logo` | object | ❌ | Logo information |
| `shortDescription` | string | ❌ | Brief description |
| `fullDescription` | string | ❌ | Detailed description |
| `services` | array | ❌ | Array of service strings |

### Logo Object

| Field | Type | Description |
|-------|------|-------------|
| `localPath` | string | Path relative to /public/ |
| `altText` | string | Alt text for accessibility |
| `width` | number | Image width in pixels |
| `height` | number | Image height in pixels |
| `boltUrl` | string\|null | Bolt CDN URL (if uploaded) |

### FAQ Object

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `question` | string | ✅ | FAQ question |
| `answer` | string | ✅ | FAQ answer (can include HTML) |

---

## Validation Rules

### State Slug
- Must match a valid US state from the US_STATES constant
- Valid examples: `wyoming`, `new-jersey`, `california`
- Invalid: `wyomng`, `wyoming-state`, `wy`

### Agencies Array
- Must contain at least 1 agency
- **Top 25**: Agencies with rank 1-25
  - Should have exactly 25 agencies
  - No duplicate ranks
  - All ranks must be integers
- **Other Agencies**: Agencies without rank or rank > 25
  - Unlimited count
  - Will be imported to `other_agencies` table

### Required Agency Fields
- `name`: Cannot be empty
- `websiteUrl`: Should be a valid URL (warning if missing)

---

## Database Schema

### top25_slots

```sql
CREATE TABLE top25_slots (
  id uuid PRIMARY KEY,
  state_slug text,
  rank integer,
  agency_name text,
  agency_website text,
  agency_city text,
  agency_state text,
  agency_pricing text,
  agency_description text,
  logo_url text,
  is_paid boolean,
  is_placeholder boolean,
  services text[],
  created_at timestamp,
  UNIQUE(state_slug, rank)
);
```

### other_agencies

```sql
CREATE TABLE other_agencies (
  id uuid PRIMARY KEY,
  state_slug text,
  name text,
  slug text,
  website_url text,
  logo_url text,
  city text,
  state text,
  short_description text,
  services text[],
  featured boolean,
  verified boolean,
  created_at timestamp
);
```

---

## Usage Examples

### Example 1: Import Single State

1. Navigate to `/admin/bulk-state-import`
2. Select `wyoming.json`
3. Verify validation passes
4. Keep all default options:
   - ✅ Import to database
   - ✅ Save JSON to /public/data/
   - ✅ Mark as placeholders
   - ❌ Override existing data
5. Click "Import 1 State"
6. Wait for success message
7. Click "Wyoming" link to view page

### Example 2: Bulk Import All 52 States

1. Navigate to `/admin/bulk-state-import`
2. Select all 52 JSON files at once
3. Review validation results
4. Fix any failed validations
5. Configure options:
   - ✅ Import to database
   - ✅ Save JSON to /public/data/
   - ✅ Mark as placeholders
   - ❌ Override existing (unless replacing data)
6. Click "Import 52 States"
7. Watch progress bar
8. Review results summary
9. Visit each state page to verify

### Example 3: Update Existing State

1. Navigate to `/admin/bulk-state-import`
2. Select `wyoming.json` (updated version)
3. Verify validation passes
4. Configure options:
   - ✅ Import to database
   - ✅ Save JSON to /public/data/
   - ❌ Mark as placeholders (if agencies are paid)
   - ✅ **Override existing data** (to replace old data)
5. Click "Import 1 State"
6. Existing Wyoming data will be deleted
7. New data will be imported

---

## Error Handling

### Common Errors

#### JSON Parse Error
```
Error: JSON parse error: Unexpected token at position 123
```
**Solution**: Validate JSON syntax using a JSON validator

#### Invalid State Slug
```
Error: Invalid state_slug: wyomng (not a valid US state)
```
**Solution**: Check state_slug matches US_STATES list exactly

#### Duplicate Ranks
```
Error: Duplicate ranks found: 5, 12
```
**Solution**: Ensure each rank 1-25 appears only once

#### Missing Required Fields
```
Error: Missing state_name
```
**Solution**: Add missing required fields

#### Database Error
```
DB: 3 Top25 errors, 0 Other errors
```
**Solution**: Check Edge Function logs for details

#### JSON Save Error
```
JSON: Failed to write state JSON file
```
**Solution**: Ensure Edge Function is deployed and has write permissions

---

## Technical Details

### File Structure

```
src/
├── pages/
│   └── AdminBulkStateImport.tsx     # Main admin page
├── utils/
│   └── stateJsonImport.ts            # Import utility functions
supabase/
└── functions/
    └── update-state-json/
        └── index.ts                   # Edge Function for JSON saving
```

### Data Flow

```
1. User uploads JSON files
2. Frontend validates JSON structure
3. User clicks "Import"
4. For each valid file:
   a. Import agencies to database (if enabled)
   b. Call Edge Function to save JSON (if enabled)
   c. Download JSON file (if enabled)
   d. Update progress
5. Show results summary
```

### Edge Function Call

```typescript
const response = await fetch(
  `${VITE_SUPABASE_URL}/functions/v1/update-state-json`,
  {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${VITE_SUPABASE_ANON_KEY}`
    },
    body: JSON.stringify({
      stateSlug: 'wyoming',
      data: { /* full state JSON */ }
    })
  }
);
```

---

## Testing Checklist

### Single State Test

- [ ] Upload wyoming.json
- [ ] Validation passes
- [ ] 25 agencies detected in Top 25
- [ ] Other agencies detected (if any)
- [ ] FAQs counted correctly
- [ ] Import to database succeeds
- [ ] JSON file saved to /public/data/wyoming.json
- [ ] Visit /marketing-agencies-in-wyoming-united-states
- [ ] Page loads correctly
- [ ] All 25 agencies visible
- [ ] FAQs display correctly

### Multi-State Test

- [ ] Upload 3-5 state JSONs
- [ ] All validate successfully
- [ ] Bulk import completes
- [ ] All database records created
- [ ] All JSON files saved
- [ ] All state pages accessible
- [ ] No database conflicts

### Error Handling Test

- [ ] Upload invalid JSON (syntax error)
- [ ] Upload JSON with missing state_name
- [ ] Upload JSON with invalid state_slug
- [ ] Upload JSON with duplicate ranks
- [ ] Verify errors shown clearly
- [ ] Other valid states still import

---

## Troubleshooting

### Import Succeeds but Page Shows No Data

**Problem**: Database import worked but JSON file wasn't saved

**Solution**:
1. Check Edge Function is deployed
2. Verify Edge Function has write permissions
3. Enable "Download JSON files" option
4. Manually place JSON files in /public/data/

### Some Agencies Missing

**Problem**: Only some agencies imported

**Solution**:
1. Check validation warnings
2. Verify rank is 1-25 for Top 25
3. Check for duplicate ranks
4. Review Edge Function logs

### State Page Shows 404

**Problem**: State page not found

**Solution**:
1. Verify state_slug matches route format exactly
2. Check JSON file exists at /public/data/{state-slug}.json
3. Clear browser cache
4. Verify state_slug in US_STATES constant

---

## Next Steps

After successful import:

1. **Verify Pages**: Visit each imported state page
2. **Upload Logos**: Use Bulk Logo Upload page if needed
3. **Test Forms**: Test availability request forms
4. **Check SEO**: Verify meta tags and descriptions
5. **Monitor Database**: Check top25_slots and other_agencies tables
6. **Start Selling**: Begin selling premium placements per state

---

## Support

For issues or questions:
- Check BULK_STATE_IMPORT_GUIDE.md (this file)
- Review validation error messages
- Check Edge Function logs in Supabase
- Test with single state before bulk importing
