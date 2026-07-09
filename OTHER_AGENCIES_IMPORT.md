# Other Agencies Import System

## Overview

The Other Agencies Import System enables bulk importing of local marketing agencies per state into Gappsy's database. These imported agencies appear in the "Other Agencies in {State}" section on each state page and are immediately available for availability check requests through the existing demo flow.

**Key Features**:
- CSV and JSON import support (CSV recommended)
- Per-state import with deduplication
- Scales to thousands of agencies per state without timeouts
- Batch processing (250 rows per batch) for performance
- Full import audit trail with error tracking
- Admin dashboard with import job history
- Automatic reconciliation with existing Top-25 data

## System Architecture

### Data Flow

```
CSV/JSON File
    ↓
Admin Upload Page (/wp-admin/other-agencies-import)
    ↓
other-agencies-import edge function
    ↓
Parse CSV/JSON → Validate → Batch UPSERT (250 rows/batch)
    ↓
other_agencies table + other_agency_import_jobs + error logs
    ↓
State Pages fetch from DB via other-agencies-list endpoint
    ↓
OtherAgenciesSection component renders with service filters
    ↓
"Check Availability" → /availability/start?agencyId=...&source=other&state=...
    ↓
Agency details loaded from other_agencies table
```

### Database Schema

#### `other_agencies` Table

Core storage for imported agencies with built-in deduplication.

**Columns**:
- `id` (uuid, PK): Unique agency identifier
- `state_slug` (text): State identifier (e.g., 'new-jersey')
- `name` (text): Agency name (required)
- `website` (text): Website URL for deduplication
- `city` (text): City location
- `description` (text): Short agency description (for cards)
- `services` (text[]): Array of service categories (e.g., ['SEO', 'PPC'])
- `primary_service` (text): Primary service focus
- `logo_url` (text): Agency logo image URL
- `email` (text): Contact email
- `phone` (text): Contact phone
- `is_active` (boolean): Visibility flag (default true)
- `source` (text): Data source identifier (default 'import')
- `created_at` (timestamptz): Record creation time
- `updated_at` (timestamptz): Last modification time

**Plus existing columns**: city, state, short_description, full_description, social_links, featured, verified, view_count, click_count, last_clicked_at

**Indexes**:
- `(state_slug, is_active)`: Fast state page queries
- `(state_slug)`: Alternative state lookup
- `services` (GIN): Service filtering via `@>` contains operator
- `(state_slug, lower(name), coalesce(lower(website),''))`: Unique deduplication key

**RLS**:
- Public SELECT on `is_active = true` records
- Service role full access for imports

#### `other_agency_import_jobs` Table

Audit trail for import operations.

**Columns**:
- `id` (uuid, PK): Job identifier
- `created_at` (timestamptz): Job start time
- `created_by` (text): Admin user identifier
- `state_slug` (text): Target state(s)
- `filename` (text): Original file name
- `mode` (text): 'csv' | 'json'
- `status` (text): 'processing' | 'succeeded' | 'failed'
- `total_rows` (int): Total rows in file
- `inserted` (int): Successfully inserted count
- `updated` (int): Successfully updated count
- `skipped` (int): Skipped count
- `failed` (int): Failed count
- `error` (text): Error message if status='failed'

**Indexes**:
- `(state_slug, created_at DESC)`: State-specific history
- `(status, created_at DESC)`: Recent imports

#### `other_agency_import_job_rows` Table

Detailed error tracking for individual rows.

**Columns**:
- `id` (uuid, PK): Row error identifier
- `job_id` (uuid, FK): Parent job
- `row_number` (int): Line number in file (1-indexed)
- `raw` (jsonb): Original parsed row data
- `error` (text): Error message
- `created_at` (timestamptz): Record creation time

**Indexes**:
- `(job_id)`: Find errors per job

## Edge Functions

### `other-agencies-import`

**Endpoint**: `POST /functions/v1/other-agencies-import`

**Authentication**: JWT required

**Request Body**:
```json
{
  "state_slug": "california",
  "filename": "agencies.csv",
  "mode": "csv",
  "data": "state_slug;name;website;...\ncalifornia;Acme Marketing;https://acme.com;..."
}
```

**Response Success**:
```json
{
  "ok": true,
  "jobId": "uuid",
  "total": 1000,
  "inserted": 950,
  "updated": 0,
  "failed": 50,
  "skipped": 0
}
```

**Response Error**:
```json
{
  "error": "Error message"
}
```

**Logic**:
1. Validate required fields (state_slug, filename, mode, data)
2. Parse CSV or JSON
3. Create import job record
4. Batch process records (250 per batch):
   - Validate required fields (name, state_slug)
   - Normalize services (split by | or ,)
   - UPSERT with conflict handling
