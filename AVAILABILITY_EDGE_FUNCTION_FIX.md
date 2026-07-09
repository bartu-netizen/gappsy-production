# Availability Edge Function Fix

## Root Cause

The `availability-submit` Edge Function was inserting a column `additional_notes` that does not exist in the `agency_availability_requests` table. This caused every insert to fail with a Postgres column-not-found error, which surfaced as "Edge Function returned non-2xx".

The actual columns in `agency_availability_requests` are:
`id`, `agency_id`, `service`, `budget`, `timeline`, `client_email`, `client_name`, `created_at`, `state_slug`, `routed_to_agency_id`, `agency_name`, `agency_website`, `agency_slug`, `source_page`

## Changes Made

### `supabase/functions/availability-submit/index.ts`
- Removed `additional_notes` from the insert payload (column does not exist)
- Redeployed to Supabase

### `src/AvailabilityModal.tsx`
- Removed `additionalNotes: null` from the invoke body (no longer needed)
- Improved error extraction: when `supabase.functions.invoke` returns an error, the handler now digs into `error.context.body` to surface the real server-side message instead of the generic "Edge Function returned non-2xx status code"

## Required Secrets

| Secret | Purpose |
|--------|---------|
| `SUPABASE_URL` | Auto-populated in Edge Function runtime |
| `SUPABASE_SERVICE_ROLE_KEY` | Auto-populated in Edge Function runtime — used to bypass RLS |
| `SMTP_INTERNAL_EMAIL` | Recipient for internal notification emails. If not set, insert still succeeds but no email is sent. |
| `SMTP_HOST`, `SMTP_PORT`, `SMTP_USERNAME`, `SMTP_PASSWORD` | Required for email delivery via the shared `emailClient` |

## How to Verify

1. Open any state page (e.g. `/marketing-agencies-in-new-jersey-united-states/`)
2. Click "Check Availability" on any agency card
3. Fill in service, budget, timeline, name, and email
4. Submit — the form should animate and show the success result screen
5. In Supabase dashboard, check `agency_availability_requests` table for a new row
6. No errors should appear in the browser console
