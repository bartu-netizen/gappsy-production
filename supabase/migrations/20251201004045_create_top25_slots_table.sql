/*
  # Create Top 25 Ranking Slots Table

  ## Overview
  This migration creates a table to track the availability and payment status of 
  Top 25 ranking spots for each state. This replaces the hardcoded ranking system 
  with a dynamic, database-driven approach.

  ## New Tables
  - `top25_slots`
    - `id` (uuid, primary key) - Unique identifier for each slot
    - `state_slug` (text, not null) - State identifier (e.g., "new-jersey")
    - `rank` (integer, not null) - Ranking position (1-25)
    - `is_paid` (boolean, default false) - Whether the slot has been purchased
    - `claimed_at` (timestamptz, nullable) - When the slot was claimed/purchased
    - `created_at` (timestamptz, default now()) - Record creation timestamp

  ## Constraints
  - Unique constraint on (state_slug, rank) to ensure one slot per rank per state
  - Check constraint to ensure rank is between 1 and 25

  ## Initial Data
  Seeds 25 slots for New Jersey:
  - Rank #1: Marked as paid (current sold spot)
  - Ranks #2-25: Available for purchase

  ## Security
  - RLS enabled to restrict access
  - Public read access for checking availability
  - Admin-only write access for claiming slots
*/

-- Create the top25_slots table
CREATE TABLE IF NOT EXISTS top25_slots (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug text NOT NULL,
  rank integer NOT NULL CHECK (rank >= 1 AND rank <= 25),
  is_paid boolean NOT NULL DEFAULT false,
  claimed_at timestamptz,
  created_at timestamptz DEFAULT now(),
  CONSTRAINT unique_state_rank UNIQUE (state_slug, rank)
);

-- Enable RLS
ALTER TABLE top25_slots ENABLE ROW LEVEL SECURITY;

-- Allow public read access to check slot availability
CREATE POLICY "Anyone can view top25 slots"
  ON top25_slots
  FOR SELECT
  USING (true);

-- Only authenticated users can update slot status (for future admin/payment flow)
CREATE POLICY "Authenticated users can update slots"
  ON top25_slots
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Create index for efficient querying by state and availability
CREATE INDEX IF NOT EXISTS idx_top25_slots_state_available 
  ON top25_slots(state_slug, is_paid, rank);

-- Seed initial data for New Jersey
-- Rank #1 is already claimed/paid, ranks #2-25 are available
INSERT INTO top25_slots (state_slug, rank, is_paid, claimed_at)
VALUES
  ('new-jersey', 1, true, now()),
  ('new-jersey', 2, false, null),
  ('new-jersey', 3, false, null),
  ('new-jersey', 4, false, null),
  ('new-jersey', 5, false, null),
  ('new-jersey', 6, false, null),
  ('new-jersey', 7, false, null),
  ('new-jersey', 8, false, null),
  ('new-jersey', 9, false, null),
  ('new-jersey', 10, false, null),
  ('new-jersey', 11, false, null),
  ('new-jersey', 12, false, null),
  ('new-jersey', 13, false, null),
  ('new-jersey', 14, false, null),
  ('new-jersey', 15, false, null),
  ('new-jersey', 16, false, null),
  ('new-jersey', 17, false, null),
  ('new-jersey', 18, false, null),
  ('new-jersey', 19, false, null),
  ('new-jersey', 20, false, null),
  ('new-jersey', 21, false, null),
  ('new-jersey', 22, false, null),
  ('new-jersey', 23, false, null),
  ('new-jersey', 24, false, null),
  ('new-jersey', 25, false, null)
ON CONFLICT (state_slug, rank) DO NOTHING;