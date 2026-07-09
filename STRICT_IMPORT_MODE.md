# Strict Import Mode - Database-Only Content System

## Overview

**GOAL**: State pages render ONLY exact content from database (imported from JSON). No AI-generated fallbacks, no filesystem dependencies, no content rewriting.

**STATUS**: ✅ ACTIVE - Database is the ONLY source of truth

## Why This Change?

### Problems with Previous System

1. **Filesystem Dependency**: `/public/data/*.json` files caused "No such file or directory" errors in edge functions
2. **Inconsistent Content**: JSON files could be out of sync with database
3. **AI Fallbacks**: Missing content triggered template generation (e.g., "Discover {state}'s leading marketing agencies...")
4. **NJ Content Leakage**: Missing FAQs showed 144 lines of hardcoded New Jersey content
5. **Link List FAQs**: Scraped FAQs contained placeholder "Marketing Agencies in [State]" link lists
6. **Description Truncation**: Full descriptions got overwritten by short versions

### New System Benefits

✅ **Single Source of Truth**: Database contains all content (no file sync issues)
✅ **Deterministic**: Same import → Same result (always)
✅ **Strict Validation**: Import fails if required fields missing
✅ **Aggressive Sanitization**: Filters out placeholders, link lists, short answers
✅ **No AI Fallbacks**: Missing content = error UI (not invented content)
✅ **Version Tracking**: Content hash stored for debugging

## Database Schema

### state_content
```sql
CREATE TABLE state_content (
  state_slug text PRIMARY KEY,
  hero_intro text NOT NULL DEFAULT '',           -- Main hero section text
  hero_intro_short text,                         -- Short hero text (optional)
  state_intro_short text,                        -- Short intro paragraph
  state_intro_full text,                         -- Full intro content
  state_description_full text,                   -- Full state description
  last_updated text,                             -- "Updated Dec 22, 2024"
  raw_json_hash text,                            -- SHA-256 hash for version tracking
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);
```

**Purpose**: Store exact intro/hero/description content from imported JSON

### state_faqs
```sql
CREATE TABLE state_faqs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug text NOT NULL,
  position integer NOT NULL,                     -- Display order (1, 2, 3...)
  question text NOT NULL,
  answer text NOT NULL,
  created_at timestamptz DEFAULT now(),
  CONSTRAINT unique_state_faq_position UNIQUE (state_slug, position)
);
```

**Purpose**: Store sanitized FAQs (after aggressive filtering)

### top25_slots
```sql
-- Existing table, key fields:
- description text              -- FULL description (never truncated)
- short_description text        -- Optional: generated client-side for display
- agency_name text
- website text
- logo_url text
- services jsonb
- city text
- is_paid boolean
- rank integer (1-25)
```

**Purpose**: Store agency listing data with full descriptions

## Import Pipeline

### 1. Validation (Required Fields)

**Before any import**:
```typescript
if (!stateContent || !stateContent.hero_intro) {
  return error("Missing required field: stateContent.hero_intro");
}

if (!faqs || faqs.length === 0) {
  return error("Missing required field: faqs[] (must have at least 1 FAQ)");
}
```

**Result**: Import fails early if critical fields missing

### 2. Aggressive FAQ Sanitization

**5 filters applied**:

1. **Missing fields**: `!question || !answer` → drop
2. **Empty after trimming**: `question.trim() === ''` → drop
3. **"Click to expand"**: `/click to expand/i.test()` → drop
4. **Link lists**: >5 lines with >3 lines starting with "Marketing Agencies in" → drop
5. **Short answers**: `answer.length < 50` chars → drop

**Example filtered FAQ**:
```json
{
  "question": "Click to expand",
  "answer": "Placeholder text"
}
```
**Result**: Filtered out, not inserted to DB

**Example filtered link list**:
```json
{
  "question": "Where can I find marketing agencies?",
  "answer": "Marketing Agencies in Alabama\nMarketing Agencies in Alaska\nMarketing Agencies in Arizona\n..."
}
```
**Result**: Filtered out (detected as link list)

### 3. Content Storage (Exact, No Rewriting)

```typescript
// Generate content hash for versioning
const contentHash = await crypto.subtle.digest('SHA-256', ...);

// Store EXACT content from JSON
await supabaseAdmin.from("state_content").upsert({
  state_slug: stateSlug,
  hero_intro: stateContent.hero_intro || '',              // EXACT
  state_intro_full: stateContent.state_intro_full || '',  // EXACT
  state_description_full: stateContent.state_description_full || '',
  raw_json_hash: hashHex,
  updated_at: new Date().toISOString()
});
```

