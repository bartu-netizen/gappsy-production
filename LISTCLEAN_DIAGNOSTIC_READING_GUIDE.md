# How to Read ListClean Diagnostic Logs - Admin Guide

## Where to Find the Logs

1. Go to Supabase Dashboard
2. Select your project
3. Go to **Edge Functions**
4. Click on `other-agencies-listclean-process-queue`
5. Click the **Logs** tab
6. Filter by recent timestamps
7. Look for `[ListClean]` markers

## What to Look For - Step by Step

### PART 1: List Details Inspection

**Look for this section:**
```
[ListClean] === Fetching list details ===
[ListClean] Endpoint: GET https://api.listclean.xyz/v1/lists/XXXXX
[ListClean] Response received, status: 200
[ListClean] ListClean GET /lists/{id} - Top-level keys (N): [...]
```

**What this tells you:**
- ✅ The endpoint is correct
- ✅ Authentication worked (status 200)
- ✅ The response came back

**Next, look for:**
```
[ListClean] ListClean GET /lists/{id} - URL-like strings found: [...]
[ListClean] ListClean GET /lists/{id} - Nested objects found: [...]
```

**What this tells you:**
- Where the URLs are located in the response
- What nested objects contain important data

**If you see `data` keys:**
```
[ListClean] ListClean GET /lists/{id}.data keys (N): [...]
```

**This means** the actual data is nested inside a `data` object, not at the top level.

**If you see `links` keys:**
```
[ListClean] ListClean GET /lists/{id}.links keys (N): [...]
```

**This means** URLs are in a `links` object.

---

### PART 2: URL Search Results

**Look for this section:**
```
[ListClean] === Searching for official result URLs in list details response ===
[ListClean] Found CLEAN URL at key "clean_url": https://results.listclean.xyz/...
[ListClean] Found DIRTY URL at key "dirty_download_url": https://results.listclean.xyz/...
[ListClean] Found UNKNOWN URL at key "unknown_results": https://results.listclean.xyz/...
```

**What this tells you:**
- The KEY NAME ListClean uses for each category (e.g., "clean_url", "dirty_download_url")
- The actual URL that will be used to download
- Whether all three categories are present

**Summary line:**
```
[ListClean] URLs found: {
  cleanUrl: "https://results.listclean.xyz/..." or "NOT FOUND",
  dirtyUrl: "https://results.listclean.xyz/..." or "NOT FOUND",
  unknownUrl: "https://results.listclean.xyz/..." or "NOT FOUND"
}
```

**Critical observation:**
- If you see `NOT FOUND` for any category, that's where the problem is
- The code will fail at this point with a helpful error message
- You should see which URLs ARE available

**If this fails:**
```
[ListClean] Step 2 FAILED: Official list details response did not contain clean result URL
[ListClean] Available URLs: { dirtyUrl: "...", unknownUrl: "..." }
[ListClean] Response shape (first 500 chars): { actual JSON response }
```

**This tells you:**
- Which category is missing (clean, dirty, or unknown)
- Which categories ARE available
- The actual response structure (first 500 chars)

---

### PART 3: Download Attempts

**Look for these sections:**

```
[ListClean] Step 3: Download clean results from official URL
[ListClean] Step 3: Download response received: status=200, content-type=text/csv
```

**What this tells you:**
- ✅ URL is accessible (status 200)
- ✅ Server returned CSV (not HTML error page)

**If you see 404:**
```
[ListClean] Step 3: Download response received: status=404, content-type=text/html
```

**This is BAD** - the URL from the API returned 404. This should NOT happen if ListClean returned the URL.

**If you see 401/403:**
```
[ListClean] Step 3: Download response received: status=401, content-type=text/plain
```

**This means** authentication token is invalid or insufficient.

---

### PART 4: Parsing

**Look for:**
```
[ListClean] Step 4: Parse clean results
[ListClean] Step 4: CSV parsed: 55 rows
[ListClean] Step 4: CSV header keys: [email, status, result_type, ...]
```

**What this tells you:**
- ✅ File was successfully parsed
- ✅ Expected number of rows found
- ✅ Expected columns are present

**Row counts - IMPORTANT:**
```
[ListClean] Step 4: CSV parsed: 55 rows
[ListClean] Step 5: Normalized: 55 email results from 55 CSV rows
```

**Compare with ListClean UI:**
- If ListClean shows "Clean: 60" but logs show "55 rows", there's a mismatch
- If logs show "0 rows" but ListClean shows "60 clean", the file is empty

**If parsing fails:**
```
[ListClean] Step 4 FAILED: JSON parse error: Unexpected token...
```

**This means** the response wasn't valid CSV or JSON. The server may have returned an error page instead of data.

---

### PART 5: Database Updates

**Look for:**
```
[listclean-queue] Batch XXXXX download stats:
  requested=100, uniqueSubmitted=100
  clean=60, dirty=35, unknown=5
  totalResults=100
```

**What this tells you:**
- How many emails were sent to ListClean
- How many were deduplicated
- How many results came back for each category
- Total results (should equal submitted)

