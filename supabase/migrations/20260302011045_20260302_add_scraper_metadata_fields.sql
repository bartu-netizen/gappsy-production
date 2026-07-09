/*
  # Add scraper metadata fields to other_agencies table

  1. New Columns
    - `zip_code` (text) - Postal code/zip code from scraper
    - `full_address` (text) - Complete address from scraper
    - `maps_url` (text) - Google Maps URL from scraper
    - `latitude` (numeric) - Latitude coordinate
    - `longitude` (numeric) - Longitude coordinate
    - `maps_position` (integer) - Position in Google Maps results
    - `keyword` (text) - Search keyword used to find agency
    - `facebook_url` (text) - Facebook profile URL
    - `instagram_url` (text) - Instagram profile URL
    - `twitter_url` (text) - Twitter/X profile URL
    - `youtube_url` (text) - YouTube channel URL
    - `linkedin_url` (text) - LinkedIn company URL

  2. Notes
    - All fields are optional (nullable)
    - Scraped from external data sources during import
    - Not exposed in public API by default
    - Available for admin view/edit and reporting
    - No changes to existing columns or RLS
    - Backward compatible

  3. Data Safety
    - No data deletion
    - No schema restructuring
    - All new columns default to NULL
    - Existing data unaffected
*/

DO $$
BEGIN
  -- zip_code
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'zip_code'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN zip_code text;
  END IF;

  -- full_address
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'full_address'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN full_address text;
  END IF;

  -- maps_url
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'maps_url'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN maps_url text;
  END IF;

  -- latitude
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'latitude'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN latitude numeric;
  END IF;

  -- longitude
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'longitude'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN longitude numeric;
  END IF;

  -- maps_position
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'maps_position'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN maps_position integer;
  END IF;

  -- keyword
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'keyword'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN keyword text;
  END IF;

  -- facebook_url
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'facebook_url'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN facebook_url text;
  END IF;

  -- instagram_url
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'instagram_url'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN instagram_url text;
  END IF;

  -- twitter_url
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'twitter_url'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN twitter_url text;
  END IF;

  -- youtube_url
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'youtube_url'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN youtube_url text;
  END IF;

  -- linkedin_url
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'linkedin_url'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN linkedin_url text;
  END IF;
END $$;
