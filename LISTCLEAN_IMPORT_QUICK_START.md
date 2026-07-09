# ListClean Email Import — Quick Start

**Build:** sw62qraw | **Status:** ✅ PRODUCTION READY

---

## What Changed?

### Backend
- ✅ CSV parser now handles ListClean columns (`LC_Status`, `LC_Email`, `LC_Reason`)
- ✅ Robust header normalization (quotes, spaces, case-insensitive)
- ✅ Status mapping: `clean` → `valid`, `bad` → `invalid`, etc.
- ✅ Provider defaults to "ListClean" if empty
- ✅ Auto-detects file format (ListClean vs Standard)

### Frontend
- ✅ Replaced text input with dropdown (ListClean selected by default)
- ✅ Updated help text to mention ListClean support
- ✅ Shows format detected after import
- ✅ No typing required, cleaner UX

---

## How to Use

### Step 1: Export emails from ListClean
Get your cleaned CSV file from ListClean (e.g., `emails_clean_listclean.csv`).

### Step 2: Upload (no editing needed!)
1. Go to Admin → Email Cleaning
2. Tab: **Import**
3. Select your ListClean CSV file
4. Provider dropdown: Already set to **ListClean** ✅
5. Click **Import**

### Step 3: Watch it work
- ✅ File parses successfully
- ✅ Rows match by `email_id` or `agency_id + email`
- ✅ Status mapped correctly (clean → valid, invalid → invalid, etc.)
- ✅ Result shows "Format detected: ListClean"

---

## Supported Formats

### ListClean CSV (NEW!)
```
email_id,agency_id,LC_Email,LC_Status,LC_Reason
456,xyz,alice@company.com,clean,Verified
457,xyz,bob@company.com,invalid,Hard bounce
```

### Standard CSV (still works)
```
email_id,agency_id,email,validation_status,validation_reason
456,xyz,alice@company.com,valid,OK
```

### JSON (still works)
```json
[
  { "email_id": "456", "validation_status": "valid" }
]
```

---

## Status Mapping

| ListClean | Internal | Display |
|-----------|----------|---------|
| clean | valid | Valid |
| invalid | invalid | Invalid |
| risky | risky | Risky |
| catch-all | catch_all | Catch-all |
| duplicate | duplicate | Duplicate |
| unknown | unknown | Unknown |

---

## Supported Field Aliases

| Internal | ListClean | Standard |
|----------|-----------|----------|
| Email ID | `email_id` | `email_id` |
| Agency | `agency_id` | `agency_id` |
| Email | `LC_Email` | `email` / `email_normalized` |
| **Status** | `LC_Status` ✅ | `validation_status` |
| Reason | `LC_Reason` | `validation_reason` |
| Provider | (auto) | `validation_provider` |
| Score | (auto) | `validation_score` |

---

## Key Features

✅ ListClean imports work **as-is** (no manual editing)
✅ Backward compatible (existing imports still work)
✅ Provider defaults to ListClean (no typing needed)
✅ Auto-detects format (shows result)
✅ Robust header parsing (handles quotes, spaces, case)
✅ Clear error messages
✅ No breaking changes

---

## Error Help

### "CSV must contain LC_Status or validation_status column"
- Your CSV missing status column
- Check header names match `LC_Status` or `validation_status`

### "email_id not found"
- Email ID doesn't match existing record
- Try using `agency_id + email` pair instead

### "agency_id + email_normalized not found"
- Email not yet in system
- Make sure you imported agencies first

---

## Testing Checklist

- ✅ ListClean CSV imports without editing
- ✅ Status values mapped correctly
- ✅ Rows match and update
- ✅ Format shown as "ListClean" in result
- ✅ Standard CSV still works
- ✅ JSON still works
- ✅ No errors during import

---
