# Agency Reviews Bulk Import System

Complete guide for importing hundreds of agency reviews at once with automatic validation, uniqueness scoring, and publishing gating.

## Overview

The Agency Reviews Bulk Import system allows administrators to:
- Upload CSV or JSON files with agency review data
- Validate all rows with detailed error reporting
- Compute uniqueness scores to assess content quality
- Preview all data before importing
- Automatically enforce publishing requirements (thin content prevention)
- Track import results and download error reports

## File Format

### CSV Format

**Delimiter:** Semicolon (`;`)
**Array Separator:** Pipe (`|`)
**Encoding:** UTF-8

CSV files use semicolons as field delimiters and pipes to separate array values. This prevents conflicts with common punctuation in text content.

**Example pipe-separated array in CSV:**
```
SEO|PPC|Web Design|Social Media
```

### JSON Format

**Structure:** Array of objects
**Array Values:** Real arrays, not pipe-separated strings
**Encoding:** UTF-8

```json
[
  {
    "agency_name": "Lone Star Digital Solutions",
    "state_slug": "texas",
    "review_type": "positive",
    "services_offered": ["SEO", "PPC", "Web Design", "Social Media"],
    "about_description": "..."
  }
]
```

## Required Fields

These fields must be present in every row:

| Field | Type | Format | Example |
|-------|------|--------|---------|
| `agency_name` | string | Agency name | "Lone Star Digital Solutions" |
| `state_slug` | string | Lowercase state slug | "texas", "new-jersey", "district-of-columbia" |
| `about_description` | string | 400+ chars for publishing | "Comprehensive description..." |
| `services_offered` | array | Pipe-separated in CSV | "SEO\|PPC\|Web Design" |
| `review_type` | string | "positive" or "negative" | "positive" |

## Optional Fields

All other fields are optional and enhance the uniqueness score:

| Field | Type | Format | Notes |
|-------|------|--------|-------|
| `agency_slug` | string | Auto-generated if missing | Format: "agency-name-state" |
| `city` | string | City name | "Austin" |
| `website_url` | string | Full URL | "https://example.com" |
| `is_top_25_ranked` | boolean | true/false, 1/0, yes/no | Negative reviews force false |
| `target_clients` | array | Pipe-separated in CSV | "Local businesses\|Ecommerce" |
| `geographic_reach` | array | Pipe-separated in CSV | "Texas\|US" |
| `team_size_range` | string | Size description | "5-15", "20-50" |
| `evaluation_status` | string | Status label | "Top 25 Agency", "Recommended" |
| `strengths` | array | Pipe-separated in CSV (positive reviews) | "Clear reporting\|Fast execution" |
| `concerns` | array | Pipe-separated in CSV (negative reviews) | "Limited case studies\|High pricing" |
| `risk_factors` | array | Pipe-separated in CSV | "Scope creep\|Staff turnover" |
| `fit_for` | array | Pipe-separated in CSV | "Local SEO\|Paid Search" |
| `case_studies_status` | string | Presence indicator | "Has public case studies" |
| `pricing_transparency` | string | Pricing availability | "Pricing partially disclosed" |
| `team_information` | string | Team presence | "Team page exists" |
| `independent_recognition` | string | Third-party mentions | "Mentions in directories" |
| `local_presence` | string | Physical location | "Local office listed" |
| `entity_signals` | array | Pipe-separated in CSV | "Clutch profile\|Google Business" |

## Publishing Gating Rules

### Automatic Draft Enforcement

Even if you select the "Publish after import" option, rows that fail publishing requirements automatically import as **drafts** (not publicly visible).

### Minimum Content Requirements

A review must meet ALL of these criteria to be eligible for publishing:

1. **About Description:** ≥ 400 characters
2. **Services Offered:** ≥ 4 items
3. **Strengths or Concerns:** ≥ 4 items
   - For positive reviews: `strengths` field ≥ 4 items
   - For negative reviews: `concerns` field ≥ 4 items
4. **Fit For:** ≥ 3 items
5. **Uniqueness Score:** ≥ 60 out of 100

### Publishing Status After Import

- **Published:** Visible in sitemap, searchable, appears on state pages
- **Draft:** Hidden from sitemap and search, only visible in admin panel

## Uniqueness Score System

The uniqueness score (0-100) assesses content quality and completeness. Scores below 60 are automatically marked as drafts regardless of user intent.

