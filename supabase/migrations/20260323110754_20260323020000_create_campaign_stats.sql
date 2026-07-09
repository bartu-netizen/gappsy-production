/*
  # Create campaign_stats table

  ## Summary
  Introduces a precomputed, campaign-level analytics cache that stores both
  provider email metrics and Gappsy agency-level unique metrics.  This powers
  the compact "second-line" display on the Smartlead Campaigns admin page without
  hitting the Smartlead API on every page load.

  ## New Tables
  - `campaign_stats`
    - `campaign_id` (text, primary key) — matches smartlead_campaigns.campaign_id
    - `total_sent`   (integer) — from provider (smartlead_campaigns.provider_sent)
    - `total_opened` (integer) — from provider (smartlead_campaigns.provider_opened)
    - `total_replied`(integer) — from provider (smartlead_campaigns.provider_replied)
    - `unique_agencies_contacted` (integer) — distinct agency_ids in email sync
    - `unique_agencies_opened`    (integer) — distinct agency_ids with open event
    - `unique_agencies_replied`   (integer) — distinct agency_ids with reply event
    - `computed_at`  (timestamptz) — when stats were last calculated
    - `updated_at`   (timestamptz) — row last updated timestamp

  ## Security
  - RLS enabled
  - service_role: full CRUD (for background sync writes)
  - authenticated: SELECT only (admin UI reads via edge functions)

  ## Notes
  1. Populated by smartlead-background-sync edge function (computeCampaignStats step)
  2. Updated via "Refresh All" button in the admin UI or scheduled cron
  3. UI only shows agency stats row for campaigns with status = 'ACTIVE'
  4. Domain-fallback agency matching (email → website_domain) handled in edge fn
*/

CREATE TABLE IF NOT EXISTS campaign_stats (
  campaign_id              text        PRIMARY KEY,
  total_sent               integer     NOT NULL DEFAULT 0,
  total_opened             integer     NOT NULL DEFAULT 0,
  total_replied            integer     NOT NULL DEFAULT 0,
  unique_agencies_contacted integer    NOT NULL DEFAULT 0,
  unique_agencies_opened   integer     NOT NULL DEFAULT 0,
  unique_agencies_replied  integer     NOT NULL DEFAULT 0,
  computed_at              timestamptz NOT NULL DEFAULT now(),
  updated_at               timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE campaign_stats ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role has full access to campaign_stats"
  ON campaign_stats
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can read campaign_stats"
  ON campaign_stats
  FOR SELECT
  TO authenticated
  USING (true);

CREATE INDEX IF NOT EXISTS idx_campaign_stats_updated_at
  ON campaign_stats (updated_at DESC);
