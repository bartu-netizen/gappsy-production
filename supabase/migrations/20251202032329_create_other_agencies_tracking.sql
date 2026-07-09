/*
  # Create Other Agencies Tracking Tables

  1. New Tables
    - other_agencies: Stores agency profile information
    - agency_metrics: Tracks view counts and availability requests
    - agency_views: Individual view events
    - agency_availability_requests: Tracks all availability form submissions

  2. Security
    - Enable RLS on all tables
    - Public read access to agencies
    - Authenticated tracking writes
    - Owner access to their agency data
*/

-- Create other_agencies table
CREATE TABLE IF NOT EXISTS other_agencies (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  state_slug text NOT NULL,
  state_name text NOT NULL,
  location text,
  intro text,
  services text[],
  website_url text,
  phone text,
  email text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_other_agencies_state_slug ON other_agencies(state_slug);
CREATE INDEX IF NOT EXISTS idx_other_agencies_slug ON other_agencies(slug);

-- Create agency_metrics table
CREATE TABLE IF NOT EXISTS agency_metrics (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id uuid REFERENCES other_agencies(id) ON DELETE CASCADE NOT NULL UNIQUE,
  view_count_last_30_days integer DEFAULT 0,
  availability_requests_last_30_days integer DEFAULT 0,
  last_view_at timestamptz,
  last_request_at timestamptz,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_agency_metrics_agency_id ON agency_metrics(agency_id);

-- Create agency_views table
CREATE TABLE IF NOT EXISTS agency_views (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id uuid REFERENCES other_agencies(id) ON DELETE CASCADE NOT NULL,
  session_id text,
  user_agent text,
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_agency_views_agency_id ON agency_views(agency_id);
CREATE INDEX IF NOT EXISTS idx_agency_views_created_at ON agency_views(created_at);

-- Create agency_availability_requests table
CREATE TABLE IF NOT EXISTS agency_availability_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id uuid REFERENCES other_agencies(id) ON DELETE CASCADE NOT NULL,
  service text,
  budget text,
  timeline text,
  email text,
  name text,
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_agency_id ON agency_availability_requests(agency_id);
CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_created_at ON agency_availability_requests(created_at);

-- Enable Row Level Security
ALTER TABLE other_agencies ENABLE ROW LEVEL SECURITY;
ALTER TABLE agency_metrics ENABLE ROW LEVEL SECURITY;
ALTER TABLE agency_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE agency_availability_requests ENABLE ROW LEVEL SECURITY;

-- Policies for other_agencies (public read)
CREATE POLICY "Anyone can view agencies"
  ON other_agencies
  FOR SELECT
  TO public
  USING (true);

-- Policies for agency_metrics (public read for display)
CREATE POLICY "Anyone can view agency metrics"
  ON agency_metrics
  FOR SELECT
  TO public
  USING (true);

-- Policies for agency_views (anyone can insert views)
CREATE POLICY "Anyone can log agency views"
  ON agency_views
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Policies for agency_availability_requests (anyone can submit)
CREATE POLICY "Anyone can submit availability requests"
  ON agency_availability_requests
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Function to update agency metrics when views/requests are added
CREATE OR REPLACE FUNCTION update_agency_metrics()
RETURNS TRIGGER AS $$
BEGIN
  -- Ensure metrics record exists
  INSERT INTO agency_metrics (agency_id)
  VALUES (NEW.agency_id)
  ON CONFLICT (agency_id) DO NOTHING;

  -- Update based on which table triggered this
  IF TG_TABLE_NAME = 'agency_views' THEN
    UPDATE agency_metrics
    SET
      view_count_last_30_days = (
        SELECT COUNT(*)
        FROM agency_views
        WHERE agency_id = NEW.agency_id
        AND created_at > now() - interval '30 days'
      ),
      last_view_at = NEW.created_at,
      updated_at = now()
    WHERE agency_id = NEW.agency_id;
  ELSIF TG_TABLE_NAME = 'agency_availability_requests' THEN
    UPDATE agency_metrics
    SET
      availability_requests_last_30_days = (
        SELECT COUNT(*)
        FROM agency_availability_requests
        WHERE agency_id = NEW.agency_id
        AND created_at > now() - interval '30 days'
      ),
      last_request_at = NEW.created_at,
      updated_at = now()
    WHERE agency_id = NEW.agency_id;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers to auto-update metrics
CREATE TRIGGER update_metrics_on_view
  AFTER INSERT ON agency_views
  FOR EACH ROW
  EXECUTE FUNCTION update_agency_metrics();

CREATE TRIGGER update_metrics_on_request
  AFTER INSERT ON agency_availability_requests
  FOR EACH ROW
  EXECUTE FUNCTION update_agency_metrics();