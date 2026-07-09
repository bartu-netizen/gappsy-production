# Automatic Prerender Implementation - Bolt-Proof SEO

## Problem Statement

**Issue:** Bolt keeps resetting `netlify.toml` build command to `"npx vite build"`, which bypasses our custom build scripts (`npm run build`). This means:
- `scripts/prerender.js` doesn't run
- `scripts/seo-generator.js` doesn't execute
- State pages only have runtime SEO (requires JavaScript)
- Googlebot/curl sees raw HTML without proper SEO metadata
- Social scrapers (Facebook, Twitter, LinkedIn) can't read OG tags

**Impact:**
- Poor search engine indexing
- Broken social media previews
- SEO metadata only works for users with JavaScript enabled

## Solution

Implement **automatic prerendering as a Vite plugin** that runs after every build, regardless of the build command used.

### Architecture

```
npx vite build
    ↓
[Vite compiles React app]
    ↓
[dist/index.html created]
    ↓
[Vite plugin: closeBundle hook]
    ↓
[Automatically runs: node scripts/prerender.js]
    ↓
[52 static HTML files generated with SEO metadata]
    ↓
✅ Build complete
```

## Implementation Details

### 1. Vite Plugin (vite.config.ts)

Added `prerenderPlugin()` that hooks into Vite's build lifecycle:

```typescript
function prerenderPlugin() {
  return {
    name: 'vite-plugin-prerender',
    apply: 'build' as const,
    closeBundle() {
      console.log('\n🔄 Running automatic prerender...\n');
      try {
        execSync('node scripts/prerender.js', {
          stdio: 'inherit',
          cwd: process.cwd()
        });
        console.log('✅ Prerender completed successfully\n');
      } catch (error) {
        console.error('❌ Prerender failed:', error);
        // Don't fail the build - runtime SEO still works as fallback
      }
    }
  };
}

export default defineConfig({
  plugins: [react(), prerenderPlugin()],
  // ... rest of config
});
```

**Key Features:**
- Runs automatically after Vite build completes
- Uses `closeBundle()` hook (runs after all files are written)
- Doesn't fail the build if prerender fails (runtime SEO is fallback)
- Works with ANY build command (`npm run build`, `npx vite build`, etc.)

### 2. Prerender Script (scripts/prerender.js)

Already exists and generates:
- **Folder-based routes:** `dist/marketing-agencies-in-{slug}-united-states/index.html`
- **Flat HTML files:** `dist/marketing-agencies-in-{slug}-united-states.html`

**Features:**
- Injects SEO metadata into `<head>`
- Uses `scripts/seo-generator.js` for consistent metadata
- Fetches states from database or JSON fallback
- Generates 52 state pages

### 3. SEO Generator (scripts/seo-generator.js)

Generates consistent SEO metadata:

```javascript
export function generateSEOData(stateSlug, stateName, stateData = {}) {
  const title = `Top 25 Marketing Agencies in ${stateName} (${CURRENT_YEAR}) | Gappsy`;
  const metaDescription = `Browse the top marketing agencies in ${stateName}. Compare services, locations, and reviews. Updated for ${CURRENT_YEAR}.`;
  const canonicalUrl = `${DOMAIN}/marketing-agencies-in-${stateSlug}-united-states/`;
  const ogImage = `${DOMAIN}/og/marketing-agencies-in-${stateSlug}-united-states.svg`;

  return {
    title,
    metaDescription,
    canonicalUrl,
    ogTitle: title,
    ogDescription: metaDescription,
    ogImage,
    ogImageWidth: '1200',
    ogImageHeight: '630',
    ogImageType: 'image/svg+xml',
    ogImageFallback: `${DOMAIN}/og/default-1200x630.jpg`,
    twitterTitle: title,
    twitterDescription: metaDescription,
    twitterImage: ogImage
  };
}
```

**Metadata Injected:**
- `<title>` with year and brand
- `<meta name="description">` with year
- `<meta name="seo-proof" content="state:{slug}:{year}">` for verification
- `<link rel="canonical">` with trailing slash
- Open Graph tags (og:title, og:description, og:image, og:url)
- OG image metadata (width, height, type)
- Twitter Card tags

### 4. Verification Script (scripts/verify-prerendered-html.sh)

Comprehensive verification script that checks:
1. **Title** includes `(YEAR) | Gappsy`
2. **Description** includes `"Updated for YEAR"`
3. **SEO Proof Tag** format: `state:{slug}:{year}`
4. **Canonical URL** has trailing slash
5. **OG Image** has width/height/type metadata

**Usage:**
```bash
./scripts/verify-prerendered-html.sh
```

