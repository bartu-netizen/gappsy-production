# Owner Demo Logging — Complete

## What Was Added

### Edge Function: `owner-demo-log`
- Path: `supabase/functions/owner-demo-log/index.ts`
- Public POST endpoint (no auth required — called from browser)
- Uses service role key to bypass RLS on `owner_demo_events`
- Accepts a structured JSON body and inserts into `owner_demo_events`
- Enriches the row server-side with User-Agent and IP (best-effort)
- All extra detail (person, agency, context) stored in `metadata` JSONB column
- Returns `{ ok: true, id, stored }` on success

### Frontend: `AvailabilityVerifyPage.tsx`
- On form submit, fires `supabase.functions.invoke('owner-demo-log', { body: {...} })` before navigating
- Call is fire-and-forget (`.catch(() => {})`) — a logging failure never blocks the user flow
- Logs: `event=confirm_connection`, `state_slug`, `agency.id`, `agency.website`, `person.email`, `person.role`, `context.page_url`, `context.referrer`, `context.flow=verify`, `context.step=confirm_connection`
- Button shows "Confirming..." while submitting

### `wpadmin-submissions` edge function (updated)
- `owner_demo_events` summary now surfaces:
  - `primary_label` → `agency_name` or `metadata.agency.name`
  - `email` → `metadata.person.email`
  - `status` → `event_name`
  - `preview` → `flow • step • role=...`

## No Schema Changes Needed
The existing `owner_demo_events` table already has a `metadata jsonb` column which stores all extra context. No migration was required.

## How to Test

1. Open any state page and click "Claim / verify your listing" on an agency card
2. Fill in website URL, role, optional email, and click **Continue**
3. Go to `/wp-admin/submissions` → **Confirm Connection / Demo** tab
4. A new row should appear with `event_name=confirm_connection`, the state slug, agency id, and full metadata in the detail drawer
