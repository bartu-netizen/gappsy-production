# ListClean Unknown Diagnostic - Quick Start Guide

**Build ID:** 492tvj3x | **Date:** 2026-03-03

---

## Get Started in 3 Steps

### Step 1: Access the Diagnostic Panel
1. Go to `/wp-admin/email/smartlead`
2. Click the **"ListClean Diagnostic"** tab (new tab added)
3. Default state is New Jersey

### Step 2: Run the Diagnostic
1. Click **"Run Unknown Rows Diagnostic"**
2. Wait ~2 seconds for results
3. View the analysis:
   - **Total Unknown:** All unknown rows in state
   - **Stale Indicators:** Clean bucket + zero attempts = pre-fix misclassification
   - **Real Unknowns:** Unknown status + multiple attempts = genuine ListClean uncertainty
   - **Sample Table:** Top 5 rows with details

### Step 3: Reprocess (Optional)
1. Choose mode:
   - **Sample Mode (5)** - Test reprocess on 5 rows
   - **Full State (All)** - Reprocess all unknowns
2. Click **"Reset & Reprocess Unknown Rows"**
3. Confirm when modal appears
4. Wait for results
5. View before/after report showing:
   - Which rows were reset
   - Snapshots of verification fields
   - Queue processor kicked confirmation

---

## What Gets Fixed

### Pre-Reprocess
```
Email: john@example.com
  validation_status: unknown
  verification_external_status: clean (from bucket fallback)
  verification_bucket_source: clean
  verification_attempt_count: 0  ← ZERO = stale!
  verification_next_retry_at: NULL
```

### Post-Reprocess
```
Email: john@example.com
  validation_status: unknown  (unchanged until queue runs)
  verification_external_status: clean
  verification_bucket_source: clean
  verification_attempt_count: 0
  verification_next_retry_at: NOW  ← RESET TO NOW!
  verification_state: queued
```

### After Queue Processor Runs (1-2 min)
```
Email: john@example.com
  validation_status: valid  ← UPDATED!
  verification_external_status: clean
  verification_bucket_source: clean
  verification_attempt_count: 1  ← INCREMENTED
  verification_next_retry_at: NULL (done)
```

---

## Interpretation Guide

### Stale Unknown Indicators
```
⚠️  Clean bucket + Zero attempts = Stale misclassification from pre-fix
```
These emails are clean but marked unknown due to old bucket fallback logic. Safe to reprocess.

### Real Unknowns
```
🔄 Unknown status + Multiple attempts = Genuine ListClean uncertainty
```
These emails truly can't be determined by ListClean. Will retry up to 6 times.

### High Retry Count
```
⏱️  More than 3 attempts = Stuck in retry loop
```
Email has been retried multiple times. May need manual review if stuck at 6.

---

## Sample Before/After Report

### 5-Row Sample Reprocess Result

| Email | Before Status | Bucket | Attempts | After Bucket | Why |
|-------|---|---|---|---|---|
| john@acme.com | unknown | clean | 0 | clean | Stale, will be valid after queue |
| jane@tech.com | unknown | unknown | 3 | unknown | Real unknown, stays unknown |
| bob@corp.com | unknown | clean | 1 | clean | Stale, will be valid after queue |
| alice@biz.com | unknown | dirty | 2 | dirty | Pre-categorized, stays invalid |
| maria@firm.com | unknown | NULL | 4 | NULL | Truly unknown, stays unknown |

**Conclusion from Sample:**
- Rows 1 & 3: Stale misclassifications → will become "valid" → send-ready
- Rows 2, 4, 5: Real results from ListClean → status won't change

---

## Expected Results

### Example: New Jersey State

**Diagnostic Run:**
```
Total Unknown Rows:       342
Stale Indicators:         87  (25% - clean bucket, 0 attempts)
Real Unknowns:            255 (75% - unknown status, multiple attempts)
High Retry Count:         12  (3%)
```

**Interpretation:**
- ~87 rows are pre-fix misclassifications from bucket fallback bug
- ~255 rows are genuinely uncertain even after ListClean verified them
- ~12 rows stuck in retry loop (may need investigation)

**Action Plan:**
1. Run sample reprocess (5 rows) → test fix
2. Verify before/after report
3. If stale indicators proven, run full state reprocess
4. Wait 1-2 minutes for queue processor
5. Admin refreshes Smartlead dashboard
6. Check "Ready to Sync" count increase

