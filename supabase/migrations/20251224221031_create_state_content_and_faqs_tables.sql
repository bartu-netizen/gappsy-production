/*
  # Create State Content and FAQs Tables

  ## Overview
  Creates tables to store per-state content (hero, intro, metadata) and FAQs.
  This fixes the critical bug where state pages show incorrect or missing content.

  ## New Tables
  
  ### `state_content`
  Stores hero/intro content for each state page
  - `state_slug` (PK, text) - State identifier (e.g., 'alaska', 'alabama')
  - `hero_intro` (text) - Full hero intro paragraph
  - `hero_intro_short` (text, nullable) - Short hero intro
  - `state_intro_short` (text, nullable) - Short state description
  - `state_intro_full` (text, nullable) - Full state introduction
  - `last_updated` (text, nullable) - Date string (e.g., '2025-12-22')
  - `created_at` (timestamptz) - Record creation timestamp
  - `updated_at` (timestamptz) - Last update timestamp

  ### `state_faqs`
  Stores FAQs for each state (questions and answers)
  - `id` (uuid, PK) - Unique identifier
  - `state_slug` (text, indexed) - State identifier
  - `position` (integer) - Display order (1, 2, 3...)
  - `question` (text) - FAQ question
  - `answer` (text) - FAQ answer
  - `created_at` (timestamptz) - Record creation timestamp

  ## Security
  - Enable RLS on both tables
  - Allow public read access (state content is public)
  - Restrict writes to authenticated users only

  ## Why This Matters
  - **Before**: State pages showed hardcoded NJ content or missing content
  - **After**: Each state has its own content stored in DB, fetched by state_slug
  - **Impact**: Alaska and all future imports will show correct content
*/

-- Create state_content table
CREATE TABLE IF NOT EXISTS state_content (
  state_slug text PRIMARY KEY,
  hero_intro text NOT NULL DEFAULT '',
  hero_intro_short text,
  state_intro_short text,
  state_intro_full text,
  last_updated text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create state_faqs table
CREATE TABLE IF NOT EXISTS state_faqs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug text NOT NULL,
  position integer NOT NULL,
  question text NOT NULL,
  answer text NOT NULL,
  created_at timestamptz DEFAULT now(),
  CONSTRAINT unique_state_faq_position UNIQUE (state_slug, position)
);

-- Create index on state_slug for faster FAQ lookups
CREATE INDEX IF NOT EXISTS idx_state_faqs_state_slug ON state_faqs(state_slug);

-- Enable RLS
ALTER TABLE state_content ENABLE ROW LEVEL SECURITY;
ALTER TABLE state_faqs ENABLE ROW LEVEL SECURITY;

-- RLS Policies: Public read access (state content is public)
CREATE POLICY "Anyone can read state content"
  ON state_content FOR SELECT
  USING (true);

CREATE POLICY "Anyone can read state FAQs"
  ON state_faqs FOR SELECT
  USING (true);

-- RLS Policies: Authenticated users can insert/update (for imports)
CREATE POLICY "Authenticated users can insert state content"
  ON state_content FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update state content"
  ON state_content FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can insert FAQs"
  ON state_faqs FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can delete FAQs"
  ON state_faqs FOR DELETE
  TO authenticated
  USING (true);

-- Add helpful comments
COMMENT ON TABLE state_content IS 'Stores per-state hero/intro content for state pages. Keyed by state_slug.';
COMMENT ON TABLE state_faqs IS 'Stores per-state FAQs. Multiple rows per state, ordered by position.';
COMMENT ON COLUMN state_content.state_slug IS 'State identifier (e.g., alaska, alabama). Must match state_pages.state_slug.';
COMMENT ON COLUMN state_faqs.state_slug IS 'State identifier. Multiple FAQs can exist for same state.';
COMMENT ON COLUMN state_faqs.position IS 'Display order for FAQs (1, 2, 3...). Lower numbers appear first.';
