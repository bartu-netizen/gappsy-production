/*
  # Add average_retainer_range column to other_agencies

  1. Changes
    - Add optional `average_retainer_range` column to `other_agencies` table
    - Column stores typical monthly retainer range for revenue calculations
    - Nullable field with specific enum values

  2. Notes
    - Backwards compatible (nullable)
    - Used for estimated missed revenue calculations on owner dashboard
*/

DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'other_agencies' 
    AND column_name = 'average_retainer_range'
  ) THEN
    ALTER TABLE other_agencies 
    ADD COLUMN average_retainer_range text CHECK (
      average_retainer_range IN (
        '500-1000',
        '1000-2500', 
        '2500-5000',
        '5000-10000',
        '10000-plus'
      ) OR average_retainer_range IS NULL
    );
  END IF;
END $$;
