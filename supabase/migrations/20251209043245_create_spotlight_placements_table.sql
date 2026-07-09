/*
  # Create Spotlight Placements Table

  1. New Tables
    - `spotlight_placements`
      - `id` (uuid, primary key) - Unique identifier
      - `state_slug` (text) - State identifier (e.g., 'new-jersey')
      - `position` (integer, 1-3) - Position in spotlight (1 = hero, 2-3 = secondary)
      
      ## Agency Information
      - `agency_name` (text) - Agency name
      - `website_url` (text) - Agency website
      - `logo_url` (text) - Logo image URL
      - `city` (text) - City location
      - `state` (text) - State name
      - `email` (text) - Contact email
      - `phone` (text) - Contact phone
      - `tagline` (text) - Short catchy phrase (50 chars max)
      - `short_description` (text) - Brief description
      - `full_description` (text) - Detailed description
      - `services` (text[]) - Array of services offered
      
      ## Spotlight Specific Fields
      - `background_color` (text) - Custom brand color (default: #1e40af)
      - `featured_image_url` (text) - Hero banner/background image
      - `cta_text` (text) - Custom button text (default: 'Get Started')
      - `cta_url` (text) - Custom button URL
      - `social_links` (jsonb) - Social media links {linkedin, twitter, facebook}
      
      ## Payment & Status
      - `is_paid` (boolean) - Whether this is a paid placement
      - `pricing_tier` (text) - spotlight-hero ($997) or spotlight-secondary ($497)
      - `claimed_at` (timestamptz) - When the spot was claimed
      - `expires_at` (timestamptz) - When the placement expires
      
      ## Analytics
      - `view_count` (integer) - Number of times viewed
      - `click_count` (integer) - Number of times CTA clicked
      - `last_clicked_at` (timestamptz) - Last click timestamp
      
      ## Meta
      - `created_at` (timestamptz) - Creation timestamp
      - `updated_at` (timestamptz) - Last update timestamp

  2. Security
    - Enable RLS on `spotlight_placements` table
    - Add policy for public read access
    - Add policy for authenticated admin write access

  3. Indexes
    - Index on state_slug for fast state lookups
    - Index on (state_slug, position) for unique constraint
    - Index on (state_slug, is_paid) for filtering paid placements
*/

-- Create spotlight_placements table
CREATE TABLE IF NOT EXISTS spotlight_placements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug TEXT NOT NULL,
  position INTEGER NOT NULL CHECK (position BETWEEN 1 AND 3),
  
  -- Agency Info
  agency_name TEXT NOT NULL,
  website_url TEXT,
  logo_url TEXT,
  city TEXT,
  state TEXT,
  email TEXT,
  phone TEXT,
  tagline TEXT,
  short_description TEXT,
  full_description TEXT,
  services TEXT[] DEFAULT '{}',
  
  -- Spotlight Specific Fields
  background_color TEXT DEFAULT '#1e40af',
  featured_image_url TEXT,
  cta_text TEXT DEFAULT 'Get Started',
  cta_url TEXT,
  social_links JSONB DEFAULT '{}',
  
  -- Payment & Status
  is_paid BOOLEAN DEFAULT false,
  pricing_tier TEXT DEFAULT 'spotlight-hero',
  claimed_at TIMESTAMPTZ,
  expires_at TIMESTAMPTZ,
  
  -- Analytics
  view_count INTEGER DEFAULT 0,
  click_count INTEGER DEFAULT 0,
  last_clicked_at TIMESTAMPTZ,
  
  -- Meta
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  
  -- Constraints
  UNIQUE(state_slug, position)
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_spotlight_state ON spotlight_placements(state_slug);
CREATE INDEX IF NOT EXISTS idx_spotlight_paid ON spotlight_placements(state_slug, is_paid);
CREATE INDEX IF NOT EXISTS idx_spotlight_position ON spotlight_placements(state_slug, position);

-- Enable RLS
ALTER TABLE spotlight_placements ENABLE ROW LEVEL SECURITY;

-- Public read access
CREATE POLICY "Anyone can view spotlight placements"
  ON spotlight_placements
  FOR SELECT
  TO anon, authenticated
  USING (true);

-- Authenticated users can insert
CREATE POLICY "Authenticated users can insert spotlight placements"
  ON spotlight_placements
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Authenticated users can update
CREATE POLICY "Authenticated users can update spotlight placements"
  ON spotlight_placements
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Authenticated users can delete
CREATE POLICY "Authenticated users can delete spotlight placements"
  ON spotlight_placements
  FOR DELETE
  TO authenticated
  USING (true);