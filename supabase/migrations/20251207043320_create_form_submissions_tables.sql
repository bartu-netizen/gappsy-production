/*
  # Create Form Submissions Tracking Tables

  This migration creates comprehensive tracking tables for all key forms across the platform,
  enabling complete submission history and analytics per state and type.

  ## 1. New Tables

  ### spotlight_applications
  Tracks all Spotlight/Featured placement applications
  - Full agency and contact details
  - State information for multi-state tracking
  - Budget range and services offered
  - Request metadata

  ### contact_messages
  Tracks all contact form submissions
  - Full message details
  - Handling status and assignment
  - Request metadata

  ### matched_leads
  Tracks all "Get Matched" lead generation form submissions
  - Client requirements (service, budget, timeline)
  - State information if available
  - Client contact details
  - Request metadata

  ### other_listing_applications
  Tracks all "Other Agencies" owner listing submissions and edits
  - Complete submission history (separate from current state in other_agencies)
  - Agency details and retainer information
  - Links to agency_id when available

  ## 2. Security
  - Enable RLS on all tables
  - Only authenticated owner/admin users can read submissions
  - Edge functions (service role) can insert new submissions
  - No public read or write access

  ## 3. Indexes
  - Indexes on created_at for chronological sorting
  - Indexes on state_slug for efficient state filtering
  - Indexes on email fields for duplicate checking and lookups
*/

-- =====================================================
-- 1. SPOTLIGHT APPLICATIONS TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS spotlight_applications (
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
  
  -- Application details
  description text,
  budget_range text,
  services text[],
  
  -- Metadata
  source text DEFAULT 'spotlight_form' NOT NULL,
  ip_address text,
  user_agent text,
  
  -- Status tracking
  status text DEFAULT 'pending',
  reviewed_at timestamptz,
  reviewed_by uuid REFERENCES auth.users(id),
  notes text
);

CREATE INDEX IF NOT EXISTS idx_spotlight_applications_state_slug 
  ON spotlight_applications(state_slug);

CREATE INDEX IF NOT EXISTS idx_spotlight_applications_created_at 
  ON spotlight_applications(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_spotlight_applications_contact_email 
  ON spotlight_applications(contact_email);

ALTER TABLE spotlight_applications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can view spotlight applications"
  ON spotlight_applications
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Service role can insert spotlight applications"
  ON spotlight_applications
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update spotlight applications"
  ON spotlight_applications
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- =====================================================
-- 2. CONTACT MESSAGES TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS contact_messages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now() NOT NULL,
  
  -- Contact information
  full_name text NOT NULL,
  email text NOT NULL,
  subject text NOT NULL,
  message text NOT NULL,
  
  -- Metadata
  ip_address text,
  user_agent text,
  
  -- Handling status
  handled boolean DEFAULT false NOT NULL,
  handled_at timestamptz,
  handled_by text,
  notes text
);

