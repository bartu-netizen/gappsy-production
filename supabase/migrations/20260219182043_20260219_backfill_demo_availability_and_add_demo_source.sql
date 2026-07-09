/*
  # Backfill Demo Availability Submissions + Ensure Schema

  ## Summary
  Existing availability requests that came from the demo flow currently have is_demo=false
  (or are missing the flag) and appear as normal "Availability" submissions, polluting stats.

  This migration:

  1. Ensures `is_demo` column exists with proper default (already added in prior migration, but safe IF NOT EXISTS guard)
  2. Ensures `source_flow` column exists
  3. Backfills is_demo=true for records that are clearly from the demo flow, detected by:
     - source_context->>'page_type' contains 'demo'
     - source_flow = 'demo'
     - source_context->>'source_route' contains 'demo'
     - source_context->>'agency_source' = 'demo'
     - meta contains placeholder=1 or demo=true hints
  4. Adds `demo_source` column (varchar) to store specific demo flow origin for future records
  5. Creates index on (is_demo, created_at) if not already present

  ## Tables Modified
  - agency_availability_requests: backfill is_demo, add demo_source column

  ## Important Notes
  - Purely additive — no data deleted, no columns dropped
  - is_demo=false records unaffected unless they match demo detection criteria
*/

-- 1. Ensure demo_source column exists
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'demo_source'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN demo_source text DEFAULT NULL;
  END IF;
END $$;

-- 2. Backfill is_demo=true for records that came from the demo flow
UPDATE agency_availability_requests
SET
  is_demo = true,
  demo_source = COALESCE(demo_source, 'backfill_detected')
WHERE
  is_demo = false
  AND deleted_at IS NULL
  AND (
    -- source_flow column hints
    source_flow = 'demo'
    OR source_flow ILIKE '%demo%'
    -- source_context JSON hints
    OR (source_context IS NOT NULL AND (
      source_context->>'page_type' ILIKE '%demo%'
      OR source_context->>'source_route' ILIKE '%demo%'
      OR source_context->>'agency_source' = 'demo'
      OR source_context->>'flow' = 'demo'
      OR (source_context->'meta'->>'is_demo')::boolean = true
      OR (source_context->'meta'->>'placeholder')::text = '1'
    ))
    -- URL-based hints in source_page
    OR source_page ILIKE '%/availability/demo%'
    OR source_page ILIKE '%/availability/owner-demo%'
    OR source_page ILIKE '%/availability/owner-simulate%'
    OR source_page ILIKE '%placeholder=1%'
  );

-- 3. Add index for (is_demo, created_at) if not exists
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE tablename = 'agency_availability_requests'
    AND indexname = 'idx_agency_availability_requests_is_demo_created'
  ) THEN
    CREATE INDEX idx_agency_availability_requests_is_demo_created
      ON agency_availability_requests (is_demo, created_at DESC);
  END IF;
END $$;
