-- Create canonical Vazagency and enforce rank #1 rule
--
-- This migration ensures:
-- 1. ONE canonical Vazagency exists with stable ID
-- 2. ALL rank #1 slots across ALL states link to this canonical Vazagency
-- 3. Rank #1 is ALWAYS paid and unavailable
-- 4. This works automatically for all future state imports
--
-- Schema:
-- - Creates/ensures canonical Vazagency in other_agencies
-- - Updates all rank #1 top25_slots to link to canonical Vazagency
-- - Deletes duplicate state-specific Vazagency entries
-- - Adds function to auto-enforce this rule

-- Step 1: Create or ensure canonical Vazagency exists
DO $$
DECLARE
  canonical_vazagency_id uuid;
BEGIN
  -- Try to find existing Vazagency with simplest slug
  SELECT id INTO canonical_vazagency_id
  FROM other_agencies
  WHERE slug = 'vazagency-global' OR slug = 'vazagency'
  LIMIT 1;

  -- If not found, create it with predictable data
  IF canonical_vazagency_id IS NULL THEN
    INSERT INTO other_agencies (
      name,
      slug,
      state_slug,
      state_name,
      website_url,
      is_paid_listing,
      logo_url,
      intro,
      services
    ) VALUES (
      'Vazagency',
      'vazagency-global',
      'all-states',
      'All States',
      'https://vazagency.com',
      true,
      '/images/vazagency_logo_-_top_25_gappsy.webp',
      'Vazagency is a leading marketing agency serving businesses nationwide. We specialize in digital marketing, SEO, web design, and comprehensive marketing strategies.',
      ARRAY['Digital Marketing', 'SEO', 'Web Design', 'Social Media Marketing', 'PPC Advertising']
    )
    RETURNING id INTO canonical_vazagency_id;

    RAISE NOTICE 'Created canonical Vazagency with ID: %', canonical_vazagency_id;
  ELSE
    -- Update existing canonical entry to ensure it has correct data
    UPDATE other_agencies
    SET name = 'Vazagency',
        website_url = 'https://vazagency.com',
        is_paid_listing = true,
        logo_url = COALESCE(logo_url, '/images/vazagency_logo_-_top_25_gappsy.webp'),
        intro = COALESCE(intro, 'Vazagency is a leading marketing agency serving businesses nationwide.'),
        services = COALESCE(services, ARRAY['Digital Marketing', 'SEO', 'Web Design'])
    WHERE id = canonical_vazagency_id;

    RAISE NOTICE 'Using existing canonical Vazagency with ID: %', canonical_vazagency_id;
  END IF;

  -- Store the canonical ID for later steps
  CREATE TEMP TABLE IF NOT EXISTS canonical_vazagency (id uuid);
  DELETE FROM canonical_vazagency;
  INSERT INTO canonical_vazagency VALUES (canonical_vazagency_id);
END $$;

-- Step 2: Update ALL rank #1 slots to link to canonical Vazagency
UPDATE top25_slots
SET agency_id = (SELECT id FROM canonical_vazagency),
    agency_name = 'Vazagency',
    website = 'https://vazagency.com',
    logo_url = '/images/vazagency_logo_-_top_25_gappsy.webp',
    is_paid = true,
    is_available = false,
    updated_at = now()
WHERE rank = 1;

-- Log how many slots were updated
DO $$
DECLARE
  updated_count integer;
BEGIN
  SELECT COUNT(*) INTO updated_count
  FROM top25_slots
  WHERE rank = 1 AND agency_id = (SELECT id FROM canonical_vazagency);
  
  RAISE NOTICE 'Updated % rank #1 slots to canonical Vazagency', updated_count;
END $$;

-- Step 3: Delete duplicate state-specific Vazagency entries
-- Keep only the canonical one
DELETE FROM other_agencies
WHERE lower(name) = 'vazagency'
  AND id != (SELECT id FROM canonical_vazagency);

-- Log deletions
DO $$
DECLARE
  deleted_count integer;
BEGIN
  GET DIAGNOSTICS deleted_count = ROW_COUNT;
  RAISE NOTICE 'Deleted % duplicate Vazagency entries', deleted_count;
END $$;

-- Step 4: Create function to auto-enforce rank #1 = Vazagency rule
CREATE OR REPLACE FUNCTION enforce_rank1_vazagency()
RETURNS TRIGGER AS $$
DECLARE
  canonical_vazagency_id uuid;
BEGIN
  -- Only enforce for rank #1
  IF NEW.rank = 1 THEN
    -- Get canonical Vazagency ID
    SELECT id INTO canonical_vazagency_id
    FROM other_agencies
    WHERE slug = 'vazagency-global'
    LIMIT 1;

    -- If canonical Vazagency exists, enforce it
    IF canonical_vazagency_id IS NOT NULL THEN
      NEW.agency_id := canonical_vazagency_id;
      NEW.agency_name := 'Vazagency';
      NEW.website := 'https://vazagency.com';
      NEW.is_paid := true;
      NEW.is_available := false;
      
      RAISE NOTICE 'Auto-enforced rank #1 = Vazagency for state: %', NEW.state_slug;
    END IF;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 5: Create trigger to auto-enforce on INSERT/UPDATE
DROP TRIGGER IF EXISTS trigger_enforce_rank1_vazagency ON top25_slots;

CREATE TRIGGER trigger_enforce_rank1_vazagency
  BEFORE INSERT OR UPDATE ON top25_slots
  FOR EACH ROW
  EXECUTE FUNCTION enforce_rank1_vazagency();

-- Step 6: Verification query
DO $$
DECLARE
  non_vazagency_rank1_count integer;
  total_rank1_count integer;
  canonical_id uuid;
BEGIN
  SELECT id INTO canonical_id FROM canonical_vazagency;
  
  SELECT COUNT(*) INTO total_rank1_count
  FROM top25_slots
  WHERE rank = 1;
  
  SELECT COUNT(*) INTO non_vazagency_rank1_count
  FROM top25_slots
  WHERE rank = 1
    AND (agency_id IS NULL 
         OR agency_id != canonical_id
         OR is_paid = false 
         OR is_available = true);
  
  RAISE NOTICE '===== VERIFICATION =====';
  RAISE NOTICE 'Canonical Vazagency ID: %', canonical_id;
  RAISE NOTICE 'Total rank #1 slots: %', total_rank1_count;
  RAISE NOTICE 'Non-Vazagency rank #1 slots: %', non_vazagency_rank1_count;
  
  IF non_vazagency_rank1_count = 0 THEN
    RAISE NOTICE '✅ SUCCESS: All rank #1 slots are Vazagency paid';
  ELSE
    RAISE WARNING '⚠️  WARNING: % rank #1 slots are not properly set', non_vazagency_rank1_count;
  END IF;
END $$;

-- Clean up temp table
DROP TABLE IF EXISTS canonical_vazagency;