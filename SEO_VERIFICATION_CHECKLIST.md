# SEO Verification Checklist - Bolt Hosting

## Pre-Deployment Checklist

Before deploying, verify these items in your local environment:

### ✅ 1. SEO Debug Overlay Test

- [ ] Navigate to: `http://localhost:5173/marketing-agencies-in-alabama-united-states?seoDebug=1`
- [ ] Verify overlay appears (bottom-right corner)
- [ ] Check title shows: "Top 25 Marketing Agencies in Alabama | 2025 Rankings"
- [ ] Check description shows: "Discover Alabama's best..."
- [ ] Check canonical shows: "https://www.gappsy.com/marketing-agencies-in-alabama-united-states/"
- [ ] Check og:title shows: "Top 25 Marketing Agencies in Alabama"
- [ ] Check NO mentions of "New Jersey" in any field

### ✅ 2. SPA Navigation Test

- [ ] Start on Alabama page with `?seoDebug=1`
- [ ] Click link to New Jersey state
- [ ] Verify overlay updates to show "New Jersey" in all fields
- [ ] NO page reload occurs
- [ ] Click browser back button
- [ ] Verify overlay updates back to "Alabama"

### ✅ 3. DevTools Elements Test

- [ ] Navigate to Alabama page (without `?seoDebug=1`)
- [ ] Press F12 → Elements tab
- [ ] Expand `<head>` element
- [ ] Press Ctrl+F, search for "Alabama"
- [ ] Verify found in: `<title>`, `<meta name="description">`, `<meta property="og:title">`, `<meta name="twitter:title">`
- [ ] Press Ctrl+F, search for "New Jersey"
- [ ] Verify 0 results in `<head>` section

### ✅ 4. JSON-LD Schema Test

- [ ] In DevTools Elements, search for: `<script type="application/ld+json"`
- [ ] Should find 3+ schema scripts
- [ ] Click to expand first one
- [ ] Verify contains: `"@type": "WebPage"`, `"name": "Top 25 Marketing Agencies in Alabama"`
- [ ] Verify second schema contains: `"@type": "ItemList"`, `"name": "Top 25 Marketing Agencies in Alabama"`

### ✅ 5. Fallback Chain Test

**Test 1: OG tags fall back to base tags**
- [ ] Check New Jersey JSON has `og_title` set
- [ ] Check Alabama JSON does NOT have `og_title`
- [ ] Navigate to Alabama with `?seoDebug=1`
- [ ] Verify og:title shows same value as page title (fallback working)

**Test 2: Twitter tags fall back to OG tags**
- [ ] Check Alabama JSON does NOT have `twitter_title`
- [ ] Navigate to Alabama with `?seoDebug=1`
- [ ] Verify twitter:title matches og:title (fallback working)

---

## Post-Deployment Checklist

After deploying to production, verify these items:

### ✅ 1. Production SEO Debug Test

- [ ] Navigate to: `https://www.gappsy.com/marketing-agencies-in-alabama-united-states?seoDebug=1`
- [ ] Verify overlay appears
- [ ] Verify all fields show Alabama data
- [ ] Navigate to New Jersey
- [ ] Verify overlay updates to New Jersey data

### ✅ 2. Production DevTools Test

- [ ] Navigate to: `https://www.gappsy.com/marketing-agencies-in-alabama-united-states`
- [ ] Open DevTools → Elements
- [ ] Verify `<head>` contains Alabama-specific tags
- [ ] Search for "New Jersey" → 0 results

### ✅ 3. Hard Refresh Test

- [ ] Navigate to Alabama page
- [ ] Press Ctrl+Shift+R (hard refresh)
- [ ] Wait for page to fully load
- [ ] Open DevTools → Elements
- [ ] Verify `<head>` still shows Alabama tags (not generic fallback)

### ✅ 4. Incognito Mode Test

- [ ] Open incognito/private window
- [ ] Navigate to Alabama URL
- [ ] Open DevTools → Elements
- [ ] Verify `<head>` shows Alabama tags
- [ ] This confirms no cache issues

### ✅ 5. Mobile Browser Test

