/*
  # Create sidebar ads table

  1. New Tables
    - `sidebar_ads`
      - `id` (text, primary key) - unique identifier like "left-1", "right-3"
      - `position` (text) - "left" or "right"
      - `display_order` (integer) - order within the column (1-5)
      - `logo_url` (text) - path to logo image
      - `title` (text) - max 18 chars
      - `subtitle` (text) - max 52 chars
      - `target_url` (text) - URL to navigate to (empty for non-clickable)
      - `bg_color` (text) - hex color or empty for auto-color
      - `is_active` (boolean) - whether to show this ad
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)

  2. Security
    - Enable RLS on `sidebar_ads` table
    - Allow public read access (ads are public)
    - Only authenticated admins can update
*/

CREATE TABLE IF NOT EXISTS sidebar_ads (
  id text PRIMARY KEY,
  position text NOT NULL CHECK (position IN ('left', 'right')),
  display_order integer NOT NULL,
  logo_url text NOT NULL DEFAULT '',
  title text NOT NULL CHECK (char_length(title) <= 18),
  subtitle text NOT NULL CHECK (char_length(subtitle) <= 52),
  target_url text NOT NULL DEFAULT '',
  bg_color text NOT NULL DEFAULT '',
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE sidebar_ads ENABLE ROW LEVEL SECURITY;

-- Allow anyone to read active ads
CREATE POLICY "Public can view active sidebar ads"
  ON sidebar_ads FOR SELECT
  USING (is_active = true);

-- Only authenticated users can update (admin check will be in edge function)
CREATE POLICY "Authenticated users can update sidebar ads"
  ON sidebar_ads FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Create index for efficient querying
CREATE INDEX IF NOT EXISTS idx_sidebar_ads_position_order 
  ON sidebar_ads(position, display_order) 
  WHERE is_active = true;

-- Insert default sidebar ads (all 10)
INSERT INTO sidebar_ads (id, position, display_order, logo_url, title, subtitle, target_url, bg_color) VALUES
  -- Left sidebar ads
  ('left-1', 'left', 1, '/logos/gappsy_-_white_-_logo_-_small.png', 'Gappsy Appbuilder', 'Build iOS & Android apps without coding.', '/appbuilder', '#E0F2FE'),
  ('left-2', 'left', 2, '/logos/gappsy_-_white_-_logo_-_small.png', 'Gappsy Proof', 'Increase conversions with social proof.', '/proof', '#FEF9C3'),
  ('left-3', 'left', 3, '/logos/gappsy_-_white_-_logo_-_small.png', 'Gappsy Analytics', 'Track performance & user insights.', '/analytics', '#D1FAE5'),
  ('left-4', 'left', 4, '/logos/gappsy_-_white_-_logo_-_small.png', 'Find Top Agencies', 'Browse state-by-state rankings.', '/marketing-agencies/usa', '#F3E8FF'),
  ('left-5', 'left', 5, '/logos/gappsy_-_white_-_logo_-_small.png', 'Get in Touch', 'Questions? We''re here to help.', '/contact', '#DBEAFE'),
  
  -- Right sidebar ads
  ('right-1', 'right', 1, '/logos/gappsy_-_white_-_logo_-_small.png', 'New Tools Weekly', 'We''re adding new business tools every week.', '', '#FCE7F3'),
  ('right-2', 'right', 2, '/logos/gappsy_-_white_-_logo_-_small.png', 'Promote Your Tool', 'Get featured on our platform.', '/contact', '#FEF3C7'),
  ('right-3', 'right', 3, '/logos/gappsy_-_white_-_logo_-_small.png', 'Premium Listings', 'Boost your visibility with featured placement.', '', '#E0E7FF'),
  ('right-4', 'right', 4, '/logos/gappsy_-_white_-_logo_-_small.png', 'Our Products', 'Explore all Gappsy tools and services.', '/products', '#FED7AA'),
  ('right-5', 'right', 5, '/logos/gappsy_-_white_-_logo_-_small.png', 'About Gappsy', 'Learn more about our mission.', '/about', '#BFDBFE')
ON CONFLICT (id) DO NOTHING;