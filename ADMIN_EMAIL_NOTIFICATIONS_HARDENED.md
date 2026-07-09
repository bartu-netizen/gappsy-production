# Admin Email Notifications Hardened - Complete Summary

**Date:** 2026-03-19
**Status:** ✅ PRODUCTION READY

---

## Executive Summary

Both critical admin notification flows have been **hardened with 3-tier emergency fallback** so they can **NEVER silently fail** due to empty configuration.

**What was fragile:**
- Both notification systems would silently skip emails if `recipient_emails` in settings was blank
- No fallback mechanism existed beyond optional `SMTP_INTERNAL_EMAIL` env var
- If settings were misconfigured, admin would receive zero notifications with no warning

**What is now bulletproof:**
- 3-tier fallback system: Settings → SMTP_INTERNAL_EMAIL → Emergency hardcoded bartu@gappsy.com
- All email attempts are logged with `recipient_source` metadata showing which tier was used
- DB migration ensures both settings rows exist with safe defaults
- Health check diagnostics endpoint monitors notification system status
- Comprehensive logging shows exactly why emails succeeded, failed, or which fallback tier was used

---

## Root Causes Found

### 1. `/your-agency` Profile Click Notification (FIXED)

**File:** `supabase/functions/your-agency-profile-click/index.ts`

**Before (FRAGILE):**
```typescript
if (recipients.length === 0) {
  console.warn("[your-agency-profile-click] No recipients configured, skipping email");
  return; // ❌ SILENTLY SKIPS - admin never notified!
}
```

**After (HARDENED):**
```typescript
// 3-TIER FALLBACK SYSTEM: Never silently skip admin notifications
// Tier 1: Try configured recipients from DB settings
if (setting?.recipient_emails) {
  recipients = setting.recipient_emails.split(",").map(...).filter(Boolean);
  if (recipients.length > 0) {
    recipientSource = "settings";
  }
}

// Tier 2: Fallback to SMTP_INTERNAL_EMAIL env var
if (recipients.length === 0 && internalEmail) {
  recipients = [internalEmail];
  recipientSource = "smtp_internal_email";
}

// Tier 3: EMERGENCY fallback to hardcoded bartu@gappsy.com
if (recipients.length === 0) {
  recipients = ["bartu@gappsy.com"];
  recipientSource = "emergency_hardcoded_fallback";
  console.warn("[your-agency-profile-click] EMERGENCY FALLBACK: Using hardcoded recipient");
}
// Email ALWAYS sent to at least bartu@gappsy.com
```

---

### 2. Check Availability Notification (FIXED)

**File:** `supabase/functions/submit-and-notify/index.ts`

**Before (FRAGILE):**
```typescript
const recipients = recipientsRaw.split(",").map(...).filter(Boolean);

if (enabled && recipients.length > 0) {
  // send email
}
// ❌ If recipients.length === 0, email is silently skipped!
```

**After (HARDENED):**
```typescript
const EMERGENCY_FALLBACK_RECIPIENT = "bartu@gappsy.com";
const SMTP_INTERNAL_EMAIL = Deno.env.get("SMTP_INTERNAL_EMAIL") ?? "";

let recipients = recipientsRaw.split(",").map(...).filter(Boolean);
let recipientSource = "none";

// 3-TIER FALLBACK SYSTEM
if (recipients.length > 0) {
  recipientSource = "settings";
}

if (recipients.length === 0 && SMTP_INTERNAL_EMAIL) {
  recipients = [SMTP_INTERNAL_EMAIL];
  recipientSource = "smtp_internal_email";
}

if (recipients.length === 0) {
  recipients = [EMERGENCY_FALLBACK_RECIPIENT];
  recipientSource = "emergency_hardcoded_fallback";
  console.warn(`[submit-and-notify] ${body.form_type}: EMERGENCY FALLBACK`);
}

if (enabled) {
  // Email ALWAYS sent - recipients guaranteed to have at least 1 entry
}
```

---

## Files Changed

### Edge Functions (Backend)

1. **`supabase/functions/your-agency-profile-click/index.ts`**
   - Added 3-tier emergency fallback
   - Added `recipientSource` tracking
   - Added explicit console logging for each fallback tier
   - Added `recipient_source` to email_notification_logs payload

