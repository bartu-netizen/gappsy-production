# Year Normalization - Quick Verification Guide

## 🎯 30-Second Test

**Run this in browser console on Alabama page:**

```javascript
const currentYear = new Date().getFullYear();
const title = document.title;
const ogTitle = document.querySelector('meta[property="og:title"]')?.content;
const twitterTitle = document.querySelector('meta[name="twitter:title"]')?.content;
const description = document.querySelector('meta[name="description"]')?.content;

console.log('=== YEAR NORMALIZATION TEST ===');
console.log('Current Year:', currentYear);
console.log('');
console.log('📄 Title:', title);
console.log('✅ Has current year:', title.includes(String(currentYear)));
console.log('');
console.log('📘 OG Title:', ogTitle);
console.log('✅ Has current year:', ogTitle?.includes(String(currentYear)));
console.log('');
console.log('🐦 Twitter Title:', twitterTitle);
console.log('✅ Has current year:', twitterTitle?.includes(String(currentYear)));
console.log('');
console.log('📝 Description:', description);
console.log('ℹ️  Note: Descriptions are NOT normalized (by design)');
console.log('');
console.log(
  title.includes(String(currentYear)) &&
  ogTitle?.includes(String(currentYear)) &&
  twitterTitle?.includes(String(currentYear))
    ? '✅ ALL TESTS PASSED'
    : '❌ SOME TESTS FAILED'
);
```

**Expected output (if current year is 2025):**
```
=== YEAR NORMALIZATION TEST ===
Current Year: 2025

📄 Title: Top 25 Marketing Agencies in Alabama | 2025 Rankings
✅ Has current year: true

📘 OG Title: Top 25 Marketing Agencies in Alabama | 2025
✅ Has current year: true

🐦 Twitter Title: Top 25 Marketing Agencies in Alabama | 2025
✅ Has current year: true

📝 Description: Discover Alabama's best marketing agencies...
ℹ️  Note: Descriptions are NOT normalized (by design)

✅ ALL TESTS PASSED
```

---

## 🔍 Visual Verification with SEO Debug Overlay

**Fastest method for non-technical verification:**

1. Navigate to: `/marketing-agencies-in-alabama-united-states?seoDebug=1`

2. Check the overlay in bottom-right corner

3. Verify these fields show current year:
   - `<title>` - Should show 2025 (or current year)
   - `og:title` - Should show 2025 (or current year)
   - `twitter:title` - Should show 2025 (or current year)

