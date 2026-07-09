# TECHNICAL IMPLEMENTATION DETAILS

Developer guide for understanding and maintaining the state page SEO system.

---

## 🏗️ ARCHITECTURE OVERVIEW

### The Problem We Solved

**Original Issue:** SPAs (Single Page Applications) serve a single `index.html` for all routes. This means:
- All pages have the same `<head>` tags
- Social scrapers can't see dynamic content (JavaScript runs after scraping)
- SEO bots see generic meta tags for all URLs

**Our Solution:** Static Site Generation (SSG) / Pre-rendering
- Generate a unique HTML file per state during build
- Inject state-specific meta tags into `<head>`
- Configure hosting to serve these files instead of `index.html`

---

## 📁 FILE STRUCTURE

```
project/
├── scripts/
│   ├── seo-generator.js           # Core SEO logic (shared)
│   ├── generate-og-images.js      # Creates SVG images
│   └── prerender.js               # Injects meta tags into HTML
├── public/
│   ├── data/
│   │   ├── alabama.json           # Optional state-specific SEO data
│   │   └── new-jersey.json
│   └── og/
│       └── *.svg                  # Generated OG images
├── dist/ (after build)
│   ├── index.html                 # Base SPA template
│   ├── marketing-agencies-in-alabama-united-states.html
│   ├── marketing-agencies-in-new-jersey-united-states.html
│   └── og/
│       └── *.svg                  # Copied OG images
├── src/
│   └── pages/
│       ├── AdminProductionHTMLFetcherPage.tsx
│       └── AdminSEOAuditPage.tsx
├── netlify.toml                   # CRITICAL: Routing configuration
└── public/_redirects              # Overridden by netlify.toml
```

---

## 🔧 CORE COMPONENTS

### 1. SEO Generator (`scripts/seo-generator.js`)

**Purpose:** Centralized logic for generating SEO data

**Key Functions:**

#### `getAllStatesFromDatabase()`
```javascript
// Fetches all active states from Supabase
// Returns: Array of { state_slug, state_name, content }
// Fallback: Reads JSON files if DB unavailable
```

**Data Flow:**
```
1. Query state_pages table (is_active = true)
2. Query state_content table (join by state_slug)
3. Merge results
4. Return array of states with content
```

#### `generateSEOData(stateSlug, stateName, stateData)`
```javascript
// Generates complete SEO object for one state
// Input: state slug, name, and combined data
// Output: { title, metaDescription, canonicalUrl, og*, twitter* }
```

**Priority Logic:**
```
1. Check stateData.seo.title → Use if exists
2. Else: Generate from template with state name + year
3. Repeat for each meta tag type
```

#### `truncateDescription(text, maxLength = 155)`
```javascript
// Intelligently truncates to 155 chars
// - Doesn't break mid-word
// - Adds "..." if truncated
// - Returns original if under limit
```

**Algorithm:**
```
1. Check if text.length <= maxLength → return as-is
2. Cut to maxLength
3. Find last space in truncated text
4. If space is within 20 chars of end → cut at space
5. Else → cut at maxLength
6. Append "..."
```

#### `generateSEOTags(seoData, stateName)`
```javascript
// Generates HTML string with all meta tags
// Input: SEO data object
// Output: HTML string ready to inject
```

**Output Format:**
```html
<!-- SEO Meta Tags - Pre-rendered for {State} -->
<title>...</title>
<meta name="description" content="..." />
<meta name="robots" content="index,follow" />
<link rel="canonical" href="..." />

<!-- Open Graph Meta Tags -->
<meta property="og:site_name" content="Gappsy" />
...

<!-- Twitter Card Meta Tags -->
<meta name="twitter:card" content="summary_large_image" />
...
```

### 2. OG Image Generator (`scripts/generate-og-images.js`)

**Purpose:** Create SVG social media images for each state

**Process:**
```
1. Fetch all states (DB or JSON)
2. For each state:
   a. Generate SVG markup with state name
   b. Save to public/og/{state-slug}.svg
3. Report success/failure counts
```

**SVG Template:**
```xml
<svg width="1200" height="630">
  <rect fill="#0A1735" />                    <!-- Dark blue background -->
  <rect fill="rgba(255,255,255,0.06)" />     <!-- Subtle border -->
  <text>Top 25 Marketing Agencies in</text>  <!-- White text -->
  <text fill="#4F46E5">{StateName}</text>    <!-- Purple state name -->
  <text>United States • {Year} Rankings</text>
  <text>By Gappsy.com</text>
</svg>
```

