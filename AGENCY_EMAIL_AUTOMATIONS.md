# Agency Email Automations System

## Overview

The Agency Email Automations system extends Gappsy's availability request handling to support automated email notifications sent directly to agencies. This system is designed to monetize the platform by encouraging unpaid agencies to upgrade to paid tiers, while simultaneously building trust with paid agencies through immediate lead forwarding.

**Key Design Principle**: All agency-facing emails are **disabled by default**. Admin must explicitly toggle each feature on via the control panel at `/wp-admin/agency-email-automations`.

## Architecture

### Three-Layer Safety Model

1. **Global Toggle** (`notification_settings.agency_emails_global.enabled`)
   - Master kill switch for entire system
   - Must be `true` for any agency emails to send
   - Overrides all individual settings

2. **Agency Opt-Out Preferences** (`agency_email_preferences.allow_lead_emails` / `allow_marketing_emails`)
   - Per-agency granular control
   - Two preference types:
     - `allow_lead_emails`: Controls receipt of full lead details (paid agencies)
     - `allow_marketing_emails`: Controls digest/sales emails (unpaid agencies)
   - Defaults to `true` (opt-in by default)
   - Can be changed via unsubscribe link in emails

3. **Request Status** (`agency_availability_requests.agency_email_status`)
   - Tracks email delivery state per request
   - Values: `disabled` (default), `queued`, `sent`, `failed`, `skipped_opted_out`
   - Prevents duplicate sends

### Data Model

#### Core Tables

**`agency_listings`** (NEW)
- Tracks paid status of agencies in each state
- Composite key: `(agency_id, state_slug)`
- Fields:
  - `agency_id` (uuid, PK)
  - `state_slug` (text, PK)
  - `listing_tier` (text): `'free'` | `'standard'` | `'spotlight'` | `'top25'`
  - `paid_active` (boolean): `true` if tier is paid and currently active
  - `created_at` (timestamp)
  - `updated_at` (timestamp)

**`agency_email_preferences`** (NEW)
- Stores per-agency email preferences and unsubscribe token
- Primary key: `agency_id`
- Fields:
  - `agency_id` (uuid, PK)
  - `email` (text): Contact email for agency
  - `allow_lead_emails` (boolean, default `true`): Opt-in for lead forwarding
  - `allow_marketing_emails` (boolean, default `true`): Opt-in for digests/sales
  - `unsub_token` (text): Unique token for one-click unsubscribe (uuid)
  - `created_at` (timestamp)
  - `updated_at` (timestamp)

**`agency_email_events`** (NEW)
- Comprehensive audit log of all email send attempts
- Primary key: `id` (uuid)
- Fields:
  - `id` (uuid, PK)
  - `agency_id` (uuid): Target agency
  - `request_id` (uuid, nullable): Associated availability request
  - `event_type` (text): `'lead_forward_paid'` | `'sales_unpaid_single'` | `'digest_weekly'`
  - `to_email` (text): Email address email was sent to
  - `subject` (text): Email subject line
  - `status` (text): `'sent'` | `'failed'` | `'skipped'` | `'skipped_opted_out'`
  - `error` (text, nullable): Error message if status is `'failed'`
  - `metadata` (jsonb): Additional context (mode, state_slug, count, etc.)
  - `created_at` (timestamp)

#### Extended Tables

**`agency_availability_requests`** (EXTENDED)
- Added fields for email automation:
  - `requester_name` (text): Full name of visitor checking availability
  - `requester_email` (text): Email of visitor
  - `requester_phone` (text): Phone of visitor (optional)
  - `requester_company` (text): Company of visitor (optional)
  - `target_agency_id` (uuid): ID of agency being checked
  - `target_agency_email` (text): Email of target agency (at time of request)
  - `routing_decision` (text): `'forward_paid'` | `'no_forward_unpaid'` | `'unknown'` | `'manual_review'`
  - `paid_status_at_time` (text): Snapshot of paid status at request time (`'paid'` | `'unpaid'` | `'unknown'`)
  - `lead_visibility` (text): `'full'` (all details) | `'withheld'` (first name only)
  - `agency_email_status` (text): `'disabled'` (default) | `'queued'` | `'sent'` | `'failed'` | `'skipped_opted_out'`

