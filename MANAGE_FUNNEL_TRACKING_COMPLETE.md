# Manage Funnel Tracking & Notification System — Implementation Complete

## Overview

A complete tracking and email notification system for the manage/delete funnel is now operational. This system treats the manage/delete flow as a full-featured funnel with comprehensive visibility, deduplication, and admin notifications.

---

## Event Types (Canonical)

Four canonical events track the complete manage funnel lifecycle:

### 1. `manage_funnel_opened`
- **Triggered**: User lands on `/manage-listing` page successfully
- **Deduplication**: Max once per 24 hours per agency
- **Email Filter**: ONLY sent if `engaged_leads_count > 0` OR `total_interactions > 0`
- **Purpose**: Alert admin when agencies with engagement open management page

### 2. `manage_remove_started`
- **Triggered**: User clicks "remove my listing" OR enters recovery step
- **Deduplication**: None (always sent)
- **Purpose**: High-intent signal that agency wants to remove listing

### 3. `manage_recovered`
- **Triggered**: User clicks "keep visible" OR "activate listing"
- **Deduplication**: None (always sent)
- **Recovery Types**:
  - `keep_visible` — Keep free listing
  - `activate` — Navigate to activation funnel
- **Purpose**: Track successful recovery from removal intent

### 4. `manage_remove_confirmed`
- **Triggered**: User confirms final removal
- **Deduplication**: None (always sent)
- **Purpose**: Track confirmed listing removals

---

## Files Changed

### New Files Created

1. **`src/utils/manageFunnelTracking.ts`**
   - Tracking utility with canonical event types
   - Type-safe event interface
   - Integration with reliablePost transport

2. **`supabase/functions/manage-funnel-track/index.ts`**
   - Edge function for event logging and notifications
   - Deduplication logic for `manage_funnel_opened`
   - Rich HTML email templates with engagement metrics
   - Error handling and logging

3. **`supabase/migrations/20260404160000_create_manage_funnel_tracking.sql`**
   - `manage_funnel_events` table
   - `manage_funnel_notification_log` table
   - Email notification settings seed data
   - Indexes for analytics queries

### Modified Files

1. **`src/pages/ManageListingPage.tsx`**
   - Replaced old tracking with manage funnel events
   - Added engagement metrics to all tracking calls
   - Tracks on mount (once per session with dedupe)
   - Tracks user actions (remove start, recovery, confirmation)

2. **`src/pages/WpAdminFunnelAnalyticsPage.tsx`**
   - Added "Manage" to funnel filter dropdowns
   - Added purple color for manage funnel visualization
   - Manage events now visible in analytics dashboard

---

## Database Schema

### `manage_funnel_events`

```sql
CREATE TABLE manage_funnel_events (
  id                    uuid PRIMARY KEY,
  event_type            text NOT NULL CHECK (event_type IN (
    'manage_funnel_opened',
    'manage_remove_started',
    'manage_recovered',
    'manage_remove_confirmed'
  )),
  agency_id             text NOT NULL,
  agency_slug           text NULL,
  agency_name           text NOT NULL,
  state_slug            text NULL,
  token                 text NULL,
  lead_key              text NULL,
  source                text DEFAULT 'unknown',
  listing_type          text NULL,

  -- Engagement context
  engaged_leads_count   int  DEFAULT 0,
  total_interactions    int  DEFAULT 0,
  engagement_hint       text NULL,

  -- Event-specific data
  recovery_type         text NULL,
  entry_reason          text NULL,

  -- Request metadata
  page_path             text NULL,
  referrer              text NULL,
  user_agent            text NULL,
  request_ip            text NULL,
  metadata              jsonb DEFAULT '{}'::jsonb,
  created_at            timestamptz DEFAULT now()
);
```

**Indexes:**
- `idx_mfe_agency_id` — Fast agency lookups
- `idx_mfe_event_type` — Filter by event type
- `idx_mfe_created_at` — Time-range queries
- `idx_mfe_agency_event` — Agency + event + time
- `idx_mfe_state_event` — State + event + time

**RLS:**
- Anyone can INSERT (anonymous tracking)
- Service role can SELECT (admin analytics)

### `manage_funnel_notification_log`

