/*
  # Create Top-25 Applications Tracking Table

  1. New Tables
    - `top25_applications`: Stores all Top-25 agency submissions across all states
      - Tracks submission details (agency info, contact, services)
      - Stores state information for multi-state filtering
      - Includes optional claim intent tracking
      - Captures request metadata (IP, user agent)

  2. Security
    - Enable RLS on `top25_applications` table
    - Only authenticated owner/admin users can read submissions
    - Edge functions (service role) can insert new submissions
    - No public read or write access

  3. Indexes
    - Index on state_slug for efficient filtering
    - Index on created_at for chronological sorting
    - Index on contact_email for duplicate checking
*/

-- Create top25_applications table
CREATE TABLE IF NOT EXISTS top25_applications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now() NOT NULL,
  
  -- State information
  state_name text NOT NULL,
  state_slug text NOT NULL,
  
  -- Agency and contact information
  agency_name text NOT NULL,
  contact_name text NOT NULL,
  contact_email text NOT NULL,
  website_url text NOT NULL,
  
  -- Submission details
  description text,
  services text[],
  
  -- Claim intent tracking (optional)
  claimed_rank_number integer,
  claimed_at timestamptz,
  
  -- Metadata
  source text DEFAULT 'top25_form' NOT NULL,
  ip_address text,
  user_agent text,
  
  -- Admin notes
  notes text,
  
  -- Status tracking
  status text DEFAULT 'pending',
  reviewed_at timestamptz,
  reviewed_by uuid REFERENCES auth.users(id)
);

-- Create indexes for efficient querying
CREATE INDEX IF NOT EXISTS idx_top25_applications_state_slug 
  ON top25_applications(state_slug);

CREATE INDEX IF NOT EXISTS idx_top25_applications_created_at 
  ON top25_applications(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_top25_applications_contact_email 
  ON top25_applications(contact_email);

CREATE INDEX IF NOT EXISTS idx_top25_applications_status 
  ON top25_applications(status);

-- Enable Row Level Security
ALTER TABLE top25_applications ENABLE ROW LEVEL SECURITY;

-- Policy: Only authenticated users can read submissions
-- This assumes all authenticated users are owner/admin
-- You can add more sophisticated role-based logic here if needed
CREATE POLICY "Authenticated users can view top25 applications"
  ON top25_applications
  FOR SELECT
  TO authenticated
  USING (true);

-- Policy: Service role can insert (for edge functions)
-- Note: This policy allows inserts from edge functions using service role key
CREATE POLICY "Service role can insert top25 applications"
  ON top25_applications
  FOR INSERT
  TO service_role
  WITH CHECK (true);

-- Policy: Authenticated users can update (for admin notes, status changes)
CREATE POLICY "Authenticated users can update top25 applications"
  ON top25_applications
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Create a view for easy querying with aggregations
CREATE OR REPLACE VIEW top25_applications_summary AS
SELECT 
  state_name,
  state_slug,
  COUNT(*) as total_submissions,
  COUNT(CASE WHEN claimed_rank_number IS NOT NULL THEN 1 END) as claimed_count,
  COUNT(CASE WHEN status = 'pending' THEN 1 END) as pending_count,
  MAX(created_at) as last_submission_at
FROM top25_applications
GROUP BY state_name, state_slug
ORDER BY last_submission_at DESC;

-- Grant select on view to authenticated users
GRANT SELECT ON top25_applications_summary TO authenticated;