2. **`supabase/functions/submit-and-notify/index.ts`**
   - Added 3-tier emergency fallback
   - Added `recipientSource` tracking
   - Added explicit console logging for each fallback tier
   - Added `recipient_source` to email_notification_logs payload

3. **`supabase/functions/email-notifications-health/index.ts`** (NEW)
   - Health check diagnostics endpoint
   - Returns status for both critical notification types
   - Shows settings existence, recipients, recent logs, success/failure counts
   - Flags configuration issues with "healthy" | "warning" | "critical" status

### Database Migrations

4. **`supabase/migrations/20260319_ensure_critical_notification_settings.sql`**
   - Ensures `email_notification_settings` rows exist for both notification types
   - Sets recipient_emails to `bartu@gappsy.com` if blank/null
   - Enables both notification types by default
   - Uses `ON CONFLICT DO UPDATE` so it's safe to run multiple times

### Frontend (No Changes)

- Frontend already fires both notification events correctly
- `YourAgencyProfilePage.tsx` fires profile-click on direct visits (previously fixed)
- `AvailabilityModal.tsx` calls `submitForm()` which hits `submit-and-notify` endpoint

---

## How The 3-Tier Fallback Works

### Tier 1: DB Settings (Preferred)
```sql
SELECT recipient_emails FROM email_notification_settings
WHERE notification_type = 'your_agency_profile_click';
```
If this returns a non-empty value, those recipients are used.

**Logged as:** `recipient_source: "settings"`

### Tier 2: SMTP_INTERNAL_EMAIL (Env Var Fallback)
If Tier 1 is empty, check for `SMTP_INTERNAL_EMAIL` environment variable.

**Logged as:** `recipient_source: "smtp_internal_email"`

### Tier 3: Emergency Hardcoded (Last Resort)
If both Tier 1 and Tier 2 are empty, use hardcoded `bartu@gappsy.com`.

**Logged as:** `recipient_source: "emergency_hardcoded_fallback"`

**Console warning emitted:**
```
[your-agency-profile-click] EMERGENCY FALLBACK: Using hardcoded recipient: bartu@gappsy.com
```

---

## Verification - How to Test

### Test 1: Direct /your-agency Profile Visit

1. Open browser to: `https://www.gappsy.com/your-agency/some-agency-slug`
2. Expected behavior:
   - Row inserted in `your_agency_profile_clicks` table
   - Email sent to bartu@gappsy.com (or configured recipients)
   - Row visible in `/wp-admin/submissions?type=your_agency_profile_clicks`
   - Log row in `email_notification_logs` with status='sent'
   - Log payload includes `recipient_source` field

**Verify in wp-admin:**
- Go to `/wp-admin/submissions`
- Filter by "Profile Clicks" tab
- See the new entry with timestamp

**Verify email log:**
```sql
SELECT created_at, status, to_emails, payload->>'recipient_source' as recipient_source
FROM email_notification_logs
WHERE notification_type = 'your_agency_profile_click'
ORDER BY created_at DESC
LIMIT 5;
```

### Test 2: Search and Click Profile

1. Go to `https://www.gappsy.com/your-agency`
2. Search for an agency
3. Click a result
4. Same expected behavior as Test 1

### Test 3: Check Availability Submission

1. Go to any state page (e.g., `/marketing-agencies-in-new-jersey-united-states/`)
2. Click "Check Availability" on any agency
3. Fill out and submit the form
4. Expected behavior:
   - Row inserted in `agency_availability_requests` table
   - Email sent to bartu@gappsy.com (or configured recipients)
   - Row visible in `/wp-admin/submissions?type=availability_check`
   - Log row in `email_notification_logs` with status='sent'
   - Log payload includes `recipient_source` field

**Verify in wp-admin:**
- Go to `/wp-admin/submissions`
- Filter by "Availability Checks" tab
- See the new entry

**Verify email log:**
```sql
SELECT created_at, status, to_emails, payload->>'recipient_source' as recipient_source
FROM email_notification_logs
WHERE notification_type = 'availability_check'
ORDER BY created_at DESC
LIMIT 5;
```

### Test 4: Emergency Fallback Trigger

To test the emergency fallback, temporarily blank out recipients:

