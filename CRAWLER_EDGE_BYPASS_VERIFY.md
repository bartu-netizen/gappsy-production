# Crawler Edge Function Verification Guide

## Overview

This document provides verification steps for the Netlify Edge Function that fixes crawler 502/504 errors by:
1. Detecting crawler User-Agents (Googlebot, Bingbot, etc.)
2. Spoofing downstream requests as browser UA to bypass Netlify's crawler pipeline
3. Serving prerendered static HTML files with debug headers

**Key Innovation:** Instead of using `context.rewrite()`, we use `context.next()` with a modified request that has a browser UA. This bypasses whatever Netlify crawler handling is causing 502s.

---

## Problem Summary

### Evidence of Crawler-Only Failures

**Homepage `/` testing (50 requests each):**
- Browser UA: **50/50 HTTP 200** (100% success)
- Googlebot UA: **32/50 HTTP 200** (36% failure rate)

**State pages testing:**
- Browser UA: Nearly 100% success
- Googlebot UA: 20-36% failure rate (intermittent 502/504)

**Root Cause:** Netlify's Edge layer has an unstable crawler detection/handling pipeline that intermittently returns 502/504 for crawler User-Agents.

**Solution:** Our Edge Function intercepts crawler requests early and spoofs them as browser requests downstream, completely bypassing Netlify's problematic crawler pipeline.

---

## Quick Verification (2 minutes)

### Test Homepage with Googlebot UA

```bash
UA_GOOGLEBOT='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

curl -Is -A "$UA_GOOGLEBOT" https://www.gappsy.com/ | egrep -i '^(HTTP|x-gappsy-crawler-|x-nf-request-id|server|date|cache-status)'
```

**Expected Output:**
```
HTTP/2 200
server: Netlify
x-gappsy-crawler-static: rewritten
x-gappsy-crawler-target: /index.html
cache-control: public, max-age=0, must-revalidate
x-nf-request-id: 01...
date: ...
```

### Test State Page (Illinois)

```bash
UA_GOOGLEBOT='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

curl -Is -A "$UA_GOOGLEBOT" https://www.gappsy.com/marketing-agencies-in-illinois-united-states/ | egrep -i '^(HTTP|x-gappsy-crawler-|x-nf-request-id)'
```

**Expected Output:**
```
HTTP/2 200
x-gappsy-crawler-static: rewritten
x-gappsy-crawler-target: /marketing-agencies-in-illinois-united-states.html
x-nf-request-id: 01...
```

**Success Indicators:**
- ✅ HTTP 200 (not 502 or 504)
- ✅ Header `x-gappsy-crawler-static: rewritten` present
- ✅ Header `x-gappsy-crawler-target` shows correct .html file

---

## Comprehensive Testing

### Multi-URL Test (Homepage + 5 States)

Run the provided test script:

```bash
./test-crawler-edge.sh
```

This tests:
- Homepage `/`
- Illinois
- New York
- Florida
- Texas
- California

**For each URL it tests:**
1. Browser UA (should be 200, no special headers)
2. Googlebot UA (should be 200 with debug headers)

**Expected Output:**
```
== Browser UA (should be 200, likely no x-gappsy headers) ==
BROWSER 200 https://www.gappsy.com/
BROWSER 200 https://www.gappsy.com/marketing-agencies-in-illinois-united-states/
... (all 200)

== Googlebot UA (should be 200 + x-gappsy-crawler-static: rewritten) ==
GOOGLEBOT 200 https://www.gappsy.com/
HTTP/2 200
x-gappsy-crawler-static: rewritten
x-gappsy-crawler-target: /index.html
...
```

### Reliability Test (30 requests each with 2s sleep)

Run the reliability test:

```bash
./test-crawler-reliability.sh
```

This makes 30 requests each to:
1. Homepage `/` with Googlebot UA
2. Illinois state page with Googlebot UA

**Expected Output:**
```
HOME_GOOGLEBOT 1 code=200
HOME_GOOGLEBOT 2 code=200
... (all 200)
HOME_GOOGLEBOT SUMMARY ok=30 fail=0 url=https://www.gappsy.com/

IL_GOOGLEBOT 1 code=200
IL_GOOGLEBOT 2 code=200
... (all 200)
IL_GOOGLEBOT SUMMARY ok=30 fail=0 url=https://www.gappsy.com/marketing-agencies-in-illinois-united-states/
```

