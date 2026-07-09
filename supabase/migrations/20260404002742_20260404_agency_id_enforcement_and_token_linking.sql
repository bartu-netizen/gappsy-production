/*
  # Agency ID Enforcement + Token Linking

  ## Purpose
  Part of the unified token→agency tracking system.
  Enforces agency_id as a first-class column on every event table,
  and extends smart_link_tokens with agency_slug for complete identity linking.

  ## Changes

  ### Modified Tables

  1. `funnel_events`
     - Add `agency_id` (text) as direct column (was only in metadata jsonb)
     - Add `step_number` as direct column if missing (already added by later migrations but guard here)
     - Add index on agency_id for fast per-agency aggregation

  2. `smart_link_tokens`
     - Add `agency_slug` (text, nullable) for complete agency identity
     - Add index on agency_id for token→agency lookups

  ## Security
  - No RLS policy changes (both tables already locked to service_role / no public access)

  ## Notes
  1. Existing funnel_events rows will have agency_id = NULL — backfill happens
     lazily as new events flow through the updated log-funnel-event function.
  2. smart_link_tokens.agency_id already existed; agency_slug is purely additive.
*/

-- ── funnel_events: add agency_id direct column ───────────────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'agency_id'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN agency_id text;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_funnel_events_agency_id
  ON funnel_events (agency_id)
  WHERE agency_id IS NOT NULL;

-- ── funnel_events: add step_number direct column (guard) ─────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'step_number'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN step_number integer;
  END IF;
END $$;

-- ── funnel_events: add funnel_name direct column (guard) ─────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'funnel_name'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN funnel_name text;
  END IF;
END $$;

-- ── funnel_events: add is_demo direct column (guard) ─────────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'is_demo'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN is_demo boolean DEFAULT false;
  END IF;
END $$;

-- ── smart_link_tokens: add agency_slug ───────────────────────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'smart_link_tokens' AND column_name = 'agency_slug'
  ) THEN
    ALTER TABLE smart_link_tokens ADD COLUMN agency_slug text;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_smart_link_tokens_agency_id
  ON smart_link_tokens (agency_id);

-- ── your_agency_funnel_events: add index on agency_id+created_at ─────────────

CREATE INDEX IF NOT EXISTS idx_yafe_agency_id_created
  ON your_agency_funnel_events (agency_id, created_at DESC)
  WHERE agency_id IS NOT NULL;

-- ── agency_funnel_engagement: composite index for per-agency queries ──────────

CREATE INDEX IF NOT EXISTS idx_afe_agency_id_created
  ON agency_funnel_engagement (agency_id, created_at DESC)
  WHERE agency_id IS NOT NULL;