**Output:**
```
✓ vermont: ALL CHECKS PASSED
✓ new-jersey: ALL CHECKS PASSED
✓ alaska: ALL CHECKS PASSED
✓ north-dakota: ALL CHECKS PASSED
✓ wyoming: ALL CHECKS PASSED

Summary:
Passed: 5
Failed: 0

✓ All prerendered HTML files have correct SEO metadata!
Ready for deployment.
```

## Generated Files

### Directory Structure

```
dist/
├── index.html                                              # React SPA shell
├── assets/                                                  # JS/CSS bundles
├── marketing-agencies-in-vermont-united-states/
│   └── index.html                                          # ✅ Prerendered SEO
├── marketing-agencies-in-vermont-united-states.html       # ✅ Flat file
├── marketing-agencies-in-new-jersey-united-states/
│   └── index.html                                          # ✅ Prerendered SEO
├── marketing-agencies-in-new-jersey-united-states.html    # ✅ Flat file
└── ... (52 states total)
```

### File Count
- **52 folder-based routes** with `index.html`
- **52 flat HTML files**
- **Total: 104 prerendered HTML files**

## How It Works

### 1. Build Command (Any of these work)

```bash
# Option 1: Full npm script (includes OG images + build ID)
npm run build

# Option 2: Direct Vite build (still runs prerender automatically)
npx vite build

# Option 3: Netlify default (if Bolt resets config)
npx vite build  # ← Still works! 🎉
```

### 2. Request Flow

#### For Folder-Based Route
```
GET /marketing-agencies-in-vermont-united-states/
    ↓
[Netlify checks for static file]
    ↓
[Finds: dist/marketing-agencies-in-vermont-united-states/index.html]
    ↓
[Returns prerendered HTML with SEO metadata]
    ↓
✅ Googlebot sees correct metadata
```

#### For Flat Route
```
GET /marketing-agencies-in-vermont-united-states.html
    ↓
[Netlify checks for static file]
    ↓
[Finds: dist/marketing-agencies-in-vermont-united-states.html]
    ↓
[Returns prerendered HTML with SEO metadata]
    ↓
✅ Direct link works
```

#### For Non-Existent Route
```
GET /some-other-page
    ↓
[Netlify checks for static file]
    ↓
[Not found]
    ↓
[Fallback: /* /index.html 200 from _redirects]
    ↓
[React Router handles routing with runtime SEO]
    ↓
✅ SPA still works
```

### 3. SEO Metadata in Raw HTML

**What Googlebot/Social Scrapers See:**

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- SEO Meta Tags - Pre-rendered -->
    <meta name="seo-proof" content="state:vermont:2026" />
    <title>Top 25 Marketing Agencies in Vermont (2026) | Gappsy</title>
    <meta name="description" content="Browse the top marketing agencies in Vermont. Compare services, locations, and reviews. Updated for 2026." />
    <meta name="robots" content="index,follow" />
    <link rel="canonical" href="https://www.gappsy.com/marketing-agencies-in-vermont-united-states/" />

    <!-- Open Graph Meta Tags -->
    <meta property="og:site_name" content="Gappsy" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Top 25 Marketing Agencies in Vermont (2026) | Gappsy" />
    <meta property="og:description" content="Browse the top marketing agencies in Vermont. Compare services, locations, and reviews. Updated for 2026." />
    <meta property="og:url" content="https://www.gappsy.com/marketing-agencies-in-vermont-united-states/" />
    <meta property="og:image" content="https://www.gappsy.com/og/marketing-agencies-in-vermont-united-states.svg" />
    <meta property="og:image:width" content="1200" />
    <meta property="og:image:height" content="630" />
    <meta property="og:image:type" content="image/svg+xml" />

    <!-- Twitter Card Meta Tags -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:site" content="@Gappsy" />
    <meta name="twitter:title" content="Top 25 Marketing Agencies in Vermont (2026) | Gappsy" />
    <meta name="twitter:description" content="Browse the top marketing agencies in Vermont. Compare services, locations, and reviews. Updated for 2026." />
    <meta name="twitter:image" content="https://www.gappsy.com/og/marketing-agencies-in-vermont-united-states.svg" />
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/assets/index-xxx.js"></script>
  </body>
</html>
```

## Testing

### Local Testing

```bash
# 1. Clean build
rm -rf dist

# 2. Build with automatic prerender
npx vite build

# 3. Verify HTML files exist
ls -l dist/marketing-agencies-in-vermont-united-states/index.html

# 4. Run verification script
./scripts/verify-prerendered-html.sh

# 5. Check raw HTML content (simulating Googlebot)
grep -o '<title>[^<]*</title>' dist/marketing-agencies-in-vermont-united-states/index.html
```

### Production Testing (After Deploy)

```bash
# Test with Googlebot user-agent
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-vermont-united-states/" | grep -i "<title>" | head -n 1

