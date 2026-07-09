/*
  # Fix Slug Uniqueness - Composite Index with State

  1. Problem
    - Current: UNIQUE INDEX on other_agencies(slug) - global unique
    - Result: Only one "acme-marketing" can exist, even in different states
  
  2. Solution
    - Change to: UNIQUE INDEX on (state_slug, slug)
    - Allows same slug per state
    - URLs can remain: /your-agency/:slug if slug is globally unique after slug+state combo
    - OR: Support state-aware slug lookups in resolver
  
  3. Migration Strategy
    - Drop existing UNIQUE constraint on other_agencies.slug
    - Add composite UNIQUE index on (state_slug, slug)
    - Add index on agency_listings_index for slug lookups (already exists but verify)
    - Ensure slug can be NULL during transition if needed
  
  4. Data Safety
    - No data deleted
    - Existing slugs remain unchanged
    - Composite index allows duplicates across states only (intended)
*/

-- Drop the old global unique constraint if it exists
DROP INDEX IF EXISTS idx_other_agencies_slug_unique;

-- Add composite unique index on (state_slug, slug)
-- This allows same slug in different states (by design)
CREATE UNIQUE INDEX IF NOT EXISTS idx_other_agencies_state_slug_unique 
  ON other_agencies (state_slug, slug) 
  WHERE slug IS NOT NULL AND is_active = true;

-- Keep supporting index for direct slug lookups (for backward compat)
CREATE INDEX IF NOT EXISTS idx_other_agencies_slug_lookup 
  ON other_agencies (slug) 
  WHERE is_active = true;

-- Verify agency_listings_index has good slug indexes
-- (these should already exist from previous migrations)
CREATE INDEX IF NOT EXISTS idx_ali_agency_slug_state
  ON agency_listings_index (agency_slug, state_slug);

CREATE INDEX IF NOT EXISTS idx_ali_state_slug
  ON agency_listings_index (state_slug, agency_slug)
  WHERE section = 'other';

-- Create function to find duplicate slugs (for audit/cleanup)
CREATE OR REPLACE FUNCTION find_duplicate_agency_slugs()
RETURNS TABLE (
  state_slug text,
  slug text,
  agency_count int,
  agencies jsonb
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    oa.state_slug,
    oa.slug,
    COUNT(*)::int as agency_count,
    jsonb_agg(jsonb_build_object('id', oa.id, 'name', oa.name, 'is_active', oa.is_active))
  FROM other_agencies oa
  WHERE oa.slug IS NOT NULL
  GROUP BY oa.state_slug, oa.slug
  HAVING COUNT(*) > 1;
END;
$$ LANGUAGE plpgsql;
