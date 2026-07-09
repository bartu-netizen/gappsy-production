/*
  # Availability Analytics: indexes + missing columns

  ## Summary
  Adds indexes on agency_availability_requests for fast per-agency analytics.
  Also adds requester_website and state_name columns if missing.

  ## Indexes
  - (target_agency_id, is_demo, created_at DESC) — per-agency time-range queries
  - (agency_name, is_demo, created_at DESC) — fallback for legacy rows
  - (state_slug, is_demo, created_at DESC) — state-level breakdown
*/

CREATE INDEX IF NOT EXISTS idx_aar_agency_id_demo_created
  ON agency_availability_requests(target_agency_id, is_demo, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_aar_agency_name_demo_created
  ON agency_availability_requests(agency_name, is_demo, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_aar_state_demo_created
  ON agency_availability_requests(state_slug, is_demo, created_at DESC);

-- Add state_name column if missing (used in submit-and-notify)
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns
    WHERE table_name='agency_availability_requests' AND column_name='state_name') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN state_name TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns
    WHERE table_name='agency_availability_requests' AND column_name='requester_website') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN requester_website TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns
    WHERE table_name='agency_availability_requests' AND column_name='requester_message') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN requester_message TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns
    WHERE table_name='agency_availability_requests' AND column_name='service_interest') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN service_interest TEXT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns
    WHERE table_name='agency_availability_requests' AND column_name='status') THEN
    ALTER TABLE agency_availability_requests ADD COLUMN status TEXT DEFAULT 'pending';
  END IF;
END $$;
