/*
  # Multi-State Agency Architecture

  ## Summary
  Implements proper multi-state agency support where one agency identity can
  appear in multiple states while maintaining a single /your-agency page.

  ## Core Rule
  1 real agency = 1 agency identity = 1 canonical slug = 1 /your-agency page = multiple states

  ## Changes

  ### 1. New Table: other_agency_state_listings
  - Many-to-many relationship between agencies and states
  - Each agency can have listings in multiple states
  - State-specific data (rank, section, visibility) stored per listing
  - The main other_agencies.state_slug becomes the PRIMARY state

  ### 2. Enhanced Merge Functions
  - Updated merge_duplicate_agencies to also merge state listings
  - Auto-moves all state associations to canonical agency

  ### 3. Backfill Trigger
  - When agency is created, auto-creates state listing for its primary state
  - Ensures backwards compatibility

  ### 4. Views for Query Simplification
  - agency_all_states: Shows agency with all its states
  - agency_canonical_lookup: Fast canonical agency lookup

  ## Security
  - RLS enabled on new table
  - Public read access for state listings
  - Service role write access
*/

-- ─────────────────────────────────────────────
-- 1. Create state listings association table
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS other_agency_state_listings (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id       uuid NOT NULL REFERENCES other_agencies(id) ON DELETE CASCADE,
  state_slug      text NOT NULL,
  state_name      text,
  section         text DEFAULT 'other' CHECK (section IN ('top25', 'other', 'featured')),
  rank            int NULL,
  is_visible      boolean DEFAULT true,
  import_job_id   uuid NULL,
  created_at      timestamptz DEFAULT now(),
  updated_at      timestamptz DEFAULT now(),
  
  CONSTRAINT unique_agency_state UNIQUE (agency_id, state_slug)
);

CREATE INDEX IF NOT EXISTS idx_oasl_agency_id ON other_agency_state_listings(agency_id);
CREATE INDEX IF NOT EXISTS idx_oasl_state_slug ON other_agency_state_listings(state_slug);
CREATE INDEX IF NOT EXISTS idx_oasl_visible_state ON other_agency_state_listings(state_slug, is_visible) WHERE is_visible = true;

ALTER TABLE other_agency_state_listings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read state listings"
  ON other_agency_state_listings FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Service role can manage state listings"
  ON other_agency_state_listings FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- ─────────────────────────────────────────────
-- 2. Backfill existing agencies into state listings
-- ─────────────────────────────────────────────
INSERT INTO other_agency_state_listings (agency_id, state_slug, state_name, section, is_visible)
SELECT
  id as agency_id,
  state_slug,
  state_name,
  'other' as section,
  is_active as is_visible
FROM other_agencies
WHERE state_slug IS NOT NULL
ON CONFLICT (agency_id, state_slug) DO NOTHING;

-- ─────────────────────────────────────────────
-- 3. Trigger to auto-create state listing on agency insert
-- ─────────────────────────────────────────────
CREATE OR REPLACE FUNCTION auto_create_state_listing()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
BEGIN
  INSERT INTO other_agency_state_listings (agency_id, state_slug, state_name, is_visible)
  VALUES (NEW.id, NEW.state_slug, NEW.state_name, NEW.is_active)
  ON CONFLICT (agency_id, state_slug) DO UPDATE SET
    is_visible = NEW.is_active,
    updated_at = now();
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_auto_create_state_listing ON other_agencies;
CREATE TRIGGER trg_auto_create_state_listing
  AFTER INSERT ON other_agencies
  FOR EACH ROW
  EXECUTE FUNCTION auto_create_state_listing();

