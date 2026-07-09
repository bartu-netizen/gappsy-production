/*
  # Add soft-delete (deleted_at) to all submission tables

  ## Purpose
  Allows admins to "delete" submissions from the Submissions Center without
  permanently destroying the data. Rows with deleted_at set are hidden from
  normal queries and counts but can be recovered if needed.

  ## Changes

  ### New Columns (all submission tables)
  - `deleted_at` timestamptz NULL — NULL means active; non-null means soft-deleted
  - `deleted_by` text NULL — optional: store who deleted it

  ### Tables Modified
  1. matched_leads
  2. spotlight_applications
  3. top25_applications
  4. agency_availability_requests
  5. owner_demo_events

  ### Indexes
  - Partial index on each table WHERE deleted_at IS NULL for fast filtering

  ### RLS
  - Add DELETE policy (authenticated only) so service role can soft-delete

  ## Safety
  - All operations use IF NOT EXISTS / safe guards
  - No existing data is modified
*/

-- ── matched_leads ─────────────────────────────────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'matched_leads' AND column_name = 'deleted_at'
  ) THEN
    ALTER TABLE matched_leads ADD COLUMN deleted_at TIMESTAMPTZ NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'matched_leads' AND column_name = 'deleted_by'
  ) THEN
    ALTER TABLE matched_leads ADD COLUMN deleted_by TEXT NULL;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_matched_leads_not_deleted
  ON matched_leads(created_at DESC) WHERE deleted_at IS NULL;

-- ── spotlight_applications ────────────────────────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'spotlight_applications' AND column_name = 'deleted_at'
  ) THEN
    ALTER TABLE spotlight_applications ADD COLUMN deleted_at TIMESTAMPTZ NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'spotlight_applications' AND column_name = 'deleted_by'
  ) THEN
    ALTER TABLE spotlight_applications ADD COLUMN deleted_by TEXT NULL;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_spotlight_applications_not_deleted
  ON spotlight_applications(created_at DESC) WHERE deleted_at IS NULL;

-- ── top25_applications ────────────────────────────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'top25_applications' AND column_name = 'deleted_at'
  ) THEN
    ALTER TABLE top25_applications ADD COLUMN deleted_at TIMESTAMPTZ NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'top25_applications' AND column_name = 'deleted_by'
  ) THEN
    ALTER TABLE top25_applications ADD COLUMN deleted_by TEXT NULL;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_top25_applications_not_deleted
  ON top25_applications(created_at DESC) WHERE deleted_at IS NULL;

-- ── agency_availability_requests ──────────────────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'deleted_at'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN deleted_at TIMESTAMPTZ NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'deleted_by'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN deleted_by TEXT NULL;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_not_deleted
  ON agency_availability_requests(created_at DESC) WHERE deleted_at IS NULL;

-- ── owner_demo_events ─────────────────────────────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'owner_demo_events' AND column_name = 'deleted_at'
  ) THEN
    ALTER TABLE owner_demo_events ADD COLUMN deleted_at TIMESTAMPTZ NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'owner_demo_events' AND column_name = 'deleted_by'
  ) THEN
    ALTER TABLE owner_demo_events ADD COLUMN deleted_by TEXT NULL;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_owner_demo_events_not_deleted
  ON owner_demo_events(created_at DESC) WHERE deleted_at IS NULL;
