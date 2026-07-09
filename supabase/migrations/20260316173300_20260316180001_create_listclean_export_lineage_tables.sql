/*
  # ListClean Export Lineage System
  
  This migration creates a durable export lineage system to track which email rows
  were exported in each ListClean batch, enabling accurate reconnection of cleaned
  results back to their original agency rows.
  
  ## Problem Being Solved
  ListClean only returns email addresses in their cleaned results. Without tracking
  which original rows were exported, we cannot reliably reconnect cleaned statuses
  to the correct agency_id and /your-agency profiles.
  
  ## New Tables
  
  1. `other_agency_cleaning_exports` - Tracks each export batch/job
    - `id` (uuid, primary key) - Unique export job identifier
    - `state_slug` (text) - State filter used during export
    - `filename` (text) - Downloaded filename for reference
    - `source` (text) - Always 'listclean' for now
    - `total_rows` (integer) - Number of emails exported
    - `status` (text) - pending/completed/imported
    - `created_at` (timestamptz) - When export was created
    - `created_by` (text) - Admin who initiated export
    - `imported_at` (timestamptz) - When cleaned results were imported back
    - `import_stats` (jsonb) - Statistics from import operation
  
  2. `other_agency_cleaning_export_rows` - Maps each exported email to original row
    - `id` (uuid, primary key) - Unique row identifier
    - `export_job_id` (uuid, FK) - References the export job
    - `other_agency_email_id` (uuid, FK) - Original email row in other_agency_emails
    - `agency_id` (uuid) - Original agency_id at time of export
    - `agency_slug` (text) - Original agency slug at time of export
    - `state_slug` (text) - State at time of export
    - `email_normalized` (text) - Email address for matching
    - `exported_at` (timestamptz) - When this row was exported
    - `cleaned_status` (text) - Status returned by ListClean (null until imported)
    - `cleaned_at` (timestamptz) - When cleaned status was applied
    - `matched` (boolean) - Whether this row was successfully matched during import
  
  ## Indexes
  - export_job_id for joining
  - email_normalized for matching during import
  - other_agency_email_id for lookups
  - state_slug for filtering
  - Composite (export_job_id, email_normalized) for import matching
  
  ## Security
  - RLS enabled on both tables
  - Only authenticated users with admin context can access
*/

-- Create export jobs table
CREATE TABLE IF NOT EXISTS other_agency_cleaning_exports (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug text NOT NULL,
  filename text,
  source text NOT NULL DEFAULT 'listclean',
  total_rows integer NOT NULL DEFAULT 0,
  status text NOT NULL DEFAULT 'completed',
  created_at timestamptz NOT NULL DEFAULT now(),
  created_by text,
  imported_at timestamptz,
  import_stats jsonb,
  notes text,
  
  CONSTRAINT cleaning_exports_status_check CHECK (status IN ('pending', 'completed', 'imported', 'failed'))
);

-- Create export row lineage table
CREATE TABLE IF NOT EXISTS other_agency_cleaning_export_rows (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  export_job_id uuid NOT NULL REFERENCES other_agency_cleaning_exports(id) ON DELETE CASCADE,
  other_agency_email_id uuid NOT NULL,
  agency_id uuid NOT NULL,
  agency_slug text,
  state_slug text NOT NULL,
  email_normalized text NOT NULL,
  exported_at timestamptz NOT NULL DEFAULT now(),
  cleaned_status text,
  cleaned_at timestamptz,
  matched boolean DEFAULT false,
  match_confidence text,
  
  CONSTRAINT cleaning_export_rows_confidence_check CHECK (match_confidence IS NULL OR match_confidence IN ('exact', 'lineage', 'ambiguous', 'not_found'))
);

-- Create indexes for efficient lookups
CREATE INDEX IF NOT EXISTS idx_cleaning_exports_state_slug ON other_agency_cleaning_exports(state_slug);
CREATE INDEX IF NOT EXISTS idx_cleaning_exports_status ON other_agency_cleaning_exports(status);
CREATE INDEX IF NOT EXISTS idx_cleaning_exports_created_at ON other_agency_cleaning_exports(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_cleaning_export_rows_job_id ON other_agency_cleaning_export_rows(export_job_id);
CREATE INDEX IF NOT EXISTS idx_cleaning_export_rows_email ON other_agency_cleaning_export_rows(email_normalized);
CREATE INDEX IF NOT EXISTS idx_cleaning_export_rows_original_id ON other_agency_cleaning_export_rows(other_agency_email_id);
CREATE INDEX IF NOT EXISTS idx_cleaning_export_rows_state ON other_agency_cleaning_export_rows(state_slug);
CREATE INDEX IF NOT EXISTS idx_cleaning_export_rows_agency ON other_agency_cleaning_export_rows(agency_id);

-- Composite index for import matching (most important)
CREATE INDEX IF NOT EXISTS idx_cleaning_export_rows_job_email 
  ON other_agency_cleaning_export_rows(export_job_id, email_normalized);

-- Enable RLS
ALTER TABLE other_agency_cleaning_exports ENABLE ROW LEVEL SECURITY;
ALTER TABLE other_agency_cleaning_export_rows ENABLE ROW LEVEL SECURITY;

-- RLS policies - admin access only via service role
CREATE POLICY "Service role full access to cleaning_exports"
  ON other_agency_cleaning_exports
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Service role full access to cleaning_export_rows"
  ON other_agency_cleaning_export_rows
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Add comment explaining the system
COMMENT ON TABLE other_agency_cleaning_exports IS 'Tracks ListClean export batches for lineage preservation. Each export job records which emails were sent for cleaning.';
COMMENT ON TABLE other_agency_cleaning_export_rows IS 'Maps each exported email to its original other_agency_email_id, enabling accurate reconnection of cleaned results.';
