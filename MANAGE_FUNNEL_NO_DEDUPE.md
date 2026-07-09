# Manage Funnel: Deduplication Removed — Always Send Emails

## Critical Change Applied

**manage_funnel_opened** now **ALWAYS** triggers admin email notifications.

All suppression logic has been removed.

---

## What Was Removed

### 1. 24-Hour Deduplication

**BEFORE:**
```typescript
if (event_type === "manage_funnel_opened") {
  const recentlySent = await checkRecentNotification(supabase, agency_id, event_type, 24);
  if (recentlySent) {
    shouldSend = false;
    skipReason = "deduped_24h";
  }
}
```

**AFTER:**
```typescript
// No deduplication
const shouldSend = true;
```

### 2. Engagement-Based Filtering

**BEFORE:**
```typescript
if ((engaged_leads_count || 0) === 0 && (total_interactions || 0) === 0) {
  shouldSend = false;
  skipReason = "no_engagement";
}
```

**AFTER:**
```typescript
// No engagement filtering
const shouldSend = true;
```

---

## New Behavior

### For manage_funnel_opened:

✅ **Every page load → Email sent**
- No time-window checks
- No engagement thresholds
- No suppression of any kind

### For other events (unchanged):

✅ **manage_remove_started** — Always sent
✅ **manage_recovered** — Always sent
✅ **manage_remove_confirmed** — Always sent

---

## File Modified

**`supabase/functions/manage-funnel-track/index.ts`** (lines 340-344)

**Old Logic:**
```typescript
// ── 3. Apply deduplication for manage_funnel_opened ───────────────────────
let shouldSend = true;
let skipReason: string | null = null;

if (event_type === "manage_funnel_opened") {
  // Filter: only send if engaged_leads_count > 0 OR total_interactions > 0
  if ((engaged_leads_count || 0) === 0 && (total_interactions || 0) === 0) {
    shouldSend = false;
    skipReason = "no_engagement";
    console.log(`[manage-funnel-track] Skipping manage_funnel_opened: no engagement for ${agency_id}`);
  } else {
    // Dedupe: max once per 24 hours
    const recentlySent = await checkRecentNotification(supabase, agency_id, event_type, 24);
    if (recentlySent) {
      shouldSend = false;
      skipReason = "deduped_24h";
      console.log(`[manage-funnel-track] Skipping manage_funnel_opened: already sent within 24h for ${agency_id}`);
    }
  }
}
```

**New Logic:**
```typescript
// ── 3. No filtering or deduplication ───────────────────────────────────────
// All manage funnel events trigger immediate email notifications
// No suppression, no deduplication, no engagement filtering
const shouldSend = true;
const skipReason: string | null = null;
```

---

## Verification

### 1. Edge Function Deployed

✅ `manage-funnel-track` edge function deployed successfully
✅ JWT verification: disabled (public tracking)

### 2. Build Status

✅ TypeScript compilation: Clean
✅ SEO checks: 52/52 passed
✅ Forbidden keywords: Clean
✅ Build ID: `4ghguqyp`

### 3. Other Event Types Unchanged

✅ `manage_remove_started` — Still always sends
✅ `manage_recovered` — Still always sends
✅ `manage_remove_confirmed` — Still always sends

### 4. Database Schema Unchanged

✅ `manage_funnel_events` table: Untouched
✅ `manage_funnel_notification_log` table: Untouched
✅ RLS policies: Untouched
✅ Indexes: Untouched

### 5. Email Formatting Unchanged

✅ HTML templates: Untouched
✅ Subject lines: Untouched
✅ Engagement metrics display: Untouched
✅ Action buttons: Untouched

### 6. Logging Unchanged

✅ Event logging: Still captures all events
✅ Notification log: Still records all sends
✅ Status tracking: Still tracks sent/failed/skipped
✅ Error handling: Still logs errors

---

## Expected Behavior

### Test Scenario 1: First Page Load

**Action:** User opens `/manage-listing/{slug}?c={token}`

**Result:**
1. ✅ Event logged to `manage_funnel_events`
2. ✅ Email sent to `bartu@gappsy.com`
3. ✅ Notification logged as `status='sent'`

### Test Scenario 2: Second Page Load (Same Agency, Same Day)

**Action:** Same user refreshes page 10 minutes later

**Result:**
1. ✅ Event logged to `manage_funnel_events` (new row)
2. ✅ Email sent again (no dedupe)
3. ✅ Notification logged as `status='sent'` (new row)

### Test Scenario 3: Multiple Page Loads

**Action:** User opens page 5 times in one hour

**Result:**
1. ✅ 5 events logged
2. ✅ 5 emails sent
3. ✅ 5 notification log entries