### Scoring Breakdown

**Total possible points:** 100

#### A) About Description Length (Max 25 points)

Rewards comprehensive, original descriptions:

| Length | Points |
|--------|--------|
| ≥ 800 characters | 25 |
| 400-799 characters | 18 |
| 200-399 characters | 10 |
| < 200 characters | 0 |

#### B) Services Richness (Max 15 points)

More services = more specialized content:

| Services Count | Points |
|---|---|
| ≥ 6 items | 15 |
| 4-5 items | 12 |
| 2-3 items | 8 |
| 0-1 items | 0 |

#### C) Strengths/Concerns Richness (Max 20 points)

Highest weight because this is the review's core content:

| Count | Points |
|---|---|
| ≥ 6 items | 20 |
| 4-5 items | 16 |
| 2-3 items | 10 |
| 0-1 items | 0 |

**Note:** For positive reviews, this counts `strengths`. For negative reviews, this counts `concerns`.

#### D) Fit-For Richness (Max 10 points)

Best-fit industries/company types:

| Fit-For Count | Points |
|---|---|
| ≥ 4 items | 10 |
| 3 items | 8 |
| 2 items | 6 |
| 0-1 items | 0 |

#### E) Public Signals Completeness (Max 15 points)

Verifiable signals increase credibility:

Count how many of these fields are present and non-empty:
- `case_studies_status`
- `pricing_transparency`
- `team_information`
- `independent_recognition`
- `local_presence`

| Signal Count | Points |
|---|---|
| 5 signals | 15 |
| 4 signals | 13 |
| 3 signals | 10 |
| 1-2 signals | 6 |
| 0 signals | 0 |

#### F) Extra Uniqueness Signals (Max 15 points)

Additional data boosts score:

- If `city` is provided: +5 points
- If `target_clients` is provided (non-empty): +5 points
- If `entity_signals` has ≥ 2 items: +5 points

**Maximum from section F:** 15 points

### Score Labels

| Score Range | Label | Status |
|---|---|---|
| 80-100 | Strong (Low risk) | Ready to publish |
| 60-79 | OK | Ready to publish |
| 40-59 | Thin (Risky) | Auto-draft only |
| 0-39 | Very Thin (High risk) | Auto-draft only |

### Example Calculation

```
Agency: "Lone Star Digital Solutions"

About description: 850 characters → 25 points
Services: ["SEO", "PPC", "Web Design", "Social Media"] → 12 points (4 items)
Strengths: ["Clear reporting", "Fast execution", "Great audits", "Strong team", "Proactive communication"] → 20 points (5 items)
Fit-For: ["Local SEO", "Paid Search", "Small-mid brands", "Ecommerce"] → 10 points (4 items)
Public signals: case_studies_status, pricing_transparency, team_information → 10 points (3 signals)
Extra signals: city provided, target_clients provided → 10 points (2 bonuses)

Total: 25 + 12 + 20 + 10 + 10 + 10 = 87 → "Strong (Low risk)" label
```

## Upsert vs Skip Behavior

### Upsert Mode (Default: Enabled)

When **Upsert** is enabled:

- **If `agency_slug` does NOT exist:** Creates new review
- **If `agency_slug` DOES exist:** Updates existing review with new data
- All rows are processed

Use this when:
- Importing for the first time
- Updating existing agencies with new information
- Merging reviews from multiple sources

### Skip Existing Mode (Upsert Disabled)

When **Upsert** is disabled:

- **If `agency_slug` exists:** Skips the row (counts as "skipped")
- **If `agency_slug` does NOT exist:** Creates new review
- Avoids accidentally overwriting existing data

Use this when:
- Importing a list of new agencies only
- Preventing accidental updates to existing reviews
- You want a safety check before updating

## Import Workflow

### Step 1: Upload File

1. Navigate to Admin Dashboard → Agency Reviews → **Bulk Import** button
2. Choose CSV or JSON tab
3. Either:
   - Drag/drop a file onto the upload area, OR
   - Click to select a file, OR
   - Paste CSV/JSON content into textarea

### Step 2: Preview & Validate

1. Click **Preview & Validate** button
2. System parses file and shows:
   - **Total rows:** Count of all rows
   - **Strong:** Rows with score ≥80
   - **OK:** Rows with score 60-79
   - **Thin:** Rows with score 40-59 (will be auto-draft)
   - **Very Thin:** Rows with score <40 (will be auto-draft)
   - **Eligible to Publish:** Rows that meet all minimum requirements

