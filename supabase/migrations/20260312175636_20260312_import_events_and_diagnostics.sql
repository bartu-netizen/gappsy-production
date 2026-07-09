/*
  # Import Events and Diagnostics System
  
  1. New Tables
    - `other_agencies_import_events` - Stores all import events for wp-admin diagnostics
      - `id` (uuid, primary key)
      - `job_id` (uuid, references import job)
      - `event_type` (text) - e.g., upload_received, file_staged, parse_started
      - `event_data` (jsonb) - additional event details
      - `created_at` (timestamp)
  
  2. Changes to existing tables
    - Add more diagnostic fields to import_jobs
  
  3. Purpose
    - Allow admins to see full import diagnostics without Supabase access
    - Track every stage of the import process
*/

CREATE TABLE IF NOT EXISTS other_agencies_import_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid NOT NULL,
  event_type text NOT NULL,
  event_data jsonb DEFAULT '{}',
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_import_events_job_id ON other_agencies_import_events(job_id);
CREATE INDEX IF NOT EXISTS idx_import_events_created_at ON other_agencies_import_events(created_at);

ALTER TABLE other_agencies_import_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role can manage import events"
ON other_agencies_import_events
FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'detected_delimiter'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN detected_delimiter text;
  END IF;
  
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'detected_header_row'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN detected_header_row integer;
  END IF;
  
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'file_size_bytes'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN file_size_bytes bigint;
  END IF;
  
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'last_checkpoint'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN last_checkpoint text;
  END IF;
  
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'chunks_failed'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN chunks_failed integer DEFAULT 0;
  END IF;
END $$;
