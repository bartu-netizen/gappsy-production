/*
  # Add base_generated_anchor_ms to canonical_replay_state

  ## Summary
  Adds a new field `base_generated_anchor_ms` to `canonical_replay_state`.

  ## Purpose
  Separates the deterministic generation anchor (used for building the
  ledger layout) from the display anchor (which can be bumped by admin
  overrides). This field:
    - Is set once on first write, from the real request anchor
    - Is NEVER changed when admin adds an override
    - Is used as the ONLY anchor for deterministic entry generation
    - Allows overrides to appear at top without shifting all entries

  ## Changes
  - `canonical_replay_state` gets new nullable bigint column `base_generated_anchor_ms`
  - Backfills existing rows: sets it equal to `most_recent_request_ms`
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'canonical_replay_state'
      AND column_name = 'base_generated_anchor_ms'
  ) THEN
    ALTER TABLE canonical_replay_state
      ADD COLUMN base_generated_anchor_ms bigint DEFAULT NULL;
  END IF;
END $$;

-- Backfill: for existing rows, use most_recent_request_ms as the base anchor
UPDATE canonical_replay_state
SET base_generated_anchor_ms = most_recent_request_ms
WHERE base_generated_anchor_ms IS NULL
  AND most_recent_request_ms IS NOT NULL;