### Test Scenario 4: Zero Engagement Agency

**Action:** Agency with 0 engaged leads, 0 interactions opens page

**OLD BEHAVIOR:** Email skipped (no_engagement)
**NEW BEHAVIOR:** ✅ Email sent

### Test Scenario 5: High Engagement Agency

**Action:** Agency with 10 engaged leads, 50 interactions opens page

**OLD BEHAVIOR:** Email sent (passes engagement filter)
**NEW BEHAVIOR:** ✅ Email sent (same result, different reason)

---

## Database Impact

### Notification Log Growth

**Before:** 1 notification per agency per 24h (max)
**After:** 1 notification per page load

**Example:**
- Agency opens page 3x in one day
- **Before:** 1 email, 2 skipped logs
- **After:** 3 emails, 3 sent logs

### Storage Estimates

**Assumption:** 100 manage page opens per day

**Before:**
- ~50 emails/day (50% pass engagement filter, rest deduped)
- ~100 log rows/day

**After:**
- ~100 emails/day
- ~100 log rows/day

**Growth:** +50 emails/day, same log volume

---

## Why This Change?

### Problem with Deduplication

1. **False Negatives**: High-intent signals were suppressed
2. **Timing Issues**: 24h window arbitrary, missed critical opens
3. **Engagement Threshold**: Zero-engagement agencies still high-value

### Problem with Engagement Filtering

1. **Data Lag**: Engagement metrics update async
2. **Early Opens**: First opens often have zero engagement
3. **False Signal**: "No engagement" doesn't mean "no value"

### New Philosophy

**Every manage page open is a signal.**

If an agency owner takes the time to open `/manage-listing`, we want to know:
- Who opened it
- When they opened it
- What their listing status is
- What their engagement looks like (for context)

**No suppression = Full visibility**

---

## Admin Email Volume

### Expected Increase

**Conservative Estimate:** +50-100 emails/day
**Peak Estimate:** +200-300 emails/day

### Email Management

**If volume too high:**
1. Use email filters/rules
2. Create digest system (separate feature)
3. Add manual opt-out per event type
4. Use notification preferences UI

**Current Setup:**
- Single recipient: `bartu@gappsy.com`
- No digest option
- Manual disable via `email_notification_settings` table

---

## Safety Guarantees

### What Stayed Safe

✅ **No breaking changes** — Other funnels untouched
✅ **No data loss** — All events still logged
✅ **No routing changes** — Smart routing untouched
✅ **No KPI changes** — Analytics queries untouched
✅ **No schema changes** — Database structure unchanged

### What Changed (Safely)

✅ **Email frequency** — Increased (expected)
✅ **Notification logic** — Simplified (safer)
✅ **Skip reasons** — No longer used for manage_funnel_opened

---

## Rollback Plan

If email volume becomes unmanageable:

### Option 1: Re-enable 24h Dedupe

```typescript
if (event_type === "manage_funnel_opened") {
  const recentlySent = await checkRecentNotification(supabase, agency_id, event_type, 24);
  if (recentlySent) {
    shouldSend = false;
    skipReason = "deduped_24h";
  }
}
```

### Option 2: Re-enable Engagement Filter

```typescript
if (event_type === "manage_funnel_opened") {
  if ((engaged_leads_count || 0) === 0 && (total_interactions || 0) === 0) {
    shouldSend = false;
    skipReason = "no_engagement";
  }
}
```

### Option 3: Disable Notification Type

```sql
UPDATE email_notification_settings
SET is_enabled = false
WHERE notification_type = 'manage_funnel_opened';
```

---

## Summary

**Status:** ✅ Deployed and verified

**Change:** Removed all suppression logic for `manage_funnel_opened`

**Result:** Every page load → Email sent

**Impact:**
- ✅ Full visibility into manage funnel
- ✅ No missed signals
- ⚠️ Higher email volume (manageable)

**Safety:** No breaking changes, easy rollback

**Build:** Passing (ID: `4ghguqyp`)

---

## Admin Quick Commands

### Check Recent Emails

```sql
SELECT
  notification_type,
  agency_id,
  status,
  subject,
  created_at
FROM manage_funnel_notification_log
WHERE notification_type = 'manage_funnel_opened'
  AND created_at >= NOW() - INTERVAL '1 day'
ORDER BY created_at DESC;
```

### Count Emails by Status

```sql
SELECT
  status,
  COUNT(*) as count
FROM manage_funnel_notification_log
WHERE notification_type = 'manage_funnel_opened'
  AND created_at >= NOW() - INTERVAL '7 days'
GROUP BY status;
```

### Disable If Needed

```sql
UPDATE email_notification_settings
SET is_enabled = false
WHERE notification_type = 'manage_funnel_opened';
```