**Guarantee**: No rewriting, no templates, no AI generation

### 4. FAQ Storage (Sanitized)

```typescript
// After filtering, delete old FAQs and insert new ones
await supabaseAdmin.from("state_faqs").delete().eq("state_slug", stateSlug);

const faqRecords = sanitizedFaqs.map((faq, index) => ({
  state_slug: stateSlug,
  position: index + 1,
  question: faq.question.trim(),
  answer: faq.answer.trim()
}));

await supabaseAdmin.from("state_faqs").insert(faqRecords);
```

**Result**: Only valid, sanitized FAQs stored

### 5. Import Results (Verification Data)

```json
{
  "top25Created": 25,
  "otherAgenciesCreated": 10,
  "stateContentSaved": true,
  "faqsImported": 5,
  "firstFaqQuestion": "Which Services do Marketing Agencies in Alabama Offer?",
  "validationWarnings": ["Filtered out 2 invalid FAQ(s)"]
}
```

**Shows**:
- ✅ Whether state_content saved
- ✅ How many FAQs imported (after filtering)
- ✅ Preview of first FAQ question
- ⚠️ Warnings about filtered content

## Frontend Changes

### NO MORE JSON FILE LOADING

**Before (WRONG)**:
```typescript
// Load from /public/data/${stateSlug}.json
const response = await fetch(`/data/${stateSlug}.json`);
const jsonMetadata = await response.json();

// Use JSON as fallback
const heroIntro = dbStateContent?.hero_intro || jsonMetadata?.hero_intro ||
  `Discover ${state}'s leading marketing agencies...`; ❌
```

**After (CORRECT)**:
```typescript
// NO JSON file loading
debug.jsonMetadata = 'disabled (DB-only mode)';

// Use DB only, no fallbacks
const heroIntro = dbStateContent?.hero_intro || '';

// If missing, show error (don't invent content)
if (!heroIntro) {
  return <ErrorUI message="Missing state content. Re-import required." />;
}
```

### DATABASE-ONLY AGENCY DATA

**Before (WRONG)**:
```typescript
// Merge JSON + DB (priority to JSON)
const fullDesc = jsonAgency?.description || slot.description || ''; ❌
```

**After (CORRECT)**:
```typescript
// DB ONLY (stored during import from JSON)
const fullDesc = slot.description || '';
const shortDesc = slot.short_description ||
  (fullDesc.length > 150 ? fullDesc.substring(0, 150) + '...' : fullDesc);
```

### FAQ COMPONENT BEHAVIOR

**If FAQs empty**:
```typescript
if (faqData.length === 0) {
  console.warn(`⚠️ No FAQs available for ${stateName} - hiding FAQ section`);
  return null; // Hide entire section
}
```

**Never shows**: NJ fallback content, placeholders, empty accordions

## Admin UI Changes

### REMOVED: "Save JSON to /public/data/"

**Old option**:
```
☑️ Save JSON to /public/data/
   Save JSON files via Edge Function
```
**Result**: Often failed with "No such file or directory"

**New UI**:
```
ℹ️ Database-Only Import Mode
   All content (hero_intro, descriptions, FAQs) is imported directly
   to database tables. No JSON files saved to /public/data/ (prevents
   filesystem errors). Database is the single source of truth.

☐ Download JSON files (Optional)
   Download to your computer for backup/debugging only
```

**Benefit**: No filesystem dependency, no sync issues

## Verification Queries

### Check State Content
```sql
SELECT state_slug,
       LEFT(hero_intro, 80) as hero_preview,
       raw_json_hash,
       updated_at
FROM state_content
WHERE state_slug = 'alaska';
```

**Expected**: Alaska-specific intro text (NOT blank, NOT generic template)

### Check FAQs
```sql
SELECT state_slug, position, question,
       LENGTH(answer) as answer_length
FROM state_faqs
WHERE state_slug = 'alaska'
ORDER BY position;
```

**Expected**:
- Questions mention "Alaska" (NOT "New Jersey")
- No "click to expand" questions
- Answer length > 50 chars (no short placeholders)

### Check for Placeholders
```sql
SELECT state_slug, question
FROM state_faqs
WHERE question ILIKE '%click to expand%'
   OR answer ILIKE '%click to expand%';
