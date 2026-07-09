# Quick Test Guide - Snippet Control

## 🚀 Instant Verification

### 1. Add ?verify=1 to Any State URL

```
http://localhost:5173/marketing-agencies-in-new-jersey-united-states/?verify=1
http://localhost:5173/marketing-agencies-in-california-united-states/?verify=1
http://localhost:5173/marketing-agencies-in-texas-united-states/?verify=1
```

### 2. Look for Green Badge (Bottom-Right)

**✅ ALL CHECKS PASSED** = Perfect!

Shows:
- Total nosnippet: ~28+
- hasPageZone: ✅ true
- hasTop25Zone: ✅ true
- agencyCardCount: 25
- hasSnippetIntro: ✅ true

### 3. Open DevTools Console

**Expected output:**
```javascript
✅ NOSNIPPET VERIFICATION: {
  totalNosnippetElements: 28,
  hasPageZone: true,
  hasTop25Zone: true,
  agencyCardCount: 25,
  hasSnippetIntro: true,
  snippetIntroText: "Looking for a digital marketing agency in..."
}
```

---

## 🔍 Manual Check (Chrome DevTools)

1. **F12** → Elements tab
2. **Cmd+F** (Mac) or **Ctrl+F** (Windows)
3. Search: `data-nosnippet`
4. **Expected:** 25+ occurrences

**What to verify:**
- ✅ `<div id="page-nosnippet-zone" data-nosnippet>` exists
- ✅ `<div id="top25-nosnippet-zone" data-nosnippet>` exists
- ✅ `<p data-snippet-intro="1">` exists (SnippetIntro)
- ✅ Multiple agency cards with data-nosnippet wrappers

---

## 📋 Acceptance Criteria (5 Checks)

For ANY state page:

### ✅ 1. hasSnippetIntro: true
- Renders under H1
- Text: "Looking for a digital marketing agency in {State}?..."
- Has `data-snippet-intro="1"` attribute

### ✅ 2. hasPageZone: true
- `#page-nosnippet-zone` wrapper exists
- Wraps everything after SnippetIntro

### ✅ 3. hasTop25Zone: true
- `#top25-nosnippet-zone` wrapper exists
- Nested inside #page-nosnippet-zone

### ✅ 4. agencyCardCount: 25 (or state-specific)
- Agency cards render inside #top25-nosnippet-zone
- Each has `.agency-card` class

### ✅ 5. totalNosnippetElements: 25+
- Multiple elements blocked from snippets
- Page wrapper + nested wrapper + components

---

## 🚨 If Badge Shows "CHECKS INCOMPLETE"

### Check 1: Wait for Hydration
- Wait 2-3 seconds
- Refresh page

### Check 2: Verify URL
- Must have `?verify=1` parameter
- Case-sensitive

### Check 3: Console Errors
- Open Console tab
- Look for React errors
- Check network tab for failed requests

### Check 4: Specific Failure
**If hasSnippetIntro: false**
- SnippetIntro component not rendering
- Check StatePageTemplate.tsx line ~632

**If hasPageZone: false**
- Global wrapper not added
- Check StatePageTemplate.tsx line ~732 (opening)
- Check line ~999 (closing)

**If hasTop25Zone: false**
- Top25 wrapper not added
- Check NewJerseyAgencyGrid.tsx line ~52

**If agencyCardCount: 0**
- Agency cards not rendering
- Scroll down (lazy-loading)
- Check if state has agencies in database

---

## 📊 What's Blocked vs Allowed

### ✅ ALLOWED (Snippet-Eligible)
- **SnippetIntro ONLY**
- Text: "Looking for a digital marketing agency in {State}? Compare SEO, PPC, web design and social media services..."

### ❌ BLOCKED (data-nosnippet)
- Hero expandable text
- Get Matched card
- Featured/Spotlight cards (Vazagency, "Your Agency Here")
- Top 25 agency names
- Agency descriptions/bios
- CTA blocks ("Want your agency...", "Think Your Marketing Agency...")
- FAQ section
- Other agencies section
- States navigation section

---

## 🎯 Expected Google Snippet

**After Google re-crawls (2-4 weeks):**

```
Looking for a digital marketing agency in New Jersey? Compare SEO,
PPC, web design and social media services. Explore top-rated
marketing agencies and digital marketing companies, reviews and
locations. Updated for 2026.
```

**Keywords covered:**
- digital marketing agency
- marketing agencies
- digital marketing companies
- SEO, PPC, web design, social media
- reviews, locations

---

## 🔧 Quick Fixes

### Green Badge Not Showing
```bash
# Clear cache and rebuild
npm run build
npm run preview
```

### Console Not Logging
- Check if ?verify=1 is in URL
- Refresh page with Cmd+R (Mac) or Ctrl+R (Windows)
- Hard refresh with Cmd+Shift+R or Ctrl+Shift+R

### Build Errors
```bash
# Clean install
rm -rf node_modules package-lock.json
npm install
npm run build
```

---

## 📝 Files to Check (If Issues)

1. **src/components/SnippetIntro.tsx** (NEW)
   - Should exist
   - Has `data-snippet-intro="1"` attribute

2. **src/pages/StatePageTemplate.tsx**
   - Line ~22: Import SnippetIntro
   - Line ~632: Render SnippetIntro after H1
   - Line ~732: Open #page-nosnippet-zone
   - Line ~999: Close #page-nosnippet-zone

3. **src/NewJerseyAgencyGrid.tsx**
   - Line ~52: #top25-nosnippet-zone exists
   - NO duplicate H2/intro (removed)

4. **src/components/NoSnippetVerifier.tsx**
   - Updated with 5 checks
   - Shows green badge when all pass

---

## ✅ Success Checklist

- [ ] Green badge appears with ?verify=1
- [ ] Console shows verification object
- [ ] hasSnippetIntro: true
- [ ] hasPageZone: true
- [ ] hasTop25Zone: true
- [ ] agencyCardCount: 25 (or expected number)
- [ ] totalNosnippetElements: 25+
- [ ] SnippetIntro text is visible on page
- [ ] No duplicate intros elsewhere
- [ ] Build passes without errors

---

## 🚀 Production Test URLs

After deploy, test these:

```
https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/?verify=1
https://www.gappsy.com/marketing-agencies-in-california-united-states/?verify=1
https://www.gappsy.com/marketing-agencies-in-texas-united-states/?verify=1
https://www.gappsy.com/marketing-agencies-in-florida-united-states/?verify=1
https://www.gappsy.com/marketing-agencies-in-new-york-united-states/?verify=1
```

**All should show:**
- ✅ Green badge
- ✅ All checks passed
- ✅ Console verification

---

**Ready to Test!** 🎉

Full docs: `ULTIMATE_SNIPPET_CONTROL_COMPLETE.md`