3. Preview table shows first 25 rows with:
   - `agency_slug`: Unique identifier
   - `review_type`: "positive" or "negative"
   - `score`: 0-100 uniqueness score
   - `label`: "Strong", "OK", "Thin", or "Very Thin"
   - `publish_eligible`: "Yes" or "No" with reason
   - `errors`: Any validation errors (red if present)

4. If errors exist:
   - Red rows indicate critical validation failures
   - Download error report as CSV or JSON
   - Fix errors in source data
   - Re-upload to restart

### Step 3: Configure Import Options

1. **Upsert:** Toggle to enable/disable (default: enabled)
   - ON: Updates existing agencies
   - OFF: Skips existing agencies
2. **Publish:** Toggle to attempt publishing (default: disabled)
   - ON: Rows meeting all criteria will be published; others auto-draft
   - OFF: All rows import as draft

### Step 4: Enter Admin Token

1. Paste your admin import token into the "Admin Token" field
2. Token is required for security validation
3. Token is never saved or logged

### Step 5: Start Import

1. Click **Start Import** button (disabled until token entered)
2. System shows real-time progress with spinner
3. Batches process in groups of 100 rows
4. Avoid closing browser during import

### Step 6: Review Results

After import completes, results tab shows:

- **Inserted:** New agencies created
- **Updated:** Existing agencies updated (upsert mode)
- **Skipped:** Rows skipped due to conflicts (skip mode)
- **Failed:** Rows that failed during import

### Step 7: Check Errors

If any rows failed:

1. View detailed error list in results
2. Click **Download Error Report** to export as CSV/JSON
3. Errors show `agency_slug` and specific failure reason
4. Fix issues in source data and re-import

### Step 8: View Updated Agencies

1. Click **View Updated Agency Reviews** link
2. Filter by:
   - **Review Type:** All, Positive, or Negative
   - **Status:** All, Published, or Draft
   - **Uniqueness:** All, Strong, OK, Thin, Very Thin

## CSV Template

### Header Row

```
agency_name;agency_slug;state_slug;state_name;city;review_type;is_top_25_ranked;website_url;services_offered;target_clients;geographic_reach;team_size_range;evaluation_status;about_description;strengths;concerns;risk_factors;fit_for;case_studies_status;pricing_transparency;team_information;independent_recognition;local_presence;entity_signals
```

### Example Row (Positive Review)

```
Lone Star Digital Solutions;lone-star-digital-solutions-texas;texas;Texas;Austin;positive;true;https://lonestardigital.com;SEO|PPC|Web Design|Social Media|Email Marketing|Analytics;Local businesses|Ecommerce|Professional services;Texas|US|North America;5-15;Top 25 Agency;"Lone Star Digital Solutions is a full-service digital marketing agency based in Austin, Texas with over 10 years of proven results. They specialize in helping small and mid-sized businesses scale their online presence through integrated SEO, paid advertising, and web design services. Known for transparent reporting and hands-on account management. Their team works closely with clients to understand business goals and delivers customized strategies that drive measurable ROI. Strong track record in the Texas market with expertise across multiple industries including local services, ecommerce, and B2B.";Clear reporting|Fast execution|Proactive communication|Strong team|Transparent pricing|Great case studies;None;Occasional scope creep risk;Local SEO|Paid Search|Web Design|Social Media|Small-mid brands;Published case studies on website|Pricing available on request|Team page with credentials;Listed on Clutch|Google Business Verified;Austin office with local team;Clutch Top Agency|Google Business Profile
```

### Example Row (Negative Review)

```
Tech Buzz Agency;tech-buzz-agency-california;california;California;San Francisco;negative;false;https://techbuzz.io;SEO|PPC;Tech startups;California;2-5;Under Evaluation;"Tech Buzz Agency is a small digital marketing firm focused on tech startups in the San Francisco Bay Area. Limited public information available about their services, team, or track record. Website lacks detailed case studies or client testimonials. Pricing structure not clearly communicated on their site. Little independent recognition or third-party verification. Difficult to assess their actual experience and results based on available public information.";None;"Limited case studies|Unclear pricing|Minimal team info|Few reviews|Hard to reach";Limited team stability|Lack of case study documentation|Unverified claims;Tech startups|Early-stage companies;No public case studies;Pricing not disclosed;Team information limited;No independent listings;No physical office mentioned;Minimal online presence
```