**Success Criteria:**
- ✅ Homepage: 30/30 or 29/30 success (≥96%)
- ✅ State page: 30/30 or 29/30 success (≥96%)
- ⚠️ If any failures, investigate (but 1-2 failures out of 60 total is acceptable)

---

## How It Works

### Request Flow for Crawlers

```
1. Googlebot makes request:
   GET https://www.gappsy.com/marketing-agencies-in-illinois-united-states/
   User-Agent: Mozilla/5.0 (compatible; Googlebot/2.1; ...)

2. Request hits Netlify Edge Function:
   - Detects crawler UA via isCrawlerUA()
   - Determines target: /marketing-agencies-in-illinois-united-states.html

3. Edge Function creates downstream request:
   - Same URL (to .html file)
   - SPOOFED UA: Mozilla/5.0 (Macintosh; ... Chrome/120.0.0.0 Safari/537.36)
   - Accept: text/html,application/xhtml+xml,...

4. Downstream sees "browser" request:
   - Netlify's crawler pipeline is NOT activated
   - Serves file from dist/ without issues

5. Edge Function wraps response:
   - Adds x-gappsy-crawler-static: rewritten
   - Adds x-gappsy-crawler-target: /...html
   - Sets cache-control: public, max-age=0, must-revalidate

6. Googlebot receives:
   - HTTP 200
   - Full prerendered HTML content
   - Debug headers for verification
```

### Request Flow for Browsers

```
1. Browser makes request:
   User-Agent: Mozilla/5.0 (Macintosh; ... Safari/537.36)

2. Edge Function checks UA:
   - NOT a crawler
   - Returns early (no modification)

3. Request proceeds normally:
   - No Edge Function interference
   - Normal _redirects rules apply
   - Serves prerendered HTML as before
```

---

## Testing Different User Agents

### Regular Browser (Should NOT Trigger Edge Function)

```bash
UA_BROWSER='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'

curl -Is -A "$UA_BROWSER" https://www.gappsy.com/ | egrep -i '^(HTTP|x-gappsy-)'
```

**Expected:** HTTP 200, NO `x-gappsy-crawler-static` header

### Googlebot

```bash
UA_GOOGLEBOT='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

curl -Is -A "$UA_GOOGLEBOT" https://www.gappsy.com/ | egrep -i '^(HTTP|x-gappsy-)'
```

**Expected:** HTTP 200, `x-gappsy-crawler-static: rewritten`

### Google InspectionTool

```bash
UA_INSPECTION='Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/W.X.Y.Z Mobile Safari/537.36 (compatible; Google-InspectionTool/1.0;)'

curl -Is -A "$UA_INSPECTION" https://www.gappsy.com/ | egrep -i '^(HTTP|x-gappsy-)'
```

**Expected:** HTTP 200, `x-gappsy-crawler-static: rewritten`

### Bingbot

```bash
UA_BINGBOT='Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'

curl -Is -A "$UA_BINGBOT" https://www.gappsy.com/marketing-agencies-in-illinois-united-states/ | egrep -i '^(HTTP|x-gappsy-)'
```

**Expected:** HTTP 200, `x-gappsy-crawler-static: rewritten`

---

## Content Verification

### Verify Full HTML is Served (Not SPA Shell)

```bash
UA_GOOGLEBOT='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

# Homepage
curl -s -A "$UA_GOOGLEBOT" https://www.gappsy.com/ \
  | grep -E '<title>|<h1|<meta name="description"' \
  | head -5

# State page
curl -s -A "$UA_GOOGLEBOT" https://www.gappsy.com/marketing-agencies-in-illinois-united-states/ \
  | grep -E '<title>|<h1|<meta name="description"|<link rel="canonical"' \
  | head -5
```

**Expected:** Should show full SEO tags with state-specific content, NOT generic loading page.

### Verify No "Loading..." Placeholder

