/*
  # Create Debug Test Table

  1. New Tables
    - `debug_test`
      - `id` (uuid, primary key) - Unique identifier for each test entry
      - `message` (text) - Test message content
      - `timestamp` (timestamptz) - When the test write occurred
      - `created_at` (timestamptz) - Record creation timestamp

  2. Security
    - Enable RLS on `debug_test` table
    - Add policy for public read access (debug purposes only)
    - Add policy for public write access (debug purposes only)

  3. Purpose
    - This table is used ONLY for debug/testing purposes
    - Allows verification of which database writes are landing in
    - Public access is intentional for debugging
*/

CREATE TABLE IF NOT EXISTS debug_test (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  message text NOT NULL DEFAULT '',
  timestamp timestamptz DEFAULT now(),
  created_at timestamptz DEFAULT now()
);

ALTER TABLE debug_test ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read debug test data"
  ON debug_test
  FOR SELECT
  USING (true);

CREATE POLICY "Anyone can insert debug test data"
  ON debug_test
  FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Anyone can delete debug test data"
  ON debug_test
  FOR DELETE
  USING (true);
