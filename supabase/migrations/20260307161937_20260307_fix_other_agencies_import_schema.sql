/*
  # Fix Other Agencies Import Schema
  
  1. Changes
    - Deduplicate existing agency_dedupe_key values (keep oldest)
    - Add UNIQUE constraint on agency_dedupe_key to enable proper upsert
    - Add agency_dedupe_key_legacy column for fallback matching
    - Make slug nullable (will be generated on insert if missing)
    - Make state_name nullable with default computed from state_slug
  
  2. Security
    - No RLS changes
  
  3. Notes
    - The agency_dedupe_key must be unique for upsert to work
    - Legacy column allows fallback matching for older imports
*/

-- Step 1: Deduplicate existing agency_dedupe_key values
-- Keep the oldest record (lowest created_at) for each dedupe_key
-- Null out the dedupe_key for all other duplicates (so they become unique records)
WITH duplicates AS (
  SELECT id, agency_dedupe_key,
         ROW_NUMBER() OVER (PARTITION BY agency_dedupe_key ORDER BY created_at ASC) as rn
  FROM other_agencies
  WHERE agency_dedupe_key IS NOT NULL
)
UPDATE other_agencies
SET agency_dedupe_key = NULL
WHERE id IN (
  SELECT id FROM duplicates WHERE rn > 1
);

-- Step 2: Drop the old non-unique index
DROP INDEX IF EXISTS idx_other_agencies_dedupe_key;

-- Step 3: Create a UNIQUE index on agency_dedupe_key (partial - only non-null values)
CREATE UNIQUE INDEX IF NOT EXISTS idx_other_agencies_dedupe_key_unique 
ON other_agencies (agency_dedupe_key) 
WHERE agency_dedupe_key IS NOT NULL;

-- Step 4: Add agency_dedupe_key_legacy column if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'other_agencies' AND column_name = 'agency_dedupe_key_legacy'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN agency_dedupe_key_legacy TEXT;
  END IF;
END $$;

-- Step 5: Create index on legacy dedupe key
CREATE INDEX IF NOT EXISTS idx_other_agencies_dedupe_key_legacy 
ON other_agencies (agency_dedupe_key_legacy) 
WHERE agency_dedupe_key_legacy IS NOT NULL;

-- Step 6: Make slug nullable (so we can generate it after insert if needed)
ALTER TABLE other_agencies ALTER COLUMN slug DROP NOT NULL;

-- Step 7: Make state_name nullable with a default
ALTER TABLE other_agencies ALTER COLUMN state_name DROP NOT NULL;

-- Step 8: Add a trigger to auto-populate state_name from state_slug if not provided
CREATE OR REPLACE FUNCTION populate_state_name_from_slug()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.state_name IS NULL AND NEW.state_slug IS NOT NULL THEN
    NEW.state_name := INITCAP(REPLACE(NEW.state_slug, '-', ' '));
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_populate_state_name ON other_agencies;

CREATE TRIGGER trigger_populate_state_name
BEFORE INSERT OR UPDATE ON other_agencies
FOR EACH ROW
EXECUTE FUNCTION populate_state_name_from_slug();

-- Step 9: Backfill any null state_name values
UPDATE other_agencies
SET state_name = INITCAP(REPLACE(state_slug, '-', ' '))
WHERE state_name IS NULL AND state_slug IS NOT NULL;