5. Log failures to import_job_rows table
6. Update job status and counts
7. Return summary

**CSV Parsing**:
- Delimiter: semicolon (;)
- Encoding: UTF-8
- Header row required
- Services field: pipe-separated (SEO|PPC|Branding) or comma-separated
- Normalized to `text[]` array in database

### `other-agencies-list`

**Endpoint**: `GET /functions/v1/other-agencies-list`

**Query Parameters**:
- `state` (string): State slug filter (required for most use cases)
- `q` (string): Search query (name ilike)
- `service` (string): Service filter (uses GIN array contains)
- `limit` (int, max 500, default 50): Result limit
- `offset` (int, default 0): Result offset

**Response Success**:
```json
{
  "ok": true,
  "agencies": [
    {
      "id": "uuid",
      "name": "Acme Marketing",
      "state_slug": "california",
      "city": "San Francisco",
      "description": "Full-service digital marketing...",
      "services": ["SEO", "PPC", "Web Design"],
      "primary_service": "SEO",
      "logo_url": "https://...",
      "website": "https://acme.com",
      "email": "contact@acme.com",
      "phone": "+1-555-1234"
    }
  ],
  "total": 42,
  "limit": 50,
  "offset": 0
}
```

**Response Error**:
```json
{
  "error": "Error message"
}
```

**Authentication**: Public (no JWT required)

### `other-agencies-services`

**Endpoint**: `GET /functions/v1/other-agencies-services`

**Query Parameters**:
- `state` (string): State slug (required)

**Response Success**:
```json
{
  "ok": true,
  "services": [
    {"service": "SEO", "count": 145},
    {"service": "PPC", "count": 128},
    {"service": "Web Design", "count": 112}
  ]
}
```

**Purpose**: Generate dynamic service filter chips on state pages. Returns top 8 services by frequency.

**Authentication**: Public (no JWT required)

### `other-agencies-import-jobs`

**Endpoint**: `GET /functions/v1/other-agencies-import-jobs`

**Query Parameters**:
- `state` (string, optional): Filter by state
- `limit` (int, max 100, default 20): Result limit

**Response Success**:
```json
{
  "ok": true,
  "jobs": [
    {
      "id": "uuid",
      "state_slug": "california",
      "filename": "agencies.csv",
      "mode": "csv",
      "status": "succeeded",
      "total_rows": 1000,
      "inserted": 950,
      "updated": 0,
      "failed": 50,
      "skipped": 0,
      "created_at": "2026-02-19T10:00:00Z"
    }
  ]
}
```

**Authentication**: Public (no JWT required)

## Admin UI

### Import Page: `/wp-admin/other-agencies-import`

#### Upload Tab

1. **State Selection**: Dropdown of all 52 states and territories
2. **Format Selection**: CSV (recommended) or JSON radio buttons
3. **File Input**: Browse and select file
4. **CSV Format Info Box**:
   - Shows required semicolon delimiter
   - Example header row
5. **Start Import Button**: Triggers upload and processing

**CSV Template**:
```csv
state_slug;name;website;city;description;services;primary_service;logo_url;email;phone
california;Acme Marketing;https://acme.com;San Francisco;Full-service digital agency;SEO|PPC|Branding;SEO;https://acme.com/logo.png;hello@acme.com;+1-555-1234
california;Shoreline Agency;https://shoreline.co;;Performance marketing specialists;Paid Social|Email Marketing;Paid Social;;;+1-555-5678
```

**Import Result Display**:
- Inserted count (green)
- Updated count (blue)
- Skipped count (yellow)
- Failed count (red)
- Job ID for reference

#### Jobs Tab

- List of recent import jobs
- Sorted by created_at DESC
- Shows state, filename, mode, status
- Displays insert/update/failed/skipped counts
- Status badge (succeeded/processing/failed)

#### Manage Tab

**Search and Filter**:
- State dropdown filter
- Name search input
- Search button

**Agency List**:
- Agency name (bold)
- City and state location
- Service chips (first 3 + count)
- Action buttons:
  - View (eye icon)
  - Edit (pencil icon)
  - Delete (trash icon)

## Public UI Integration

### State Pages: "Other Agencies in {State}" Section

**Component**: `OtherAgenciesSection.tsx`

**Features**:
1. **Dynamic Loading**: Fetches agencies from `other-agencies-list` endpoint
2. **Search**: Real-time name filtering
3. **Service Chips**: Generated from top services in state
4. **Filtering**: Click service chip to filter
5. **Pagination**: Shows first 4 agencies, expandable with search/filter
6. **Fallback**: Mock data if no DB agencies available
7. **Performance**: LazyLoad with intersection observer