## JSON Template

### Full Example

```json
[
  {
    "agency_name": "Lone Star Digital Solutions",
    "agency_slug": "lone-star-digital-solutions-texas",
    "state_slug": "texas",
    "state_name": "Texas",
    "city": "Austin",
    "review_type": "positive",
    "is_top_25_ranked": true,
    "website_url": "https://lonestardigital.com",
    "services_offered": ["SEO", "PPC", "Web Design", "Social Media", "Email Marketing", "Analytics"],
    "target_clients": ["Local businesses", "Ecommerce", "Professional services"],
    "geographic_reach": ["Texas", "US", "North America"],
    "team_size_range": "5-15",
    "evaluation_status": "Top 25 Agency",
    "about_description": "Lone Star Digital Solutions is a full-service digital marketing agency based in Austin, Texas with over 10 years of proven results. They specialize in helping small and mid-sized businesses scale their online presence through integrated SEO, paid advertising, and web design services. Known for transparent reporting and hands-on account management. Their team works closely with clients to understand business goals and delivers customized strategies that drive measurable ROI. Strong track record in the Texas market with expertise across multiple industries including local services, ecommerce, and B2B.",
    "strengths": ["Clear reporting", "Fast execution", "Proactive communication", "Strong team", "Transparent pricing", "Great case studies"],
    "concerns": [],
    "risk_factors": ["Occasional scope creep risk"],
    "fit_for": ["Local SEO", "Paid Search", "Web Design", "Social Media", "Small-mid brands"],
    "case_studies_status": "Published case studies on website",
    "pricing_transparency": "Pricing available on request",
    "team_information": "Team page with credentials",
    "independent_recognition": "Listed on Clutch",
    "local_presence": "Austin office with local team",
    "entity_signals": ["Clutch Top Agency", "Google Business Profile"]
  },
  {
    "agency_name": "Tech Buzz Agency",
    "agency_slug": "tech-buzz-agency-california",
    "state_slug": "california",
    "state_name": "California",
    "city": "San Francisco",
    "review_type": "negative",
    "is_top_25_ranked": false,
    "website_url": "https://techbuzz.io",
    "services_offered": ["SEO", "PPC"],
    "target_clients": ["Tech startups"],
    "geographic_reach": ["California"],
    "team_size_range": "2-5",
    "evaluation_status": "Under Evaluation",
    "about_description": "Tech Buzz Agency is a small digital marketing firm focused on tech startups in the San Francisco Bay Area. Limited public information available about their services, team, or track record. Website lacks detailed case studies or client testimonials. Pricing structure not clearly communicated on their site. Little independent recognition or third-party verification. Difficult to assess their actual experience and results based on available public information.",
    "strengths": [],
    "concerns": ["Limited case studies", "Unclear pricing", "Minimal team info", "Few reviews", "Hard to reach"],
    "risk_factors": ["Limited team stability", "Lack of case study documentation", "Unverified claims"],
    "fit_for": ["Tech startups", "Early-stage companies"],
    "case_studies_status": "No public case studies",
    "pricing_transparency": "Pricing not disclosed",
    "team_information": "Team information limited",
    "independent_recognition": "No independent listings",
    "local_presence": "No physical office mentioned",
    "entity_signals": ["Minimal online presence"]
  }
]
```

## Supported States

All 52 US states and territories are supported:

**States:** Alabama, Alaska, Arizona, Arkansas, California, Colorado, Connecticut, Delaware, Florida, Georgia, Hawaii, Idaho, Illinois, Indiana, Iowa, Kansas, Kentucky, Louisiana, Maine, Maryland, Massachusetts, Michigan, Minnesota, Mississippi, Missouri, Montana, Nebraska, Nevada, New Hampshire, New Jersey, New Mexico, New York, North Carolina, North Dakota, Ohio, Oklahoma, Oregon, Pennsylvania, Rhode Island, South Carolina, South Dakota, Tennessee, Texas, Utah, Vermont, Virginia, Washington, West Virginia, Wisconsin, Wyoming

**Territories:** District of Columbia, Puerto Rico

Use lowercase slugs with hyphens:
- ✅ `texas`, `new-jersey`, `district-of-columbia`
- ❌ `Texas`, `New Jersey`, `DC`