- [ ] Open Alabama URL on mobile device
- [ ] Use mobile browser's "View Source" equivalent
- [ ] Will show generic shell (EXPECTED)
- [ ] Use remote debugging to inspect Elements
- [ ] Verify `<head>` shows Alabama tags in live DOM

---

## Social Media Scraper Tests

### ✅ Facebook Open Graph Debugger

- [ ] Go to: https://developers.facebook.com/tools/debug/
- [ ] Enter: `https://www.gappsy.com/marketing-agencies-in-alabama-united-states/`
- [ ] Click "Scrape Again" (2-3 times)
- [ ] Verify preview shows:
  - [ ] Title: "Top 25 Marketing Agencies in Alabama"
  - [ ] Description: Alabama-specific
  - [ ] URL: Alabama URL
  - [ ] Image: Correct OG image (if set in JSON)

**If wrong preview shows:**
- First verify DevTools Elements shows correct tags
- If Elements is correct, issue is Facebook cache
- Wait 24-48 hours or keep clicking "Scrape Again"

### ✅ Twitter Card Validator

- [ ] Go to: https://cards-dev.twitter.com/validator
- [ ] Enter: `https://www.gappsy.com/marketing-agencies-in-alabama-united-states/`
- [ ] Verify card shows:
  - [ ] Title: Alabama-specific
  - [ ] Description: Alabama-specific
  - [ ] Image: Correct Twitter image
  - [ ] Card type: summary_large_image

### ✅ LinkedIn Post Inspector

- [ ] Go to: https://www.linkedin.com/post-inspector/
- [ ] Enter: `https://www.gappsy.com/marketing-agencies-in-alabama-united-states/`
- [ ] Verify preview shows Alabama-specific content

---

## Google Search Console Tests

**Note:** These tests require the site to be indexed by Google (24-48 hours after deployment)

### ✅ URL Inspection Tool

- [ ] Open Google Search Console
- [ ] Use "URL Inspection" tool
- [ ] Enter: `https://www.gappsy.com/marketing-agencies-in-alabama-united-states/`
- [ ] Click "Test Live URL"
- [ ] Wait for Googlebot to render page (30-60 seconds)
- [ ] Click "View Tested Page" → "HTML" tab
- [ ] Verify Googlebot sees:
  - [ ] Title: "Top 25 Marketing Agencies in Alabama | 2025 Rankings"
  - [ ] Meta description: Alabama-specific
  - [ ] Canonical: Alabama URL
  - [ ] NO mentions of "New Jersey"

**If correct:**
- [ ] Click "Request Indexing"
- [ ] Repeat for New Jersey and other states

### ✅ Rich Results Test

- [ ] Go to: https://search.google.com/test/rich-results
- [ ] Enter Alabama URL
- [ ] Click "Test URL"
- [ ] Verify detects:
  - [ ] WebPage schema
  - [ ] ItemList schema
  - [ ] LocalBusiness schemas
- [ ] Check "View Tested Page" shows correct structured data

---

## Performance Tests

### ✅ SEO Tag Load Time

- [ ] Open DevTools → Network tab
- [ ] Navigate to Alabama page
- [ ] Check "DOMContentLoaded" time
- [ ] Open DevTools → Performance tab
- [ ] Record page load
- [ ] Stop recording after 2-3 seconds
- [ ] Find "SEOTags useEffect" in timeline
- [ ] Verify runs in < 50ms (should be nearly instant)

### ✅ Memory Leak Test

- [ ] Open DevTools → Performance Monitor
- [ ] Enable "JS heap size" metric
- [ ] Navigate Alabama → New Jersey → Alabama → New Jersey (repeat 10 times)
- [ ] Check heap size doesn't grow continuously
- [ ] Minor fluctuations are normal
- [ ] Steady growth indicates memory leak (should NOT happen)

---

## Cross-Browser Tests

### ✅ Chrome/Edge

- [ ] Navigate to Alabama page
- [ ] DevTools → Elements → verify tags
- [ ] Navigate to New Jersey
- [ ] Verify tags update

### ✅ Firefox

