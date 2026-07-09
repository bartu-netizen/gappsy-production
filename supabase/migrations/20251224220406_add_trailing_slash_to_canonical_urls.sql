/*
  # Add Trailing Slash to Canonical URLs (SEO Fix)

  ## Changes
  - Normalize all `canonical_url` values in `state_pages` to end with trailing slash
  - This ensures 100% consistency with the old site SEO
  - Updates any URLs missing the trailing slash

  ## Why
  - SEO canonical URLs must be consistent
  - Old site (gappsy.com) uses trailing slash
  - Search engines treat /path and /path/ as different URLs
  - We must match the canonical format exactly

  ## Implementation
  - Update all existing rows to add trailing slash if missing
  - No data loss - only appending '/' where needed
*/

-- Add trailing slash to all canonical URLs that don't have it
UPDATE state_pages
SET canonical_url = CASE
  WHEN canonical_url LIKE '%/' THEN canonical_url
  ELSE canonical_url || '/'
END
WHERE canonical_url IS NOT NULL;

-- Verify the update
DO $$
DECLARE
  total_count INTEGER;
  slash_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO total_count FROM state_pages WHERE canonical_url IS NOT NULL;
  SELECT COUNT(*) INTO slash_count FROM state_pages WHERE canonical_url LIKE '%/';
  
  RAISE NOTICE 'Total canonical URLs: %', total_count;
  RAISE NOTICE 'URLs with trailing slash: %', slash_count;
  
  IF total_count != slash_count THEN
    RAISE EXCEPTION 'Some canonical URLs still missing trailing slash!';
  END IF;
END $$;
