/*
  # Add Showcase Pinning System to Other Agencies

  1. New Fields
    - `showcase_pinned` (boolean) - Whether agency is manually pinned in showcase
    - `showcase_position` (integer) - Manual pin position (1-12)
    - `showcase_updated_at` (timestamptz) - When pinning was last updated
    - `showcase_updated_by` (text) - Admin email who updated pinning

  2. Changes
    - Add new columns to other_agencies table
    - All fields nullable and default false/null for backwards compatibility
    - Add index on showcase_pinned for filtering
    - Add index on showcase_position for ordering
    - Add composite index on (state_slug, showcase_pinned, showcase_position) for efficient showcase queries

  3. Security
    - No RLS changes needed - uses existing other_agencies policies
*/

-- Add showcase pinning fields to other_agencies
ALTER TABLE other_agencies
ADD COLUMN IF NOT EXISTS showcase_pinned boolean DEFAULT false,
ADD COLUMN IF NOT EXISTS showcase_position integer,
ADD COLUMN IF NOT EXISTS showcase_updated_at timestamptz,
ADD COLUMN IF NOT EXISTS showcase_updated_by text;

-- Create indexes for efficient showcase queries
CREATE INDEX IF NOT EXISTS idx_other_agencies_showcase_pinned
  ON other_agencies(showcase_pinned)
  WHERE showcase_pinned = true;

CREATE INDEX IF NOT EXISTS idx_other_agencies_showcase_position
  ON other_agencies(showcase_position)
  WHERE showcase_position IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_other_agencies_showcase_composite
  ON other_agencies(state_slug, showcase_pinned DESC, showcase_position ASC NULLS LAST)
  WHERE is_active = true;

-- Add constraint to ensure showcase_position is between 1 and 12 if set
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint 
    WHERE conname = 'showcase_position_range'
  ) THEN
    ALTER TABLE other_agencies
    ADD CONSTRAINT showcase_position_range
      CHECK (showcase_position IS NULL OR (showcase_position >= 1 AND showcase_position <= 12));
  END IF;
END $$;

-- Add comment explaining the showcase system
COMMENT ON COLUMN other_agencies.showcase_pinned IS 'Whether this agency is manually pinned in the first 12 showcase positions on state pages';
COMMENT ON COLUMN other_agencies.showcase_position IS 'Manual pin position (1-12) within the showcase. NULL means auto-fill by priority algorithm.';
COMMENT ON COLUMN other_agencies.showcase_updated_at IS 'Timestamp when showcase pinning was last updated';
COMMENT ON COLUMN other_agencies.showcase_updated_by IS 'Email of admin who last updated showcase pinning';