- [ ] Navigate to Alabama page
- [ ] DevTools → Inspector → verify tags
- [ ] Navigate to New Jersey
- [ ] Verify tags update

### ✅ Safari

- [ ] Navigate to Alabama page
- [ ] Web Inspector → Elements → verify tags
- [ ] Navigate to New Jersey
- [ ] Verify tags update

---

## Edge Case Tests

### ✅ Test 1: Direct URL Entry

- [ ] Clear browser history/cache
- [ ] Directly type Alabama URL in address bar
- [ ] Press Enter
- [ ] Open DevTools → Elements
- [ ] Verify Alabama tags (not fallback)

### ✅ Test 2: Bookmark Test

- [ ] Bookmark Alabama page
- [ ] Close all browser tabs
- [ ] Open bookmark
- [ ] Open DevTools → Elements
- [ ] Verify Alabama tags load

### ✅ Test 3: External Link Test

- [ ] Create HTML file with link to Alabama page
- [ ] Click link from external file
- [ ] Open DevTools → Elements
- [ ] Verify Alabama tags load

### ✅ Test 4: Browser Back/Forward

- [ ] Navigate: Home → Alabama → New Jersey → Alabama
- [ ] Click browser back button twice
- [ ] Now on New Jersey
- [ ] Verify with `?seoDebug=1` shows New Jersey
- [ ] Click browser forward
- [ ] Verify shows Alabama

### ✅ Test 5: Slow Network Test

- [ ] DevTools → Network tab
- [ ] Change throttling to "Slow 3G"
- [ ] Navigate to Alabama page
- [ ] Wait for full load
- [ ] Verify tags eventually load correctly
- [ ] No errors in console

---

## Error Scenarios

### ✅ Test 1: Missing SEO Object

- [ ] Temporarily remove `seo` object from state JSON
- [ ] Navigate to that state
- [ ] Verify fallback tags are created
- [ ] Check title uses: `Top 25 Marketing Agencies in [StateName]`
- [ ] No JavaScript errors in console

### ✅ Test 2: Invalid JSON

- [ ] Temporarily break state JSON syntax
- [ ] Navigate to that state
- [ ] Verify error page shows (not white screen)
- [ ] Check console shows meaningful error

### ✅ Test 3: Missing Image URL

- [ ] Remove `og_image` from state JSON
- [ ] Navigate to that state with `?seoDebug=1`
- [ ] Verify overlay shows "Not set" for og:image
- [ ] Verify no broken image errors
- [ ] Other tags still work correctly

---

## Regression Tests

Run these tests before each major release:

### ✅ Regression 1: NJ SEO Not Leaking

- [ ] Navigate to Alabama with `?seoDebug=1`
- [ ] Search overlay text for "New Jersey" → 0 results
- [ ] Open DevTools → Elements
- [ ] Press Ctrl+F, search "New Jersey" in `<head>` → 0 results
- [ ] Search entire page for "New Jersey" → Only in state selector

### ✅ Regression 2: Tags Update on Route Change

- [ ] Start on Alabama
- [ ] Note document.title in console: `console.log(document.title)`
- [ ] Navigate to New Jersey
- [ ] Check document.title again
- [ ] Should change from Alabama title to New Jersey title

### ✅ Regression 3: Canonical URLs Unique Per State

- [ ] Navigate to Alabama
- [ ] Check canonical: Should contain `/alabama/`
- [ ] Navigate to New Jersey
- [ ] Check canonical: Should contain `/new-jersey/`
- [ ] Navigate to California
- [ ] Check canonical: Should contain `/california/`
- [ ] All should be unique and correct

---

## Accessibility Tests

### ✅ Screen Reader Test

- [ ] Enable screen reader (NVDA, JAWS, VoiceOver)
- [ ] Navigate to Alabama page
- [ ] Verify page title is announced correctly
- [ ] Verify meta description is not announced (correct behavior)

---

## Documentation Tests

### ✅ Verify Documentation Matches Implementation

- [ ] Read `BOLT_RUNTIME_SEO_IMPLEMENTATION.md`
- [ ] Follow verification steps
- [ ] Confirm all steps work as documented
- [ ] No missing steps
- [ ] No outdated information

