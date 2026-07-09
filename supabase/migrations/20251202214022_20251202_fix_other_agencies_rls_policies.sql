/*
  # Fix RLS Policies for other_agencies Table

  1. Problem
    - Table has RLS enabled but only has SELECT policy
    - No INSERT or UPDATE policies exist
    - Frontend upserts are being blocked with "violates row-level security policy"
    
  2. Solution
    - Add permissive INSERT policy to allow app to create agency records
    - Add permissive UPDATE policy to allow app to update agency records
    - Keep existing SELECT policy (already permissive)
    
  3. Security Notes
    - This is a public directory of agencies (not user-owned data yet)
    - Frontend can insert/update agency records as part of the claiming flow
    - No user authentication required at this stage
    - Future: Add owner-based policies when user ownership is implemented
*/

-- Add INSERT policy to allow app to create records
CREATE POLICY "other_agencies_insert_all"
  ON other_agencies
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Add UPDATE policy to allow app to update records
CREATE POLICY "other_agencies_update_all"
  ON other_agencies
  FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

-- Note: SELECT policy "Anyone can view agencies" already exists and is permissive
