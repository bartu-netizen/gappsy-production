# Availability RLS Fix - Complete

## Problem
The "Check Availability" form was throwing:
```
Database error (42501): new row violates row-level security policy for table "agency_availability_requests"
```
This happened because `AvailabilityModal.tsx` was doing a direct client-side INSERT into `agency_availability_requests` using the anon key. RLS blocks anon inserts on that table.

## What Was Changed

### 1. New Edge Function: `availability-submit`
**File:** `supabase/functions/availability-submit/index.ts`

- Uses service role key → bypasses RLS safely on the server side
- Accepts POST with JSON body: `{ agencyId, stateSlug, clientName, clientEmail, service, budget, timeline, additionalNotes, agencyName, stateName }`
- Validates: email format/length, stateSlug non-empty, service/budget/timeline present
- Inserts row into `agency_availability_requests`
- Fires internal notification email via `SMTP_INTERNAL_EMAIL` (non-blocking via `EdgeRuntime.waitUntil`)
- Returns `{ ok: true, id: <uuid> }` on success

### 2. Updated Frontend: `src/AvailabilityModal.tsx`
- Removed the `supabase.from('agency_availability_requests').insert(...)` direct call
- Removed the separate `availability-notify` fetch call (email is now handled inside `availability-submit`)
- Replaced with `supabase.functions.invoke('availability-submit', { body: {...} })`
- Passes `agencyName` and `stateName` for the email notification subject
- Removed the DEV test button that also used direct insert

## How to Test

1. Open any state page (e.g. `/marketing-agencies-in-new-jersey-united-states/`)
2. Click "Check Availability" on any agency card
3. Fill in service, budget, timeline, and email
4. Submit the form
5. The form should animate and reach the result screen without any error
6. Verify in Supabase dashboard: `agency_availability_requests` table should have a new row

## Required Secret

| Secret | Purpose |
|--------|---------|
| `SMTP_INTERNAL_EMAIL` | Recipient for internal notification emails on new availability requests. Also checked: `INTERNAL_NOTIFICATION_EMAIL` as fallback. If neither is set, the insert still succeeds but no email is sent. |

SMTP credentials (`SMTP_HOST`, `SMTP_PORT`, `SMTP_USERNAME`, `SMTP_PASSWORD`) must also be configured for emails to send.