```sql
CREATE TABLE manage_funnel_notification_log (
  id                    uuid PRIMARY KEY,
  notification_type     text NOT NULL,
  agency_id             text NOT NULL,
  event_id              uuid NULL REFERENCES manage_funnel_events(id),
  to_emails             text NOT NULL,
  subject               text NOT NULL,
  status                text NOT NULL CHECK (status IN ('sent', 'failed', 'skipped')),
  skip_reason           text NULL,
  provider              text NULL,
  provider_message_id   text NULL,
  provider_response     jsonb NULL,
  error_message         text NULL,
  payload               jsonb NULL,
  created_at            timestamptz DEFAULT now()
);
```

**Indexes:**
- `idx_mfnl_agency_type_created` — Deduplication checks
- `idx_mfnl_created_at` — Audit queries
- `idx_mfnl_status` — Status filtering

**RLS:**
- Service role full access

---

## Tracking Implementation

### Where Events Fire

#### `manage_funnel_opened`
**Location**: `ManageListingPage.tsx` useEffect (line 106-126)
**Triggers**: Page load after token validation and funnel summary fetch
**Includes**:
- Full agency context
- Engagement metrics (engaged_leads_count, total_interactions, engagement_hint)
- Listing type
- Current management status

**Deduplication**:
- Frontend: Fires once per mount
- Backend: Max once per 24h per agency (via notification log)

**Email Filter**: Only sends if engagement > 0

#### `manage_remove_started`
**Location**: `ManageListingPage.tsx` handleRemoveStart (line 182-201)
**Triggers**: User clicks "Remove my listing permanently"
**Includes**:
- Full agency context
- Engagement metrics
- Entry reason: 'remove_me'

**Deduplication**: None (always sent)

#### `manage_recovered`
**Location**: `ManageListingPage.tsx`
- handleKeepVisible (line 131-156)
- handleActivate (line 158-180)

**Triggers**:
- "Keep my listing visible for free" button
- "Activate and receive inquiries" button

**Includes**:
- Full agency context
- Engagement metrics
- Recovery type: 'keep_visible' or 'activate'

**Deduplication**: None (always sent)

#### `manage_remove_confirmed`
**Location**: `ManageListingPage.tsx` handleRemoveConfirm (line 208-236)
**Triggers**: User confirms final removal in recovery step
**Includes**:
- Full agency context
- Engagement metrics
- Availability checks (last 30d)
- Unique requesters (last 30d)

**Deduplication**: None (always sent)

---

## Email Notifications

### Email Structure (All Events)

**Recipient**: `bartu@gappsy.com` (configurable via `email_notification_settings`)

**Subject Line Templates**:
- `manage_funnel_opened`: "Manage funnel opened — {agency_name}"
- `manage_remove_started`: "Removal intent — {agency_name}"
- `manage_recovered`: "Recovered from removal funnel — {agency_name}"
- `manage_remove_confirmed`: "Listing removed — {agency_name}"

**Email Content**:
1. **Header** — Event title with badge (Funnel Entry / High Intent / Recovery / Removed)
2. **Description** — Context-specific message
3. **Agency Info Card**:
   - Agency name
   - State
   - Listing type (top25 / other / free)
   - Source (smartlead / direct / unknown)
   - Recovery type (if applicable)
4. **Engagement Metrics Card** (if `engaged_leads_count > 0` OR `total_interactions > 0`):
   - Engaged leads count
   - Total interactions
   - Engagement hint text
5. **Action Buttons**:
   - View Profile → `/your-agency/{slug}`
   - Manage Listing → `/manage-listing/{slug}?c={token}` (if token exists)

**HTML Template**: Professional gradient header, responsive layout, clear visual hierarchy

### Deduplication Logic

**Implementation**: `manage-funnel-track/index.ts` lines 137-156

```typescript
if (event_type === "manage_funnel_opened") {
  // Filter: only send if engaged_leads_count > 0 OR total_interactions > 0
  if ((engaged_leads_count || 0) === 0 && (total_interactions || 0) === 0) {
    shouldSend = false;
    skipReason = "no_engagement";
  } else {
    // Dedupe: max once per 24 hours per agency
    const recentlySent = await checkRecentNotification(supabase, agency_id, event_type, 24);
    if (recentlySent) {
      shouldSend = false;
      skipReason = "deduped_24h";
    }
  }
}
```