```sql
-- Temporarily blank out recipients (DO NOT RUN IN PRODUCTION WITHOUT PLANNING)
UPDATE email_notification_settings
SET recipient_emails = ''
WHERE notification_type = 'your_agency_profile_click';
```

Then trigger a profile click. Check logs:

```sql
SELECT payload->>'recipient_source' as source, to_emails
FROM email_notification_logs
WHERE notification_type = 'your_agency_profile_click'
ORDER BY created_at DESC LIMIT 1;
```

**Expected result:**
- `source` = `"smtp_internal_email"` if SMTP_INTERNAL_EMAIL env var is set
- `source` = `"emergency_hardcoded_fallback"` if SMTP_INTERNAL_EMAIL is not set
- `to_emails` = `"bartu@gappsy.com"` in emergency fallback case

**Don't forget to restore:**
```sql
UPDATE email_notification_settings
SET recipient_emails = 'bartu@gappsy.com'
WHERE notification_type = 'your_agency_profile_click';
```

---

## Health Check Diagnostics

### Endpoint

**URL:** `https://[your-supabase-url]/functions/v1/email-notifications-health`

**Method:** GET

**Authentication:** Requires valid Supabase anon key or service role key

### Example Response

```json
{
  "overall_health": "healthy",
  "checked_at": "2026-03-19T19:50:00.000Z",
  "smtp_host_configured": true,
  "smtp_internal_email_configured": true,
  "notifications": [
    {
      "notification_type": "your_agency_profile_click",
      "settings_exist": true,
      "is_enabled": true,
      "recipients_configured": true,
      "recipient_emails": "bartu@gappsy.com",
      "recent_logs_count": 15,
      "recent_sent_count": 15,
      "recent_failed_count": 0,
      "last_sent_at": "2026-03-19T18:45:23.123Z",
      "last_failed_at": null,
      "smtp_env_configured": true,
      "emergency_fallback_available": true,
      "health_status": "healthy",
      "issues": []
    },
    {
      "notification_type": "availability_check",
      "settings_exist": true,
      "is_enabled": true,
      "recipients_configured": true,
      "recipient_emails": "bartu@gappsy.com",
      "recent_logs_count": 8,
      "recent_sent_count": 8,
      "recent_failed_count": 0,
      "last_sent_at": "2026-03-19T17:30:12.456Z",
      "last_failed_at": null,
      "smtp_env_configured": true,
      "emergency_fallback_available": true,
      "health_status": "healthy",
      "issues": []
    }
  ]
}
```

### Health Status Levels

- **healthy** - Everything working, no issues
- **warning** - Minor issues (e.g., notification disabled, or more failures than successes in last 7 days)
- **critical** - Major issues (e.g., settings row missing, all recent notifications failed, no recipients and no fallback configured)

### How to Add to WP-Admin

Add a health check dashboard widget or page that calls this endpoint and displays the results.

**Suggested location:** `/wp-admin/email-notifications` or `/wp-admin/settings`

**Display:**
- Overall health badge (green/yellow/red)
- Per-notification status
- Recent send/fail counts
- Issues list (if any)
- Last successful send timestamp

---

## WP-Admin Visibility

### Current Production Routes

Both submission types are visible in the unified submissions center:

**URL:** `https://www.gappsy.com/wp-admin/submissions`

**Tabs:**
1. "Profile Clicks" - shows `your_agency_profile_clicks` table entries
2. "Availability Checks" - shows `agency_availability_requests` table entries

**Data Source:**
- Backend: `supabase/functions/wpadmin-submissions/index.ts`
- Frontend: `src/pages/WpAdminSubmissionsPage.tsx`

### Email Logs Visibility

Email notification logs are stored in `email_notification_logs` table and can be viewed at:

**URL:** `https://www.gappsy.com/wp-admin/email-notifications` (if implemented)

Or query directly:

```sql
SELECT
  notification_type,
  status,
  to_emails,
  subject,
  payload->>'recipient_source' as recipient_source,
  error_message,
  created_at
FROM email_notification_logs
WHERE notification_type IN ('your_agency_profile_click', 'availability_check')
ORDER BY created_at DESC
LIMIT 20;
```

---

## Database Schema

### email_notification_settings