```bash
UA_GOOGLEBOT='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

if curl -s -A "$UA_GOOGLEBOT" https://www.gappsy.com/marketing-agencies-in-illinois-united-states/ | grep -qi "Loading\.\.\."; then
  echo "❌ FAIL: Found 'Loading...' placeholder"
else
  echo "✅ PASS: No placeholder text"
fi
```

---

## Troubleshooting

### Edge Function Not Running

**Symptom:** No `x-gappsy-crawler-static` header in response

**Check:**

1. **Verify Edge Function deployed:**
   ```bash
   # Check Netlify deploy logs for Edge Function
   ```

2. **Verify file exists in repo:**
   ```bash
   ls -l netlify/edge-functions/crawler-static.js
   ```

3. **Verify netlify.toml config:**
   ```bash
   grep -A 2 "edge_functions" netlify.toml
   ```

   Should show TWO declarations:
   ```toml
   [[edge_functions]]
   function = "crawler-static"
   path = "/"

   [[edge_functions]]
   function = "crawler-static"
   path = "/marketing-agencies-in-*"
   ```

4. **Check if UA is detected:**
   - Edge Function only runs for known crawler UAs
   - Test with exact Googlebot UA string above

### Still Getting 502 Errors

**Symptom:** Crawler requests return 502 even with Edge Function

**Check:**

1. **Verify HTML files exist:**
   ```bash
   curl -I https://www.gappsy.com/index.html
   curl -I https://www.gappsy.com/marketing-agencies-in-illinois-united-states.html
   ```
   Both should return 200.

2. **Check Edge Function logs in Netlify:**
   - Look for errors in function execution
   - Check if function is even being invoked

3. **Test direct .html access:**
   ```bash
   curl -Is https://www.gappsy.com/marketing-agencies-in-illinois-united-states.html | head -1
   ```
   Should be HTTP 200.

4. **Verify _redirects is clean:**
   ```bash
   curl -s https://www.gappsy.com/_redirects | head -20
   ```
   Should NOT have stray `]` or `)` lines.

### Edge Function Crashes

**Symptom:** Inconsistent behavior, sometimes works, sometimes doesn't

The Edge Function includes `onError: "bypass"` which means:
- If function crashes, request proceeds normally
- Check Netlify Function logs for errors
- Look for JavaScript errors in Edge Function execution

### Homepage Doesn't Work But State Pages Do

**Check netlify.toml:**
```bash
grep -B 1 'path = "/"' netlify.toml
```

Must have separate declaration for `/` route.

---

## Success Criteria

After deployment, all of these must be true:

