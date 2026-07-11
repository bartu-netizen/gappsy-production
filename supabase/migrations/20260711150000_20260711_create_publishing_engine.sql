/*
  # Publishing Engine — status pipeline + provenance tracking

  ## Overview
  Fully additive schema supporting the new /wp-admin Publishing module
  (New Software wizard, Publishing Queue, Draft Queue, Import History):

  1. Widens the existing tools_status_check constraint from 3 values to 5,
     adding 'needs_review' and 'ready_to_publish' as pre-publish workflow
     stages between 'draft' and 'published'. Every existing row (draft,
     published, archived) stays valid unchanged. Nothing that reads
     `status` elsewhere breaks: public RLS/rendering/sitemap/prerender
     only ever match the literal 'published' value, so the two new
     intermediate values are simply invisible to the public site by
     construction, exactly like 'draft' already is.
  2. Adds `source` (manual | wizard | bulk | api) and `source_url` to
     `tools` — provenance tracking so Import History can show which tools
     came from the wizard (today) vs. a future bulk importer or API,
     without needing a separate log table. Defaults to 'manual' so every
     existing row is unaffected.

  No existing table, row, or policy is dropped or rewritten. No column is
  narrowed or made stricter for existing data.
*/

-- ─────────────────────────────────────────────
-- 1. Widen the status pipeline
-- ─────────────────────────────────────────────
ALTER TABLE tools DROP CONSTRAINT IF EXISTS tools_status_check;
ALTER TABLE tools ADD CONSTRAINT tools_status_check
  CHECK (status IN ('draft', 'needs_review', 'ready_to_publish', 'published', 'archived'));

-- ─────────────────────────────────────────────
-- 2. Provenance tracking
-- ─────────────────────────────────────────────
ALTER TABLE tools ADD COLUMN IF NOT EXISTS source text NOT NULL DEFAULT 'manual';
ALTER TABLE tools ADD COLUMN IF NOT EXISTS source_url text;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'tools_source_check' AND conrelid = 'tools'::regclass
  ) THEN
    ALTER TABLE tools ADD CONSTRAINT tools_source_check
      CHECK (source IN ('manual', 'wizard', 'bulk', 'api'));
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_tools_source ON tools (source) WHERE source <> 'manual';
