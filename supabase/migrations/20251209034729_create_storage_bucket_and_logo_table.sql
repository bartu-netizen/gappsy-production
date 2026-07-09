/*
  # Create Storage Bucket and Logo URL Table

  1. Purpose
    - Create Supabase storage bucket for agency logo uploads
    - Create table to store logo URLs for placeholder agencies
    - Enable agencies to have custom uploaded logos

  2. New Storage Bucket
    - Name: `agency-logos`
    - Public: true
    - Path structure: `{state}/{filename}`
    - File types: .webp, .png, .jpg, .jpeg

  3. New Table: `placeholder_agency_logos`
    - Stores logo URLs for placeholder agencies (from JSON files)
    - Links to state and rank
    - Overrides default JSON logo with uploaded version
    - One logo per state/rank combination

  4. Security
    - Storage bucket is publicly readable
    - Table has RLS enabled
    - Authenticated users can read all logos
    - Only authenticated users can insert/update logos

  5. Use Case
    When displaying state agencies:
    - Get paid agencies from `top25_slots` (has logo_url)
    - Get placeholder agencies from JSON files
    - Check `placeholder_agency_logos` for custom uploaded logos
    - If custom logo exists, use it; otherwise use JSON default
*/

-- Create storage bucket for agency logos
INSERT INTO storage.buckets (id, name, public)
VALUES ('agency-logos', 'agency-logos', true)
ON CONFLICT (id) DO NOTHING;

-- Storage policies for agency logos
DO $$
BEGIN
  -- Allow public access to read files
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'storage' 
    AND tablename = 'objects'
    AND policyname = 'Public Access to Agency Logos'
  ) THEN
    CREATE POLICY "Public Access to Agency Logos"
    ON storage.objects FOR SELECT
    USING (bucket_id = 'agency-logos');
  END IF;

  -- Allow authenticated users to upload files
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'storage' 
    AND tablename = 'objects'
    AND policyname = 'Authenticated users can upload agency logos'
  ) THEN
    CREATE POLICY "Authenticated users can upload agency logos"
    ON storage.objects FOR INSERT
    TO authenticated
    WITH CHECK (bucket_id = 'agency-logos');
  END IF;

  -- Allow authenticated users to update files
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'storage' 
    AND tablename = 'objects'
    AND policyname = 'Authenticated users can update agency logos'
  ) THEN
    CREATE POLICY "Authenticated users can update agency logos"
    ON storage.objects FOR UPDATE
    TO authenticated
    USING (bucket_id = 'agency-logos');
  END IF;
END $$;

-- Create table for placeholder agency logos
CREATE TABLE IF NOT EXISTS placeholder_agency_logos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug text NOT NULL,
  agency_rank integer NOT NULL,
  logo_url text NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(state_slug, agency_rank),
  CONSTRAINT valid_rank CHECK (agency_rank >= 1 AND agency_rank <= 25),
  CONSTRAINT valid_state_slug CHECK (length(state_slug) > 0)
);

-- Create indexes for faster lookups
CREATE INDEX IF NOT EXISTS idx_placeholder_logos_state
ON placeholder_agency_logos(state_slug);

CREATE INDEX IF NOT EXISTS idx_placeholder_logos_state_rank
ON placeholder_agency_logos(state_slug, agency_rank);

-- Enable RLS
ALTER TABLE placeholder_agency_logos ENABLE ROW LEVEL SECURITY;

-- RLS Policies for placeholder_agency_logos
DO $$
BEGIN
  -- Allow everyone to read logo URLs (public data)
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'public' 
    AND tablename = 'placeholder_agency_logos'
    AND policyname = 'Anyone can view placeholder agency logos'
  ) THEN
    CREATE POLICY "Anyone can view placeholder agency logos"
    ON placeholder_agency_logos FOR SELECT
    TO anon, authenticated
    USING (true);
  END IF;

  -- Allow authenticated users to insert logo URLs
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'public' 
    AND tablename = 'placeholder_agency_logos'
    AND policyname = 'Authenticated users can insert placeholder agency logos'
  ) THEN
    CREATE POLICY "Authenticated users can insert placeholder agency logos"
    ON placeholder_agency_logos FOR INSERT
    TO authenticated
    WITH CHECK (true);
  END IF;

  -- Allow authenticated users to update logo URLs
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'public' 
    AND tablename = 'placeholder_agency_logos'
    AND policyname = 'Authenticated users can update placeholder agency logos'
  ) THEN
    CREATE POLICY "Authenticated users can update placeholder agency logos"
    ON placeholder_agency_logos FOR UPDATE
    TO authenticated
    USING (true)
    WITH CHECK (true);
  END IF;

  -- Allow authenticated users to delete logo URLs
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'public' 
    AND tablename = 'placeholder_agency_logos'
    AND policyname = 'Authenticated users can delete placeholder agency logos'
  ) THEN
    CREATE POLICY "Authenticated users can delete placeholder agency logos"
    ON placeholder_agency_logos FOR DELETE
    TO authenticated
    USING (true);
  END IF;
END $$;

-- Create function to automatically update updated_at timestamp
CREATE OR REPLACE FUNCTION update_placeholder_logos_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for updated_at
DROP TRIGGER IF EXISTS update_placeholder_logos_timestamp ON placeholder_agency_logos;
CREATE TRIGGER update_placeholder_logos_timestamp
BEFORE UPDATE ON placeholder_agency_logos
FOR EACH ROW
EXECUTE FUNCTION update_placeholder_logos_updated_at();