4. Verify these fields are unchanged:
   - `meta[name="description"]` - May show 2025 or not (doesn't matter)
   - `og:description` - May show 2025 or not (doesn't matter)
   - `twitter:description` - May show 2025 or not (doesn't matter)

**If overlay shows current year in all title fields → ✅ Working!**

---

## 🧪 Testing Different Years

### Test Current Year (2025)

**Alabama JSON contains:**
```json
"title": "Top 25 Marketing Agencies in Alabama | 2025 Rankings"
```

**Expected render:**
```html
<title>Top 25 Marketing Agencies in Alabama | 2025 Rankings</title>
```

**Verification:**
```javascript
console.assert(
  document.title.includes('2025'),
  'Title should contain 2025'
);
```

---

### Simulate Future Year (2026)

**To test what happens in 2026 without waiting:**

```javascript
// Save original Date
const OriginalDate = Date;

// Override Date to return 2026
global.Date = class extends OriginalDate {
  constructor(...args) {
    if (args.length === 0) {
      super('2026-01-01T00:00:00Z');
    } else {
      super(...args);
    }
  }

  static now() {
    return new OriginalDate('2026-01-01T00:00:00Z').getTime();
  }

  getFullYear() {
    return 2026;
  }
};

// Force component re-render by navigating
window.location.href = '/marketing-agencies-in-alabama-united-states';
```

**After reload:**
- Title should show "2026" instead of "2025"
- OG title should show "2026"
- Twitter title should show "2026"

**To restore:**
```javascript
global.Date = OriginalDate;
window.location.reload();
```

---

## 📋 Comprehensive Checklist

### ✅ Title Normalization Tests

- [ ] Page `<title>` shows current year
- [ ] `<meta property="og:title">` shows current year
- [ ] `<meta name="twitter:title">` shows current year
- [ ] All three update together (consistency)

### ✅ Description Preservation Tests

- [ ] `<meta name="description">` is unchanged (may show old year)
- [ ] `<meta property="og:description">` is unchanged
- [ ] `<meta name="twitter:description">` is unchanged
- [ ] Canonical URL is unchanged (no year replacement)

### ✅ Edge Case Tests

**Test 1: Title without year**
- [ ] JSON: `"Best Agencies in Alabama"`
- [ ] Rendered: `"Best Agencies in Alabama"` (unchanged)

**Test 2: Multiple years in title**
- [ ] JSON: `"2024-2025 Rankings"`
- [ ] Rendered: `"2025-2025 Rankings"` (both replaced)

**Test 3: Year in non-title field**
- [ ] JSON description: `"Updated for 2024"`
- [ ] Rendered description: `"Updated for 2024"` (unchanged)

### ✅ Cross-State Consistency Tests

- [ ] Alabama shows current year in title
- [ ] New Jersey shows current year in title
- [ ] Both show same year (not different years)

### ✅ Navigation Tests

- [ ] Start on Alabama → Title shows current year
- [ ] Navigate to New Jersey → Title updates to show current year
- [ ] Navigate back to Alabama → Title still shows current year
- [ ] No stale titles remain after navigation

---

## 🐛 Debugging Failed Tests

### Issue: Title shows "2025" but current year is 2026

**Possible causes:**

1. **Browser cache**
   ```bash
   Hard refresh: Ctrl+Shift+R (Windows) or Cmd+Shift+R (Mac)
   ```

2. **System clock incorrect**
   ```javascript
   console.log('System year:', new Date().getFullYear());
   // Should match actual current year
   ```

3. **Old build deployed**
   ```bash
   Check build timestamp:
   ls -la dist/assets/*.js

   If old, rebuild:
   npm run build
   ```

4. **Component not re-rendering**
   ```javascript
   // Check if SEOTags component is mounted
   // React DevTools → Components → Search for "SEOTags"
   ```

---

### Issue: Description shows current year but shouldn't

**Expected behavior:** Descriptions are NOT normalized.

**If description is being normalized:**
- Check SEOTags.tsx
- Verify `description` is NOT passed through `normalizeYear()`
- Should be: `{ name: 'description', content: description }`
- NOT: `{ name: 'description', content: normalizeYear(description) }`

---

### Issue: og:title shows different year than <title>

**Possible causes:**

1. **Fallback chain issue**
   ```javascript
   // Check the logic:
   const normalizedTitle = normalizeYear(title);
   const normalizedOgTitle = normalizeYear(ogTitle);
   const finalOgTitle = normalizedOgTitle || normalizedTitle;

   // Both should be normalized before fallback
   ```

2. **JSON has different years**
   ```json
   {
     "title": "Top 25 Agencies | 2025",
     "og_title": "Top 25 Agencies | 2024"
   }
   ```
   Both should normalize to current year.

---

## 📊 Automated Testing Script

**Copy/paste this into your test suite:**

```javascript
describe('Year Normalization', () => {
  beforeEach(() => {
    cy.visit('/marketing-agencies-in-alabama-united-states');
  });

  it('should show current year in page title', () => {
    const currentYear = new Date().getFullYear();
    cy.title().should('include', String(currentYear));
  });

  it('should show current year in OG title', () => {
    const currentYear = new Date().getFullYear();
    cy.get('meta[property="og:title"]')
      .should('have.attr', 'content')
      .and('include', String(currentYear));
  });

  it('should show current year in Twitter title', () => {
    const currentYear = new Date().getFullYear();
    cy.get('meta[name="twitter:title"]')
      .should('have.attr', 'content')
      .and('include', String(currentYear));
  });

  it('should NOT normalize description', () => {
    cy.get('meta[name="description"]')
      .should('have.attr', 'content')
      .and('not.be.empty');
    // Description may or may not contain year - we don't care
  });

  it('should update year when navigating between states', () => {
    const currentYear = new Date().getFullYear();

    // Check Alabama
    cy.title().should('include', String(currentYear));

    // Navigate to New Jersey
    cy.visit('/marketing-agencies-in-new-jersey-united-states');

    // Should still show current year
    cy.title().should('include', String(currentYear));
  });
});
```

---

## 🎓 Understanding the Implementation

**Where it happens:** `src/components/SEOTags.tsx`

**Key code:**
```typescript
const currentYear = new Date().getFullYear(); // 2025

const normalizeYear = (text?: string): string => {
  if (!text) return '';
  return text.replace(/\b20\d{2}\b/g, String(currentYear));
};

// Normalize BEFORE fallback chains
const normalizedTitle = normalizeYear(title);
const normalizedOgTitle = normalizeYear(ogTitle);
const normalizedTwitterTitle = normalizeYear(twitterTitle);

// Then build fallback chains with normalized values
const finalOgTitle = normalizedOgTitle || normalizedTitle;
const finalTwitterTitle = normalizedTwitterTitle || normalizedOgTitle || normalizedTitle;
```

**Why this order matters:**

1. Normalize each value independently
2. Then apply fallback chains
3. This ensures consistency

**Example:**
```
title = "Top 25 | 2025"
ogTitle = undefined

normalizedTitle = "Top 25 | 2026"
normalizedOgTitle = "" (undefined → empty)

finalOgTitle = normalizedOgTitle || normalizedTitle
             = "" || "Top 25 | 2026"
             = "Top 25 | 2026"

Result: OG title falls back to page title with correct year
```

---

## 📅 Calendar Testing Schedule

**To ensure long-term reliability, test at these times:**

### December 31st (Day Before New Year)
- [ ] Verify titles show current year (e.g., 2025)
- [ ] No premature year updates

### January 1st (New Year's Day)
- [ ] Verify titles show new year (e.g., 2026)
- [ ] All states updated simultaneously
- [ ] No stale 2025 titles remain

### Mid-Year Spot Check (June 1st)
- [ ] Verify titles still show correct year
- [ ] No regression to old year

**Set calendar reminders for these dates.**

---

## ✅ Sign-Off Checklist

**Before marking as production-ready:**

- [ ] Ran 30-second console test → PASSED
- [ ] Checked `?seoDebug=1` overlay → Shows current year
- [ ] Tested Alabama page → Current year in title
- [ ] Tested New Jersey page → Current year in title
- [ ] Tested navigation → Year persists correctly
- [ ] Verified descriptions unchanged → PASSED
- [ ] Verified canonical unchanged → PASSED
- [ ] Cross-browser test (Chrome, Firefox, Safari) → PASSED
- [ ] Build completes without errors → PASSED

**All items checked?** ✅ **Year normalization is production-ready!**

---

## 🎯 Quick Reference

**One command to verify everything:**
```javascript
['title', 'og:title', 'twitter:title'].forEach(field => {
  const selector = field === 'title'
    ? 'title'
    : field.startsWith('og')
      ? `meta[property="${field}"]`
      : `meta[name="${field}"]`;
  const el = document.querySelector(selector);
  const content = field === 'title' ? el?.textContent : el?.content;
  const year = content?.match(/\b20\d{2}\b/)?.[0];
  console.log(`${field}: ${year || 'no year'}`);
});
```

**Expected output:**
```
title: 2025
og:title: 2025
twitter:title: 2025
```

**All showing current year?** ✅ **Working perfectly!**
