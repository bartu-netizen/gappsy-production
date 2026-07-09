/*
  # Add Monetization and Lead Routing Features

  ## New Features
  
  ### 1. Monetization Tracking in other_agencies
  
  Add columns to track paid listings and upsells:
  - `is_paid_listing` - Boolean flag for paid Top-25/Spotlight listings
  - `paid_listing_type` - Type of paid listing ('top25', 'spotlight', 'other')
  - `paid_listing_rank` - Rank number for Top-25 listings
  - `has_card_visual_upgrade` - Boolean flag for Card Visual Upgrade upsell
  - `has_lead_matching_upgrade` - Boolean flag for Lead Matching upsell
  - `availability_redirect_enabled` - Boolean flag to enable direct redirect
  - `availability_redirect_url` - URL for Check Availability redirect
  
  ### 2. State Lead Routing Table
  
  New table `state_lead_routing` to manage per-state lead routing:
  - Maps state to default agencies for Check Availability and Get Matched flows
  - Enables dynamic routing without code changes
  - Seeded with New Jersey defaults (Vazagency)
  
  ### 3. Lead Tracking Enhancement
  
  Add `routed_to_agency_id` to `agency_availability_requests`:
  - Tracks which agency received the lead
  - Enables analytics on lead distribution
  
  ## Security
  
  - RLS enabled on state_lead_routing (public read, admin write)
  - All new columns have safe defaults
*/

-- Add monetization columns to other_agencies table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'other_agencies' AND column_name = 'is_paid_listing'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN is_paid_listing boolean NOT NULL DEFAULT false;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'other_agencies' AND column_name = 'paid_listing_type'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN paid_listing_type text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'other_agencies' AND column_name = 'paid_listing_rank'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN paid_listing_rank integer;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'other_agencies' AND column_name = 'has_card_visual_upgrade'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN has_card_visual_upgrade boolean NOT NULL DEFAULT false;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'other_agencies' AND column_name = 'has_lead_matching_upgrade'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN has_lead_matching_upgrade boolean NOT NULL DEFAULT false;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'other_agencies' AND column_name = 'availability_redirect_enabled'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN availability_redirect_enabled boolean NOT NULL DEFAULT false;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'other_agencies' AND column_name = 'availability_redirect_url'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN availability_redirect_url text;
  END IF;
END $$;

-- Add routed_to_agency_id to agency_availability_requests
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'agency_availability_requests' AND column_name = 'routed_to_agency_id'
  ) THEN
    ALTER TABLE agency_availability_requests ADD COLUMN routed_to_agency_id uuid;
  END IF;
END $$;

-- Create state_lead_routing table
CREATE TABLE IF NOT EXISTS state_lead_routing (
  state_slug text PRIMARY KEY,
  default_availability_agency_id uuid,
  default_get_matched_agency_id uuid,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Enable RLS on state_lead_routing
ALTER TABLE state_lead_routing ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist and recreate
DO $$
BEGIN
  DROP POLICY IF EXISTS "Anyone can read state lead routing" ON state_lead_routing;
  DROP POLICY IF EXISTS "Service role can insert state lead routing" ON state_lead_routing;
  DROP POLICY IF EXISTS "Service role can update state lead routing" ON state_lead_routing;
  DROP POLICY IF EXISTS "Service role can delete state lead routing" ON state_lead_routing;
END $$;

-- Allow public read access to state_lead_routing
CREATE POLICY "Anyone can read state lead routing"
  ON state_lead_routing FOR SELECT
  TO public
  USING (true);

-- Only service role can insert/update/delete
CREATE POLICY "Service role can insert state lead routing"
  ON state_lead_routing FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role can update state lead routing"
  ON state_lead_routing FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Service role can delete state lead routing"
  ON state_lead_routing FOR DELETE
  TO service_role
  USING (true);

-- Seed New Jersey with Vazagency as default (if not already seeded)
-- First, get Vazagency's ID (assuming it exists with website vazagency.com)
DO $$
DECLARE
  vazagency_id uuid;
BEGIN
  -- Find Vazagency by website URL
  SELECT id INTO vazagency_id 
  FROM other_agencies 
  WHERE website_url ILIKE '%vazagency%' 
  LIMIT 1;
  
  -- If Vazagency exists, seed the routing table
  IF vazagency_id IS NOT NULL THEN
    INSERT INTO state_lead_routing (
      state_slug, 
      default_availability_agency_id, 
      default_get_matched_agency_id
    )
    VALUES (
      'new-jersey',
      vazagency_id,
      vazagency_id
    )
    ON CONFLICT (state_slug) DO NOTHING;
  END IF;
END $$;

-- Add helpful indexes for new columns
CREATE INDEX IF NOT EXISTS idx_other_agencies_is_paid_listing 
  ON other_agencies(is_paid_listing) 
  WHERE is_paid_listing = true;

CREATE INDEX IF NOT EXISTS idx_other_agencies_has_lead_matching 
  ON other_agencies(has_lead_matching_upgrade) 
  WHERE has_lead_matching_upgrade = true;

CREATE INDEX IF NOT EXISTS idx_agency_availability_routed_to 
  ON agency_availability_requests(routed_to_agency_id);
