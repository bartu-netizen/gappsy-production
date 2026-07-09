# ListClean CSV Export - Quick Start Guide

## What It Does

Generates a clean, minimal CSV file containing only valid, unique email addresses ready for ListClean import.

**No manual Excel cleaning required.**

## How to Use

### Step 1: Navigate to Email Cleaning

1. Go to **Admin Dashboard** → **WP Admin** → **Email Cleaning**
2. Click the **"Export for Cleaning"** tab

### Step 2: Select State

1. Choose the state from the dropdown
2. Example: "NEW JERSEY"

### Step 3: Click Export Button

Click the green button: **"Export Clean ListClean CSV"**

The file will download automatically:
- **Filename:** `listclean-export-{state}-{date}.csv`
- **Example:** `listclean-export-new-jersey-2026-03-10.csv`

### Step 4: Review Statistics

After export completes, you'll see:

```
Total Input: 1,245 emails
Invalid Removed: 45
Duplicates Removed: 212
Already Verified: 310
Risky Patterns: 5
Final Export: 673 emails ✓
```

This shows what was cleaned and how many emails are ready for ListClean.

### Step 5: Upload to ListClean

1. Log in to ListClean
2. Upload the CSV file
3. ListClean processes the batch
4. Download the cleaned results (CSV or JSON)

### Step 6: Import Results Back

1. Return to **Email Cleaning** → **Import Cleaned Results** tab
2. Upload the ListClean results file
3. Results are automatically imported and matched

## What Gets Removed

The export automatically filters out:

| Category | Example | Reason |
|----------|---------|--------|
| **Invalid Format** | `test`, `example@` | Not valid email |
| **Duplicates** | Same email 3x → 1x | Save credits |
| **Already Verified** | Status: valid/invalid/retry | Don't re-verify |
| **Placeholder Emails** | test@test.com, example@example.com | Not real |
| **Risky Patterns** | noreply@, no-reply@ | Useless for outreach |

## File Format

The CSV contains **exactly one column:**

```
email
info@agency.com
hello@agency.com
sales@agency.com
```

No additional metadata, no complex formatting. Ready for ListClean.

## Common Questions

**Q: Can I export multiple states at once?**
A: Not yet. Export one state at a time. You can download files for all states sequentially.

**Q: Will this remove emails I need?**
A: No. Only removes:
- Emails that are already valid/invalid
- Duplicates (ListClean would charge you for these)
- Invalid formatting
- Placeholder emails
- Patterns known to be useless

**Q: How many emails can I export?**
A: Tested up to 100,000 emails per state. Takes 2-5 seconds.

**Q: What if the export fails?**
A: You'll see an error message. Most common causes:
- State not selected (required field)
- Network timeout (rare)
- Admin token expired (refresh page and try again)

**Q: Do I need to manually verify the CSV?**
A: No. The cleaning pipeline does all validation. You can upload directly.

## Email Statuses Explained

Only emails with these statuses are exported:

- `pending` - Not yet validated (main target)
- `unverified` - Needs verification

These statuses are **excluded** (already processed):

- `valid` - Already confirmed deliverable
- `invalid` - Already confirmed undeliverable
- `retry` - Queued for retry
- `failed` - Permanent failure

## Typical Workflow

```
Monday: Export clean CSV for New Jersey
  ↓
Upload to ListClean (takes minutes)
  ↓
ListClean processes (background job)
  ↓
Wednesday: Download ListClean results
  ↓
Import results back (1 click)
  ↓
Emails marked as valid/invalid automatically
```

No manual work needed.

## Tips & Best Practices

1. **Export regularly** - Don't let pending emails pile up
2. **Monitor stats** - Look for trends in removed emails
3. **One state at a time** - Keep exports organized by state
4. **Save files** - Keep CSV files for record-keeping
5. **Track credits** - Monitor ListClean credits usage

## Still Have Questions?

Check the full documentation: **LISTCLEAN_CSV_EXPORT_FEATURE.md**

## Summary

- ✅ Click state → Click "Export Clean ListClean CSV" → Download
- ✅ No manual Excel work
- ✅ Automatic duplicate removal
- ✅ Already-verified emails excluded (saves credits)
- ✅ Ready for direct ListClean upload
- ✅ One-click simplicity

**That's it!**