**Matching step:**
```
[listclean-queue] Batch XXXXX processing summary:
  submitted=100, resultsFromListClean=100
  matched=100, unmatched=0
  successCount=100, errorCount=0
```

**Perfect scenario:**
- submitted = resultsFromListClean (all emails got results)
- matched = submitted (all were matched to database records)
- successCount = matched (all database updates succeeded)
- errorCount = 0 (no errors)

**Problem scenario:**
- submitted=100, resultsFromListClean=100, but matched=50, unmatched=50
- **This means** results came back but couldn't be matched to emails
- Could be email normalization issue

---

## Diagnostic Checklist

Use this checklist when reading logs:

- [ ] `[ListClean] Endpoint: GET https://api.listclean.xyz/v1/lists/...` - Correct endpoint
- [ ] `status: 200` after fetching list - Auth worked
- [ ] `Top-level keys` printed - Response structure visible
- [ ] `Found CLEAN URL` / `Found DIRTY URL` / `Found UNKNOWN URL` - URLs extracted
- [ ] `NOT FOUND` for any URL? - This is the problem to investigate
- [ ] `status=200` for downloads - Files accessible
- [ ] `content-type=text/csv` or `application/json` - Correct format
- [ ] Row counts printed - Files parsed successfully
- [ ] `successCount` > 0 - Database updated
- [ ] `errorCount` = 0 - No errors in update

---

## Common Scenarios & What They Mean

### ✅ Success Scenario
```
[ListClean] Step 1 complete: List details retrieved
[ListClean] Found CLEAN URL at key "clean_download_url": https://...
[ListClean] Found DIRTY URL at key "dirty_download_url": https://...
[ListClean] Found UNKNOWN URL at key "unknown_download_url": https://...
[ListClean] Step 3: Download response received: status=200, content-type=text/csv
[ListClean] Step 4: CSV parsed: 60 rows
[listclean-queue] Batch 12345 processing summary: successCount=100, errorCount=0
```
**Meaning:** Everything worked perfectly.

### ⚠️ Missing Category Scenario
```
[ListClean] Found CLEAN URL at key "clean_download_url": https://...
[ListClean] URLs found: {
  cleanUrl: "https://...",
  dirtyUrl: "NOT FOUND",
  unknownUrl: "https://..."
}
```
**Meaning:** ListClean didn't return a dirty category URL. Either:
- The batch has 0 dirty emails
- The API doesn't provide that URL in this case

Continue reading to see if it fails or treats empty.

### ❌ Auth Failure Scenario
```
[ListClean] Step 3: Download response received: status=401, content-type=text/plain
[ListClean] Step 3 FAILED: Authentication error (401)
```
**Meaning:** ListClean token is invalid or expired.

### ❌ URL Extraction Failure Scenario
```
[ListClean] === Searching for official result URLs in list details response ===
[ListClean] URLs found: {
  cleanUrl: "NOT FOUND",
  dirtyUrl: "NOT FOUND",
  unknownUrl: "NOT FOUND"
}
[ListClean] Step 2 FAILED: Official list details response did not contain clean result URL
[ListClean] Response shape (first 500 chars): { "id": 12345, "status": "completed", ... }
```
**Meaning:** The response doesn't have URLs in keys we're searching for. Need to adjust search logic based on actual response structure shown.

---

## If You See "NOT FOUND"

When a URL is NOT FOUND, the response structure is printed. Example:
```
[ListClean] Response shape (first 500 chars):
{
  "id": 12345,
  "status": "completed",
  "created_at": "2026-03-09T...",
  "export_id": "abc123",
  "results_available": true
}
```

**Next steps:**
- Look for a key that contains a URL or ID
- It might be `"export_id"` or `"file_id"` instead of a direct URL
- If so, there's a second API call needed (e.g., `GET /exports/{export_id}`)

The logs will show you exactly what's in the response, so you can determine the next official endpoint to call.

---

## Questions to Answer from Logs

1. **"Is the batch completed?"**
   - Check: `[ListClean] Response received, status: 200`
   - Check: Status in response (should show "completed")

2. **"Are the result URLs in the API response?"**
   - Check: `Found CLEAN URL at key...`
   - If all three say "NOT FOUND", they're not there

3. **"Can we download the files?"**
   - Check: `status=200` in download response
   - Check: `content-type` shows file type

4. **"Does the CSV have the expected data?"**
   - Check: Row count matches ListClean UI
   - Check: Header keys include "email"

5. **"Why didn't database update?"**
   - Check: `successCount` vs `errorCount`
   - If errorCount > 0, there's a DB issue (separate problem)

---

## Final Check

After reading the logs:

1. **Did it reach Step 5 (Normalize)?**
   - Yes → Results were parsed successfully
   - No → Find which step failed

2. **What was the failure step?**
   - Step 1 → Auth/network issue
   - Step 2 → API response structure changed
   - Step 3 → Downloaded file was invalid
   - Step 4 → Can't parse the file
   - Step 5+ → Database issue (different problem)

3. **What's the next official API call?**
   - Read the response structure printed in logs
   - Identify missing URLs or IDs
   - Determine the next endpoint from API docs

The logs will give you all the data needed to diagnose the issue. No guessing required.
