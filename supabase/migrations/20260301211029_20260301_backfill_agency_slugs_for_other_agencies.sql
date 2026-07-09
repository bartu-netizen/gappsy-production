/*
  # Backfill Agency Slugs for Other Agencies

  1. Purpose
    - Generate slugs for existing agencies in other_agencies table
    - Populate slugs for agencies that will appear in agency_listings_index
    - Ensure all agencies have canonical /your-agency/{slug} URLs
  
  2. Slug Generation Rules
    - Lowercase agency name
    - Replace & with "and"
    - Remove special characters
    - Replace spaces with hyphens
    - Append state_slug for uniqueness (since composite unique index)
    - Handle collisions with numeric suffixes
  
  3. Data Safety
    - Idempotent: Only generates slugs for agencies with NULL slug
    - Does not overwrite existing slugs
    - Logs count of slugs generated
  
  4. Performance
    - Batch operation via DO block
    - No loops, uses window functions for collision detection
*/

DO $$
DECLARE
  v_updated_count INT := 0;
  v_collision_count INT := 0;
BEGIN
  -- Step 1: Generate initial slugs for agencies without them
  WITH slug_candidates AS (
    SELECT 
      id,
      state_slug,
      name,
      LOWER(
        REGEXP_REPLACE(
          REGEXP_REPLACE(
            REGEXP_REPLACE(
              REGEXP_REPLACE(
                REGEXP_REPLACE(
                  name,
                  '&',
                  'and'
                ),
                '[^a-zA-Z0-9\s-]',
                '',
                'g'
              ),
              '\s+',
              '-',
              'g'
            ),
            '-{2,}',
            '-',
            'g'
          ),
          '^-+|-+$',
          '',
          'g'
        )
      ) || '-' || state_slug AS base_slug
    FROM other_agencies
    WHERE slug IS NULL
      AND is_active = true
      AND state_slug IS NOT NULL
      AND name IS NOT NULL
  ),
  -- Step 2: Add collision detection (find if slug exists)
  slug_with_collision_detection AS (
    SELECT 
      sc.id,
      sc.state_slug,
      CASE 
        WHEN NOT EXISTS (
          SELECT 1 FROM other_agencies oa2 
          WHERE oa2.slug = sc.base_slug 
            AND oa2.is_active = true
        ) THEN sc.base_slug
        ELSE sc.base_slug || '-' || (
          SELECT COUNT(*) + 2 FROM other_agencies oa2 
          WHERE oa2.slug LIKE sc.base_slug || '-%'
            AND oa2.is_active = true
        )::text
      END AS final_slug
    FROM slug_candidates sc
  )
  UPDATE other_agencies oa
  SET slug = swcd.final_slug, updated_at = now()
  FROM slug_with_collision_detection swcd
  WHERE oa.id = swcd.id;

  GET DIAGNOSTICS v_updated_count = ROW_COUNT;

  -- Log summary
  RAISE NOTICE 'Backfill complete: Generated % slugs for other_agencies', v_updated_count;

END $$;

-- Verify: Show agencies that still have NULL slugs (should be 0 for active agencies)
SELECT COUNT(*) as agencies_without_slug
FROM other_agencies
WHERE slug IS NULL
  AND is_active = true;
