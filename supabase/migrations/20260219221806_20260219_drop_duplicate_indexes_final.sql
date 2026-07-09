/*
  # Drop Duplicate Indexes - Final Pass

  Remove 4 sets of identical/duplicate indexes
*/

-- agency_reviews: Drop idx_agency_reviews_published (duplicate of idx_agency_reviews_is_published)
DROP INDEX IF EXISTS public.idx_agency_reviews_published;

-- agency_reviews: Drop idx_agency_reviews_uniqueness_score (duplicate of idx_agency_reviews_score)
DROP INDEX IF EXISTS public.idx_agency_reviews_score;

-- other_agencies: Drop idx_other_agencies_state_only (duplicate of idx_other_agencies_state_slug)
DROP INDEX IF EXISTS public.idx_other_agencies_state_only;

-- top25_slots: Drop top25_slots_state_slug_rank_unique (keep unique constraint version)
-- Note: This is constraint-backed, so we can't drop it directly
-- Skip this one as it backs the unique constraint
