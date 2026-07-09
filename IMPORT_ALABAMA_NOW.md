# Import Alabama NOW - Quick Guide

## Current Status

**Tables Created**: ✅
- `state_content` - Ready (0 rows currently)
- `state_faqs` - Ready (0 rows currently)

**Edge Function Updated**: ✅
- Imports state content (hero, intro, lastUpdated)
- Imports state FAQs (questions, answers, position)
- Stores full agency descriptions correctly

**Frontend Updated**: ✅
- Fetches state content from DB
- Fetches FAQs from DB
- No more hardcoded NJ fallbacks

**Build Status**: ✅
- Project built successfully
- All changes compiled

## Next Action: Import Alabama

### Step 1: Access Admin Import

```
URL: https://your-site.com/admin/bulk-state-import
```

Or locally:
```
URL: http://localhost:5173/admin/bulk-state-import
```

### Step 2: Upload Alabama JSON

1. Click "Choose File"
2. Select file: `/public/data/alabama.json`
3. ✅ Check "Override Existing Data"
4. Enter admin secret (from Supabase Edge Functions Secrets)
5. Click "Import State"

### Step 3: Monitor Console

Watch for success logs:
```
✅ Upserted state_pages for alabama
✅ Upserted state_content for alabama
✅ Inserted 5 FAQs for alabama
✅ Created 25 top25_slots for alabama
```

### Step 4: Verify With SQL

Run verification queries from `STATE_CONTENT_VERIFICATION_QUERIES.sql`:

```sql
-- Quick check: Alabama content exists
SELECT * FROM state_content WHERE state_slug = 'alabama';

-- Quick check: Alabama FAQs exist
SELECT COUNT(*) FROM state_faqs WHERE state_slug = 'alabama';

-- Quick check: First FAQ is Alabama-specific
SELECT question FROM state_faqs
WHERE state_slug = 'alabama' AND position = 1;
```

**Expected First FAQ**:
```
"Which Services do Marketing Agencies in Alabama Offer?"
```

**NOT**:
```
"Which Services do Marketing Agencies in New Jersey Offer?"  ❌
```

### Step 5: Test Alabama Page

Navigate to: `/marketing-agencies-in-alabama-united-states/`

**Visual Checks**:
1. ✅ Hero section shows: "Discover Alabama's leading marketing agencies..."
2. ✅ FAQs section shows Alabama-specific questions
3. ✅ Agency cards show full descriptions (not truncated)
4. ✅ "Read more" expansion shows complete text

**Console Checks** (F12 → Console):
```
[DatabaseRoutedPage] ✅ Route resolved to state: alabama
dbStateContent: 'loaded'
dbFaqsCount: 5
faqsSource: 'database'
```

## Alaska Next

### Create Alaska JSON

If Alaska JSON doesn't exist yet, create `/public/data/alaska.json`:

```json
{
  "state": "alaska",
  "stateName": "Alaska",
  "lastUpdated": "2025-12-24",
  "hero_intro": "Discover Alaska's leading marketing agencies...",
  "hero_intro_short": "Alaska's top marketing agencies...",
  "state_intro_short": "Our comprehensive ranking of Alaska's top agencies...",
  "state_intro_full": "Alaska's marketing landscape...",
  "seo": {
    "canonical_url": "https://www.gappsy.com/marketing-agencies-in-alaska-united-states/"
  },
  "agencies": [
    {
      "rank": 1,
      "name": "Vazagency",
      "website": "https://vazagency.com",
      "description": "Short desc...",
      "fullDescription": "FULL description...",
      "services": ["SEO", "Digital Marketing"],
      "city": "Anchorage"
    }
  ],
  "faqs": [
    {
      "question": "Which Services do Marketing Agencies in Alaska Offer?",
      "answer": "Marketing agencies in Alaska offer..."
    }
  ]
}
```

**Key Points**:
- Change all mentions of "Alabama" to "Alaska"
- Update `canonical_url` to include "alaska"
- Provide Alaska-specific FAQs
- Include full agency descriptions

### Import Alaska

Same process as Alabama:
1. Go to Admin Import
2. Upload `alaska.json`
3. Check "Override Existing"
4. Import
5. Verify with SQL
6. Test page

## Troubleshooting

### Issue: FAQs Still Show NJ Content

**Cause**: Old data in DB, new import failed

**Fix**:
1. Check console for errors during import
2. Manually delete old FAQs:
   ```sql
   DELETE FROM state_faqs WHERE state_slug = 'alabama';
   ```
3. Re-import Alabama

### Issue: Hero Intro Still Blank

**Cause**: state_content not imported

**Fix**:
1. Check if row exists:
   ```sql
   SELECT * FROM state_content WHERE state_slug = 'alabama';
   ```
2. If no row, re-import Alabama with "Override Existing" checked

### Issue: Agency Descriptions Truncated

**Cause**: JSON has only `description`, not `fullDescription`

**Fix**:
1. Update JSON to include `fullDescription` field
2. Re-import state

## Success Criteria

After importing Alabama, ALL of these must be TRUE:

- ✅ `state_content` table has Alabama row
- ✅ `state_faqs` table has 5 Alabama rows
- ✅ First FAQ mentions "Alabama" (not "New Jersey")
- ✅ Alabama page hero shows Alabama intro (not blank, not NJ)
- ✅ Alabama page FAQs show Alabama questions (not NJ)
- ✅ Agency cards show full descriptions (150+ chars)

## Summary

**Current**: Tables created, code updated, ready to import

**Next**: Import Alabama through Admin UI

**Verification**: Run SQL queries, test state page

**Result**: Alabama (and all future states) will show correct content automatically

---

## IMPORT ALABAMA NOW ✅

The system is ready. All you need to do is upload the JSON file through the admin interface.