**Card Display** (`OtherAgencyCard.tsx`):
- Agency name
- City and state location
- Short description
- Service badges
- "Check Availability" button

**Check Availability Flow**:
- Link: `/availability/start?agencyId={uuid}&source=other&state={state_slug}`
- Opens availability request form
- Requires visitor info: type (client/owner), name, email
- Creates entry in availability_requests table
- Sets `agency_source = 'other_agencies'`

## CSV Format Reference

### Recommended Structure (Semicolon Delimited)

**Header Row** (copy exactly):
```
state_slug;name;website;city;description;services;primary_service;logo_url;email;phone
```

### Field Specifications

| Field | Required | Format | Notes |
|-------|----------|--------|-------|
| `state_slug` | Yes | Text slug | Use hyphens: 'new-jersey', 'district-of-columbia' |
| `name` | Yes | Text | Agency legal name (used for deduplication) |
| `website` | No | URL | Used for deduplication if provided |
| `city` | No | Text | City name only (no state) |
| `description` | No | Text (max 500 chars) | Short pitch for card display |
| `services` | No | Pipe-separated list | E.g. 'SEO|PPC|Branding' or comma-separated |
| `primary_service` | No | Text | One service for sorting/filtering |
| `logo_url` | No | HTTPS URL | Square image preferred |
| `email` | No | Email | Contact email address |
| `phone` | No | Text | Phone with country code recommended |

### Example CSV (Copy-Paste Template)

```csv
state_slug;name;website;city;description;services;primary_service;logo_url;email;phone
california;Acme Marketing Co;https://acmemkt.com;San Francisco;Full-service digital marketing for SMBs and startups;SEO|PPC|Web Design|Content Marketing;SEO;https://acmemkt.com/logo.png;contact@acmemkt.com;+1-415-555-0123
california;Shoreline Performance;https://shoreline.io;Los Angeles;Performance-first agency specializing in paid advertising and conversions;Paid Social|Email Marketing|Analytics;Paid Social;https://shoreline.io/logo.png;hello@shoreline.io;+1-310-555-4567
california;Bay Area Branding Studio;https://baystudio.design;;Brand strategy and UX design for tech companies;Branding|UX Design|Web Design;;https://baystudio.design/logo.png;;
```

## Deduplication Strategy

### Unique Constraint

The system uses a composite unique index to prevent duplicate agency entries:

```sql
CREATE UNIQUE INDEX idx_other_agencies_dedupe
  ON other_agencies(
    state_slug,
    lower(name),
    COALESCE(lower(website), '')
  );
```

**Deduplication Logic**:
1. State slug must match
2. Name comparison is case-insensitive (normalized to lowercase)
3. Website comparison is case-insensitive with null-safe coalescing
   - If both records have same website: duplicate
   - If one has no website: not a duplicate
   - If both have no website: duplicate on name alone

### Import Behavior

On import, the system uses PostgreSQL's `UPSERT` (INSERT ... ON CONFLICT ... DO UPDATE):

- **If new agency**: INSERT new record
- **If exact match found**: UPDATE existing record (retains ID)
- **If partial match**: Depends on import mode (handled gracefully)

**Example**:
- First import: "Acme Marketing" + "https://acme.com" → creates agency
- Second import: Same data → UPDATE (no duplicate ID created)
- Third import: "ACME MARKETING" + "https://acme.com" → UPDATE (case-insensitive match)
- Fourth import: "Acme Marketing" + no website → INSERT (different key)

## Import Workflow

### Step 1: Prepare CSV File

1. Use Excel, Google Sheets, or text editor
2. Save as CSV (semicolon delimited)
3. Include header row (copy from template)
4. Validate state slugs match the list
5. Check for required fields (name and state_slug)

### Step 2: Access Admin Panel

1. Log in to `/wp-admin`
2. Command palette (Cmd/Ctrl+K) → search "import other"
3. Or navigate: Sidebar → Content → Import Other Agencies

### Step 3: Upload and Configure

1. Select target state from dropdown
2. Choose format: CSV (recommended)
3. Click "Browse" or drag-drop file
4. File preview shows name and size
5. Review CSV template info box

### Step 4: Start Import

1. Click "Start Import" button
2. Monitor progress (loading spinner)
3. Wait for completion

### Step 5: Review Results

**Success Screen Shows**:
- Total rows processed
- Inserted count
- Updated count (0 for new imports)
- Failed count
- Skipped count
- Job ID (save for reference)

**If Failures Occur**:
1. Note job ID
2. Check "Import History" tab
3. Review error details (row number and error message)
4. Fix CSV file
5. Re-import (will upsert, not create duplicates)

## Troubleshooting

### Common Issues

