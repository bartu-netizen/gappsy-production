/*
  # Agency Identity Hardening - Global Identity Keys and Duplicate Detection

  ## Summary
  This migration adds global identity key support for multi-state agency detection
  and creates tools to identify and clean up duplicate agency records.

  ## Changes

  ### 1. New Column: global_identity_key
  - Added to `other_agencies` table
  - Computed from normalized website domain (priority) or name+phone combination
  - Enables cross-state agency matching (one agency = one profile across all states)

  ### 2. Backfill global_identity_key
  - Domain-based key for agencies with websites: `domain:{normalized_domain}`
  - Name+phone key for agencies without websites: `name_phone:{name}|{phone_digits}`

  ### 3. Index for fast identity lookup
  - Partial index on global_identity_key for efficient cross-state matching

  ### 4. View: potential_duplicate_agencies
  - Identifies agencies that may be duplicates based on:
    - Same website domain across different state listings
    - Same name + phone combination
  - Used for manual review and automated cleanup

  ## Security
  - No RLS changes (admin-only operations)
  - Read-only view for duplicate detection

  ## Notes
  - This migration does NOT automatically merge duplicates
  - Duplicates should be reviewed manually before merging
  - The canonical agency (oldest created_at) should be preserved
*/

-- 1. Add global_identity_key column if not exists
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'global_identity_key'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN global_identity_key TEXT;
  END IF;
END $$;

-- 2. Create index on global_identity_key for fast cross-state lookups
CREATE INDEX IF NOT EXISTS idx_other_agencies_global_identity_key
ON other_agencies (global_identity_key)
WHERE global_identity_key IS NOT NULL;

-- 3. Backfill global_identity_key for existing agencies
-- Priority 1: Domain-based key (normalized website URL)
-- Priority 2: Name+phone key (for agencies without website)
UPDATE other_agencies
SET global_identity_key = CASE
  -- Domain-based key: strip protocol, www, path, query, lowercase
  WHEN website_url IS NOT NULL 
    AND trim(website_url) != '' 
    AND trim(website_url) NOT IN ('-', 'n/a', 'none', 'null', 'undefined')
    AND position('.' IN trim(lower(regexp_replace(regexp_replace(regexp_replace(trim(website_url), '^https?://(www\.)?', '', 'i'), '/.*$', ''), '\?.*$', '')))) > 0
  THEN 'domain:' || lower(
    regexp_replace(
      regexp_replace(
        regexp_replace(trim(website_url), '^https?://(www\.)?', '', 'i'),
        '/.*$', ''
      ),
      '\?.*$', ''
    )
  )
  -- Name+phone key: normalized name + phone digits (10 digits, strip leading 1)
  WHEN phone IS NOT NULL 
    AND length(regexp_replace(phone, '\D', '', 'g')) >= 10
    AND name IS NOT NULL
    AND trim(name) != ''
  THEN 'name_phone:' || lower(trim(regexp_replace(name, '\s+', ' ', 'g'))) || '|' || 
    CASE 
      WHEN length(regexp_replace(phone, '\D', '', 'g')) = 11 
        AND left(regexp_replace(phone, '\D', '', 'g'), 1) = '1'
      THEN right(regexp_replace(phone, '\D', '', 'g'), 10)
      ELSE left(regexp_replace(phone, '\D', '', 'g'), 10)
    END
  ELSE NULL
END
WHERE global_identity_key IS NULL;

-- 4. Create view to identify potential duplicate agencies
CREATE OR REPLACE VIEW potential_duplicate_agencies AS
WITH agency_groups AS (
  SELECT 
    global_identity_key,
    COUNT(*) as duplicate_count,
    array_agg(DISTINCT state_slug ORDER BY state_slug) as states,
    MIN(created_at) as first_created,
    array_agg(id ORDER BY created_at ASC) as agency_ids,
    array_agg(name ORDER BY created_at ASC) as agency_names,
    array_agg(slug ORDER BY created_at ASC) as agency_slugs
  FROM other_agencies
  WHERE global_identity_key IS NOT NULL
  GROUP BY global_identity_key
  HAVING COUNT(*) > 1
)
SELECT 
  global_identity_key,
  duplicate_count,
  states,
  first_created,
  agency_ids[1] as canonical_agency_id,
  agency_slugs[1] as canonical_slug,
  agency_ids,
  agency_names,
  agency_slugs
FROM agency_groups
ORDER BY duplicate_count DESC, first_created ASC;

-- 5. Create function to get all states for an agency (by global identity)
CREATE OR REPLACE FUNCTION get_agency_states(p_agency_id UUID)
RETURNS TEXT[]
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = public
AS $$
  SELECT array_agg(DISTINCT state_slug ORDER BY state_slug)
  FROM other_agencies
  WHERE global_identity_key = (
    SELECT global_identity_key 
    FROM other_agencies 
    WHERE id = p_agency_id
  )
  AND global_identity_key IS NOT NULL;
$$;