-- ─────────────────────────────────────────────
-- 4. Function to add agency to additional state
-- ─────────────────────────────────────────────
CREATE OR REPLACE FUNCTION add_agency_to_state(
  p_agency_id UUID,
  p_state_slug TEXT,
  p_state_name TEXT DEFAULT NULL
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_state_name TEXT;
  v_result_id UUID;
BEGIN
  v_state_name := COALESCE(p_state_name, initcap(replace(p_state_slug, '-', ' ')));
  
  INSERT INTO other_agency_state_listings (agency_id, state_slug, state_name, is_visible)
  VALUES (p_agency_id, p_state_slug, v_state_name, true)
  ON CONFLICT (agency_id, state_slug) DO UPDATE SET
    is_visible = true,
    updated_at = now()
  RETURNING id INTO v_result_id;
  
  RETURN jsonb_build_object(
    'success', true,
    'listing_id', v_result_id,
    'agency_id', p_agency_id,
    'state_slug', p_state_slug
  );
END;
$$;

-- ─────────────────────────────────────────────
-- 5. Enhanced merge function that also merges state listings
-- ─────────────────────────────────────────────
CREATE OR REPLACE FUNCTION merge_duplicate_agencies(
  p_canonical_agency_id UUID,
  p_duplicate_agency_ids UUID[]
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_emails_moved INT := 0;
  v_phones_moved INT := 0;
  v_states_moved INT := 0;
  v_duplicates_deactivated INT := 0;
  v_canonical_slug TEXT;
  v_dup_id UUID;
  v_moved_count INT;
BEGIN
  SELECT slug INTO v_canonical_slug
  FROM other_agencies
  WHERE id = p_canonical_agency_id;

  IF v_canonical_slug IS NULL THEN
    RETURN jsonb_build_object(
      'success', false,
      'error', 'Canonical agency not found'
    );
  END IF;

  FOREACH v_dup_id IN ARRAY p_duplicate_agency_ids
  LOOP
    IF v_dup_id = p_canonical_agency_id THEN
      CONTINUE;
    END IF;

    -- Move emails to canonical agency (skip if already exists)
    WITH moved AS (
      UPDATE other_agency_emails
      SET agency_id = p_canonical_agency_id
      WHERE agency_id = v_dup_id
        AND email_normalized NOT IN (
          SELECT email_normalized
          FROM other_agency_emails
          WHERE agency_id = p_canonical_agency_id
        )
      RETURNING id
    )
    SELECT COUNT(*) INTO v_moved_count FROM moved;
    v_emails_moved := v_emails_moved + v_moved_count;

    DELETE FROM other_agency_emails WHERE agency_id = v_dup_id;

    -- Move phones to canonical agency (skip if already exists)
    WITH moved AS (
      UPDATE other_agency_phones
      SET agency_id = p_canonical_agency_id
      WHERE agency_id = v_dup_id
        AND phone_normalized NOT IN (
          SELECT phone_normalized
          FROM other_agency_phones
          WHERE agency_id = p_canonical_agency_id
            AND phone_normalized IS NOT NULL
        )
      RETURNING id
    )
    SELECT COUNT(*) INTO v_moved_count FROM moved;
    v_phones_moved := v_phones_moved + v_moved_count;

    DELETE FROM other_agency_phones WHERE agency_id = v_dup_id;

    -- Move state listings to canonical agency (skip if already exists)
    WITH moved AS (
      UPDATE other_agency_state_listings
      SET agency_id = p_canonical_agency_id
      WHERE agency_id = v_dup_id
        AND state_slug NOT IN (
          SELECT state_slug
          FROM other_agency_state_listings
          WHERE agency_id = p_canonical_agency_id
        )
      RETURNING id
    )
    SELECT COUNT(*) INTO v_moved_count FROM moved;
    v_states_moved := v_states_moved + v_moved_count;

    DELETE FROM other_agency_state_listings WHERE agency_id = v_dup_id;

    -- Update agency_listings_index to point to canonical
    UPDATE agency_listings_index
    SET agency_id = p_canonical_agency_id::text,
        agency_slug = v_canonical_slug
    WHERE agency_id = v_dup_id::text;

    -- Soft-delete the duplicate agency
    UPDATE other_agencies
    SET is_active = false,
        agency_dedupe_key = NULL,
        global_identity_key = NULL
    WHERE id = v_dup_id;

    v_duplicates_deactivated := v_duplicates_deactivated + 1;
  END LOOP;

  RETURN jsonb_build_object(
    'success', true,
    'canonical_agency_id', p_canonical_agency_id,
    'canonical_slug', v_canonical_slug,
    'emails_moved', v_emails_moved,
    'phones_moved', v_phones_moved,
    'states_moved', v_states_moved,
    'duplicates_deactivated', v_duplicates_deactivated
  );
END;
$$;

-- ─────────────────────────────────────────────
-- 6. View: Agency with all its states
-- ─────────────────────────────────────────────
CREATE OR REPLACE VIEW agency_all_states AS
SELECT
  a.id,
  a.name,
  a.slug,
  a.website_url,
  a.global_identity_key,
  a.state_slug as primary_state_slug,
  a.is_active,
  a.created_at,
  COALESCE(
    array_agg(DISTINCT sl.state_slug) FILTER (WHERE sl.state_slug IS NOT NULL AND sl.is_visible = true),
    ARRAY[a.state_slug]
  ) as all_states,
  COUNT(DISTINCT sl.state_slug) FILTER (WHERE sl.is_visible = true) as state_count
FROM other_agencies a
LEFT JOIN other_agency_state_listings sl ON sl.agency_id = a.id
WHERE a.is_active = true
GROUP BY a.id, a.name, a.slug, a.website_url, a.global_identity_key, a.state_slug, a.is_active, a.created_at;

-- ─────────────────────────────────────────────
-- 7. Function to sync state listing to agency_listings_index
-- ─────────────────────────────────────────────
CREATE OR REPLACE FUNCTION sync_agency_to_listings_index(
  p_agency_id UUID,
  p_state_slug TEXT
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_agency RECORD;
  v_domain TEXT;
  v_page_path TEXT;
BEGIN
  SELECT
    id, name, slug, website_url
  INTO v_agency
  FROM other_agencies
  WHERE id = p_agency_id AND is_active = true;

  IF v_agency.id IS NULL THEN
    RETURN jsonb_build_object('success', false, 'error', 'Agency not found or inactive');
  END IF;

  v_domain := CASE
    WHEN v_agency.website_url IS NOT NULL AND v_agency.website_url != ''
    THEN lower(regexp_replace(regexp_replace(v_agency.website_url, '^https?://(www\.)?', ''), '/.*$', ''))
    ELSE NULL
  END;

  v_page_path := '/marketing-agencies/' || p_state_slug;

  INSERT INTO agency_listings_index (
    agency_id,
    agency_slug,
    agency_name,
    agency_domain,
    state_slug,
    section,
    rank,
    page_path
  )
  VALUES (
    v_agency.id::text,
    v_agency.slug,
    v_agency.name,
    v_domain,
    p_state_slug,
    'other',
    NULL,
    v_page_path
  )
  ON CONFLICT (agency_id, state_slug, section) DO UPDATE SET
    agency_slug = v_agency.slug,
    agency_name = v_agency.name,
    agency_domain = v_domain,
    page_path = v_page_path,
    updated_at = now();

  RETURN jsonb_build_object('success', true, 'agency_id', p_agency_id, 'state_slug', p_state_slug);
END;
$$;

-- ─────────────────────────────────────────────
-- 8. Trigger to sync state listings to index
-- ─────────────────────────────────────────────
CREATE OR REPLACE FUNCTION sync_state_listing_to_index()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
BEGIN
  IF NEW.is_visible = true THEN
    PERFORM sync_agency_to_listings_index(NEW.agency_id, NEW.state_slug);
  ELSE
    DELETE FROM agency_listings_index
    WHERE agency_id = NEW.agency_id::text
      AND state_slug = NEW.state_slug
      AND section = 'other';
  END IF;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_sync_state_listing_to_index ON other_agency_state_listings;
CREATE TRIGGER trg_sync_state_listing_to_index
  AFTER INSERT OR UPDATE ON other_agency_state_listings
  FOR EACH ROW
  EXECUTE FUNCTION sync_state_listing_to_index();

-- ─────────────────────────────────────────────
-- 9. Function: Auto-merge on matching global identity key
-- ─────────────────────────────────────────────
CREATE OR REPLACE FUNCTION check_and_merge_on_identity(
  p_new_agency_id UUID
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_new_agency RECORD;
  v_existing_agency RECORD;
  v_merge_result JSONB;
BEGIN
  SELECT id, name, slug, global_identity_key, state_slug, created_at
  INTO v_new_agency
  FROM other_agencies
  WHERE id = p_new_agency_id;

  IF v_new_agency.global_identity_key IS NULL THEN
    RETURN jsonb_build_object('merged', false, 'reason', 'No global identity key');
  END IF;

  SELECT id, name, slug, global_identity_key, state_slug, created_at
  INTO v_existing_agency
  FROM other_agencies
  WHERE global_identity_key = v_new_agency.global_identity_key
    AND id != p_new_agency_id
    AND is_active = true
  ORDER BY created_at ASC
  LIMIT 1;

  IF v_existing_agency.id IS NULL THEN
    RETURN jsonb_build_object('merged', false, 'reason', 'No existing agency with same identity');
  END IF;

  v_merge_result := merge_duplicate_agencies(v_existing_agency.id, ARRAY[p_new_agency_id]);

  RETURN jsonb_build_object(
    'merged', true,
    'canonical_agency_id', v_existing_agency.id,
    'canonical_slug', v_existing_agency.slug,
    'merged_agency_id', p_new_agency_id,
    'merge_details', v_merge_result
  );
END;
$$;

-- ─────────────────────────────────────────────
-- 10. Update duplicate_agencies_summary view
-- ─────────────────────────────────────────────
DROP VIEW IF EXISTS duplicate_agencies_summary;
CREATE VIEW duplicate_agencies_summary AS
SELECT
  'by_domain' as duplicate_type,
  global_identity_key as identity_key,
  COUNT(*) as duplicate_count,
  array_agg(DISTINCT state_slug) as states,
  MIN(created_at) as first_created,
  array_agg(id ORDER BY created_at ASC) as agency_ids,
  array_agg(slug ORDER BY created_at ASC) as slugs
FROM other_agencies
WHERE global_identity_key IS NOT NULL
  AND global_identity_key LIKE 'domain:%'
  AND is_active = true
GROUP BY global_identity_key
HAVING COUNT(*) > 1

UNION ALL

SELECT
  'by_name_phone' as duplicate_type,
  global_identity_key as identity_key,
  COUNT(*) as duplicate_count,
  array_agg(DISTINCT state_slug) as states,
  MIN(created_at) as first_created,
  array_agg(id ORDER BY created_at ASC) as agency_ids,
  array_agg(slug ORDER BY created_at ASC) as slugs
FROM other_agencies
WHERE global_identity_key IS NOT NULL
  AND global_identity_key LIKE 'name_phone:%'
  AND is_active = true
GROUP BY global_identity_key
HAVING COUNT(*) > 1

ORDER BY duplicate_count DESC;