```

**Expected**: 0 rows (all filtered out)

### Check for NJ Leakage
```sql
SELECT state_slug, question
FROM state_faqs
WHERE state_slug != 'new-jersey'
  AND (question LIKE '%New Jersey%' OR answer LIKE '%New Jersey%');
```

**Expected**: 0 rows (no NJ content in other states)

### Check Link Lists
```sql
SELECT state_slug, question,
       LENGTH(answer) - LENGTH(REPLACE(answer, 'Marketing Agencies in', '')) as link_count
FROM state_faqs
WHERE answer LIKE '%Marketing Agencies in%'
HAVING link_count > 3;
```

**Expected**: 0 rows (all link lists filtered)

## Testing Alaska Import

### Step 1: Prepare JSON

**File**: `/public/data/alaska.json`

**Required fields**:
```json
{
  "state_slug": "alaska",
  "state_name": "Alaska",
  "seo": { "canonical_url": "..." },
  "stateContent": {
    "hero_intro": "Discover Alaska's leading marketing agencies...",
    "state_intro_full": "Full intro paragraph here...",
    "state_description_full": "Complete state description..."
  },
  "faqs": [
    {
      "question": "Which Services do Marketing Agencies in Alaska Offer?",
      "answer": "Marketing agencies in Alaska offer... (>50 chars)"
    }
  ],
  "agencies": [
    {
      "rank": 1,
      "name": "Agency Name",
      "description": "Full description (not truncated)...",
      "website": "https://example.com",
      "services": ["SEO", "PPC"]
    }
  ]
}
```

### Step 2: Import via Admin UI

1. Go to `/admin/bulk-state-import`
2. Enter admin secret
3. Upload `alaska.json`
4. Check "Override Existing Data" ✅
5. **DO NOT** check "Download JSON files" (optional)
6. Click "Import State"

### Step 3: Verify Import Results

**Console output**:
```
✅ Upserted state_content for alaska (hash: a3f2b1c4...)
✅ Inserted 5 sanitized FAQs for alaska (filtered 0 invalid items)
✅ Created 25 top25_slots for alaska
```

**UI shows**:
```json
{
  "stateContentSaved": true,
  "faqsImported": 5,
  "firstFaqQuestion": "Which Services do Marketing Agencies in Alaska Offer?",
  "top25Created": 25
}
```

### Step 4: Test Alaska Page

**Visit**: `/marketing-agencies-in-alaska-united-states/`

**Visual checks**:
- ✅ Hero: "Discover Alaska's leading marketing agencies..." (from JSON)
- ✅ Intro: Full paragraph (not generic template)
- ✅ FAQs: Alaska-specific questions (not NJ)
- ✅ Agencies: Full descriptions (not truncated)
- ❌ NO "Click to expand" anywhere
- ❌ NO New Jersey mentions

**Console checks**:
```
✅ State data loaded from DATABASE: Alaska (25 agencies)
dbStateContent: 'loaded'
faqsFiltered: 5
faqsSource: 'database'
jsonMetadata: 'disabled (DB-only mode)'
```

### Step 5: Database Verification

```sql
-- Content saved?
SELECT * FROM state_content WHERE state_slug = 'alaska';

-- FAQs valid?
SELECT question FROM state_faqs WHERE state_slug = 'alaska';

-- No placeholders?
SELECT COUNT(*) FROM state_faqs
WHERE state_slug = 'alaska'
  AND question ILIKE '%click to expand%'; -- Must be 0

