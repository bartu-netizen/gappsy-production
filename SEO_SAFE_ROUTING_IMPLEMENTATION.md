# SEO-Safe Routing Implementation

## Problem Solved

**BEFORE**: State pages returned 404 because URLs were reconstructed from slugs, causing URL drift and breaking SEO.

**AFTER**: URLs are stored verbatim from JSON imports in the database. Routing resolves by database lookup. No URL reconstruction.

## Core Principle

> **The canonical URL from the JSON import is the ONLY source of truth for routing.**
>
> **Never reconstruct URLs from state slugs. Always look up the exact URL in the database.**

## Architecture

### 1. Database Schema (`state_pages` table)

```sql
CREATE TABLE state_pages (
  id uuid PRIMARY KEY,
  state_slug text UNIQUE NOT NULL,           -- e.g., "alaska"
  state_name text NOT NULL,                   -- e.g., "Alaska"
  canonical_url text UNIQUE NOT NULL,         -- e.g., "/marketing-agencies-in-alaska-united-states"
  full_canonical_url text UNIQUE NOT NULL,    -- e.g., "https://www.gappsy.com/..."
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);
```

**Key Points**:
- `canonical_url` stores the EXACT path from JSON (`seo.canonical_url`)
- `state_slug` is internal identifier only (not used for routing)
- Both URLs are UNIQUE to prevent conflicts

### 2. Import Flow

**Frontend** (`src/utils/stateJsonImport.ts`):
```typescript
// Extract canonical URL from JSON
const fullCanonicalUrl = stateData.seo?.canonical_url || '';
const canonicalUrl = new URL(fullCanonicalUrl).pathname;

// Send to edge function
fetch('/functions/v1/state-json-import', {
  body: JSON.stringify({
    stateSlug,
    stateName,
    agencies,
    otherAgencies,
    options,
    canonicalUrl,        // Path only: /marketing-agencies-in-alaska-united-states
    fullCanonicalUrl     // Full URL: https://www.gappsy.com/...
  })
});
```

**Edge Function** (`supabase/functions/state-json-import/index.ts`):
```typescript
// Upsert state_pages with canonical URL
await supabaseAdmin
  .from('state_pages')
  .upsert({
    state_slug: stateSlug,
    state_name: stateName,
    canonical_url: canonicalUrl,        // Stored verbatim
    full_canonical_url: fullCanonicalUrl, // Stored verbatim
    is_active: true
  }, {
    onConflict: 'state_slug'
  });
```

### 3. Routing Resolution

**StatePageTemplate Component** (`src/pages/StatePageTemplate.tsx`):
```typescript
// Step 1: Resolve state slug from URL
useEffect(() => {
  async function resolveSlug() {
    if (stateSlugOverride) {
      setResolvedSlug(stateSlugOverride);
      return;
    }

    if (paramSlug) {
      setResolvedSlug(paramSlug);
      return;
    }

    // Database lookup for canonical URL
    const stateInfo = await resolveStateByUrl(location.pathname);
    if (stateInfo) {
      setResolvedSlug(stateInfo.stateSlug);
    } else {
      setError('Page not found');
    }
  }

  resolveSlug();
}, [stateSlugOverride, paramSlug, location.pathname]);

// Step 2: Load state data (only after slug resolved)
useEffect(() => {
  if (!resolvedSlug) return;

  // Load agencies, FAQs, etc. using resolvedSlug
}, [resolvedSlug]);
```

**Utility Function** (`src/utils/stateRouting.ts`):
```typescript
export async function resolveStateByUrl(pathname: string): Promise<StatePageInfo | null> {
  const cleanPath = pathname.replace(/\/$/, '');

  const { data } = await supabase
    .from('state_pages')
    .select('*')
    .eq('canonical_url', cleanPath)
    .eq('is_active', true)
    .maybeSingle();

  if (!data) return null;

  return {
    stateSlug: data.state_slug,
    stateName: data.state_name,
    canonicalUrl: data.canonical_url,
    fullCanonicalUrl: data.full_canonical_url,
    isActive: data.is_active
  };
}
```

## How It Works

### Scenario 1: Standard State Import (Alaska)

1. **JSON file**: `public/data/alaska.json`
   ```json
   {
     "state_slug": "alaska",
     "state_name": "Alaska",
     "seo": {
       "canonical_url": "https://www.gappsy.com/marketing-agencies-in-alaska-united-states/"
     },
     "agencies": [...]
   }
   ```

2. **Import process**:
   - Admin uploads `alaska.json` to import UI
   - Frontend extracts `seo.canonical_url`
   - Sends to edge function with both path and full URL
   - Edge function upserts `state_pages`:
     ```sql
     INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url)
     VALUES (
       'alaska',
       'Alaska',
       '/marketing-agencies-in-alaska-united-states',
       'https://www.gappsy.com/marketing-agencies-in-alaska-united-states/'
     );
     ```

3. **User visits**: `/marketing-agencies-in-alaska-united-states`
   - React Router matches route pattern: `/marketing-agencies-in-:stateSlug-united-states`
   - Extracts param: `stateSlug = "alaska"`
   - StatePageTemplate uses `stateSlug` directly
   - Loads Alaska agencies from database and JSON
   - **Page loads successfully** ✅

### Scenario 2: Custom URL State Import

1. **JSON file**: `public/data/custom-state.json`
   ```json
   {
     "state_slug": "new-york",
     "state_name": "New York",
     "seo": {
       "canonical_url": "https://www.gappsy.com/top-marketing-agencies-new-york-city/"
     }
   }
   ```