---

## Final Sign-Off

**Before marking SEO as production-ready, ALL items above must be checked.**

### Critical Items (Must Pass)

- [ ] SEO Debug Overlay shows correct state
- [ ] DevTools Elements shows correct tags
- [ ] SPA navigation updates tags without reload
- [ ] No "New Jersey" found in Alabama `<head>`
- [ ] Facebook/Twitter scrapers show correct preview
- [ ] Google Search Console sees correct HTML

### Nice-to-Have Items (Should Pass)

- [ ] All cross-browser tests pass
- [ ] All edge case tests pass
- [ ] Performance under 50ms
- [ ] No memory leaks

---

## Test Results Template

```
SEO Verification - [Date]
Environment: [Local / Staging / Production]

Pre-Deployment Tests:
✅ SEO Debug Overlay - PASS
✅ SPA Navigation - PASS
✅ DevTools Elements - PASS
✅ JSON-LD Schema - PASS
✅ Fallback Chain - PASS

Post-Deployment Tests:
✅ Production Debug - PASS
✅ Production DevTools - PASS
✅ Hard Refresh - PASS
✅ Incognito Mode - PASS

Social Scraper Tests:
✅ Facebook Debugger - PASS
✅ Twitter Validator - PASS
⏳ LinkedIn Inspector - PENDING (cache)

Google Tests:
⏳ URL Inspection - PENDING (not indexed yet)
⏳ Rich Results - PENDING (not indexed yet)

Critical Issues: NONE
Minor Issues: NONE

Status: ✅ APPROVED FOR PRODUCTION
```

---

## Quick Test Script

For fast verification, run this in browser console on Alabama page:

```javascript
// Quick SEO Test Script
console.log('=== SEO Verification ===');
console.log('Title:', document.title);
console.log('Description:', document.querySelector('meta[name="description"]')?.content);
console.log('Canonical:', document.querySelector('link[rel="canonical"]')?.href);
console.log('OG Title:', document.querySelector('meta[property="og:title"]')?.content);
console.log('Twitter Title:', document.querySelector('meta[name="twitter:title"]')?.content);
console.log('Schemas:', document.querySelectorAll('script[type="application/ld+json"]').length);

// Check for wrong state
const headHTML = document.head.innerHTML;
const wrongStateCount = (headHTML.match(/New Jersey/gi) || []).length;
console.log('Mentions of "New Jersey" in <head>:', wrongStateCount);
console.log(wrongStateCount === 0 ? '✅ PASS' : '❌ FAIL - Wrong state detected!');
```

**Expected output on Alabama page:**
```
=== SEO Verification ===
Title: Top 25 Marketing Agencies in Alabama | 2025 Rankings
Description: Discover Alabama's best marketing agencies...
Canonical: https://www.gappsy.com/marketing-agencies-in-alabama-united-states/
OG Title: Top 25 Marketing Agencies in Alabama
Twitter Title: Top 25 Marketing Agencies in Alabama
Schemas: 27
Mentions of "New Jersey" in <head>: 0
✅ PASS
```

---

## Automated Testing Ideas

For CI/CD integration, consider these automated tests:

```javascript
// Playwright/Cypress example
test('Alabama page has correct SEO tags', async ({ page }) => {
  await page.goto('/marketing-agencies-in-alabama-united-states');

  const title = await page.title();
  expect(title).toContain('Alabama');
  expect(title).not.toContain('New Jersey');

  const description = await page.getAttribute('meta[name="description"]', 'content');
  expect(description).toContain('Alabama');

  const canonical = await page.getAttribute('link[rel="canonical"]', 'href');
  expect(canonical).toContain('alabama');
});
```

---

## Support Contact

If any tests fail consistently:

1. Check browser console for JavaScript errors
2. Verify state JSON file is valid and deployed
3. Clear all caches and retry
4. Test in incognito mode
5. Check network tab for failed requests
6. Review `BOLT_RUNTIME_SEO_IMPLEMENTATION.md` for troubleshooting

**The system is designed to work automatically. If tests fail, something external has changed.**
