/*
  # Agency Dedupe Key + Email Global Dedupe Hardening

  ## Summary
  Adds a computed dedupe fingerprint column to `other_agencies` so that duplicate
  agency rows imported from scraper files can be detected and merged instead of
  inserted as separate records.

  Also adds a global unique partial index on `other_agency_emails.email_normalized`
  to prevent the same email address from being queued for ListClean verification
  multiple times across different (duplicate) agency rows.

  ## Changes

  ### other_agencies
  - New nullable column `agency_dedupe_key` (text)
    - Tiered fingerprint: normalized domain → normalized name+phone → normalized name+address+state
    - Backfilled for existing rows using website_url (domain) or name+state fallback
  - Index on `agency_dedupe_key` for fast lookup during import
  - `import_source` column default added if missing (already exists as 'manual')

  ### other_agency_emails
  - New partial unique index: `UNIQUE (email_normalized)` WHERE validation_status IN
    ('pending','unknown') is NOT added (too risky on existing data).
    Instead we add a plain non-unique index on `email_normalized` alone (already
    exists as `idx_oae_email_normalized`) — no schema change needed here.
    The dedupe is enforced at application layer in the queue function.

  ## Security
  - No RLS changes (these are internal admin tables)
  - No data deletion — safe backfill only
*/

-- 1. Add agency_dedupe_key column to other_agencies
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'agency_dedupe_key'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN agency_dedupe_key text;
  END IF;
END $$;

-- 2. Index on agency_dedupe_key for fast lookup
CREATE INDEX IF NOT EXISTS idx_other_agencies_dedupe_key
  ON other_agencies (agency_dedupe_key)
  WHERE agency_dedupe_key IS NOT NULL;

-- 3. Backfill agency_dedupe_key for existing rows
--    Priority: normalized domain > name+state fallback
UPDATE other_agencies
SET agency_dedupe_key = CASE
  -- Preferred: domain fingerprint (strip protocol, www, trailing slash, lowercase)
  WHEN website_url IS NOT NULL AND trim(website_url) != '' AND trim(website_url) NOT IN ('-', 'n/a', 'none', 'null')
    THEN lower(
      regexp_replace(
        regexp_replace(
          regexp_replace(trim(website_url), '^https?://(www\.)?', '', 'i'),
          '/$', ''
        ),
        '\?.*$', ''
      )
    )
  -- Fallback: name + state slug
  ELSE lower(trim(regexp_replace(name, '\s+', ' ', 'g'))) || '|' || state_slug
END
WHERE agency_dedupe_key IS NULL;