## Security

### Admin Token

All imports require an admin import token for security:

1. Token is provided by system administrator
2. Token validates that requester is authorized admin
3. Never share token publicly
4. Never commit token to version control

### Service Role Access

The import endpoint uses Supabase service role credentials (server-side):

- Service role bypasses RLS policies
- Never expose service role key to client
- Import processing happens on secure server
- Client never touches sensitive database credentials

### Token Validation

Each import request includes `x-admin-token` header:

```
POST /functions/v1/agency-reviews-import
x-admin-token: [token-here]
```

Server validates token before processing any rows.

## Troubleshooting

### Error: "Invalid state slug"

**Cause:** State slug not recognized
**Solution:** Check state slug against supported states list. Use lowercase with hyphens (e.g., `new-jersey`, not `New Jersey`)

### Error: "Duplicate agency_slug in import"

**Cause:** Same `agency_slug` appears twice in file
**Solution:** Each agency must have unique slug. If intentionally updating same agency, remove duplicate row and use upsert mode

### Error: "Agency name is required"

**Cause:** `agency_name` field empty or missing
**Solution:** Populate `agency_name` for all rows

### Error: "About description is required"

**Cause:** `about_description` field empty or missing
**Solution:** Provide description for all rows (minimum 1 character, but 400+ required for publishing)

### Row Shows "Draft Only" But I Selected Publish

**Cause:** Row fails publishing requirements
**Solution:** This is intentional—thin content is auto-drafted. Either:
- Accept as draft for now, or
- Add more content (longer description, more items in strengths/concerns/fit_for)

### Import Stalls or Times Out

**Cause:** Browser connection lost or server timeout on large import
**Solution:**
- Smaller batches recommended (1000-5000 rows max per import)
- Split large files into multiple imports
- Ensure stable internet connection
- Check server logs for errors

### Cannot See Updated Agencies

**Cause:** Refresh needed, or agencies imported as draft
**Solution:**
- Refresh admin page (F5 or browser reload)
- Check "Draft" filter to see unpublished reviews
- Verify import completed successfully (check results tab)

### Admin Token Invalid

**Cause:** Incorrect or expired token
**Solution:**
- Copy token exactly as provided (including any special characters)
- Request new token if unsure
- Verify token hasn't been revoked

## Best Practices

### Before Importing

1. **Validate locally first:** Test with small sample (5-10 rows) before large import
2. **Backup data:** Upsert mode updates existing agencies—verify you want changes
3. **Review format:** Ensure all required fields populated
4. **Check state slugs:** Verify all state slugs are in supported states list
5. **Test parsing:** Use preview feature before committing

### During Import

1. **Don't close browser:** Keep page open during import
2. **Monitor progress:** Watch batch progress indicator
3. **Review results:** Check stats after completion
4. **Download errors:** Save error report if any failures occur

### After Import

1. **Verify published:** Check sitemap and state pages for new agencies
2. **Review drafts:** Check admin filter for auto-drafted rows
3. **Monitor traffic:** Watch for crawl activity on new pages
4. **Adjust if needed:** Update drafts with more content to publish later

## Technical Details

### Database Schema

- **Table:** `agency_reviews`
- **Key fields:** `agency_slug` (unique), `is_published`, `uniqueness_score`, `review_type`
- **Indexes:** `(is_published, created_at DESC)` for published list queries
- **RLS:** Public SELECT on published reviews only; service role full access

### API Endpoint

- **URL:** `{SUPABASE_URL}/functions/v1/agency-reviews-import`
- **Method:** POST
- **Auth:** x-admin-token header required
- **Payload:** JSON with rows array and import options
- **Batch size:** 100 rows per batch
- **Timeout:** 60 seconds per batch

### Response Format

```json
{
  "ok": true,
  "total": 150,
  "inserted": 120,
  "updated": 25,
  "skipped": 5,
  "failed": 0,
  "errors": []
}
```

On failure:

```json
{
  "ok": false,
  "message": "Admin token invalid",
  "errors": [{"row": 5, "agency_slug": "test-agency-texas", "reason": "..."}]
}
```

## Support

For issues or questions:

1. Check troubleshooting section above
2. Review error report downloaded from import results
3. Verify data format against templates in this document
4. Contact system administrator with:
   - Import file sample (first 5 rows)
   - Error report (if available)
   - Screenshots of validation tab showing issue