**Design Specs:**
- Size: 1200x630 (optimal for Facebook/Twitter/LinkedIn)
- Format: SVG (lightweight, scales perfectly, text is readable)
- Colors: Dark blue (#0A1735), Purple (#4F46E5), White (#F8FAFC)
- Fonts: Arial, Helvetica, sans-serif (universally supported)

### 3. Pre-renderer (`scripts/prerender.js`)

**Purpose:** Inject SEO tags into static HTML files

**Process:**
```
1. Check dist/index.html exists (Vite must build first)
2. Fetch all states (DB or JSON)
3. For each state:
   a. Load JSON file if exists (for seo object)
   b. Merge JSON + DB content
   c. Generate SEO data using seo-generator
   d. Inject tags into HTML <head>
   e. Write to dist/marketing-agencies-in-{state}-united-states.html
   f. Also write flat file version (routing compatibility)
4. Report success/failure counts
```

**HTML Injection:**
```javascript
// 1. Replace existing <title>
html = html.replace(/<title>.*?<\/title>/, `<title>${seoData.title}</title>`);

// 2. Replace existing <meta name="description">
html = html.replace(/<meta name="description"[^>]*>/, `<meta name="description" content="${seoData.metaDescription}" />`);

// 3. Inject full SEO tag block before </head>
const seoTagsBlock = generateSEOTags(seoData, stateName);
html = html.replace(/<\/head>/, `${seoTagsBlock}\n  </head>`);
```

**Why Two Output Files?**
```
1. Directory version: /marketing-agencies-in-alabama-united-states/index.html
   - Clean URLs (no .html extension visible)
   - SEO-friendly

2. Flat file version: /marketing-agencies-in-alabama-united-states.html
   - Direct file access
   - Routing fallback
   - Netlify redirect target
```

---

## 🌐 ROUTING CONFIGURATION

### Netlify Redirects (netlify.toml)

**CRITICAL SECTION:**
```toml
# MUST come BEFORE catch-all
[[redirects]]
from = "/marketing-agencies-in-*-united-states"
to = "/marketing-agencies-in-:splat-united-states.html"
status = 200

[[redirects]]
from = "/marketing-agencies-in-*-united-states/"
to = "/marketing-agencies-in-:splat-united-states.html"
status = 200

# SPA fallback (MUST be last)
[[redirects]]
from = "/*"
to = "/index.html"
status = 200
```

**How It Works:**
```
1. Request: /marketing-agencies-in-texas-united-states/
2. Netlify checks redirects top-to-bottom
3. Matches: /marketing-agencies-in-*-united-states/
4. Extracts: splat = "texas"
5. Serves: /marketing-agencies-in-texas-united-states.html
6. Browser receives: Pre-rendered HTML with SEO tags
```

**Common Mistake:**
```toml
# ❌ WRONG - Catch-all first
[[redirects]]
from = "/*"
to = "/index.html"
status = 200

[[redirects]]
from = "/marketing-agencies-in-*-united-states"
to = "/marketing-agencies-in-:splat-united-states.html"
status = 200
```
This will NEVER serve state pages because catch-all matches first.

### Status Code 200 vs 301/302

**Why `status = 200`?**
- 200 = "Rewrite" (internal redirect, URL stays same)
- 301/302 = "Redirect" (browser URL changes)

**For SEO:**
- 200 is correct (URL doesn't change in browser)
- Google sees the requested URL, not the .html file
- Canonical URLs match requested URLs

---

## 🧪 TESTING COMPONENTS

### AdminProductionHTMLFetcherPage

**Purpose:** Diagnose what production is actually serving

**Implementation:**
```javascript
// Fetch actual server HTML (NOT browser DOM)
const response = await fetch(url, {
  method: 'GET',
  headers: {
    'Accept': 'text/html',
    'User-Agent': 'Mozilla/5.0'  // Important: act like a bot
  },
  cache: 'no-store'  // Don't use cached version
});

const htmlText = await response.text();  // Raw HTML

// Parse and check
const hasOgTitle = /<meta\s+property=["']og:title["']/.test(htmlText);
```

**Why This Works:**
- Fetches from production URL (not localhost)
- Gets initial server response (before JavaScript runs)
- Regex checks for meta tag presence in raw HTML
- Proves what bots/scrapers see

### AdminSEOAuditPage

**Purpose:** Validate all states comprehensively

**Implementation:**
```javascript
async function auditState(state) {
  // 1. Fetch production HTML
  const response = await fetch(state.url);
  const html = await response.text();

  // 2. Extract meta tags
  const titleMatch = html.match(/<title[^>]*>(.*?)<\/title>/i);
  const ogImageMatch = html.match(/<meta\s+property=["']og:image["']\s+content=["']([^"']*)["']/i);

  // 3. Validate OG image is reachable
  if (ogImageMatch) {
    const imgResponse = await fetch(ogImageMatch[1], { method: 'HEAD' });
    checks.ogImageReachable = imgResponse.ok;
  }

  // 4. Check description length
  if (metaDesc.length > 160) {
    errors.push(`Meta description too long (${metaDesc.length} chars)`);
  }

  // 5. Return PASS/FAIL
  return allChecksPassed ? 'pass' : 'fail';
}
```

**Why Comprehensive?**
- Tests actual production URLs (real-world behavior)
- Checks all critical SEO elements
- Validates OG image accessibility (HTTP 200)
- Catches edge cases (description too long, canonical mismatch)
- Provides CSV export for tracking

---

## 🗃️ DATABASE SCHEMA

### Relevant Tables

#### `state_pages`
```sql
CREATE TABLE state_pages (
  state_slug TEXT PRIMARY KEY,
  state_name TEXT NOT NULL,
  is_active BOOLEAN DEFAULT true,
  canonical_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);
```

**Usage:**
- Lists all available states
- `is_active` controls which states to render
- `canonical_url` used for SEO tags

#### `state_content`
```sql
CREATE TABLE state_content (
  state_slug TEXT PRIMARY KEY REFERENCES state_pages(state_slug),
  hero_intro_short TEXT,
  state_intro_short TEXT,
  state_intro_full TEXT,
  state_description_full TEXT,
  updated_at TIMESTAMPTZ DEFAULT now()
);
```

**Usage:**
- Provides state-specific intro text
- Used for meta descriptions when JSON seo object missing
- Truncated to 155 chars automatically

### Data Priority

```
1. JSON file: public/data/{state}.json
   └─ seo: { title, meta_description, og_image, ... }

2. Database: state_content table
   └─ state_intro_short (truncated to 155 chars)

3. Fallback: Generated template
   └─ "Discover the top 25 marketing agencies in {State}..."
```

---

## 🚀 BUILD PIPELINE

### Build Command
```bash
npm run build
```

**Defined in package.json:**
```json
{
  "scripts": {
    "build": "node scripts/generate-og-images.js && vite build && node scripts/prerender.js"
  }
}
```

### Step-by-Step Execution

#### Step 1: Generate OG Images
```bash
node scripts/generate-og-images.js
```

**Actions:**
1. Fetch states from DB (or JSON)
2. Generate SVG for each state
3. Save to `public/og/*.svg`
4. Log success/failure counts

**Output:**
```
✅ Alabama              → /og/marketing-agencies-in-alabama-united-states.svg
✅ New Jersey           → /og/marketing-agencies-in-new-jersey-united-states.svg
```

#### Step 2: Vite Build
```bash
vite build
```

**Actions:**
1. Compile React app (TypeScript → JavaScript)
2. Bundle and minify CSS/JS
3. Copy `public/` to `dist/`
4. Generate `dist/index.html` (base template)

**Output:**
```
dist/
├── index.html
├── assets/
│   ├── index-[hash].js
│   └── index-[hash].css
├── og/
│   └── *.svg  (copied from public/)
└── data/
    └── *.json  (copied from public/)
```

#### Step 3: Pre-render
```bash
node scripts/prerender.js
```

**Actions:**
1. Read `dist/index.html` (base template)
2. Fetch all states
3. For each state:
   - Generate SEO data
   - Inject tags into `<head>`
   - Write HTML file
4. Log success/failure counts

**Output:**
```
dist/
├── marketing-agencies-in-alabama-united-states/
│   └── index.html
├── marketing-agencies-in-alabama-united-states.html
├── marketing-agencies-in-new-jersey-united-states/
│   └── index.html
└── marketing-agencies-in-new-jersey-united-states.html
```

### Environment Variables (Build Time)

**Required for DB access:**
```bash
VITE_SUPABASE_URL=https://xxx.supabase.co
VITE_SUPABASE_ANON_KEY=xxx
```

**Where to Set:**
- **Local:** `.env` file (already exists)
- **Netlify:** Build environment variables in dashboard
- **CI/CD:** GitHub secrets or equivalent

**Fallback Behavior:**
If env vars missing during build:
- Scripts will warn: "⚠️ Supabase credentials not found"
- Fall back to JSON files in `public/data/`
- Build will NOT fail
- States without JSON files will use generated fallbacks

---

## 🐛 DEBUGGING GUIDE

### Problem: Pre-rendered HTML has wrong tags

**Check:**
```bash
# 1. Verify HTML file exists
ls dist/marketing-agencies-in-alabama-united-states.html

# 2. Check tags in file
grep "og:title" dist/marketing-agencies-in-alabama-united-states.html

# 3. Check SEO data source
cat public/data/alabama.json | grep -A 10 "seo"
```

**Solutions:**
- If JSON has `seo` object → That data is used
- If no `seo` object → Check database `state_content`
- If no DB content → Fallback template is used

### Problem: Build fails during pre-render

**Check:**
```bash
# Run prerender separately with verbose output
node scripts/prerender.js
```

**Common Errors:**

#### "dist/index.html not found"
**Cause:** Vite build didn't run first
**Solution:** Run `npm run build:vite` first

#### "Database query error"
**Cause:** Env vars not set or Supabase down
**Solution:** Check `.env` file, test DB connection

#### "JSON parse error"
**Cause:** Malformed JSON in `public/data/*.json`
**Solution:** Validate JSON syntax, remove trailing commas

### Problem: Routing not working in production

**Check:**
```bash
# 1. Verify netlify.toml deployed
git log --oneline netlify.toml

# 2. Check Netlify build logs
# Look for: "Processing netlify.toml"

# 3. Test redirect locally
# (Netlify CLI required)
netlify dev
```

**Solutions:**
- Ensure netlify.toml is committed and pushed
- Check redirect order (state pages before catch-all)
- Trigger manual rebuild with cache clear

### Problem: OG images return 404

**Check:**
```bash
# 1. Verify images in dist
ls dist/og/*.svg

# 2. Check build logs
npm run build | grep "OG image"

# 3. Test URL format
# Correct: /og/marketing-agencies-in-alabama-united-states.svg
# Wrong: /og/alabama.svg
```

**Solutions:**
- Ensure `generate-og-images.js` runs during build
- Check `public/og/` has images (Vite copies them)
- Verify slug format matches exactly (lowercase, hyphens)

---

## 🔒 SECURITY CONSIDERATIONS

### 1. No Secrets in Generated HTML

**Safe:**
```javascript
// SEO data from public sources
const title = `Top 25 Marketing Agencies in ${stateName}`;
```

**Unsafe:**
```javascript
// ❌ Don't do this
const apiKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
// This would be in the HTML!
```

### 2. Sanitize User Input

**Implementation:**
```javascript
function escapeHtml(text) {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}
```

**Usage:**
```javascript
// Always escape before injecting
const seoTags = `<title>${escapeHtml(title)}</title>`;
```

**Why:**
- Prevents XSS attacks
- Protects against malicious JSON data
- Ensures HTML is valid

### 3. Validate State Slugs

**Check:**
```javascript
// Only allow lowercase letters, numbers, hyphens
const validSlug = /^[a-z0-9-]+$/.test(stateSlug);
if (!validSlug) {
  throw new Error('Invalid state slug');
}
```

**Why:**
- Prevents directory traversal
- Ensures file paths are safe
- Blocks injection attempts

---

## 📈 PERFORMANCE OPTIMIZATIONS

### 1. Build-Time Generation (Not Runtime)

**Current (Correct):**
```
Build → Generate all HTML files → Deploy static files
Request → Serve pre-generated HTML (instant)
```

**Alternative (Slower):**
```
Request → Generate HTML on-demand → Return
(Requires server, adds latency)
```

### 2. SVG vs PNG for OG Images

**Why SVG?**
- Much smaller file size (~1 KB vs 50-100 KB)
- Scales perfectly to any size
- Text is crisp at all resolutions
- Faster download for scrapers

**Trade-offs:**
- Some older scrapers may not support SVG
- No complex graphics (but we don't need them)

### 3. Caching Strategy

**Headers in netlify.toml:**
```toml
# State pages: 5 min cache, 1 day stale-while-revalidate
[[headers]]
for = "/marketing-agencies-in-*-united-states"
[headers.values]
Cache-Control = "public, max-age=300, stale-while-revalidate=86400"

# OG images: 7 day cache
[[headers]]
for = "/og/*.svg"
[headers.values]
Cache-Control = "public, max-age=604800"
```

**Benefits:**
- Fast page loads (5 min cache)
- Instant updates when needed (5 min expiry)
- Graceful degradation (stale-while-revalidate)
- Long-term image caching (rarely change)

---

## 🔄 ADDING A NEW STATE

### Step 1: Add to Database

```sql
-- 1. Add to state_pages
INSERT INTO state_pages (state_slug, state_name, is_active, canonical_url)
VALUES (
  'wyoming',
  'Wyoming',
  true,
  '/marketing-agencies-in-wyoming-united-states/'
);

-- 2. Optionally add content
INSERT INTO state_content (state_slug, state_intro_short)
VALUES (
  'wyoming',
  'Wyoming has over 500 marketing agencies serving businesses across the state.'
);
```

### Step 2: (Optional) Add JSON File

Create `public/data/wyoming.json`:
```json
{
  "state": "wyoming",
  "stateName": "Wyoming",
  "seo": {
    "title": "Top 25 Marketing Agencies in Wyoming (2025) | Gappsy",
    "meta_description": "Discover the top marketing agencies in Wyoming...",
    "og_title": "Top 25 Marketing Agencies in Wyoming",
    "og_description": "Expert rankings of Wyoming's best agencies...",
    "og_image": "https://gappsy.bolt.host/og/marketing-agencies-in-wyoming-united-states.svg"
  }
}
```

### Step 3: Build and Deploy

```bash
# Local test
npm run build

# Check output
ls dist/marketing-agencies-in-wyoming-united-states.html
ls dist/og/marketing-agencies-in-wyoming-united-states.svg

# Deploy
git add .
git commit -m "Add Wyoming state page"
git push
```

### Step 4: Verify

1. Use `/admin/production-test` → Test Wyoming URL
2. Check view-source for meta tags
3. Test OG image loads
4. Run `/admin/seo-audit` → Verify Wyoming passes

---

## 🎓 BEST PRACTICES

### 1. Always Test Locally Before Deploy

```bash
npm run build
# Check dist/ folder
# Verify meta tags in HTML files
# Test in local browser
```

### 2. Use Admin Tools for QA

- `/admin/production-test` → Quick smoke test
- `/admin/seo-debug` → Preview tags for any state
- `/admin/seo-audit` → Comprehensive validation

### 3. Keep Documentation Updated

When modifying the system:
- Update this technical doc
- Update user-facing docs
- Add comments to complex code
- Document breaking changes

### 4. Version Control

```bash
# Always commit these together
git add netlify.toml
git add scripts/
git add public/data/
git commit -m "SEO: [description of change]"
```

### 5. Monitor in Production

- Run SEO audit weekly
- Check Google Search Console monthly
- Test social scrapers after major changes
- Keep CSV exports for historical tracking

---

## 🔗 RELATED DOCUMENTATION

- **PRODUCTION_SEO_FIX_COMPLETE.md** - Comprehensive fix guide
- **QUICK_POST_DEPLOY_TEST.md** - 5-minute verification
- **SEO_OG_IMPLEMENTATION_COMPLETE.md** - Original implementation
- **package.json** - Build scripts
- **netlify.toml** - Routing configuration

---

## 📞 MAINTENANCE CONTACTS

**For questions about:**
- Build pipeline → Check `scripts/` and `package.json`
- Routing → Check `netlify.toml`
- Database schema → Check `supabase/migrations/`
- Admin tools → Check `src/pages/Admin*.tsx`

**Common issues:**
- Routing not working → netlify.toml redirect order
- Tags missing → prerender.js not running
- Images 404 → generate-og-images.js not running
- Build fails → Check env vars and dependencies

---

**This document is maintained alongside the codebase. Last updated: 2025-12-26**
