/*
  # Create agency_logos table for bulk logo storage

  1. New Tables
    - `agency_logos`
      - `id` (uuid, primary key)
      - `agency_name` (text) - Name of the agency
      - `state` (text) - State code (e.g., 'nj', 'ca')
      - `logo_url` (text) - Supabase Storage URL
      - `display_order` (integer) - Position in ranked list
      - `created_at` (timestamp)
  
  2. Security
    - Enable RLS
    - Allow public read access
*/

CREATE TABLE IF NOT EXISTS agency_logos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_name text NOT NULL,
  state text NOT NULL,
  logo_url text NOT NULL,
  display_order integer,
  created_at timestamptz DEFAULT now(),
  UNIQUE(agency_name, state)
);

ALTER TABLE agency_logos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read access"
  ON agency_logos FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Authenticated users can insert"
  ON agency_logos FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update"
  ON agency_logos FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can delete"
  ON agency_logos FOR DELETE
  TO authenticated
  USING (true);
