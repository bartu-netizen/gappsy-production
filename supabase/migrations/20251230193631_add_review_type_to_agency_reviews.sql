/*
  # Add review_type column to agency_reviews table

  1. Changes
    - Add `review_type` column to `agency_reviews` table
      - Type: text
      - Allowed values: 'positive' or 'negative'
      - Default: NULL (must be set explicitly)
    - Add check constraint to enforce valid values
    - Set Calta Marketing to 'positive' review type
  
  2. Data Migration
    - Set Calta Marketing (calta-marketing-new-york) to review_type = 'positive'
  
  3. Security
    - No RLS changes needed (inherits from existing table policies)
*/

-- Add review_type column
ALTER TABLE agency_reviews 
ADD COLUMN IF NOT EXISTS review_type text;

-- Add check constraint for valid values
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint 
    WHERE conname = 'agency_reviews_review_type_check'
  ) THEN
    ALTER TABLE agency_reviews
    ADD CONSTRAINT agency_reviews_review_type_check 
    CHECK (review_type IN ('positive', 'negative'));
  END IF;
END $$;

-- Set Calta Marketing to positive review type
UPDATE agency_reviews 
SET review_type = 'positive'
WHERE agency_slug = 'calta-marketing-new-york';