- ✅ **Googlebot on `/`:** HTTP 200, header `x-gappsy-crawler-static: rewritten`, target `/index.html`
- ✅ **Googlebot on state pages:** HTTP 200, header present, correct target path
- ✅ **Browser on `/`:** HTTP 200, NO special headers (Edge Function doesn't run)
- ✅ **Browser on state pages:** HTTP 200, NO special headers
- ✅ **Reliability test:** ≥28/30 success on homepage (≥93%)
- ✅ **Reliability test:** ≥28/30 success on state pages (≥93%)
- ✅ **Content verification:** Full HTML with SEO tags, no "Loading..." text
- ✅ **Multi-UA test:** Works for Googlebot, InspectionTool, Bingbot

---

## Post-Deploy Checklist

After deploying to Netlify:

- [ ] Wait 2-3 minutes for deploy to complete
- [ ] Run quick test: `curl -Is -A "Googlebot..." https://www.gappsy.com/`
- [ ] Verify `x-gappsy-crawler-static` header present
- [ ] Run multi-URL test: `./test-crawler-edge.sh`
- [ ] Run reliability test: `./test-crawler-reliability.sh` (takes ~2 minutes)
- [ ] Test with Browser UA (should NOT have special headers)
- [ ] Test homepage `/` specifically
- [ ] Test 3-5 different state pages
- [ ] Verify content quality (no "Loading..." text)
- [ ] Check Netlify Function logs for any errors
- [ ] Monitor for 24-48 hours

---

## Monitoring Recommendations

### Immediate (First 24 Hours)

1. **Check Netlify logs:**
   - Edge Function invocation count
   - Any errors or exceptions
   - Execution time (should be <50ms)

2. **Run reliability test every hour:**
   ```bash
   # Cron job example
   0 * * * * cd /path/to/project && ./test-crawler-reliability.sh >> /var/log/crawler-test.log 2>&1
   ```

3. **Monitor Google Search Console:**
   - Crawl errors
   - Coverage issues
   - Server errors (502/504)

### Ongoing (After 24 Hours)

1. **Daily reliability checks:**
   - Run test-crawler-edge.sh daily
   - Alert if any failures

2. **Weekly content checks:**
   - Verify prerendered HTML still has full content
   - Check for any regressions

3. **Alert conditions:**
   - Success rate drops below 90%
   - Any 502/504 errors detected
   - Edge Function stops running (missing headers)
   - Homepage fails (most critical)

---

## Rollback Plan

If Edge Function causes issues:

### Option 1: Disable for Homepage Only

Edit `netlify.toml`:
```toml
# Comment out homepage:
# [[edge_functions]]
# function = "crawler-static"
# path = "/"

# Keep state pages:
[[edge_functions]]
function = "crawler-static"
path = "/marketing-agencies-in-*"
```

### Option 2: Disable Completely

Edit `netlify.toml`:
```toml
# Comment out all edge functions:
# [[edge_functions]]
# function = "crawler-static"
# path = "/"

# [[edge_functions]]
# function = "crawler-static"
# path = "/marketing-agencies-in-*"
```

### Option 3: Delete Edge Function

```bash
rm netlify/edge-functions/crawler-static.js
git commit -am "Rollback: Remove Edge Function"
git push
```

**Note:** Site will continue working for browsers via `_redirects`. Only crawler stability will be affected.

---

## Why This Should Work

### Root Cause Analysis

**Problem:** Netlify's Edge infrastructure has an unstable crawler detection/handling pipeline that causes intermittent 502/504s.

**Evidence:**
- Browser UA: 100% success
- Crawler UA: 64-80% success (20-36% failure)
- Same URLs, same content, only difference is User-Agent

**Solution:** Bypass Netlify's crawler pipeline entirely by:
1. Intercepting crawler requests at Edge
2. Making downstream request look like browser
3. Netlify never activates problematic crawler handling
4. We get browser-level reliability for crawlers

### Key Advantages

1. **Direct control:** We control exactly how crawlers are served
2. **UA spoofing:** Downstream sees browser, uses stable pipeline
3. **Debug visibility:** Headers prove function is working
4. **Crash-proof:** `onError: "bypass"` prevents cascading failures
5. **Zero risk to browsers:** Function only runs for crawlers
6. **Homepage included:** Fixes the worst failure rate (36%)

---

## Expected Outcome

### Before Fix (Production Evidence)

**Homepage `/`:**
- Browser: 50/50 (100%) ✅
- Googlebot: 32/50 (64%) ❌ **36% failure rate**

**State pages:**
- Browser: ~50/50 (100%) ✅
- Googlebot: 37-40/50 (74-80%) ❌ **20-26% failure rate**

### After Fix (Expected)

**Homepage `/`:**
- Browser: 50/50 (100%) ✅ (unchanged)
- Googlebot: 48-50/50 (96-100%) ✅ **Target: ≥95%**

**State pages:**
- Browser: 50/50 (100%) ✅ (unchanged)
- Googlebot: 48-50/50 (96-100%) ✅ **Target: ≥95%**

### Success Metrics

- **Primary:** Homepage Googlebot success rate ≥95%
- **Secondary:** State pages Googlebot success rate ≥95%
- **Tertiary:** Debug headers present in all successful responses
- **Critical:** Zero impact on browser traffic

---

## Related Documentation

- **Implementation:** `CRAWLER_EDGE_FUNCTION_IMPLEMENTATION.md`
- **Quick Start:** `QUICK_START_EDGE_FUNCTION.md`
- **Previous Analysis:** `GOOGLEBOT_502_DIAGNOSTIC.md`

---

**Last Updated:** 2026-02-13
**Status:** Ready for production testing
**Risk Level:** Low (browser traffic unaffected, error bypass in place)
