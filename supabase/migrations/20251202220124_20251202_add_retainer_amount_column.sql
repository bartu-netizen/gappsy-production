/*
  # Add Exact Retainer Amount Column

  1. Changes
    - Add `average_retainer_amount` column to store exact dollar amounts
    - Backfill existing range data to numeric amounts using midpoint mapping
    - Keep `average_retainer_range` for backward compatibility
    
  2. Mapping (range → amount)
    - '500-1000'    → 750
    - '1000-2500'   → 1750
    - '2500-5000'   → 3750
    - '5000-10000'  → 7500
    - '10000-plus'  → 10000
    
  3. Notes
    - New column is nullable to support agencies without retainer set
    - Primary calculation will use `average_retainer_amount` going forward
    - Legacy `average_retainer_range` kept for compatibility
*/

-- Add new numeric column for exact retainer amount
ALTER TABLE other_agencies
ADD COLUMN IF NOT EXISTS average_retainer_amount numeric NULL;

-- Backfill existing range data to numeric amounts
UPDATE other_agencies
SET average_retainer_amount = CASE average_retainer_range
  WHEN '500-1000' THEN 750
  WHEN '1000-2500' THEN 1750
  WHEN '2500-5000' THEN 3750
  WHEN '5000-10000' THEN 7500
  WHEN '10000-plus' THEN 10000
  ELSE NULL
END
WHERE average_retainer_range IS NOT NULL
  AND average_retainer_amount IS NULL;