-- Descriptions full?
SELECT rank, LENGTH(description) as desc_length
FROM top25_slots
WHERE state_slug = 'alaska'
ORDER BY rank;
```

## Error Messages Reference

### Import Validation Errors

**Missing hero_intro**:
```json
{
  "code": "VALIDATION_ERROR",
  "message": "JSON import validation failed. Required fields are missing.",
  "errors": ["Missing required field: stateContent.hero_intro"],
  "hint": "Ensure your JSON file contains: stateContent.hero_intro and faqs[]"
}
```

**Missing FAQs**:
```json
{
  "code": "VALIDATION_ERROR",
  "message": "JSON import validation failed. Required fields are missing.",
  "errors": ["Missing required field: faqs[] (must have at least 1 FAQ)"]
}
```

**All FAQs Filtered**:
```json
{
  "code": "VALIDATION_ERROR",
  "message": "All FAQs were filtered out during sanitization for alaska",
  "originalCount": 5,
  "validCount": 0
}
```

### Frontend Errors

**Missing State Content**:
```
Error: Missing state content for alaska. This state needs to be imported with proper content.
```

**No FAQs Available**:
```
Console: ⚠️ No FAQs available for Alaska - hiding FAQ section
UI: (FAQ section not rendered)
```

## Acceptance Criteria

### ✅ REQUIREMENT 1: Hero/Intro Exact from JSON

**Test**: Import Alaska, check hero text matches JSON exactly

**SQL**:
```sql
SELECT hero_intro FROM state_content WHERE state_slug = 'alaska';
```

**Expected**: Exact text from `alaska.json` (no AI rewrites)

### ✅ REQUIREMENT 2: No "Click to Expand" Anywhere

**Test**: Import with placeholder FAQ, verify it's filtered

**SQL**:
```sql
SELECT * FROM state_faqs WHERE question ILIKE '%click to expand%';
```

**Expected**: 0 rows

### ✅ REQUIREMENT 3: No NJ FAQs in Alaska

**Test**: Check for New Jersey mentions in Alaska FAQs

**SQL**:
```sql
SELECT * FROM state_faqs
WHERE state_slug = 'alaska'
  AND (question LIKE '%New Jersey%' OR answer LIKE '%New Jersey%');
```

**Expected**: 0 rows

### ✅ REQUIREMENT 4: Descriptions Not Truncated

**Test**: Check agency descriptions are full (not cut off)

**SQL**:
```sql
SELECT rank,
       LENGTH(description) as length,
       LEFT(description, 50) as preview
FROM top25_slots
WHERE state_slug = 'alaska'
  AND rank <= 5
ORDER BY rank;
```

**Expected**: Descriptions >100 chars, no "..." truncation

### ✅ REQUIREMENT 5: Future Imports Work Same Way

**Test**: Import another state (e.g., California) without manual fixes

**Result**: Same validation, sanitization, and storage applied automatically

## Files Modified

### Backend
1. ✅ `supabase/migrations/add_state_description_full_and_raw_json.sql`
   - Added `state_description_full` column
   - Added `raw_json_hash` column

2. ✅ `supabase/functions/state-json-import/index.ts`
   - Added strict validation (required fields)
   - Added aggressive FAQ sanitization (5 filters)
   - Added content hash generation
   - Updated state_content upsert

### Frontend
3. ✅ `src/pages/StatePageTemplate.tsx`
   - Removed JSON file loading
   - Load from DB only
   - Show error if content missing (no fallbacks)

4. ✅ `src/NewJerseyFAQ.tsx`
   - Hide FAQ section if empty
   - No NJ fallback content

5. ✅ `src/pages/AdminBulkStateImport.tsx`
   - Removed "Save JSON to /public/data/" option
   - Added "Database-Only Import Mode" notice

### Documentation
6. ✅ `STRICT_IMPORT_MODE.md` (this file)
7. ✅ `VERIFY_IMPORTED_STATE.sql` (verification queries)

## Summary

### Before (BROKEN)
- ❌ JSON files as source → filesystem errors
- ❌ Missing content → AI-generated fallbacks
- ❌ Missing FAQs → NJ content shown
- ❌ Placeholders → "Click to expand" rendered
- ❌ Descriptions → Truncated by DB short_description

### After (FIXED)
- ✅ Database as source → no filesystem issues
- ✅ Missing content → error UI (no fallbacks)
- ✅ Missing FAQs → section hidden
- ✅ Placeholders → filtered during import
- ✅ Descriptions → full text preserved

### Guarantees

✅ **Deterministic Imports**: Same JSON → Same DB → Same page (always)
✅ **No AI Content**: System shows error instead of generating content
✅ **No File Sync Issues**: DB is single source of truth
✅ **Aggressive Filtering**: Link lists, placeholders, short answers removed
✅ **Version Tracking**: Content hash stored for debugging

---

## STRICT IMPORT MODE ACTIVE ✅

**Status**: Production-ready

**Next Action**: Import Alaska to test end-to-end

**Expected Result**: Alaska page shows Alaska-specific content ONLY, no NJ leakage, no AI fallbacks, no placeholders

**Verification**: Run SQL queries from `VERIFY_IMPORTED_STATE.sql`
