/*
  # Create your_agency_profile_clicks table

  ## Summary
  Dedicated admin-visible table that records every click from the /your-agency
  searchbar. Unlike the lightweight analytics table (your_agency_funnel_events),
  this table is designed to surface in the Submissions Center and trigger admin
  email notifications with imported agency email context.

  ## New Tables
  - `your_agency_profile_clicks`
    - `id` (uuid, primary key)
    - `agency_id` (text, nullable) - internal agency ID if resolved
    - `agency_slug` (text, nullable) - URL slug for the clicked agency
    - `agency_name` (text, not null default '') - display name of clicked agency
    - `profile_url` (text, not null default '') - full /your-agency/:slug URL
    - `search_query` (text, nullable) - the query typed in the searchbar
    - `source` (text, not null default 'your_agency_searchbar') - click source
    - `visitor_session_id` (text, nullable) - fsid for funnel correlation
    - `visitor_token` (text, nullable) - any visitor auth token present
    - `state_slug` (text, nullable) - primary state of the agency
    - `imported_agency_email` (text, nullable) - primary imported email found
    - `imported_agency_email_count` (integer, not null default 0)
    - `imported_agency_emails` (jsonb, not null default '[]')
    - `email_notification_sent` (boolean, not null default false)
    - `dedupe_key` (text, nullable) - short-window dedup key
    - `meta` (jsonb, not null default '{}')
    - `created_at` (timestamptz, not null default now())

  ## Security
  - RLS enabled
  - service_role has full access (INSERT, SELECT, UPDATE, DELETE)
  - No direct anon/authenticated reads — edge functions write via service role

  ## Indexes
  - created_at DESC (for latest-first listing)
  - agency_id (for email enrichment lookup)
  - agency_slug (for profile URL matching)
  - dedupe_key (for duplicate suppression)
*/

CREATE TABLE IF NOT EXISTS public.your_agency_profile_clicks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id text NULL,
  agency_slug text NULL,
  agency_name text NOT NULL DEFAULT '',
  profile_url text NOT NULL DEFAULT '',
  search_query text NULL,
  source text NOT NULL DEFAULT 'your_agency_searchbar',
  visitor_session_id text NULL,
  visitor_token text NULL,
  state_slug text NULL,
  imported_agency_email text NULL,
  imported_agency_email_count integer NOT NULL DEFAULT 0,
  imported_agency_emails jsonb NOT NULL DEFAULT '[]'::jsonb,
  email_notification_sent boolean NOT NULL DEFAULT false,
  dedupe_key text NULL,
  meta jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.your_agency_profile_clicks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access to your_agency_profile_clicks"
  ON public.your_agency_profile_clicks
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role insert your_agency_profile_clicks"
  ON public.your_agency_profile_clicks
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role update your_agency_profile_clicks"
  ON public.your_agency_profile_clicks
  FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Service role delete your_agency_profile_clicks"
  ON public.your_agency_profile_clicks
  FOR DELETE
  TO service_role
  USING (true);

CREATE INDEX IF NOT EXISTS idx_yapc_created_at ON public.your_agency_profile_clicks (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_yapc_agency_id ON public.your_agency_profile_clicks (agency_id) WHERE agency_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_yapc_agency_slug ON public.your_agency_profile_clicks (agency_slug) WHERE agency_slug IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_yapc_dedupe_key ON public.your_agency_profile_clicks (dedupe_key) WHERE dedupe_key IS NOT NULL;
