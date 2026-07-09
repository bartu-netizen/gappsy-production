# SEO Routing Quick Test Guide

## Verify Alaska Works

### 1. Check Database

```sql
SELECT state_slug, state_name, canonical_url, is_active
FROM state_pages
WHERE state_slug = 'alaska';
```

**Expected**:
```
state_slug: alaska
state_name: Alaska
canonical_url: /marketing-agencies-in-alaska-united-states
is_active: true
```

### 2. Test in Browser

1. Start dev server or deploy to production
2. Navigate to: `/marketing-agencies-in-alaska-united-states`
3. Open DevTools Console (F12)
4. Look for these logs:
   ```
   [StatePageTemplate] Resolving state from URL: /marketing-agencies-in-alaska-united-states
   [stateRouting] Resolving state by URL: /marketing-agencies-in-alaska-united-states
   [StatePageTemplate] ✅ Resolved to state: alaska
   ```
5. Page should display "Top 25 Marketing Agencies in Alaska"

### 3. Test All States

Run this SQL to get all state URLs:
```sql
SELECT canonical_url FROM state_pages WHERE is_active = true ORDER BY state_name;
```

Visit a few randomly:
- `/marketing-agencies-in-california-united-states`
- `/marketing-agencies-in-new-york-united-states`
- `/marketing-agencies-in-texas-united-states`

All should load without 404.

## Import a New State

### 1. Create JSON

File: `public/data/wyoming.json`
```json
{
  "state": "wyoming",
  "state_slug": "wyoming",
  "state_name": "Wyoming",
  "seo": {
    "title": "Top 25 Marketing Agencies in Wyoming | 2025",
    "meta_description": "Discover Wyoming's best marketing agencies.",
    "canonical_url": "https://www.gappsy.com/marketing-agencies-in-wyoming-united-states/",
    "og_title": "Top 25 Marketing Agencies in Wyoming",
    "og_description": "Discover Wyoming's best marketing agencies.",
    "focus_keyword": "marketing agencies in Wyoming"
  },
  "agencies": [
    {
      "rank": 1,
      "name": "Vazagency",
      "website": "https://vazagency.com",
      "description": "Leading digital marketing agency",
      "services": ["SEO", "Social Media", "Web Development"],
      "city": "Cheyenne"
    }
  ]
}
```

### 2. Import via UI

1. Log in to WP Admin: `/wp-admin`
2. Click "Import Top-25 Agencies (JSON)"
3. Enter admin secret
4. Upload `wyoming.json`
5. Check "Import to Database"
6. Click "Import All"

### 3. Verify Import

**Check Console Logs**:
```
[state-json-import] ✅ Upserted state_pages for wyoming: /marketing-agencies-in-wyoming-united-states
```

**Check Database**:
```sql
SELECT * FROM state_pages WHERE state_slug = 'wyoming';
```

**Visit Page**:
Navigate to: `/marketing-agencies-in-wyoming-united-states`

Should load successfully with Vazagency at rank #1.

## Test Custom URL

### 1. Create JSON with Custom URL

File: `public/data/custom-test.json`
```json
{
  "state": "colorado",
  "state_slug": "colorado",
  "state_name": "Colorado",
  "seo": {
    "canonical_url": "https://www.gappsy.com/denver-colorado-top-agencies/"
  },
  "agencies": [...]
}
```

### 2. Import

Follow same import steps as above.

### 3. Test Both URLs

**Standard URL** (should 404 or redirect):
`/marketing-agencies-in-colorado-united-states`

**Custom URL** (should work):
`/denver-colorado-top-agencies`

## Troubleshooting

### Alaska shows 404

**Check these in order**:

1. **Database entry exists**:
   ```sql
   SELECT * FROM state_pages WHERE state_slug = 'alaska';
   ```
   If missing, run migration or import Alaska JSON.

2. **URL matches exactly**:
   ```sql
   SELECT canonical_url FROM state_pages WHERE state_slug = 'alaska';
   ```
   Should be: `/marketing-agencies-in-alaska-united-states` (no trailing slash)

3. **State is active**:
   ```sql
   SELECT is_active FROM state_pages WHERE state_slug = 'alaska';
   ```
   Should be: `true`

4. **React route exists**:
   Check `src/App.tsx` has:
   ```typescript
   <Route path="/marketing-agencies-in-:stateSlug-united-states" element={<StatePageTemplate />} />
   ```

5. **Component resolves correctly**:
   Open DevTools, navigate to Alaska page, check console for resolution logs.

### Import doesn't store URL

**Check these**:

1. **JSON has canonical_url**:
   ```json
   "seo": {
     "canonical_url": "https://www.gappsy.com/..."
   }
   ```

2. **Admin secret is valid**:
   Generate new secret in `/wp-admin/settings` if needed.

3. **Edge function deployed**:
   Check Supabase dashboard → Edge Functions → `state-json-import`

4. **Check edge function logs**:
   Look for: `✅ Upserted state_pages for {state}`

## Success Criteria

✅ Alaska loads at `/marketing-agencies-in-alaska-united-states`
✅ Database has correct canonical URLs for all states
✅ New imports automatically store canonical URLs
✅ Custom URLs work (if tested)
✅ No 404s for imported states
✅ Console logs show successful resolution

## Quick SQL Checks

### Count states in database
```sql
SELECT COUNT(*) FROM state_pages WHERE is_active = true;
```
Expected: 52 states

### Find states without canonical URLs
```sql
SELECT state_slug FROM state_pages WHERE canonical_url IS NULL OR canonical_url = '';
```
Expected: 0 rows

### Find duplicate canonical URLs
```sql
SELECT canonical_url, COUNT(*)
FROM state_pages
GROUP BY canonical_url
HAVING COUNT(*) > 1;
```
Expected: 0 rows

## Need Help?

See full documentation: `SEO_SAFE_ROUTING_IMPLEMENTATION.md`
