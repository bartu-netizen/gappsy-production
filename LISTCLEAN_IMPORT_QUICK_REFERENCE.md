# ListClean Import - Quick Reference for Admins

## The Complete Workflow (Fully Automated)

### Step 1: Export from Our System
1. Go to: **WP Admin Dashboard → Email Cleaning**
2. Click: **"Export for Cleaning"** tab
3. Select: State
4. Click: **"Export Clean ListClean CSV"**
5. File saves: `listclean-export-{state}-{date}.csv`

### Step 2: Upload to ListClean
1. Log in to ListClean
2. Upload: `listclean-export-{state}-{date}.csv`
3. Wait for ListClean to process
4. Download results when ready

### Step 3: Import Results Back (NEW - FULLY SUPPORTED)
1. Go back to: **WP Admin Dashboard → Email Cleaning**
2. Click: **"Import Cleaned Results"** tab
3. Select state if needed
4. Upload: The file from ListClean (no editing required)
5. Click: **"Import"**
6. View results immediately

**That's it. No manual Excel editing. No adding columns. The file works exactly as ListClean returns it.**

## What Changed

**Before:** You had to manually add `email_id` or `agency_id` columns to the ListClean CSV
**Now:** Just upload the file as-is

## Result Message Format

After import, you'll see something like:

```
✓ Import Successful
Total rows: 100
Rows matched: 98
Rows updated: 98
Rows unmatched: 2
Errors: 2
```

**rows_matched** = How many rows from your file were found in the database
**rows_updated** = How many database rows were actually updated (usually same as matched)

If you have unmatched rows:
- They're listed in the errors
- Usually means the email isn't in our system yet
- This is normal for the first import

## How It Works (No Technical Knowledge Needed)

1. **Export:** We extract all pending/unverified emails from the database
2. **Clean:** We remove duplicates, invalid emails, already-verified ones
3. **Send to ListClean:** ListClean validates them
4. **Get back results:** ListClean tells us which are valid, invalid, risky
5. **Import:** We update our database with those results
6. **Resolve:** Your /your-agency URLs now have accurate email validation status

**Why this matters:**
- Saves ListClean credits by not re-verifying already-verified emails
- Keeps email validation data current
- Improves deliverability scoring
- Automatic - no manual work needed

## ListClean File Format

**You'll receive from ListClean:**
```
LC_Email,LC_Status,LC_Reason,LC_MX,LC_MSP,"EMAIL"
info@agency.com,clean,Valid address,yes,Gmail
hello@agency.com,invalid,Undeliverable,no,Other
```

**Just upload this file directly.** Do not modify it.

## Status Mapping

What ListClean tells us → What we store:

| ListClean Says | We Store | Meaning |
|---|---|---|
| clean | valid | Email is good to send to |
| valid | valid | Email is good to send to |
| invalid | invalid | Email is bad, don't send |
| bad | invalid | Email is bad, don't send |
| risky | retry | Email might be bad, try again later |
| catch-all | retry | Email might be bad, try again later |
| unknown | retry | Email might be bad, try again later |
| duplicate | invalid | Email is a duplicate, skip |

## Troubleshooting

### "Import Successful" but "Rows unmatched: 5"

**This is normal.** It means 5 emails from ListClean aren't in our database.

Possible reasons:
- They were already verified and removed
- They never made it into export (already had status)
- Data sync issue

Action: Review the error list and investigate those specific emails.

### "Import successful" but "Rows matched: 0"

**This is unusual.** None of the emails matched.

Check:
- Did you upload the right file? (from ListClean, not elsewhere)
- Is it a CSV file? (not Excel xlsx)
- Does it have email addresses? (not empty file)

Action: Download the file again from ListClean and try importing again.

### Upload says "File rejected"

Check:
- File is CSV format (not Excel)
- File has email column (named something with "email" in it)
- File has status column (named something with "status" in it)
- File is not corrupted

Action: Try downloading from ListClean again.

## Best Practices

1. **Export weekly:** Keep email validation current
2. **Process promptly:** Import results within 24 hours of export
3. **Monitor statistics:** Watch matched vs unmatched counts
4. **Save files:** Keep a copy of each ListClean result for records
5. **Don't edit:** Never manually modify the ListClean CSV

## Time-Saving Tips

- Export runs in < 30 seconds for most states
- Import runs in < 10 seconds for typical batch
- Total workflow: ~5 minutes per state per week
- Can be done multiple times per week if needed

## Questions?

**Does this create new agencies?**
No. This only updates email validation status on existing email records.

**Does this change /your-agency URLs?**
No. Slugs and URLs are never modified by this process.

**What if an agency has multiple emails?**
Each email updates independently but stays linked to the same agency.

**Is there a risk of data loss?**
No. Only validation_status, validation_reason, and validation_score fields update. Agency data, emails, links are never modified or deleted.

**Can I import multiple files at once?**
No, one at a time. Upload one file, wait for result, then upload next.

**What happens to emails marked "invalid"?**
They're marked but not deleted. You can still see them. They're just marked as non-deliverable.

## Support

For issues:
1. Check the error messages in the result
2. Review file format (is it really CSV?)
3. Try downloading from ListClean again
4. Contact support with the error message

---

**The bottom line: Export → Upload to ListClean → Download → Import back. No manual steps needed.**