```sql
notification_type        | text (PK)
is_enabled              | boolean
recipient_emails        | text (comma-separated)
subject_template        | text
body_html              | text
body_text              | text (nullable)
created_at             | timestamptz
updated_at             | timestamptz
```

**Current rows (guaranteed by migration):**
```
your_agency_profile_click | enabled | bartu@gappsy.com
availability_check        | enabled | bartu@gappsy.com
```

### email_notification_logs

```sql
id                     | uuid (PK)
notification_type      | text
is_test               | boolean
to_emails             | text
subject               | text
status                | text (sent/failed/skipped)
provider              | text
provider_message_id   | text (nullable)
error_message         | text (nullable)
payload               | jsonb (includes recipient_source)
request_id            | text (nullable)
stripe_event_id       | text (nullable)
created_at            | timestamptz
```

**Key field in payload:**
```json
{
  "recipient_source": "settings" | "smtp_internal_email" | "emergency_hardcoded_fallback"
}
```

---

## Configuration Requirements

### Environment Variables (Supabase Edge Functions)

**Required for SMTP:**
- `SMTP_HOST` - SMTP server hostname
- `SMTP_PORT` - SMTP port (default 2525)
- `SMTP_USERNAME` - SMTP username
- `SMTP_PASSWORD` - SMTP password

**Optional (Tier 2 fallback):**
- `SMTP_INTERNAL_EMAIL` - Fallback recipient if DB settings are blank

**Note:** Tier 3 emergency fallback (bartu@gappsy.com) is **hardcoded** and requires no configuration.

### Database Settings (Tier 1 preferred)

```sql
INSERT INTO email_notification_settings (notification_type, recipient_emails)
VALUES ('your_agency_profile_click', 'bartu@gappsy.com, another@example.com');
```

Multiple recipients supported (comma-separated).

---

## Maintenance Checklist

### Weekly
- [ ] Check health endpoint: `GET /functions/v1/email-notifications-health`
- [ ] Verify overall_health = "healthy"
- [ ] Confirm recent_sent_count > 0 for both notification types

### Monthly
- [ ] Review failed notification logs
- [ ] Check for excessive use of fallback tiers (should mostly use "settings")
- [ ] Verify SMTP credentials still valid

### After Any Settings Change
- [ ] Test both notification types end-to-end
- [ ] Confirm emails arrive at intended recipients
- [ ] Check email_notification_logs for correct recipient_source

---

## Rollback Plan

If issues arise, rollback is simple:

1. **Edge functions:** Redeploy previous version
   ```bash
   # Supabase CLI (if you have git history)
   git checkout <previous-commit>
   supabase functions deploy your-agency-profile-click
   supabase functions deploy submit-and-notify
   ```

2. **Database migration:** Migrations are additive and safe
   - The migration only ensures rows exist and updates blank recipients
   - No destructive operations
   - Safe to leave in place

3. **Emergency recipient override:**
   ```sql
   UPDATE email_notification_settings
   SET recipient_emails = 'bartu@gappsy.com'
   WHERE notification_type IN ('your_agency_profile_click', 'availability_check');
   ```

---

## Summary: What Can No Longer Break

✅ **Empty recipient_emails in settings** → Tier 2 or Tier 3 fallback kicks in
✅ **Missing SMTP_INTERNAL_EMAIL env var** → Tier 3 emergency fallback to bartu@gappsy.com
✅ **Missing email_notification_settings row** → Migration guarantees rows exist
✅ **Notification accidentally disabled** → Health check flags it as "warning"
✅ **All recent notifications failing** → Health check flags it as "critical"
✅ **Silent failures** → Every email attempt is logged with status + error message
✅ **Unknown recipient source** → Every log includes recipient_source metadata

**Bottom line:** Admin notifications to bartu@gappsy.com can **NEVER** be silently dropped due to configuration issues. At minimum, the emergency hardcoded fallback will always fire.

---

## Questions / Support

If you need to:
- Add more recipients → Update `email_notification_settings.recipient_emails`
- Disable a notification type → Set `is_enabled = false` in `email_notification_settings`
- Check health → Call `/functions/v1/email-notifications-health` endpoint
- Debug email issue → Query `email_notification_logs` table, check `recipient_source` field

**All changes are production-ready and deployed.**
