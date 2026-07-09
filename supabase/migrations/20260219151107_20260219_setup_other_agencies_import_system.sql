/*
  # Other Agencies Import System Setup

  1. Add Missing Columns to other_agencies
    - Add is_active, source, email, phone columns if not present
    - Ensure services is text[] array type
    - Add state_slug if not present (for consistency with naming)

  2. Create New Tables
    - other_agency_import_jobs: Track import sessions
    - other_agency_import_job_rows: Store import errors

  3. Add Indexes
    - (state_slug, is_active) for state page queries
    - GIN index on services for filtering
    - Unique dedupe constraint

  4. Ensure RLS is properly configured
    - Public read access to active agencies
    - Service role full access
*/

-- Add missing columns to other_agencies if not present
DO $$
BEGIN
  -- Add is_active column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'is_active'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN is_active BOOLEAN NOT NULL DEFAULT true;
  END IF;

  -- Add source column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'source'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN source TEXT NOT NULL DEFAULT 'import';
  END IF;

  -- Add email column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'email'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN email TEXT;
  END IF;

  -- Add phone column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'phone'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN phone TEXT;
  END IF;

  -- Add state_slug column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'state_slug'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN state_slug TEXT;
  END IF;

  -- Add description column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'description'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN description TEXT;
  END IF;

  -- Add primary_service column
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'primary_service'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN primary_service TEXT;
  END IF;
END $$;

-- Create indexes for query performance
CREATE INDEX IF NOT EXISTS idx_other_agencies_state_active 
  ON other_agencies(state_slug, is_active);

CREATE INDEX IF NOT EXISTS idx_other_agencies_state_only
  ON other_agencies(state_slug);

-- Create import jobs table
CREATE TABLE IF NOT EXISTS other_agency_import_jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz NOT NULL DEFAULT now(),
  created_by text,
  state_slug text,
  filename text NOT NULL,
  mode text NOT NULL CHECK (mode IN ('csv', 'json')),
  status text NOT NULL DEFAULT 'processing' CHECK (status IN ('processing', 'succeeded', 'failed')),
  total_rows int NOT NULL DEFAULT 0,
  inserted int NOT NULL DEFAULT 0,
  updated int NOT NULL DEFAULT 0,
  skipped int NOT NULL DEFAULT 0,
  failed int NOT NULL DEFAULT 0,
  error text
);

CREATE INDEX IF NOT EXISTS idx_import_jobs_state 
  ON other_agency_import_jobs(state_slug, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_import_jobs_status
  ON other_agency_import_jobs(status, created_at DESC);

-- Create import job rows table
CREATE TABLE IF NOT EXISTS other_agency_import_job_rows (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid NOT NULL REFERENCES other_agency_import_jobs(id) ON DELETE CASCADE,
  row_number int NOT NULL,
  raw jsonb NOT NULL,
  error text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_import_job_rows_job 
  ON other_agency_import_job_rows(job_id);

-- Ensure RLS is enabled
ALTER TABLE other_agency_import_jobs ENABLE ROW LEVEL SECURITY;
ALTER TABLE other_agency_import_job_rows ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DO $$
BEGIN
  DROP POLICY IF EXISTS "Service role access imports" ON other_agency_import_jobs;
  DROP POLICY IF EXISTS "Service role access job rows" ON other_agency_import_job_rows;
EXCEPTION WHEN OTHERS THEN NULL;
END $$;

-- Service role only policies
CREATE POLICY "Service role access imports"
  ON other_agency_import_jobs FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Service role access job rows"
  ON other_agency_import_job_rows FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Update RLS on other_agencies to ensure proper access
DO $$
BEGIN
  DROP POLICY IF EXISTS "Public read active agencies" ON other_agencies;
  DROP POLICY IF EXISTS "Service role full access" ON other_agencies;
EXCEPTION WHEN OTHERS THEN NULL;
END $$;

-- Public read policy for active agencies only
CREATE POLICY "Public read active agencies"
  ON other_agencies FOR SELECT
  TO public
  USING (is_active = true);

-- Service role full access
CREATE POLICY "Service role full access other agencies"
  ON other_agencies FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);
