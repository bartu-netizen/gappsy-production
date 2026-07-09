/*
  # Remove Old Global Slug Unique Constraint

  1. Issue
    - Old UNIQUE constraint other_agencies_slug_key still exists globally
    - This prevents duplicate slugs even in different states
    - Need to drop the constraint itself, not just the index
  
  2. Solution
    - Drop the constraint on the table
    - Keep composite unique index on (state_slug, slug)
    - This allows state-scoped slug uniqueness as intended
*/

ALTER TABLE other_agencies DROP CONSTRAINT IF EXISTS other_agencies_slug_key;
