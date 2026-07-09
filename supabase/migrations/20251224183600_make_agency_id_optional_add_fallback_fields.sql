/*
  # Make agency_id optional and add fallback fields for placeholder agencies

  This migration allows availability requests to be submitted for both:
  - Real agencies (with agency_id from database)
  - Placeholder agencies (without agency_id, using fallback name/website/slug)

  ## Changes

  1. **Make agency_id nullable in agency_availability_requests**
     - Remove NOT NULL constraint from agency_id
     - Keep foreign key constraint but allow nulls
     - This allows submissions even when agency doesn't exist in database

  2. **Add fallback columns for placeholder agencies**
     - `agency_name` (text) - stores agency name when no DB record exists
     - `agency_website` (text, nullable) - stores agency website
     - `agency_slug` (text, nullable) - stores agency slug for tracking
     - `source_page` (text, nullable) - stores the page URL where request was made

  3. **Security**
     - Maintain existing RLS policies (anyone can insert)
     - No changes to authentication requirements

  ## Important Notes

  - Requests with agency_id: can be connected to claimed agency accounts later
  - Requests without agency_id: stored with fallback data for manual follow-up
  - All submissions are tracked regardless of agency verification status
*/

-- Make agency_id nullable
DO $$
BEGIN
  -- Drop the NOT NULL constraint on agency_id if it exists
  IF EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests'
      AND column_name = 'agency_id'
      AND is_nullable = 'NO'
  ) THEN
    ALTER TABLE agency_availability_requests
    ALTER COLUMN agency_id DROP NOT NULL;
  END IF;
END $$;

-- Add fallback columns for placeholder agencies
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'agency_name'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN agency_name TEXT;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'agency_website'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN agency_website TEXT;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'agency_slug'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN agency_slug TEXT;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'source_page'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN source_page TEXT;
  END IF;
END $$;

-- Create index on agency_name for queries filtering by placeholder agency name
CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_agency_name
  ON agency_availability_requests(agency_name);

-- Create index on source_page to track which pages generate requests
CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_source_page
  ON agency_availability_requests(source_page);
