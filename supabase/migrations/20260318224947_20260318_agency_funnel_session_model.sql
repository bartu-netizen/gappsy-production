/*
  # Agency Funnel Session Model Extension

  1. Modified Tables
    - `funnel_sessions`
      - `entry_path` (text) - 'search' or 'direct_profile' to distinguish how the user entered the funnel
      - `agency_slug` (text) - slug of the agency being viewed in this funnel session
      - `drop_off_step_name` (text) - human-readable name of the last funnel step reached
      - `drop_off_step_number` (integer) - numeric step number of the last funnel step reached
      - `purchased_product` (text) - product name/ID if a purchase was completed
      - `purchased_amount` (integer) - amount in cents if a purchase was completed
      - `upsell_taken` (boolean) - whether an upsell was accepted during this session
      - `avg_time_on_page_seconds` (integer) - average time spent on profile page
      - `max_scroll_depth_percent` (integer) - maximum scroll depth on profile page

  2. New Tables
    - `agency_funnel_engagement`
      - Tracks per-page-view engagement metrics (time on page, scroll depth)
      - Linked to funnel sessions via fsid
      - `id` (uuid, primary key)
      - `fsid` (text) - funnel session identifier
      - `agency_id` (text) - agency being viewed
      - `agency_slug` (text) - agency slug
      - `page_path` (text) - page where engagement occurred
      - `time_on_page_seconds` (integer) - seconds spent on page
      - `scroll_depth_percent` (integer) - max scroll depth percentage
      - `created_at` (timestamptz)

  3. Security
    - RLS enabled on `agency_funnel_engagement`
    - Insert policy for anonymous visitors (fire-and-forget from frontend)
    - No public SELECT (admin only via service role)

  4. Indexes
    - `agency_funnel_engagement`: fsid, agency_slug, agency_id
    - `funnel_sessions`: agency_slug, entry_path
*/

-- Add new columns to funnel_sessions
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'entry_path'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN entry_path text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'agency_slug'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN agency_slug text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'drop_off_step_name'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN drop_off_step_name text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'drop_off_step_number'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN drop_off_step_number integer;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'purchased_product'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN purchased_product text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'purchased_amount'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN purchased_amount integer;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'upsell_taken'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN upsell_taken boolean DEFAULT false;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'avg_time_on_page_seconds'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN avg_time_on_page_seconds integer;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'max_scroll_depth_percent'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN max_scroll_depth_percent integer;
  END IF;
END $$;

-- Create agency_funnel_engagement table
CREATE TABLE IF NOT EXISTS agency_funnel_engagement (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  fsid text NOT NULL,
  agency_id text,
  agency_slug text,
  page_path text,
  time_on_page_seconds integer DEFAULT 0,
  scroll_depth_percent integer DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE agency_funnel_engagement ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anonymous insert for engagement tracking"
  ON agency_funnel_engagement
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Indexes for agency_funnel_engagement
CREATE INDEX IF NOT EXISTS idx_agency_funnel_engagement_fsid
  ON agency_funnel_engagement(fsid);

CREATE INDEX IF NOT EXISTS idx_agency_funnel_engagement_agency_slug
  ON agency_funnel_engagement(agency_slug);

CREATE INDEX IF NOT EXISTS idx_agency_funnel_engagement_agency_id
  ON agency_funnel_engagement(agency_id);

-- Indexes for new funnel_sessions columns
CREATE INDEX IF NOT EXISTS idx_funnel_sessions_agency_slug
  ON funnel_sessions(agency_slug);

CREATE INDEX IF NOT EXISTS idx_funnel_sessions_entry_path
  ON funnel_sessions(entry_path);

CREATE INDEX IF NOT EXISTS idx_funnel_sessions_funnel_name_agency_slug
  ON funnel_sessions(funnel_name, agency_slug)
  WHERE funnel_name = 'your_agency';
