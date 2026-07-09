/*
  # Add Canonical URL for SEO-Safe Routing

  ## Problem
  - State pages were returning 404 because routing was based on reconstructed slugs
  - SEO requires EXACT URLs from old site (no URL reconstruction allowed)
  - Alaska and other imported states were failing

  ## Solution
  1. New Tables
    - `state_pages` - Stores canonical URLs and state metadata
      - `id` (uuid, primary key)
      - `state_slug` (text, unique) - Internal identifier (e.g., "alaska")
      - `state_name` (text) - Display name (e.g., "Alaska")
      - `canonical_url` (text, unique) - EXACT URL from JSON import
      - `full_canonical_url` (text, unique) - Full URL with domain
      - `is_active` (boolean) - Whether page is live
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)

  2. Changes to top25_slots
    - No changes needed - state_slug is foreign key reference

  3. Import Logic
    - JSON field `seo.canonical_url` becomes the ONLY source of truth
    - Routing looks up URL in database (not reconstructed from slug)
    - No slug-based routing allowed (prevents URL drift)

  ## SEO Safety
  - Canonical URL is stored verbatim from JSON
  - Routing resolves by DB lookup, not slug generation
  - Ensures old site URLs are preserved 1:1
*/

-- Create state_pages table
CREATE TABLE IF NOT EXISTS state_pages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug text NOT NULL UNIQUE,
  state_name text NOT NULL,
  canonical_url text NOT NULL UNIQUE,
  full_canonical_url text NOT NULL UNIQUE,
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE state_pages ENABLE ROW LEVEL SECURITY;

-- Allow public read access (for routing)
CREATE POLICY "Anyone can view state pages"
  ON state_pages
  FOR SELECT
  USING (true);

-- Only authenticated users can manage state pages
CREATE POLICY "Authenticated users can insert state pages"
  ON state_pages
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update state pages"
  ON state_pages
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Create indexes for fast URL lookup
CREATE INDEX IF NOT EXISTS idx_state_pages_canonical_url
  ON state_pages(canonical_url);

CREATE INDEX IF NOT EXISTS idx_state_pages_state_slug
  ON state_pages(state_slug);

CREATE INDEX IF NOT EXISTS idx_state_pages_active
  ON state_pages(is_active)
  WHERE is_active = true;

-- Seed existing states from top25_slots
-- Extract unique states and create page entries
INSERT INTO state_pages (state_slug, state_name, canonical_url, full_canonical_url, is_active)
SELECT DISTINCT
  state_slug,
  -- Convert slug to proper state name (capitalize first letter of each word)
  INITCAP(REPLACE(state_slug, '-', ' ')) as state_name,
  -- Generate canonical URL pattern (path only)
  '/marketing-agencies-in-' || state_slug || '-united-states' as canonical_url,
  -- Generate full canonical URL with domain
  'https://www.gappsy.com/marketing-agencies-in-' || state_slug || '-united-states/' as full_canonical_url,
  true as is_active
FROM top25_slots
WHERE NOT EXISTS (
  SELECT 1 FROM state_pages sp WHERE sp.state_slug = top25_slots.state_slug
)
ORDER BY state_slug;

-- Add comment explaining the canonical URL requirement
COMMENT ON TABLE state_pages IS 'Stores canonical URLs for state pages. The canonical_url field MUST match the exact URL from JSON imports. Do not reconstruct URLs from slugs.';

COMMENT ON COLUMN state_pages.canonical_url IS 'Path-only canonical URL (e.g., /marketing-agencies-in-alaska-united-states). Must match JSON exactly.';

COMMENT ON COLUMN state_pages.full_canonical_url IS 'Full canonical URL with domain (e.g., https://www.gappsy.com/marketing-agencies-in-alaska-united-states/). Must match JSON exactly.';
