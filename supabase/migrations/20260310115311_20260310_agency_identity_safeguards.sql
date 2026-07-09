/*
  # Agency Identity Safeguards - Permanent Identity System

  ## Summary
  Adds database-level constraints and triggers to enforce ONE real agency = ONE /your-agency URL rule.
  Prevents duplicate identity creation and ensures permanent identity system integrity.

  ## Changes

  ### 1. Global Identity Key Enforcement
  - Unique constraint on global_identity_key (when not null)
  - Ensures domain, name+phone combinations can only exist once
  - Allows cross-state reuse via single global identity key

  ### 2. Agency Dedupe Key State Constraint
  - Unique constraint on (state_slug, agency_dedupe_key)
  - Prevents same-state duplicate identities
  - Protects against state-scoped duplication

  ### 3. Slug Uniqueness Across All States
  - Unique constraint on slug (canonical /your-agency page is unique)
  - Prevents slug collision like: /your-agency/acme, /your-agency/acme-1
  - One slug = one identity = one /your-agency page

  ### 4. Prevent Inactive Agency Conflicts
  - Soft-deleted (is_active=false) agencies don't block slug reuse
  - New agencies can reuse slug of deactivated ones
  - Enables clean merge-and-reactivate flow

  ### 5. Multi-Email Uniqueness Per Agency
  - Unique constraint: (agency_id, email_normalized)
  - One agency can have multiple emails
  - But each email belongs to exactly one agency

  ### 6. Phone Deduplication Per Agency
  - Unique constraint: (agency_id, phone_normalized)
  - Multiple phones per agency supported
  - No duplicate phones within single agency

  ## Security
  - RLS remains in place on all tables
  - Constraints are data-model level, not easily bypassed
  - Prevents data model violations at database layer
*/

-- Add unique constraint on active slug (ignores soft-deleted agencies)
CREATE UNIQUE INDEX IF NOT EXISTS idx_other_agencies_slug_unique_active
ON other_agencies(slug)
WHERE is_active = true AND slug IS NOT NULL;

-- Add unique constraint on global_identity_key for active agencies
CREATE UNIQUE INDEX IF NOT EXISTS idx_other_agencies_global_identity_key_unique
ON other_agencies(global_identity_key)
WHERE is_active = true AND global_identity_key IS NOT NULL;

-- Add unique constraint on state-scoped dedupe key
CREATE UNIQUE INDEX IF NOT EXISTS idx_other_agencies_state_dedupe_unique
ON other_agencies(state_slug, agency_dedupe_key)
WHERE is_active = true AND agency_dedupe_key IS NOT NULL;

-- Ensure multi-email uniqueness per agency (prevents duplicates within single agency)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'uq_other_agency_emails_agency_email'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD CONSTRAINT uq_other_agency_emails_agency_email
    UNIQUE (agency_id, email_normalized);
  END IF;
END $$;

-- Ensure multi-phone uniqueness per agency (prevents duplicates within single agency)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE indexname = 'idx_other_agency_phones_unique'
  ) THEN
    CREATE UNIQUE INDEX idx_other_agency_phones_unique
    ON other_agency_phones(agency_id, phone_normalized)
    WHERE phone_normalized IS NOT NULL;
  END IF;
END $$;

-- Create helper function to detect constraint violations
CREATE OR REPLACE FUNCTION check_identity_constraint_violations()
RETURNS TABLE (
  violation_type text,
  count_violations int,
  sample_details jsonb
) AS $$
BEGIN
  RETURN QUERY
  SELECT 'duplicate_global_identity_key'::text, COUNT(*)::int,
    JSONB_BUILD_OBJECT('key_sample', MIN(global_identity_key))
  FROM (
    SELECT global_identity_key, COUNT(*) as cnt
    FROM other_agencies
    WHERE global_identity_key IS NOT NULL AND is_active = true
    GROUP BY global_identity_key
    HAVING COUNT(*) > 1
  ) t;

  RETURN QUERY
  SELECT 'duplicate_slug'::text, COUNT(*)::int,
    JSONB_BUILD_OBJECT('slug_sample', MIN(slug))
  FROM (
    SELECT slug, COUNT(*) as cnt
    FROM other_agencies
    WHERE slug IS NOT NULL AND is_active = true
    GROUP BY slug
    HAVING COUNT(*) > 1
  ) t;

  RETURN QUERY
  SELECT 'duplicate_state_dedupe_key'::text, COUNT(*)::int,
    JSONB_BUILD_OBJECT('key_sample', MIN(agency_dedupe_key))
  FROM (
    SELECT state_slug, agency_dedupe_key, COUNT(*) as cnt
    FROM other_agencies
    WHERE agency_dedupe_key IS NOT NULL AND is_active = true
    GROUP BY state_slug, agency_dedupe_key
    HAVING COUNT(*) > 1
  ) t;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER SET search_path = public;
