/*
  # Extend agency_reviews for bulk import system

  1. Add Missing Columns for Publishing Control
    - is_published: Flag to control visibility (drafts vs published)
    - uniqueness_score: 0-100 score for content quality/uniqueness
    - created_at, updated_at: Timestamps for audit trail

  2. Add Unique Constraint on agency_slug
    - Enables safe upsert operations during bulk import

  3. RLS Policies
    - Enforce service role only for writes
    - Public SELECT allowed only for is_published=true rows

  4. Indexes
    - (is_published, created_at DESC) for published list queries
    - (agency_slug) unique for upsert operations
*/

-- Add missing columns if not present
DO $$
BEGIN
  -- is_published: controls visibility (default false for drafts)
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_reviews' AND column_name = 'is_published'
  ) THEN
    ALTER TABLE agency_reviews ADD COLUMN is_published BOOLEAN NOT NULL DEFAULT false;
  END IF;

  -- uniqueness_score: 0-100 quality/uniqueness metric
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_reviews' AND column_name = 'uniqueness_score'
  ) THEN
    ALTER TABLE agency_reviews ADD COLUMN uniqueness_score INTEGER NOT NULL DEFAULT 0;
  END IF;

  -- created_at: record creation timestamp
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_reviews' AND column_name = 'created_at'
  ) THEN
    ALTER TABLE agency_reviews ADD COLUMN created_at TIMESTAMPTZ NOT NULL DEFAULT now();
  END IF;

  -- updated_at: last modification timestamp
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_reviews' AND column_name = 'updated_at'
  ) THEN
    ALTER TABLE agency_reviews ADD COLUMN updated_at TIMESTAMPTZ NOT NULL DEFAULT now();
  END IF;
END $$;

-- Add unique constraint on agency_slug for safe upsert
CREATE UNIQUE INDEX IF NOT EXISTS idx_agency_reviews_agency_slug_unique
  ON agency_reviews(agency_slug);

-- Add indexes for efficient queries
CREATE INDEX IF NOT EXISTS idx_agency_reviews_published
  ON agency_reviews(is_published, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_agency_reviews_score
  ON agency_reviews(uniqueness_score DESC);

-- Ensure RLS is enabled
ALTER TABLE agency_reviews ENABLE ROW LEVEL SECURITY;

-- Drop existing policies to recreate them
DROP POLICY IF EXISTS "Public read published reviews" ON agency_reviews;
DROP POLICY IF EXISTS "Service role full access" ON agency_reviews;

-- Public read policy: only published reviews visible
CREATE POLICY "Public read published reviews"
  ON agency_reviews FOR SELECT
  TO public
  USING (is_published = true);

-- Service role full access for admin operations
CREATE POLICY "Service role full access reviews"
  ON agency_reviews FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);
