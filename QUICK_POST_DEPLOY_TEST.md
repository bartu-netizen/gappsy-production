# QUICK POST-DEPLOY VERIFICATION (5 Minutes)

Run these tests IMMEDIATELY after deploying to production to confirm the SEO fix is working.

---

## ✅ Test 1: Production HTML Fetcher (2 minutes)

**URL:** `https://gappsy.bolt.host/admin/production-test`

**Steps:**
1. Open the URL above
2. Click "Test Default URLs"
3. Wait for results (~30 seconds)

**Expected Result:**
```
✅ ALL TESTS PASSED - Production is serving pre-rendered HTML correctly
```

**Each state should show:**
- ✅ State Title (green)
- ✅ og:title (green)
- ✅ og:image (green)
- ✅ canonical (green)

**If you see ❌ RED:**
→ Routing fix didn't deploy. Check netlify.toml was committed.
→ Trigger manual rebuild in Netlify: "Clear cache and deploy"

---

## ✅ Test 2: View Source Manual Check (1 minute)

**URL:** `https://gappsy.bolt.host/marketing-agencies-in-alabama-united-states/`

**Steps:**
1. Open the URL above
2. Press `Ctrl+U` (Windows) or `Cmd+U` (Mac)
3. Press `Ctrl+F` or `Cmd+F` and search for: `og:title`

**Expected Result:**
```html
<meta property="og:title" content="Top 25 Marketing Agencies in Alabama" />
```

**The tag MUST be in the HTML source, NOT inside a `<script>` tag.**

**If you see generic homepage title:**
→ Pre-rendered HTML not being served
→ Go back to Test 1 and diagnose

---

## ✅ Test 3: OG Image Check (1 minute)

**URL:** `https://gappsy.bolt.host/og/marketing-agencies-in-alabama-united-states.svg`

**Steps:**
1. Open the URL above
2. Verify image displays

**Expected Result:**
- Dark blue background
- Text: "Top 25 Marketing Agencies in"
- Purple text: "Alabama"
- Text: "United States • 2025 Rankings"

**If you see 404:**
→ OG images weren't copied to dist
→ Rebuild project: `npm run build`

---

## ✅ Test 4: Facebook Debugger (1 minute)

**URL:** `https://developers.facebook.com/tools/debug/`

**Steps:**
1. Open the Facebook debugger
2. Paste: `https://gappsy.bolt.host/marketing-agencies-in-florida-united-states/`
3. Click "Scrape Again"

**Expected Result:**
- Title: "Top 25 Marketing Agencies in Florida (2025)"
- Description: Florida-specific text (NOT generic homepage description)
- Image: Shows Florida in purple text

**If you see generic content:**
→ Meta tags not in server HTML
→ Check Test 1 and Test 2 first

---

## ✅ DECISION TREE

```
Test 1 PASSED?
├─ YES → Continue to Test 2
└─ NO → Check netlify.toml in git, trigger rebuild, retry Test 1

Test 2 PASSED?
├─ YES → Continue to Test 3
└─ NO → Same HTML as Test 1 issue, check redirects

Test 3 PASSED?
├─ YES → Continue to Test 4
└─ NO → Run "npm run build" locally, check dist/og/ folder

Test 4 PASSED?
├─ YES → ✅ ALL SYSTEMS GO - Deployment successful!
└─ NO → Clear Facebook cache with "Scrape Again" button
```

---

## 🚨 CRITICAL CHECKS SUMMARY

| Test | What It Proves | Must Pass |
|------|---------------|-----------|
| Test 1 | Routing is serving pre-rendered HTML | ✅ YES |
| Test 2 | View-source has state-specific tags | ✅ YES |
| Test 3 | OG images are accessible | ✅ YES |
| Test 4 | Social scrapers see correct content | ✅ YES |

**ALL 4 MUST PASS for production to be considered working.**

---

## 📊 COMPREHENSIVE AUDIT (Optional - 5 more minutes)

After the 4 quick tests pass, run the full audit:

**URL:** `https://gappsy.bolt.host/admin/seo-audit`

**Steps:**
1. Open the URL
2. Click "Run Full Audit"
3. Wait 2-3 minutes
4. Export CSV

**Expected Result:**
- Total States: 52
- Passed: 10+ (ideally all 52, but some may not have data yet)
- Failed: <5 (only states without JSON/DB content)
- Errors: 0

---

## ✅ DEPLOYMENT APPROVED CHECKLIST

Mark each when verified:

- [ ] Test 1: Production HTML Fetcher shows ✅ for all 5 states
- [ ] Test 2: View-source contains `og:title` for Alabama
- [ ] Test 3: OG image loads for Alabama (SVG visible)
- [ ] Test 4: Facebook debugger shows Florida-specific preview

**When all 4 are checked, deployment is VERIFIED and APPROVED.**

---

## 🚀 POST-VERIFICATION ACTIONS

After all tests pass:

1. **Notify stakeholders:** "SEO fix deployed and verified"
2. **Monitor:** Check Google Search Console in 24-48 hours
3. **Re-test:** Run SEO audit weekly to catch regressions
4. **Document:** Save exported CSV for historical records

---

## 🔗 QUICK LINKS

- [Production HTML Fetcher](https://gappsy.bolt.host/admin/production-test)
- [SEO Audit](https://gappsy.bolt.host/admin/seo-audit)
- [Facebook Debugger](https://developers.facebook.com/tools/debug/)
- [Sample State Page](https://gappsy.bolt.host/marketing-agencies-in-alabama-united-states/)
- [Sample OG Image](https://gappsy.bolt.host/og/marketing-agencies-in-alabama-united-states.svg)

---

**Total Time: ~5 minutes for critical tests, +5 minutes for comprehensive audit**

**If any test fails, refer to PRODUCTION_SEO_FIX_COMPLETE.md troubleshooting section.**