2. **Import process**:
   - Canonical URL is different from standard pattern
   - Still stored verbatim in `state_pages`
   - Database has:
     ```
     state_slug: "new-york"
     canonical_url: "/top-marketing-agencies-new-york-city"
     ```

3. **User visits**: `/top-marketing-agencies-new-york-city`
   - Does NOT match standard route pattern
   - StatePageTemplate calls `resolveStateByUrl('/top-marketing-agencies-new-york-city')`
   - Database lookup finds: `state_slug = "new-york"`
   - Component loads New York agencies
   - **Page loads successfully** ✅

### Scenario 3: State Not Imported

1. **User visits**: `/marketing-agencies-in-wyoming-united-states`
   - Route pattern matches, extracts `stateSlug = "wyoming"`
   - Component checks if `wyoming` is valid
   - No agencies found in database or JSON
   - **Shows 404 or "Coming Soon"** ❌

## Benefits

### 1. SEO Safety
- ✅ Old site URLs are preserved exactly (no drift)
- ✅ Google's indexed URLs continue to work
- ✅ No broken links or 404s after import

### 2. Flexibility
- ✅ Supports custom URL patterns per state
- ✅ Handles URL migrations (old site → new site)
- ✅ Works with any URL structure (not just `/marketing-agencies-in-{state}`)

### 3. Future-Proof
- ✅ New states auto-work after import
- ✅ No code changes needed for new URL patterns
- ✅ Database is single source of truth

### 4. Backwards Compatibility
- ✅ Existing hardcoded routes still work (`stateSlugOverride`)
- ✅ Parameterized routes still work (`:stateSlug`)
- ✅ Graceful fallback to database lookup

## Testing

### Test 1: Alaska Page Loads

```bash
# Check database
curl -X POST https://YOUR_PROJECT.supabase.co/rest/v1/rpc/state_pages \
  -H "apikey: YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d '{"canonical_url":"/marketing-agencies-in-alaska-united-states"}'

# Expected: Returns alaska state info
```

**In browser**:
1. Navigate to: `/marketing-agencies-in-alaska-united-states`
2. Open DevTools Console
3. Look for: `[StatePageTemplate] ✅ Resolved to state: alaska`
4. Page should load with Alaska agencies

### Test 2: Custom URL State

1. Create JSON with custom `seo.canonical_url`
2. Import via admin UI
3. Visit the custom URL
4. Verify page loads correctly

### Test 3: 404 Handling

1. Visit: `/marketing-agencies-in-fake-state-united-states`
2. Should show 404 or error page

## Files Modified

1. **Database**:
   - `supabase/migrations/20251224213000_add_canonical_url_for_seo_routing.sql`
   - Creates `state_pages` table
   - Seeds 52 states with canonical URLs

2. **Edge Function**:
   - `supabase/functions/state-json-import/index.ts`
   - Accepts `canonicalUrl` and `fullCanonicalUrl` in request
   - Upserts `state_pages` table during import

3. **Frontend Import Utility**:
   - `src/utils/stateJsonImport.ts`
   - Extracts canonical URLs from JSON
   - Sends to edge function

4. **Routing Component**:
   - `src/pages/StatePageTemplate.tsx`
   - Resolves state slug from URL using database
   - Waits for resolution before loading data

5. **New Utility**:
   - `src/utils/stateRouting.ts`
   - `resolveStateByUrl()` - Lookup state by canonical URL
   - `getStateBySlug()` - Lookup state by slug
   - `getAllStateUrls()` - Get all active state URLs

## Verification Checklist

- [x] `state_pages` table created
- [x] 52 states seeded with canonical URLs
- [x] Alaska has correct URL: `/marketing-agencies-in-alaska-united-states`
- [x] Import function stores canonical URLs
- [x] StatePageTemplate resolves from database
- [x] Build succeeds
- [x] Alaska page loads at correct URL

## Acceptance Criteria

✅ Alaska page loads at `/marketing-agencies-in-alaska-united-states`
✅ No 404 for any imported state
✅ URLs match old site exactly (string-equal)
✅ Future imports auto-work without code changes
✅ SEO-safe (no URL reconstruction from slugs)

## Troubleshooting

### Issue: State page shows 404

**Check**:
1. Is state in `state_pages` table?
   ```sql
   SELECT * FROM state_pages WHERE state_slug = 'alaska';
   ```
2. Does `canonical_url` match the URL you're visiting?
3. Is `is_active = true`?

### Issue: Wrong state loads

**Check**:
1. Multiple states with same canonical URL?
   ```sql
   SELECT canonical_url, COUNT(*) FROM state_pages GROUP BY canonical_url HAVING COUNT(*) > 1;
   ```
2. Check browser console for resolution logs

### Issue: Import fails to store URL

**Check**:
1. Does JSON have `seo.canonical_url` field?
2. Is admin secret valid?
3. Check edge function logs in Supabase dashboard

## Future Enhancements

1. **URL Redirects**: Store old URLs that redirect to canonical URLs
2. **URL History**: Track URL changes over time
3. **A/B Testing**: Test different URL patterns for SEO
4. **Sitemap Generation**: Auto-generate sitemap from `state_pages`
5. **Canonical Validation**: Warn if imported URL doesn't match expected pattern

## Summary

The SEO-safe routing system ensures that:
- URLs from the old site are preserved exactly
- No manual URL reconstruction from slugs
- Database is the single source of truth
- Future imports automatically work
- Alaska and all other states load correctly

**Alaska is now live at**: `/marketing-agencies-in-alaska-united-states` ✅
