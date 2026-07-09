/*
  # Add state_description_full and raw_json_hash to state_content

  1. New Columns
    - `state_description_full` (text) - Full state description from JSON
    - `raw_json_hash` (text) - Optional hash of imported JSON for debugging
  
  2. Purpose
    - Store complete state description without truncation
    - Track import versions for debugging
  
  3. Changes
    - Add columns to state_content table
    - No data migration needed (existing states can be re-imported)
*/

-- Add state_description_full column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'state_content' AND column_name = 'state_description_full'
  ) THEN
    ALTER TABLE state_content ADD COLUMN state_description_full text;
  END IF;
END $$;

-- Add raw_json_hash column for debugging
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'state_content' AND column_name = 'raw_json_hash'
  ) THEN
    ALTER TABLE state_content ADD COLUMN raw_json_hash text;
  END IF;
END $$;

-- Add comment
COMMENT ON COLUMN state_content.state_description_full IS 'Full state description from JSON import - never truncated';
COMMENT ON COLUMN state_content.raw_json_hash IS 'SHA-256 hash of imported JSON for version tracking';
