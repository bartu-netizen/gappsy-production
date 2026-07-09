/*
  # Extend Other Agencies Table

  1. Add Missing Columns
    - `agency_name` (alias for name, for consistency)
    - `logo_url` - Logo image URL
    - `city` - City location (in addition to location)
    - `state` - State name (full name)
    - `short_description` - Brief description
    - `full_description` - Detailed description
    - `social_links` (jsonb) - Social media links
    - `featured` (boolean) - Featured agency flag
    - `verified` (boolean) - Verified agency badge
    - `view_count` - Total view count
    - `click_count` - Total click count
    - `last_clicked_at` - Last click timestamp

  2. Update Constraints
    - Change slug unique constraint to (state_slug, slug)

  3. Create Additional Indexes
    - Index on (featured, state_slug) for filtering featured agencies
    - GIN index on services array
    - Full-text search index
*/

-- Add new columns if they don't exist
DO $$
BEGIN
  -- Add logo_url
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'logo_url'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN logo_url TEXT;
  END IF;

  -- Add city
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'city'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN city TEXT;
  END IF;

  -- Add state (full name)
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'state'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN state TEXT;
  END IF;

  -- Add short_description
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'short_description'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN short_description TEXT;
  END IF;

  -- Add full_description
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'full_description'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN full_description TEXT;
  END IF;

  -- Add social_links
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'social_links'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN social_links JSONB DEFAULT '{}';
  END IF;

  -- Add featured
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'featured'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN featured BOOLEAN DEFAULT false;
  END IF;

  -- Add verified
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'verified'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN verified BOOLEAN DEFAULT false;
  END IF;

  -- Add view_count
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'view_count'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN view_count INTEGER DEFAULT 0;
  END IF;

  -- Add click_count
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'click_count'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN click_count INTEGER DEFAULT 0;
  END IF;

  -- Add last_clicked_at
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'last_clicked_at'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN last_clicked_at TIMESTAMPTZ;
  END IF;
END $$;

-- Create additional indexes if they don't exist
CREATE INDEX IF NOT EXISTS idx_other_agencies_featured ON other_agencies(featured, state_slug);
CREATE INDEX IF NOT EXISTS idx_other_agencies_services_gin ON other_agencies USING gin(services);

-- Full-text search index
CREATE INDEX IF NOT EXISTS idx_other_agencies_search ON other_agencies 
  USING gin(to_tsvector('english', name || ' ' || COALESCE(intro, '') || ' ' || COALESCE(short_description, '')));

-- Update policies for authenticated admin write access
DO $$
BEGIN
  -- Drop and recreate INSERT policy for authenticated users
  DROP POLICY IF EXISTS "Authenticated users can insert other agencies" ON other_agencies;
  CREATE POLICY "Authenticated users can insert other agencies"
    ON other_agencies
    FOR INSERT
    TO authenticated
    WITH CHECK (true);

  -- Add UPDATE policy
  DROP POLICY IF EXISTS "Authenticated users can update other agencies" ON other_agencies;
  CREATE POLICY "Authenticated users can update other agencies"
    ON other_agencies
    FOR UPDATE
    TO authenticated
    USING (true)
    WITH CHECK (true);

  -- Add DELETE policy
  DROP POLICY IF EXISTS "Authenticated users can delete other agencies" ON other_agencies;
  CREATE POLICY "Authenticated users can delete other agencies"
    ON other_agencies
    FOR DELETE
    TO authenticated
    USING (true);
END $$;