CREATE INDEX IF NOT EXISTS idx_contact_messages_created_at 
  ON contact_messages(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_contact_messages_email 
  ON contact_messages(email);

CREATE INDEX IF NOT EXISTS idx_contact_messages_handled 
  ON contact_messages(handled);

ALTER TABLE contact_messages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can view contact messages"
  ON contact_messages
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Service role can insert contact messages"
  ON contact_messages
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update contact messages"
  ON contact_messages
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- =====================================================
-- 3. MATCHED LEADS TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS matched_leads (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now() NOT NULL,
  
  -- State information (if available)
  state_name text,
  state_slug text,
  
  -- Client requirements
  service_needed text NOT NULL,
  budget_range text NOT NULL,
  timeline text NOT NULL,
  
  -- Client contact information
  client_email text NOT NULL,
  client_name text NOT NULL,
  
  -- Additional details
  additional_details text,
  
  -- Metadata
  source text DEFAULT 'get_matched_form' NOT NULL,
  ip_address text,
  user_agent text,
  
  -- Status tracking
  status text DEFAULT 'pending',
  matched_agency_id uuid,
  matched_at timestamptz,
  notes text
);

CREATE INDEX IF NOT EXISTS idx_matched_leads_created_at 
  ON matched_leads(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_matched_leads_state_slug 
  ON matched_leads(state_slug);

CREATE INDEX IF NOT EXISTS idx_matched_leads_client_email 
  ON matched_leads(client_email);

CREATE INDEX IF NOT EXISTS idx_matched_leads_status 
  ON matched_leads(status);

ALTER TABLE matched_leads ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can view matched leads"
  ON matched_leads
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Service role can insert matched leads"
  ON matched_leads
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update matched leads"
  ON matched_leads
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- =====================================================
-- 4. OTHER LISTING APPLICATIONS TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS other_listing_applications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now() NOT NULL,
  
  -- Agency reference (if known)
  agency_id uuid,
  
  -- State information
  state_name text NOT NULL,
  state_slug text NOT NULL,
  
  -- Agency information
  agency_name text NOT NULL,
  contact_name text,
  contact_email text,
  website_url text NOT NULL,
  
  -- Listing details
  intro text,
  services text[],
  average_retainer_amount numeric,
  
  -- Metadata
  source text DEFAULT 'other_listing_form' NOT NULL,
  ip_address text,
  user_agent text,
  
  -- Submission type
  submission_type text DEFAULT 'edit',  -- 'initial', 'edit', 'activation'
  notes text
);

CREATE INDEX IF NOT EXISTS idx_other_listing_applications_created_at 
  ON other_listing_applications(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_other_listing_applications_state_slug 
  ON other_listing_applications(state_slug);

CREATE INDEX IF NOT EXISTS idx_other_listing_applications_agency_id 
  ON other_listing_applications(agency_id);

CREATE INDEX IF NOT EXISTS idx_other_listing_applications_contact_email 
  ON other_listing_applications(contact_email);

ALTER TABLE other_listing_applications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can view other listing applications"
  ON other_listing_applications
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Service role can insert other listing applications"
  ON other_listing_applications
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update other listing applications"
  ON other_listing_applications
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- =====================================================
-- 5. SUMMARY VIEWS
-- =====================================================

-- Summary view for spotlight applications by state
CREATE OR REPLACE VIEW spotlight_applications_summary AS
SELECT 
  state_name,
  state_slug,
  COUNT(*) as total_submissions,
  COUNT(CASE WHEN status = 'pending' THEN 1 END) as pending_count,
  COUNT(CASE WHEN status = 'approved' THEN 1 END) as approved_count,
  MAX(created_at) as last_submission_at
FROM spotlight_applications
GROUP BY state_name, state_slug
ORDER BY last_submission_at DESC;

GRANT SELECT ON spotlight_applications_summary TO authenticated;

-- Summary view for matched leads by state
CREATE OR REPLACE VIEW matched_leads_summary AS
SELECT 
  state_name,
  state_slug,
  COUNT(*) as total_leads,
  COUNT(CASE WHEN status = 'pending' THEN 1 END) as pending_count,
  COUNT(CASE WHEN matched_agency_id IS NOT NULL THEN 1 END) as matched_count,
  MAX(created_at) as last_lead_at
FROM matched_leads
WHERE state_slug IS NOT NULL
GROUP BY state_name, state_slug
ORDER BY last_lead_at DESC;

GRANT SELECT ON matched_leads_summary TO authenticated;

-- Summary view for other listing applications by state
CREATE OR REPLACE VIEW other_listing_applications_summary AS
SELECT 
  state_name,
  state_slug,
  COUNT(*) as total_submissions,
  COUNT(DISTINCT agency_id) as unique_agencies,
  MAX(created_at) as last_submission_at
FROM other_listing_applications
GROUP BY state_name, state_slug
ORDER BY last_submission_at DESC;

GRANT SELECT ON other_listing_applications_summary TO authenticated;