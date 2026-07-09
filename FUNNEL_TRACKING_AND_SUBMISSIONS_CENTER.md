# Funnel Tracking & Submissions Center

## What Was Built

A complete end-to-end funnel tracking system + upgraded Submissions Center admin UI.

---

## Database (2 new tables)

### `funnel_sessions`
One row per unique lead/session. The "summary" record joined into the Submissions Center list.

Key fields: `funnel_type`, `state_slug`, `lead_email`, `lead_key` (dedup key), `agency_name`, `stage`, `last_event_at`, `dropoff_stage`, `dropoff_path`, `selected_offer`, `selected_upsell`, `checkout_session_id`, `payment_status`, `amount_total`, `currency`.

### `funnel_events`
Append-only timeline. One row per event.

Key fields: `session_id` (FK), `event_name`, `event_stage`, `page_path`, `metadata`.

Both tables: RLS enabled, service role only (no public access).

---

## Edge Functions

### `funnel-track` (public POST, no JWT required)
Called fire-and-forget from the browser. Uses service role to bypass RLS.

**Input:** `{ funnelType, stateSlug, visitorId, leadEmail, leadName, agencyName, agencyId, eventName, eventStage, pagePath, referrer, submissionType, submissionId, selectedOffer, selectedUpsell, checkoutSessionId, paymentIntentId, paymentStatus, amountTotal, currency, metadata }`

**Logic:**
1. Finds or creates a `funnel_sessions` row (match by checkoutSessionId → lead_key → visitorId)
2. Inserts a `funnel_events` row
3. Updates the session summary fields (stage, last_event, dropoff, payment, etc.)

**Output:** `{ ok: true, sessionId, stage }`

### `wpadmin-submissions` (updated)
Now enriches each submission row with funnel data from `funnel_sessions`:
- Matches by `submission_id` or by `lead_key` (email + funnel_type + state_slug)
- Returns `funnel: { stage, last_event_at, dropoff_stage, dropoff_path, selected_offer, payment_status, amount_total, ... }` per item
- Detail endpoint returns `funnel_session` + `timeline` (full `funnel_events` list)

---

## Stage Precedence

Stages only advance, never go backwards:

```
paid (100) > checkout_started (80) > upsell_viewed (60) > offer_viewed (40) > submitted (20) > opened (5)
```

Stage is computed from event_name:
- `payment_success` → `paid`
- `checkout_start` → `checkout_started`
- `form_submit` → `submitted`
- `upsell_view` → `upsell_viewed`
- `offer_view` → `offer_viewed`

---

## Client Tracking Helper

**File:** `src/utils/funnelTracking.ts`

- `getVisitorId()` — returns a stable UUID from localStorage (key: `gappsy_visitor_id`)
- `trackFunnelEvent(params)` — fire-and-forget call to `funnel-track` edge function

---

## Events Tracked Per Form

| Form | funnelType | eventName | When |
|------|-----------|-----------|------|
| GetMatchedModal | `matched` | `form_submit` | On submit + after backend response with submissionId |
| FeaturedSpotlightModal | `spotlight` | `form_submit` | On submit + after backend response with submissionId |
| SubmitAgencyModal | `top25` | `form_submit` | On submit + after backend response with submissionId |
| AvailabilityModal | `availability` | `form_submit` | After successful availability-submit edge function |
| AvailabilityVerifyPage | `demo` | `confirm_connection_submit` | On form submit |

---

## Submissions Center UI Changes

**File:** `src/pages/WpAdminSubmissionsPage.tsx`

New columns in the table:
- **Funnel Stage** — badge: Paid / At Checkout / Upsell Viewed / Offer Viewed / Submitted / Opened
- **Last Seen** — relative time ago (e.g. "3h ago")
- **Drop-off** — last known page path or stage
- **Payment** — Paid / Unpaid / Failed / Refunded + amount
- **Offer** — selected_offer value

New in Detail Drawer (3 tabs):
1. **Submission** — all form fields + funnel session summary + quick copy buttons (email, state, checkout session ID)
2. **Timeline (N)** — chronological `funnel_events` list with color-coded dots per event type
3. **Raw JSON** — full raw row + funnel session + timeline

Abandoned checkout detection: rows with `stage=checkout_started` + no payment + last seen >24h get a red "Abandoned" badge and faint red row background.

Enhanced CSV export includes all funnel fields.

---

## How to Test

1. Go to any state page (e.g. `/marketing-agencies-in-new-jersey-united-states/`)
2. Open "Get Matched" modal, fill in the form and submit
3. Go to `/wp-admin/submissions` → **Get Matched** tab
4. The row should show Funnel Stage = "Submitted"
5. Click the row to open the drawer → **Timeline** tab shows the `form_submit` event

For the confirm/demo flow:
1. Navigate to `/availability/verify?agencyId=...&state=new-jersey`
2. Fill in and submit
3. Go to **Confirm Connection / Demo** tab in Submissions Center
4. Row appears with stage + timeline entry `confirm_connection_submit`