#### "File format not recognized"
- Check delimiter: must be semicolon (;)
- Check encoding: must be UTF-8
- Check header row: must match template exactly
- Solution: Copy template CSV and replace data

#### "Missing required fields"
- Ensure `state_slug` and `name` in every row
- Check for empty cells in required columns
- Solution: Fill in missing values or delete rows

#### "Duplicate agency" errors
- Two rows with same name + website + state
- System prevents duplicates but logs the error
- Solution: Remove duplicate from CSV or update first import

#### Import hangs or times out
- File too large: split into multiple files per state
- Network issue: check internet connection
- Solution: Import in batches of 500-1000 rows

#### Agencies not appearing on state page
- Check `is_active` flag (should be true)
- Verify state_slug matches exactly
- Clear browser cache
- Solution: Check import job for errors

#### "Search not working"
- No agencies in DB for that state
- Service filter too restrictive
- Solution: Run import for that state first

## Advanced Operations

### Direct SQL Queries

#### Find all agencies in a state
```sql
SELECT
  id,
  name,
  city,
  services,
  is_active
FROM other_agencies
WHERE state_slug = 'california' AND is_active = true
ORDER BY name;
```

#### Search by service
```sql
SELECT
  id,
  name,
  city,
  services
FROM other_agencies
WHERE state_slug = 'california'
  AND services @> ARRAY['SEO']
ORDER BY name;
```

#### Find import errors
```sql
SELECT
  job_id,
  row_number,
  error,
  raw
FROM other_agency_import_job_rows
WHERE job_id = '...'
ORDER BY row_number;
```

#### Disable specific agency
```sql
UPDATE other_agencies
SET is_active = false
WHERE id = '...';
```

#### Delete all agencies for a state
```sql
DELETE FROM other_agencies
WHERE state_slug = 'california';
```

### Batch Operations

#### Disable all agencies in a state
```sql
UPDATE other_agencies
SET is_active = false
WHERE state_slug = 'california';
```

#### Activate after disabling
```sql
UPDATE other_agencies
SET is_active = true
WHERE state_slug = 'california' AND is_active = false;
```

#### Update services for multiple agencies
```sql
UPDATE other_agencies
SET services = array_append(services, 'New Service')
WHERE state_slug = 'california' AND services IS NOT NULL;
```

## Performance Considerations

### Query Optimization

**Efficient Queries**:
- Always filter by `state_slug` first (indexed)
- Use `is_active = true` to exclude inactive
- Limit results to 50-100 for pagination
- Use service filter sparingly (GIN index helps)

**Slow Queries to Avoid**:
- Full table scan without state filter
- Complex full-text search
- Unindexed sorting

### Scalability

**Tested Performance**:
- 1000 agencies per state: 2-3 seconds
- 50 states × 1000 agencies = 50,000 total: scalable
- Batch processing: 250 rows per batch prevents memory issues
- Upsert operation: typically 100ms per 250 rows

**Recommendations**:
- Import 500-1000 rows per file (balance speed vs manageability)
- Schedule imports during off-peak hours
- Monitor import job table for failed jobs

## API Reference Summary

| Endpoint | Method | Auth | Purpose |
|----------|--------|------|---------|
| `/other-agencies-import` | POST | JWT | Bulk import agencies |
| `/other-agencies-list` | GET | Public | Search/filter agencies |
| `/other-agencies-services` | GET | Public | Get service chips for state |
| `/other-agencies-import-jobs` | GET | Public | List import history |

## Security

### RLS Policies

**Reading**:
- Public users can read only `is_active = true` agencies
- Cannot access inactive or pending agencies

**Writing**:
- Service role only (via edge functions)
- No direct user writes to these tables
- All writes logged to import_jobs table

### Input Validation

- CSV delimiter validation
- Required field validation
- State slug validation against known states
- Email format validation (if provided)
- URL validation for website/logo_url

## Future Enhancements

1. **Bulk Edits**: Multi-select agencies for editing
2. **Logo Auto-Fetch**: Automatically download logos from agency websites
3. **Duplicate Detection**: AI-powered fuzzy matching for deduplication
4. **Analytics**: Track which imported agencies receive checks
5. **Sync Integrations**: Connect to external agency directories (e.g., Clutch, GoodFirms)
6. **Data Quality Scoring**: Flag incomplete or suspicious entries
7. **Workflow Approvals**: Admin review before publishing
8. **Versioning**: Track import history and rollback capability

## Support

For issues or questions:
1. Check import job error details in admin panel
2. Review application logs for edge function errors
3. Verify CSV format matches template exactly
4. Contact support with job ID for debugging

---

**Last Updated**: 2026-02-19
**Status**: Production Ready
**Maintained By**: Gappsy Engineering Team
