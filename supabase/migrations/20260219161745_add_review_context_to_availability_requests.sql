/*
  # Add review page context columns to agency_availability_requests

  ## Summary
  Adds columns to support availability submissions from agency review pages,
  enabling sentiment-based routing and logging in the Submissions Center.

  ## New Columns
  - `page_type` (text) — "review" for review page submissions, null for state pages
  - `review_slug` (text) — the agency review slug (e.g. "calta-marketing-new-york")
  - `sentiment` (text) — "positive" or "negative" from the review page

  ## Notes
  - source_flow and source_context already exist on the table and will carry this data
  - These columns are nullable to maintain backwards compatibility with existing rows
  - No RLS changes needed — service role is used for all writes to this table
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'page_type'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN page_type text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'review_slug'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN review_slug text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_availability_requests' AND column_name = 'sentiment'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN sentiment text;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_page_type
  ON agency_availability_requests(page_type)
  WHERE page_type IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_sentiment
  ON agency_availability_requests(sentiment)
  WHERE sentiment IS NOT NULL;
