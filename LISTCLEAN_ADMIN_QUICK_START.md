# ListClean Diagnostics - Admin Quick Start

## You Have ONE Job Now

**Run the queue, read the logs, see what ListClean actually returns.**

No more guessing. No more 404s. Only official API data.

---

## Quick Steps

### 1. Run the Queue on Your Failing Batch
```
POST https://your-supabase-url/functions/v1/other-agencies-listclean-process-queue
Authorization: Bearer {service_role_key}
Content-Type: application/json

{}
```

### 2. Get the Logs
1. Supabase Dashboard
2. Edge Functions
3. `other-agencies-listclean-process-queue`
4. Logs tab
5. Filter by recent

### 3. What to Look For
```
[ListClean] ListClean GET /lists/{id} - Top-level keys:
```
This shows you WHAT LIST CLEAN ACTUALLY RETURNS.

### 4. Look for URLs
```
[ListClean] Found CLEAN URL at key "...": https://...
[ListClean] Found DIRTY URL at key "...": https://...
[ListClean] Found UNKNOWN URL at key "...": https://...
```

- ✅ If you see these → Working!
- ❌ If you see "NOT FOUND" → Keep reading the response structure

### 5. Check Success
```
[listclean-queue] Batch XXXXX processing summary:
  successCount=XXX, errorCount=0
```

---

## Two Scenarios

### ✅ Success Logs
```
[ListClean] Found CLEAN URL at key "clean_url": https://results.listclean.xyz/...
[ListClean] Step 3: Download response received: status=200
[ListClean] Step 4: CSV parsed: 60 rows
[listclean-queue] successCount=100, errorCount=0

Admin Dashboard Shows:
  Processed: 100 ✅
  Verified Valid: 60 ✅
  Verified Invalid: 35 ✅
  Verified Retry: 5 ✅
  Failed: 0 ✅
```

### ⚠️ Diagnostic Logs
```
[ListClean] URLs found: {
  cleanUrl: "NOT FOUND",
  dirtyUrl: "NOT FOUND",
  unknownUrl: "NOT FOUND"
}
[ListClean] Response shape (first 500 chars):
{
  "id": 12345,
  "status": "completed",
  "export_ids": { "clean": "abc123", "dirty": "def456" }
}
```

**What this means:**
- URLs are NOT in the list details response
- But there's an `export_ids` object
- Next step = Call `GET /exports/{id}` or `GET /files/{id}`
- Code needs adjustment based on real API

---

## If Something Fails

### 404 on Download
```
[ListClean] Step 3 FAILED: URL returned 404
```
URL was in response but file not found. Check ListClean web app - is batch complete?

### Auth Failed
```
[ListClean] Step 3 FAILED: Authentication error (401)
```
Check ListClean API token in Supabase secrets.

### Can't Parse
```
[ListClean] Step 4 FAILED: Could not parse JSON
```
The downloaded file wasn't valid CSV/JSON. Check format.

---

## The Key Advantage

Before: `processed = 0, failed = 100` (no info)
After: Full diagnostic logs showing exactly what ListClean returns

---

## Files to Read

1. **Quick Summary:** `LISTCLEAN_NO_MORE_GUESSING_SUMMARY.md` (this tells you the concept)
2. **How to Read Logs:** `LISTCLEAN_DIAGNOSTIC_READING_GUIDE.md` (interpret what you see)
3. **Full Details:** `LISTCLEAN_IMPLEMENTATION_COMPLETE.md` (technical deep dive)

---

## What's Different

- ✅ No more `/downloads/{id}/clean/` fabrication
- ✅ Only uses URLs ListClean API actually returns
- ✅ If URL missing, prints what IS in response
- ✅ Full diagnostic info logged
- ✅ Clear error messages

---

## Checklist

- [ ] Edge function deployed (should be live)
- [ ] Build completed without errors
- [ ] No code changes to other systems
- [ ] Run queue on failing batch
- [ ] Read logs for response structure
- [ ] Report any new API flow needed

---

## TL;DR

1. Run queue on batch
2. Check logs for `[ListClean]` entries
3. Look for URLs or diagnostic structure
4. If working: celebrate ✅
5. If not working: logs show exactly why (no guessing needed)

That's it.