**Query**: Checks `manage_funnel_notification_log` for recent `status='sent'` within 24h window

**Result**:
- **Sent**: Email delivered, logged as 'sent'
- **Skipped**: Logged with reason ('no_engagement' or 'deduped_24h')
- **Failed**: Email error, logged as 'failed' with error message

---

## Analytics Integration

### Dashboard Access

**Path**: `/wp-admin/analytics/agency-funnel`

**Filter Options**:
- Funnel Type dropdown includes "Manage"
- Quick filter chips include "Manage"
- Color: Purple (`bg-purple-500`)

### Queryable Metrics

Via `manage_funnel_events` table:

1. **Funnel Entry Rate**
   - `WHERE event_type = 'manage_funnel_opened'`
   - Group by: state_slug, listing_type, source

2. **Removal Intent Rate**
   - `WHERE event_type = 'manage_remove_started'`
   - Measure: % of entries that start removal

3. **Recovery Rate**
   - `WHERE event_type = 'manage_recovered'`
   - Measure: % of removal intents that recover
   - Split by: recovery_type (keep_visible vs activate)

4. **Confirmed Removal Rate**
   - `WHERE event_type = 'manage_remove_confirmed'`
   - Measure: % of removal intents that complete

5. **Engagement Correlation**
   - Join with engagement metrics
   - Analyze: Does higher engagement lead to more recoveries?

### Example Analytics Queries

```sql
-- Manage funnel conversion: entry → recovery
SELECT
  COUNT(CASE WHEN event_type = 'manage_funnel_opened' THEN 1 END) as entries,
  COUNT(CASE WHEN event_type = 'manage_recovered' THEN 1 END) as recoveries,
  COUNT(CASE WHEN event_type = 'manage_remove_confirmed' THEN 1 END) as confirmed_removals
FROM manage_funnel_events
WHERE created_at >= NOW() - INTERVAL '30 days';

-- Recovery rate by listing type
SELECT
  listing_type,
  COUNT(CASE WHEN event_type = 'manage_remove_started' THEN 1 END) as removal_intents,
  COUNT(CASE WHEN event_type = 'manage_recovered' THEN 1 END) as recoveries,
  ROUND(
    100.0 * COUNT(CASE WHEN event_type = 'manage_recovered' THEN 1 END) /
    NULLIF(COUNT(CASE WHEN event_type = 'manage_remove_started' THEN 1 END), 0),
    2
  ) as recovery_rate_pct
FROM manage_funnel_events
WHERE created_at >= NOW() - INTERVAL '30 days'
GROUP BY listing_type;

-- Engagement impact on recovery
SELECT
  CASE
    WHEN engaged_leads_count >= 5 THEN '5+ engaged leads'
    WHEN engaged_leads_count >= 1 THEN '1-4 engaged leads'
    ELSE '0 engaged leads'
  END as engagement_tier,
  COUNT(CASE WHEN event_type = 'manage_remove_started' THEN 1 END) as removal_intents,
  COUNT(CASE WHEN event_type = 'manage_recovered' THEN 1 END) as recoveries
FROM manage_funnel_events
WHERE created_at >= NOW() - INTERVAL '30 days'
GROUP BY engagement_tier
ORDER BY MIN(engaged_leads_count) DESC;
```

---

## Safety Guarantees

### No Breaking Changes

✅ **Smart-next-resolver**: Untouched (routing order fix deployed separately)
✅ **Smartlead export**: Untouched
✅ **Top 25 logic**: Untouched
✅ **Existing funnel tracking**: Untouched (your_agency, availability, etc.)
✅ **KPI calculations**: Untouched

### Email Spam Prevention

✅ **Deduplication**: `manage_funnel_opened` max once per 24h per agency
✅ **Engagement filter**: Only sends if agency has engagement
✅ **Notification log**: Full audit trail with skip reasons
✅ **RLS**: Service role only for notification table
✅ **Error handling**: Failed emails logged, don't crash function

### Data Integrity

