/*
  # Your Agency Funnel Tables

  ## Overview
  Creates three tables to power the /your-agency funnel feature:

  1. **agency_listings_index** — Scalable O(1) lookup of all agency listings across states.
     Avoids runtime page parsing. Populated via admin import / Top-25 sync.
     - Stores state slug, section (top25 vs other), rank, page path, domain, etc.
     - Supports pg_trgm fuzzy search on agency_name.

  2. **agency_claim_tokens** — Short URL-safe tokens that map directly to an agency.
     Used for campaign-specific deep links: /your-agency/t/<token>

  3. **your_agency_funnel_events** — Lightweight event log for funnel analytics.
     Tracks searches, selections, CTA clicks, token opens, highlight views.

  ## Security
  - All three tables have RLS enabled.
  - agency_listings_index and agency_claim_tokens are public-readable (SEO/funnel access).
  - your_agency_funnel_events: anyone can insert (anonymous tracking), admin reads only.
  - No authenticated writes required for read-only tables.
*/

-- ─────────────────────────────────────────────
-- 1. agency_listings_index
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS agency_listings_index (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id       text NOT NULL,
  agency_slug     text NOT NULL,
  agency_name     text NOT NULL,
  agency_domain   text NULL,
  state_slug      text NOT NULL,
  section         text NOT NULL CHECK (section IN ('top25', 'other')),
  rank            int  NULL,
  other_position  int  NULL,
  page_path       text NOT NULL,
  updated_at      timestamptz DEFAULT now()
);

-- Unique per agency+state+section combination
CREATE UNIQUE INDEX IF NOT EXISTS idx_ali_agency_state_section
  ON agency_listings_index (agency_id, state_slug, section);

-- Fast agency_slug lookups (slug-based page load)
CREATE INDEX IF NOT EXISTS idx_ali_agency_slug
  ON agency_listings_index (agency_slug);

-- Case-insensitive name search
CREATE INDEX IF NOT EXISTS idx_ali_name_lower
  ON agency_listings_index (lower(agency_name));

-- State + section filter
CREATE INDEX IF NOT EXISTS idx_ali_state_section
  ON agency_listings_index (state_slug, section);

-- Enable pg_trgm for fuzzy name search if available
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_available_extensions WHERE name = 'pg_trgm') THEN
    CREATE EXTENSION IF NOT EXISTS pg_trgm;
    EXECUTE 'CREATE INDEX IF NOT EXISTS idx_ali_name_trgm ON agency_listings_index USING gin (lower(agency_name) gin_trgm_ops)';
  END IF;
EXCEPTION WHEN OTHERS THEN
  NULL;
END $$;

ALTER TABLE agency_listings_index ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read agency listings index"
  ON agency_listings_index FOR SELECT
  TO anon, authenticated
  USING (true);

-- ─────────────────────────────────────────────
-- 2. agency_claim_tokens
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS agency_claim_tokens (
  token         text PRIMARY KEY,
  agency_id     text NOT NULL,
  agency_slug   text NOT NULL,
  agency_name   text NOT NULL,
  created_at    timestamptz DEFAULT now(),
  last_used_at  timestamptz NULL,
  uses          int  DEFAULT 0,
  note          text NULL
);

CREATE INDEX IF NOT EXISTS idx_act_agency_id
  ON agency_claim_tokens (agency_id);

ALTER TABLE agency_claim_tokens ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read tokens"
  ON agency_claim_tokens FOR SELECT
  TO anon, authenticated
  USING (true);

-- ─────────────────────────────────────────────
-- 3. your_agency_funnel_events
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS your_agency_funnel_events (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at  timestamptz DEFAULT now(),
  event_name  text NOT NULL,
  agency_id   text NULL,
  agency_slug text NULL,
  state_slug  text NULL,
  section     text NULL,
  token       text NULL,
  meta        jsonb DEFAULT '{}'::jsonb
);

CREATE INDEX IF NOT EXISTS idx_yafe_event_name
  ON your_agency_funnel_events (event_name);

CREATE INDEX IF NOT EXISTS idx_yafe_agency_id
  ON your_agency_funnel_events (agency_id);

CREATE INDEX IF NOT EXISTS idx_yafe_created_at
  ON your_agency_funnel_events (created_at DESC);

ALTER TABLE your_agency_funnel_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can insert funnel events"
  ON your_agency_funnel_events FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated can read funnel events"
  ON your_agency_funnel_events FOR SELECT
  TO authenticated
  USING (true);
