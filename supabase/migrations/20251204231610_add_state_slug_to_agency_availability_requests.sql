/*
  # Add state_slug to agency_availability_requests table

  1. Changes
    - Add `state_slug` column to `agency_availability_requests` table
    - Rename `email` to `client_email` for clarity
    - Rename `name` to `client_name` for clarity

  2. Notes
    - This migration enhances the availability requests tracking
    - The state_slug allows for better state-specific analytics
*/

-- Add state_slug column if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'state_slug'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN state_slug TEXT;
  END IF;
END $$;

-- Rename email to client_email if needed
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'email'
  ) AND NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'client_email'
  ) THEN
    ALTER TABLE agency_availability_requests RENAME COLUMN email TO client_email;
  END IF;
END $$;

-- Rename name to client_name if needed
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'name'
  ) AND NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'client_name'
  ) THEN
    ALTER TABLE agency_availability_requests RENAME COLUMN name TO client_name;
  END IF;
END $$;
