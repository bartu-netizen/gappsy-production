# 🧪 Quick Test Guide - State Pages from Database

## What Changed

State pages now load agencies from the Supabase database instead of JSON files.

---

## Quick Tests

### Test 1: Alabama (After Import) ✅

**Setup:**
1. Go to `/admin/json-import`
2. Upload `alabama.json`
3. Click Import
4. Wait for "25/25 imported"

**Test:**
```
URL: /marketing-agencies-in-alabama-united-states
Expected: Shows Alabama state page with 25 agencies from database
```

**Verify:**
- Page title shows "Alabama"
- Breadcrumb shows "Alabama"
- Shows 25 agency cards
- Same design as New Jersey
- Debug panel (in dev mode) shows:
  - DB Agencies: 25
  - First Agency: [name from database]
  - Data Source: database

---

### Test 2: New Jersey (Existing) ✅

**Test:**
```
URL: /marketing-agencies-in-new-jersey-united-states
Expected: Still works, shows NJ agencies from database
```

**Verify:**
- Page loads normally
- Shows New Jersey agencies
- No errors in console

---

### Test 3: Wyoming (Not Imported) ⚠️

**Test:**
```
URL: /marketing-agencies-in-wyoming-united-states
Expected: Shows error message, NOT homepage
```

**Verify:**
- Shows message: "No agencies found for Wyoming"
- Shows link to "View All States"
- Does NOT show homepage UI
- Does NOT redirect

---

### Test 4: Invalid URL 🚫

**Test:**
```
URL: /this-page-does-not-exist
Expected: Shows 404 page
```

**Verify:**
- Shows "404 Page Not Found"
- Links to homepage and state directory
- Does NOT show homepage

---

## Debug Panel (Dev Mode Only)

Run `npm run dev` and visit any state page. At the bottom you'll see:

```
🐛 DEBUG INFO
State Slug: alabama
State Name: Alabama
DB Agencies: 25
Valid Agencies: 25
First Agency: [agency name]
JSON Metadata: loaded
Data Source: database
```

This confirms:
- ✅ State slug recognized
- ✅ Agencies loaded from database
- ✅ First agency name visible

---

## Common Issues

### "No agencies found for [State]"

**Cause:** State not imported yet

**Fix:** Import the state JSON via `/admin/json-import`

### Page Shows Homepage

**Cause:** Wrong URL format

**Fix:** Use exact format: `/marketing-agencies-in-{state}-united-states`
- ✅ `/marketing-agencies-in-alabama-united-states`
- ❌ `/alabama`
- ❌ `/marketing-agencies/alabama`

### Database Error

**Cause:** Supabase not configured

**Fix:**
1. Check `.env` has `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`
2. Restart dev server

---

## Production Checklist

Before going live:

- [ ] New Jersey page works
- [ ] Alabama page shows 25 agencies
- [ ] Unknown state shows error (not homepage)
- [ ] Invalid URL shows 404 page
- [ ] No console errors
- [ ] Build succeeds (`npm run build`)

---

## Quick Verification Script

Run this in dev tools console on any state page:

```javascript
console.log({
  url: window.location.pathname,
  stateParam: window.location.pathname.match(/in-(.+?)-united/)?.[1],
  title: document.title,
  agencyCards: document.querySelectorAll('.agency-card').length
});
```

**Expected output:**
```json
{
  "url": "/marketing-agencies-in-alabama-united-states",
  "stateParam": "alabama",
  "title": "Top 25 Marketing Agencies in Alabama",
  "agencyCards": 25
}
```

---

## Status

✅ Routing fixed
✅ Database integration working
✅ 404 page created
✅ Debug panel added
✅ Build succeeds

**Next:** Import more states and verify they appear correctly!