#### Extended Tables

**`notification_settings`** (EXTENDED)
- Added row for agency email control:
  - `form_type` = `'agency_emails_global'`
  - `enabled` (boolean): Global master toggle (default `false`)
  - Controls all agency-facing emails when `true`

### RLS (Row Level Security)

All new tables have RLS enabled. Access rules:

- **`agency_listings`**: Public SELECT only (no auth required)
- **`agency_email_preferences`**: Service role full access only
- **`agency_email_events`**: Service role full access only
- **Extended columns on `agency_availability_requests`**: Service role full access only

No authenticated user can access these tables directly.

## Edge Functions

### `send-agency-availability-email`

Sends immediate notification email when availability is checked.

**Endpoint**: `POST /functions/v1/send-agency-availability-email`

**Request Body**:
```json
{
  "request_id": "uuid-of-availability-request",
  "mode": "production" | "test" | "preview"
}
```

**Response**:
```json
{
  "ok": true,
  "status": "sent" | "skipped" | "skipped_opted_out" | "failed",
  "reason": "..." (if skipped/failed),
  "error": null | "error message"
}
```

**Logic Flow**:

1. Load availability request by `request_id`
2. Extract routing decision (`forward_paid` vs `no_forward_unpaid`)
3. Check global toggle (`agency_emails_global.enabled`)
   - If `false` and mode ≠ `test`, return `{ ok: true, status: "skipped", reason: "global_disabled" }`
4. Load agency preferences by `target_agency_id`
5. Check opt-out preferences based on routing decision:
   - If `forward_paid` and `allow_lead_emails=false`, return `{ ok: true, status: "skipped_opted_out", reason: "lead_emails" }`
   - If `no_forward_unpaid` and `allow_marketing_emails=false`, return `{ ok: true, status: "skipped_opted_out", reason: "marketing_emails" }`
6. Build email HTML (different template for paid vs unpaid)
7. Send via SMTP using `sendEmail()` from `_shared/emailClient.ts`
8. Log event to `agency_email_events` table
9. Update `agency_availability_requests.agency_email_status` to `"sent"` or `"failed"`
10. Return status to caller

**Email Templates**:

**For Paid Agencies** (`forward_paid`):
- Subject: `[Gappsy] New availability request — {STATE} — {REQUESTER_NAME}`
- Body: Full lead details
  - Name, email, phone, company, website, message
  - Direct reply instruction
  - Unsubscribe link
