/*
  # Add demo tracking to agency_availability_requests

  1. New Columns
    - `is_demo` (boolean, NOT NULL, DEFAULT false) - Mark demo availability checks
    - `source_flow` (text, NULL) - Indicates origin: "demo", "live", or "internal_test"
    - `source_context` (jsonb, NULL) - Optional metadata (page_path, verification token, etc.)

  2. Indexes
    - Index on (is_demo, created_at DESC) for fast demo filtering
    - Index on (state_slug, is_demo) for state + demo analysis

  3. Backfill Strategy (safe, optional)
    - Attempt to mark existing demo submissions by checking source_page
    - Only mark if source_page clearly indicates demo
    - Otherwise leave as false (conservative approach)

  4. Purpose
    - Separate demo availability submissions from real ones
    - Prevent demo submissions from polluting conversion stats
    - Enable easy filtering and export in admin UI
    - Preserve all data for analysis while allowing clean separation
*/

-- Add columns if they don't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'is_demo'
  ) THEN
    ALTER TABLE agency_availability_requests
    ADD COLUMN is_demo BOOLEAN NOT NULL DEFAULT false;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'source_flow'
  ) THEN
    ALTER TABLE agency_availability_requests
    ADD COLUMN source_flow TEXT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'source_context'
  ) THEN
    ALTER TABLE agency_availability_requests
    ADD COLUMN source_context JSONB NULL;
  END IF;
END $$;

-- Create indexes for demo filtering and analysis
CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_is_demo_created
  ON agency_availability_requests(is_demo, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_state_demo
  ON agency_availability_requests(state_slug, is_demo);

-- Backfill: Mark existing submissions as demo if source_page suggests it
UPDATE agency_availability_requests
SET is_demo = true, source_flow = 'demo'
WHERE is_demo = false
  AND source_page IS NOT NULL
  AND source_page ILIKE '%/demo%'
  AND created_at > NOW() - INTERVAL '90 days';
