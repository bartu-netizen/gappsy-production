/*
  # Null contaminated base_generated_anchor_ms rows

  ## Problem
  A prior migration backfilled:
    base_generated_anchor_ms = most_recent_request_ms
  But some rows had most_recent_request_ms set from an admin override timestamp,
  making the override the deterministic generation anchor — which is wrong.

  ## Fix
  For each canonical_replay_state row where base_generated_anchor_ms is non-null:
  - Check if that exact timestamp (±1 second) exists in canonical_request_overrides
    for the same agency/state
  - AND verify no real agency_availability_requests row exists within ±5 seconds
  - If both conditions hold → the anchor was contaminated → set base_generated_anchor_ms = NULL

  Runtime logic will then re-derive the anchor from the actual real request timestamp,
  or produce baseGeneratedCount = 0 if no real request exists.

  ## Tables modified
  - canonical_replay_state: base_generated_anchor_ms set to NULL for contaminated rows

  ## Safety
  - Uses IF EXISTS guards throughout
  - Does not DROP or DELETE any rows
  - Idempotent: re-running produces no additional changes
*/

DO $$
DECLARE
  rec RECORD;
  anchor_ts TIMESTAMPTZ;
  override_match INT;
  real_match INT;
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'canonical_replay_state'
  ) THEN
    RETURN;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'canonical_request_overrides'
  ) THEN
    RETURN;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'agency_availability_requests'
  ) THEN
    RETURN;
  END IF;

  FOR rec IN
    SELECT agency_id, state_slug, base_generated_anchor_ms
    FROM canonical_replay_state
    WHERE base_generated_anchor_ms IS NOT NULL
      AND agency_id IS NOT NULL
  LOOP
    anchor_ts := to_timestamp(rec.base_generated_anchor_ms / 1000.0);

    -- Count matching overrides within ±1 second of the stored anchor
    SELECT COUNT(*) INTO override_match
    FROM canonical_request_overrides
    WHERE agency_id = rec.agency_id
      AND state_slug = rec.state_slug
      AND request_at >= anchor_ts - INTERVAL '1 second'
      AND request_at <= anchor_ts + INTERVAL '1 second';

    IF override_match > 0 THEN
      -- Count real requests within ±5 seconds of the stored anchor
      SELECT COUNT(*) INTO real_match
      FROM agency_availability_requests aar
      WHERE (aar.target_agency_id = rec.agency_id OR aar.agency_id = rec.agency_id)
        AND aar.is_demo = false
        AND aar.deleted_at IS NULL
        AND aar.created_at >= anchor_ts - INTERVAL '5 seconds'
        AND aar.created_at <= anchor_ts + INTERVAL '5 seconds';

      IF real_match = 0 THEN
        UPDATE canonical_replay_state
        SET base_generated_anchor_ms = NULL,
            updated_at = NOW()
        WHERE agency_id = rec.agency_id
          AND state_slug = rec.state_slug;
      END IF;
    END IF;
  END LOOP;
END $$;