- Color scheme: Blue header (#1d4ed8)

**For Unpaid Agencies** (`no_forward_unpaid`):
- Subject: `[Gappsy] Someone checked your availability on Top-25 {STATE}`
- Body: Limited info + upgrade CTA
  - Only first name ("Someone checked" → "John checked")
  - Message: "We routed this lead elsewhere"
  - Button: "Activate paid listing"
  - Unsubscribe link
- Color scheme: Amber header (#f59e0b)

### `send-weekly-availability-digest`

Sends weekly summary email to unpaid agencies with availability check counts.

**Endpoint**: `POST /functions/v1/send-weekly-availability-digest`

**Request Body**:
```json
{
  "mode": "scheduled" | "preview" | "test",
  "agency_id": "uuid (optional for scheduled to process one agency)",
  "state_slug": "state-name (optional for scheduled to process one state)"
}
```

**Response**:
```json
{
  "ok": true,
  "sent": 42,
  "failed": 3,
  "status": "skipped",
  "reason": "..."
}
```

**Logic Flow**:

1. Check global toggle (`agency_emails_global.enabled`)
   - If `false` and mode ≠ `preview`, skip sending
2. If `agency_id` and `state_slug` provided, send single digest (optional test mode)
3. Otherwise, fetch all agencies with `allow_marketing_emails=true`
4. For each agency:
   - Get list of states with availability checks in last 7 days
   - For each state:
     - Count availability checks from `agency_availability_requests` in last 7 days
     - Build digest email with count
     - Send via SMTP
     - Log to `agency_email_events`
5. Return aggregate stats (sent count, failed count)

**Email Template**:
- Subject: `[Gappsy] {COUNT} availability check(s) this week — Top-25 {STATE}`
- Body:
  - Header: Large count display
  - Message: "{X} potential client(s) checked your availability"
  - Highlight box: "To receive leads directly, upgrade your listing"
  - Button: "Upgrade to get leads"
  - Footer: Unsubscribe link
- Color scheme: Violet header (#7c3aed)

### `email-preferences-api`

Manages agency email preference changes via unsubscribe link.

**Endpoint**: `GET /functions/v1/email-preferences-api?token={unsub_token}`

**Response** (GET):
```json
{
  "ok": true,
  "preferences": {
    "agency_id": "uuid",
    "email": "agency@example.com",
    "allow_lead_emails": true,
    "allow_marketing_emails": true
  }
}
```

or

```json
{
  "ok": false,
  "error": "Invalid or expired token"
}
```

**Endpoint**: `POST /functions/v1/email-preferences-api`

**Request Body**:
```json
{
  "token": "unsub-token",
  "allow_lead_emails": true | false,
  "allow_marketing_emails": true | false
}
```

**Response** (POST):
```json
{
  "ok": true,
  "preferences": { ... }
}
```

or

```json
{
  "ok": false,
  "error": "..."
}
```

**Logic**:
- GET: Load `agency_email_preferences` by `unsub_token`, return preferences
- POST: Validate `unsub_token`, update `allow_lead_emails` and/or `allow_marketing_emails`, return updated preferences

## Admin UI

### Agency Email Automations Page

**Route**: `/wp-admin/agency-email-automations`

**Access**: Admin only (protected by `AdminRoute` wrapper)

**Sections**:

1. **Header Card**
   - Title: "Agency-Facing Email System"
   - Subtitle: "Control automated emails sent to agencies for availability checks."
   - Status badge: Shows "🔴 System DISABLED" or "🟣 System ENABLED"

2. **Global Toggles** (3 sections, all default OFF)
   - **Forward leads to paid agencies**
     - When ON: Send full lead details when visitor checks paid agency
     - Impact: Paid agencies receive full contact info immediately
   - **Sales emails to unpaid agencies**
     - When ON: Send limited info + upgrade CTA when unpaid agency is checked
     - Impact: Unpaid agencies receive "someone checked you" notification
   - **Weekly availability digest**
     - When ON: Send weekly summary to unpaid agencies
     - Impact: Every Sunday, unpaid agencies get count of checks that week

3. **Email Template Preview**
   - Three expandable sections showing email templates:
     - "Paid: Lead Forward" - shows paid agency email
     - "Unpaid: Sales Message" - shows unpaid agency email
     - "Weekly Digest" - shows digest email
   - Each shows subject, from line, and preview of body

4. **Test Email Input**
   - Text field for email address
   - "Send" button to dispatch test email
   - Useful for verifying SMTP configuration

5. **Digest Preview Button**
   - "Run Digest Preview" button
   - Executes digest in preview mode (no emails actually sent)
   - Simulates weekly digest for testing

6. **Save Settings Button**
   - Saves toggle states to `notification_settings` table
   - Shows success/error message

7. **Info Box** (Blue)
   - "All agency-facing emails are disabled by default"
   - "Toggling these settings affects system-wide behavior"
   - "Each agency can opt out via email preferences link"
   - "Every email includes unsubscribe link"

### Email Preferences Page

**Route**: `/email-preferences?token={unsub_token}`

**Access**: Public (no auth required, token-based)

**Sections**:

1. **Header**
   - Icon: Mail envelope
   - Title: "Email Preferences"
   - Subtitle: "Manage how Gappsy communicates with you"

2. **Email Display**
   - Shows the agency's email address loaded from token

3. **Preference Checkboxes**
   - **Receive lead details**
     - Description: "Get full contact information when someone checks your availability (for paid listings)"
     - Checkbox for `allow_lead_emails`
   - **Receive marketing emails**
     - Description: "Receive weekly digests and upgrade offers (for non-paid listings)"
     - Checkbox for `allow_marketing_emails`

4. **Save Button**
   - Calls `email-preferences-api` POST endpoint
   - Shows loading state during save
   - Shows success message: "Preferences saved"

5. **Error Handling**
   - Invalid token: "The link may be invalid or expired"
   - Network error: Shows error message
   - Loading state: Spinner with "Loading your preferences..."

## Integration Points

### Form Submission Flow

When an availability check form is submitted:

1. **Form validation** occurs in React component
2. **`submitForm()` helper called** (`src/lib/forms/submit.ts`)
   - Form type: `'availability_check'`
   - Makes non-blocking API call to `availability-submit`
3. **`availability-submit` edge function**:
   - Creates row in `agency_availability_requests` with all new fields
   - Queries `agency_listings` to determine if target agency is paid
   - Sets `routing_decision` (`forward_paid` or `no_forward_unpaid`)
   - Sets `paid_status_at_time` and `lead_visibility`
   - Sets `agency_email_status` to `'disabled'` (default, not sent yet)
   - Sends internal admin notification immediately (existing behavior)
   - Returns success to frontend
4. **Admin can manually trigger email send** by calling `send-agency-availability-email` with `request_id`
   - OR email sent automatically if system is live and triggers are in place (future)

### Availability Request Lifecycle

```
┌─────────────────────────────────────────────────────────────────┐
│ Visitor submits availability check form                         │
└─────────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────────┐
│ availability-submit edge function:                              │
│ - Query agency_listings for target agency                       │
│ - Set routing_decision (paid vs unpaid)                         │
│ - Create availability_request row with all details              │
│ - Send internal admin notification                              │
│ - Set agency_email_status = 'disabled'                          │
└─────────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────────┐
│ [ADMIN or SCHEDULER triggers]                                   │
│                                                                 │
│ send-agency-availability-email (request_id, mode)               │
│ - Check global toggle (must be enabled)                         │
│ - Check agency opt-outs (lead_emails or marketing_emails)       │
│ - Build email template (paid vs unpaid)                         │
│ - Send via SMTP                                                 │
│ - Log to agency_email_events                                    │
│ - Update agency_email_status = 'sent'/'failed'                  │
└─────────────────────────────────────────────────────────────────┘
```

## Enabling Features Safely

### Step 1: Verify Email System

1. Go to `/wp-admin/email/smtp`
2. Verify SMTP configuration is correct
3. Send test email to admin address
4. Confirm receipt

### Step 2: Test with Preview Emails

1. Go to `/wp-admin/agency-email-automations`
2. View email template previews to understand formatting
3. Enter admin email in "Send Test Email" field
4. Click "Send"
5. Confirm receipt in admin inbox

### Step 3: Enable One Feature at a Time

**To enable lead forwarding**:
1. Go to `/wp-admin/agency-email-automations`
2. Toggle "Forward leads to paid agencies" to ON
3. Click "Save settings"
4. Pick a test request from database (paid agency only)
5. Manually call `send-agency-availability-email` with that `request_id`
6. Verify email received at paid agency email
7. Keep feature ON

**To enable unpaid sales emails**:
1. Go to `/wp-admin/agency-email-automations`
2. Toggle "Sales emails to unpaid agencies" to ON
3. Click "Save settings"
4. Pick a test request with unpaid agency
5. Manually call `send-agency-availability-email`
6. Verify email received at unpaid agency email
7. Test opt-out by clicking unsubscribe link in email
8. Verify can change preferences
9. Keep feature ON

**To enable weekly digests**:
1. Go to `/wp-admin/agency-email-automations`
2. Toggle "Weekly availability digest" to ON
3. Click "Save settings"
4. Click "Run Digest Preview" button
5. Check `agency_email_events` table for preview logs
6. Set up scheduled task to call `send-weekly-availability-digest` with `mode=scheduled` weekly
7. Keep feature ON

## Database Queries

### Check if agency is paid in a state

```sql
SELECT is_agency_paid_in_state('agency-uuid', 'california') AS is_paid;
```

Returns `true` if agency has active paid listing, `false` otherwise.

### View all email events for an agency

```sql
SELECT
  event_type,
  to_email,
  status,
  error,
  created_at
FROM agency_email_events
WHERE agency_id = 'agency-uuid'
ORDER BY created_at DESC;
```

### Find undelivered emails

```sql
SELECT
  aae.id,
  aae.agency_id,
  aae.event_type,
  aae.error,
  aae.created_at
FROM agency_email_events aae
WHERE aae.status = 'failed'
AND aae.created_at > now() - interval '24 hours'
ORDER BY aae.created_at DESC;
```

### View availability requests by routing decision

```sql
SELECT
  id,
  requester_email,
  routing_decision,
  paid_status_at_time,
  lead_visibility,
  agency_email_status,
  created_at
FROM agency_availability_requests
WHERE routing_decision = 'forward_paid'
ORDER BY created_at DESC;
```

## Environment Variables

No new environment variables required. Uses existing:
- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY` (in edge functions)

## Troubleshooting

### Emails not sending despite toggle ON

**Check**:
1. Is `notification_settings` row with `form_type='agency_emails_global'` set to `enabled=true`?
2. Is `agency_email_preferences.allow_lead_emails` or `allow_marketing_emails` set to `true` for that agency?
3. Is `agency_email_preferences.email` populated for that agency?
4. Check `agency_email_events` table for `status='skipped_opted_out'` or `status='failed'` with error message
5. Check SMTP configuration at `/wp-admin/email/smtp`

### Email content not rendering correctly

**Check**:
1. Email client may not support full CSS
2. Verify HTML is properly escaped in edge functions (check for `escHtml()` calls)
3. Test with multiple email clients (Gmail, Outlook, Apple Mail)
4. Check `agency_email_events.metadata` for any rendering issues

### Unsubscribe links not working

**Check**:
1. Is `unsub_token` populated in `agency_email_preferences`?
2. Is email preferences endpoint (`email-preferences-api`) deployed?
3. Try accessing URL directly: `/email-preferences?token={token}`
4. Check browser console for errors
5. Verify token matches record in database

## Future Enhancements

1. **Email Template Customization**: Allow admins to customize email subject/body per event type
2. **Scheduling**: Automatic weekly digest scheduler (currently manual or requires external cron)
3. **Analytics Dashboard**: Track open rates, click rates, unsubscribe rates
4. **A/B Testing**: Test different email subject lines and CTAs
5. **Dynamic Pricing**: Adjust lead forwarding based on agency tier and availability
6. **Lead Routing Intelligence**: Route to multiple agencies based on availability/tier/score

## Compliance Notes

- **CAN-SPAM**: All emails include unsubscribe link and agency address (Gappsy • The Top-25 Marketing Agency Directory)
- **GDPR**: Agencies can opt out from any email link; preferences stored in database
- **Audit Trail**: All send attempts logged in `agency_email_events` with timestamp and outcome
- **Data Minimization**: Lead details only sent to paid agencies; unpaid agencies see minimal info

---

**Last Updated**: 2026-02-19
**Status**: Production Ready (all features disabled by default)
**Maintained By**: Gappsy Engineering
