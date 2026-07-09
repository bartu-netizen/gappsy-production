/*
  # Add listing_management_status to other_agencies

  ## Summary
  Adds a new safe, reversible status column to track agency listing management
  actions triggered via the manage listing funnel (email recovery flow).

  ## New Columns
  - `other_agencies.listing_management_status` (text, nullable)
    - `NULL` = default / untouched (same as visible_free)
    - `visible_free` = agency confirmed they want to stay listed (free tier)
    - `active_paid` = agency has an active paid listing (set programmatically)
    - `removal_pending` = agency requested removal, 30-day grace window
    - `removed` = agency confirmed permanent removal

  ## Notes
  1. This column is additive — no existing data is changed.
  2. NULL and 'visible_free' are functionally equivalent for display purposes.
  3. Hard DELETE is never used; status = 'removed' hides the listing instead.
  4. RLS is not changed (table already has service-role-only write policies).
*/

ALTER TABLE other_agencies
  ADD COLUMN IF NOT EXISTS listing_management_status TEXT
  CHECK (listing_management_status IN ('visible_free','active_paid','removal_pending','removed'));

CREATE INDEX IF NOT EXISTS idx_other_agencies_listing_management_status
  ON other_agencies (listing_management_status)
  WHERE listing_management_status IS NOT NULL;
