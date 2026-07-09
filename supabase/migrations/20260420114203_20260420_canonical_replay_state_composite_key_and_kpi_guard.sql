/*
  # Canonical Replay State: composite (agency_id, state_slug) key + real KPI guard

  ## Purpose
  Evolve `canonical_replay_state` from slug-only identity to the composite
  `(agency_id, state_slug)` identity while preserving full backward
  compatibility with existing consumers that still read by `agency_slug`.

  ## Changes
  1. New columns (additive, nullable):
     - `agency_id` (uuid) - authoritative identity for an agency
     - `last_real_kpi_at` (timestamptz) - set whenever a row is written
       from REAL KPI data (agency_availability_requests). Used to guard
       against deterministic fallback overwriting real state.

  2. New composite partial unique index:
     - `ux_canonical_replay_state_agency_id_state_slug`
       on `(agency_id, state_slug) WHERE agency_id IS NOT NULL`
     - Partial so legacy rows with NULL `agency_id` are not rejected
       during rollout.

  3. Helper lookup index on `agency_id` alone for composite reads.

  4. Safe backfill of `agency_id` for existing rows by joining
     `agency_listings_index` on `agency_slug`. Rows without a resolvable
     agency_id are left as-is (still readable by legacy consumers).
     Note: `agency_listings_index.agency_id` is text; cast to uuid when
     the string is a valid uuid only.

  ## Safety
  - No destructive changes: no DROP, no data loss.
  - Existing PRIMARY KEY on `agency_slug` remains intact.
  - Existing rows remain valid and readable by legacy slug-only paths.
  - RLS remains enabled; all access continues to go through edge functions
    using the service role key.

  ## Notes
  - Write-path transition: new writes populate both `agency_id` and
    `agency_slug`, and set `last_real_kpi_at = now()` when data is real.
  - Read-path transition: edge functions try composite read first, then
    fall back to legacy slug-only read if no composite row is found.
  - Deterministic fallback persistence (if ever enabled) must refuse to
    overwrite rows where `last_real_kpi_at IS NOT NULL`.
*/

ALTER TABLE IF EXISTS canonical_replay_state
  ADD COLUMN IF NOT EXISTS agency_id uuid;

ALTER TABLE IF EXISTS canonical_replay_state
  ADD COLUMN IF NOT EXISTS last_real_kpi_at timestamptz;

CREATE INDEX IF NOT EXISTS idx_canonical_replay_state_agency_id
  ON canonical_replay_state (agency_id)
  WHERE agency_id IS NOT NULL;

CREATE UNIQUE INDEX IF NOT EXISTS ux_canonical_replay_state_agency_id_state_slug
  ON canonical_replay_state (agency_id, state_slug)
  WHERE agency_id IS NOT NULL;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'agency_listings_index'
  ) THEN
    UPDATE canonical_replay_state crs
    SET agency_id = ali.agency_id_uuid
    FROM (
      SELECT DISTINCT ON (agency_slug)
        agency_slug,
        CASE
          WHEN agency_id ~ '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'
            THEN agency_id::uuid
          ELSE NULL
        END AS agency_id_uuid
      FROM agency_listings_index
      WHERE agency_id IS NOT NULL
      ORDER BY agency_slug, agency_id
    ) ali
    WHERE crs.agency_id IS NULL
      AND crs.agency_slug = ali.agency_slug
      AND ali.agency_id_uuid IS NOT NULL;
  END IF;
END $$;

DO $$
BEGIN
  UPDATE canonical_replay_state
  SET last_real_kpi_at = COALESCE(updated_at, created_at, now())
  WHERE last_real_kpi_at IS NULL
    AND missed_requests_last_30_days > 0
    AND most_recent_request_ms > 0;
END $$;