---

## FAQ

### Q: Is reprocessing reversible?
**A:** Yes! It only sets `verification_next_retry_at = NOW()`. Original data preserved.

### Q: What if reprocess fails?
**A:** No data was changed. Just try again. Rows still have all original info.

### Q: How long does reprocess take?
**A:** Immediate for the UI action (sets flag). Queue processor runs 1-2 min later.

### Q: Can I reprocess all states at once?
**A:** No, it's state-filtered by design. Do one state at a time.

### Q: What happens to rows with verification_attempt_count >= 6?
**A:** They're excluded from reprocess (can't exceed 6 attempts by design).

### Q: Will reprocess change eligibility rules for Smartlead?
**A:** No. Only valid emails (clean) are send-ready. Reprocess just fixes mapping.

### Q: Can I run diagnostic multiple times?
**A:** Yes! Each run is read-only. Safe to run as often as needed.

---

## Common Workflows

### Workflow 1: Verify Fix is Working
```
1. Run diagnostic for New Jersey
2. See stale_unknown_indicators > 0 (proof of problem)
3. Run sample reprocess (5 rows)
4. Check before/after report
5. Confirm clean bucket rows were reset
✅ Fix proven effective!
```

### Workflow 2: Full State Recovery
```
1. Run diagnostic to confirm stale indicators exist
2. Set mode to "Full State (All)"
3. Click reprocess, confirm modal
4. Wait 1-2 minutes
5. Admin refreshes Smartlead dashboard
6. Check "Ready to Sync" increased by ~stale_indicator count
✅ All stale rows recovered!
```

### Workflow 3: Monitor Stuck Rows
```
1. Run diagnostic regularly
2. Track high_retry_count trend
3. If stuck rows not decreasing → manual review needed
4. After ListClean API fix or mapping update, run diagnostic again
✅ Track improvement over time!
```

---

## What NOT to Do

❌ Don't reprocess if queue is auto-paused (check credits first)
❌ Don't reprocess rows with attempt_count >= 6 (auto-excluded)
❌ Don't expect validation_status to change immediately (wait 1-2 min)
❌ Don't run full state without checking sample first
❌ Don't forget to refresh Smartlead dashboard to see new stats

---

## Support

**Issue:** Diagnostic shows 0 unknowns
- ✅ Normal! New Jersey might have all unknowns resolved. Try different state.

**Issue:** Reprocess kicked but no change after 5 minutes
- ✅ Check queue status: `listclean_monitor_state.queue_auto_paused`
- ✅ Manually kick queue: `/functions/v1/other-agencies-listclean-process-queue`

**Issue:** Before/after report shows no row differences
- ✅ This is normal! Status unchanged until queue runs.
- ✅ Only `verification_next_retry_at` changed (not in report).
- ✅ Wait 1-2 min, refresh Smartlead, check "Ready to Sync" count.

---

## Key Metrics to Watch

| Metric | What It Means | Action |
|--------|---|---|
| stale_unknown_indicators | Pre-fix misclassifications | Reprocess these |
| potential_real_unknown | Genuine ListClean unknowns | Monitor retry progress |
| high_retry_count | Stuck rows (>3 attempts) | Investigate if >6 |
| total_unknown_count | Total unknowns in state | Baseline for comparison |

---

## After Reprocessing

### Check Results (1-2 min later)

1. **Go to Smartlead Dashboard overview**
2. **Look at "Ready to Sync" KPI card**
3. **Should increase by ~stale_indicator_count**
4. **Refresh Smartlead stats to confirm**

### Example

Before reprocess:
```
Ready to Sync: 1,234 emails
```

After diagnostic shows 87 stale indicators, reprocess 87 rows, wait 2 min:
```
Ready to Sync: 1,321 emails  ← +87 increase!
```

✅ **Proof:** Stale misclassifications fixed!

---

## Next Steps

1. **Visit:** `/wp-admin/email/smartlead`
2. **Click:** "ListClean Diagnostic" tab
3. **Run:** Diagnostic for New Jersey
4. **Review:** Stale vs real unknowns count
5. **Sample:** Reprocess 5 rows
6. **Verify:** Before/after report
7. **Full:** Run full state if sample successful

---

**Build ID:** 492tvj3x
**Deployed:** 2026-03-03
**Status:** ✅ Ready to use