# Expected output:
# <title>Top 25 Marketing Agencies in Vermont (2026) | Gappsy</title>

# Verify description
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-vermont-united-states/" | grep -i 'name="description"' | head -n 1

# Expected output:
# <meta name="description" content="Browse the top marketing agencies in Vermont. Compare services, locations, and reviews. Updated for 2026." />

# Verify SEO proof tag
curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-vermont-united-states/" | grep -i "seo-proof" | head -n 1

# Expected output:
# <meta name="seo-proof" content="state:vermont:2026" />

# Test multiple states
for state in vermont wyoming alaska north-dakota new-jersey; do
  echo "== $state ==";
  curl -A "Googlebot" -sL "https://www.gappsy.com/marketing-agencies-in-$state-united-states/" | grep -o '<title>[^<]*</title>' | head -n 1;
done
```

## Benefits

### ✅ Bolt-Proof
- Works even if Bolt resets `netlify.toml` to `"npx vite build"`
- No manual build command configuration required
- Automatic prerender is part of Vite build process

### ✅ SEO Optimized
- Googlebot sees complete metadata in raw HTML
- No JavaScript execution required
- Proper Open Graph tags for social media
- Canonical URLs with trailing slashes
- All metadata includes current year

### ✅ Performance
- Static HTML served directly (no React rendering needed for bots)
- Faster first contentful paint for crawlers
- Reduced server load (static files vs. SPA)

### ✅ Reliability
- 52 states prerendered automatically
- Folder-based + flat file routes (both work)
- Runtime SEO as fallback if prerender fails
- SPA routing still works for non-state pages

### ✅ Developer Experience
- Single source of truth: `scripts/seo-generator.js`
- Verification script confirms SEO metadata
- Automatic execution (no manual steps)
- Clear error messages if prerender fails

## Troubleshooting

### Prerender Doesn't Run

**Symptom:** Build completes but no state HTML files in `dist/`

**Diagnosis:**
```bash
# Check if Vite plugin is registered
grep -A5 "prerenderPlugin" vite.config.ts

# Run prerender manually
node scripts/prerender.js
```

**Fix:** Ensure `vite.config.ts` has `prerenderPlugin()` in plugins array

### HTML Files Missing SEO Tags

**Symptom:** HTML files exist but don't have proper SEO metadata

**Diagnosis:**
```bash
# Run verification script
./scripts/verify-prerendered-html.sh

# Check raw HTML
cat dist/marketing-agencies-in-vermont-united-states/index.html | grep -i "<title>"
```

**Fix:**
- Check `scripts/seo-generator.js` is generating correct metadata
- Verify `scripts/prerender.js` is injecting tags properly

### Prerender Script Fails

**Symptom:** Build succeeds but prerender logs errors

**Diagnosis:**
```bash
# Check database connection
node -e "console.log(process.env.VITE_SUPABASE_URL)"

# Test manual prerender
npm run prerender
```

**Fix:**
- Ensure `.env` has correct Supabase credentials
- Check database has active states in `state_pages` table
- Fallback to JSON files in `public/data/` if database unavailable

## Deployment Checklist

- [ ] Run `npx vite build` locally
- [ ] Verify 52 state folders in `dist/`
- [ ] Run `./scripts/verify-prerendered-html.sh` (all pass)
- [ ] Check raw HTML has SEO metadata
- [ ] Deploy to Netlify
- [ ] Test production with curl/Googlebot UA
- [ ] Verify social media preview (Facebook/Twitter/LinkedIn)
- [ ] Submit updated sitemap to Google Search Console

## Maintenance

### Annual Year Update

The year updates automatically based on `new Date().getFullYear()` in:
- `scripts/seo-generator.js` (build-time)
- `src/utils/seoHelper.ts` (runtime)

**No manual updates required!** Just rebuild once per year:

```bash
npm run build  # Regenerates all HTML with new year
```

### Adding New States

1. Add state to database: `state_pages` table
2. Create JSON file: `public/data/{state-slug}.json`
3. Generate OG image: `npm run generate-og`
4. Rebuild: `npx vite build`
5. Verify: `./scripts/verify-prerendered-html.sh`

## Summary

✅ **Automatic prerender integrated into Vite build**
✅ **Works with `npx vite build` (Bolt-proof)**
✅ **52 static HTML files with complete SEO metadata**
✅ **Googlebot sees correct titles/descriptions in raw HTML**
✅ **Social scrapers see OG tags without JavaScript**
✅ **Verification script confirms SEO quality**
✅ **Runtime SEO still works as fallback**

**Ready for production deployment.**

---

**Implementation Date:** 2026-01-27
**Files Modified:** `vite.config.ts`, `scripts/verify-prerendered-html.sh`
**Files Utilized:** `scripts/prerender.js`, `scripts/seo-generator.js`
