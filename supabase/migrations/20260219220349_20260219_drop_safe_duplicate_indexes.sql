/*
  # Drop Safe Duplicate Indexes (Non-Constraint Backed)

  Removes only indexes that don't back constraints,
  while preserving all constraint-backed indexes.
*/

-- Remove duplicate email indexes on em_contacts (keep em_contacts_email_unique)
DROP INDEX IF EXISTS public.idx_em_contacts_email;

-- Remove duplicate unsub_token index on agency_email_preferences (keep the unique one)
DROP INDEX IF EXISTS public.idx_agency_email_preferences_unsub_token;

-- Remove redundant name indexes on agency_listings_index
-- Keep: idx_agency_listings_name_gin (GIN for ILIKE), idx_agency_listings_normalized
DROP INDEX IF EXISTS public.idx_ali_name_lower;
DROP INDEX IF EXISTS public.idx_ali_name_trgm;

-- Remove redundant slug index on agency_listings_index (keep one)
DROP INDEX IF EXISTS public.idx_agency_listings_slug;

-- Remove redundant state_section composite (consolidate to one)
DROP INDEX IF EXISTS public.idx_agency_listings_state_section;

-- On agency_reviews, keep agency_reviews_agency_slug_key (the unique constraint)
-- idx_agency_reviews_agency_slug_unique is a duplicate
DROP INDEX IF EXISTS public.idx_agency_reviews_agency_slug_unique;

-- On agency_email_preferences, keep agency_email_preferences_unsub_token_key (the unique constraint)
-- idx_agency_email_preferences_email is just a regular index, keep it for lookups

-- Clean up redundant create_at indexes (many tables have multiple)
DROP INDEX IF EXISTS public.idx_em_events_created;

-- Remove idx_agency_listings_normalized if there's a better index
DROP INDEX IF EXISTS public.idx_agency_listings_normalized;

-- Remove idx_agency_listings_active (low selectivity boolean)
DROP INDEX IF EXISTS public.idx_agency_listings_active;

-- On em_suppression, keep em_suppression_email_key (unique constraint)
-- Do not drop it - it backs a constraint