✅ **Event validation**: CHECK constraints on event_type
✅ **Required fields**: agency_id, agency_name, event_type are NOT NULL
✅ **Anonymous tracking**: Anyone can insert events (no auth barrier)
✅ **Admin-only reads**: Service role RLS for analytics queries
✅ **Foreign key**: notification_log → manage_funnel_events

---

## Verification Steps

### 1. Event Logging

```bash
# Check events are being inserted
supabase db query "
  SELECT event_type, agency_name, engaged_leads_count, created_at
  FROM manage_funnel_events
  ORDER BY created_at DESC
  LIMIT 10;
"
```

### 2. Email Notifications

```bash
# Check notification log
supabase db query "
  SELECT notification_type, agency_id, status, skip_reason, created_at
  FROM manage_funnel_notification_log
  ORDER BY created_at DESC
  LIMIT 10;
"
```

### 3. Deduplication

```bash
# Verify 24h dedupe window
supabase db query "
  SELECT agency_id, COUNT(*) as notification_count
  FROM manage_funnel_notification_log
  WHERE notification_type = 'manage_funnel_opened'
    AND status = 'sent'
    AND created_at >= NOW() - INTERVAL '24 hours'
  GROUP BY agency_id
  HAVING COUNT(*) > 1;
"
# Should return 0 rows
```

### 4. Analytics Dashboard

1. Navigate to `/wp-admin/analytics/agency-funnel`
2. Select "Manage" from funnel filter
3. Verify events appear in timeline
4. Check purple badge appears for manage funnel

### 5. End-to-End Test

1. Open `/manage-listing/{slug}?c={token}` with valid token
2. Verify `manage_funnel_opened` event logged
3. Check email sent (if engagement > 0)
4. Click "Remove my listing permanently"
5. Verify `manage_remove_started` event + email
6. Click "Keep my listing visible for free"
7. Verify `manage_recovered` event + email
8. Navigate back, click remove again, confirm
9. Verify `manage_remove_confirmed` event + email

---

## Build Verification

```bash
npm run build
```

✅ **TypeScript**: No errors
✅ **SEO Checks**: 52/52 passed
✅ **Forbidden Keywords**: Clean
✅ **Build Output**: Success

**Build ID**: `t38pkawn`
**Timestamp**: `2026-04-04T15:37:34.342Z`

---

## Production Readiness Checklist

- [x] Database schema migrated
- [x] Edge function deployed
- [x] Tracking utility implemented
- [x] Frontend tracking integrated
- [x] Email templates created
- [x] Deduplication logic verified
- [x] Analytics dashboard updated
- [x] RLS policies configured
- [x] Indexes created
- [x] Build passes
- [x] No breaking changes

---

## Admin Quick Reference

### View Recent Manage Funnel Events

```sql
SELECT
  event_type,
  agency_name,
  state_slug,
  listing_type,
  engaged_leads_count,
  recovery_type,
  created_at
FROM manage_funnel_events
WHERE created_at >= NOW() - INTERVAL '7 days'
ORDER BY created_at DESC;
```

### Check Email Notification Status

```sql
SELECT
  notification_type,
  agency_id,
  status,
  skip_reason,
  error_message,
  created_at
FROM manage_funnel_notification_log
WHERE created_at >= NOW() - INTERVAL '7 days'
ORDER BY created_at DESC;
```

### Disable Notifications for Event Type

```sql
UPDATE email_notification_settings
SET is_enabled = false
WHERE notification_type = 'manage_funnel_opened';
```

### Change Recipient Email

```sql
UPDATE email_notification_settings
SET recipient_emails = 'your-email@gappsy.com'
WHERE notification_type IN (
  'manage_funnel_opened',
  'manage_remove_started',
  'manage_recovered',
  'manage_remove_confirmed'
);
```

---

## Summary

The manage/delete funnel is now a **first-class tracked funnel** with:

1. **Full event tracking** across all steps
2. **Rich admin notifications** with engagement context
3. **Smart deduplication** to prevent email spam
4. **Analytics integration** for conversion analysis
5. **Production-safe implementation** with no breaking changes

This system provides complete visibility into negative-intent funnels and recovery opportunities without adding noise to admin workflows.
