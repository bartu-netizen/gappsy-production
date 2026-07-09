/*
  # Fix Security Issues - Indexes and RLS Policies
  
  1. Performance Issues - Missing Foreign Key Indexes
    - Add index on `agency_availability_requests.agency_id`
    - Add index on `agency_views.agency_id`
    - Add index on `spotlight_applications.reviewed_by`
    - Add index on `top25_applications.reviewed_by`
    - Remove unused index `idx_owner_demo_events_owner_user_id`
  
  2. Security Issues - Fix RLS Policies Always True
    This migration tightens RLS policies that currently allow unrestricted access.
    We implement proper admin checks and ownership verification.
    
    Tables affected:
    - agency_availability_requests
    - agency_logos
    - agency_reviews
    - agency_views
    - contact_messages
    - matched_leads
    - other_agencies
    - other_listing_applications
    - owner_demo_events
    - placeholder_agency_logos
    - sidebar_ads
    - spotlight_applications
    - spotlight_placements
    - state_content
    - state_faqs
    - state_pages
    - top25_applications
    - top25_slots
    
  3. Notes
    - Admin users are identified by checking admin_secrets table
    - Public insert operations are restricted where appropriate
    - All authenticated operations now verify admin status
*/

-- =====================================================
-- PART 1: ADD MISSING FOREIGN KEY INDEXES
-- =====================================================

-- Add index for agency_availability_requests.agency_id
CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_agency_id 
ON agency_availability_requests(agency_id);

-- Add index for agency_views.agency_id
CREATE INDEX IF NOT EXISTS idx_agency_views_agency_id 
ON agency_views(agency_id);

-- Add index for spotlight_applications.reviewed_by
CREATE INDEX IF NOT EXISTS idx_spotlight_applications_reviewed_by 
ON spotlight_applications(reviewed_by);

-- Add index for top25_applications.reviewed_by
CREATE INDEX IF NOT EXISTS idx_top25_applications_reviewed_by 
ON top25_applications(reviewed_by);

-- Remove unused index
DROP INDEX IF EXISTS idx_owner_demo_events_owner_user_id;

-- =====================================================
-- PART 2: CREATE HELPER FUNCTION FOR ADMIN CHECK
-- =====================================================

-- Function to check if user is admin
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM admin_secrets
    WHERE user_id = auth.uid()
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =====================================================
-- PART 3: FIX RLS POLICIES
-- =====================================================

-- agency_availability_requests: Tighten insert policy
DROP POLICY IF EXISTS "public_insert_availability_requests" ON agency_availability_requests;
CREATE POLICY "Anyone can submit availability requests"
  ON agency_availability_requests
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (
    agency_id IS NOT NULL AND
    client_email IS NOT NULL AND
    client_name IS NOT NULL
  );

-- agency_logos: Restrict to admins only
DROP POLICY IF EXISTS "Authenticated users can delete" ON agency_logos;
DROP POLICY IF EXISTS "Authenticated users can insert" ON agency_logos;
DROP POLICY IF EXISTS "Authenticated users can update" ON agency_logos;

CREATE POLICY "Only admins can delete agency logos"
  ON agency_logos
  FOR DELETE
  TO authenticated
  USING (is_admin());

CREATE POLICY "Only admins can insert agency logos"
  ON agency_logos
  FOR INSERT
  TO authenticated
  WITH CHECK (is_admin());

CREATE POLICY "Only admins can update agency logos"
  ON agency_logos
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- agency_reviews: Restrict to admins only
DROP POLICY IF EXISTS "Authenticated users can insert agency reviews" ON agency_reviews;
DROP POLICY IF EXISTS "Authenticated users can update agency reviews" ON agency_reviews;

CREATE POLICY "Only admins can insert agency reviews"
  ON agency_reviews
  FOR INSERT
  TO authenticated
  WITH CHECK (is_admin());

CREATE POLICY "Only admins can update agency reviews"
  ON agency_reviews
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- agency_views: Keep permissive for analytics but ensure data integrity
DROP POLICY IF EXISTS "Anyone can log agency views" ON agency_views;
CREATE POLICY "Anyone can log agency views with valid data"
  ON agency_views
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (agency_id IS NOT NULL);

-- contact_messages: Restrict updates to admins
DROP POLICY IF EXISTS "Authenticated users can update contact messages" ON contact_messages;
CREATE POLICY "Only admins can update contact messages"
  ON contact_messages
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- matched_leads: Restrict updates to admins
DROP POLICY IF EXISTS "Authenticated users can update matched leads" ON matched_leads;
CREATE POLICY "Only admins can update matched leads"
  ON matched_leads
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- other_agencies: Restrict to admins
DROP POLICY IF EXISTS "Authenticated users can delete other agencies" ON other_agencies;
DROP POLICY IF EXISTS "Authenticated users can insert other agencies" ON other_agencies;
DROP POLICY IF EXISTS "Authenticated users can update other agencies" ON other_agencies;

CREATE POLICY "Only admins can delete other agencies"
  ON other_agencies
  FOR DELETE
  TO authenticated
  USING (is_admin());

CREATE POLICY "Only admins can insert other agencies"
  ON other_agencies
  FOR INSERT
  TO authenticated
  WITH CHECK (is_admin());

CREATE POLICY "Only admins can update other agencies"
  ON other_agencies
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- other_listing_applications: Restrict updates to admins
DROP POLICY IF EXISTS "Authenticated users can update other listing applications" ON other_listing_applications;
CREATE POLICY "Only admins can update other listing applications"
  ON other_listing_applications
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- owner_demo_events: Restrict to admins
DROP POLICY IF EXISTS "Authenticated users can log demo events" ON owner_demo_events;
CREATE POLICY "Only admins can log demo events"
  ON owner_demo_events
  FOR INSERT
  TO authenticated
  WITH CHECK (is_admin());

-- placeholder_agency_logos: Restrict to admins
DROP POLICY IF EXISTS "Authenticated users can delete placeholder agency logos" ON placeholder_agency_logos;
DROP POLICY IF EXISTS "Authenticated users can insert placeholder agency logos" ON placeholder_agency_logos;
DROP POLICY IF EXISTS "Authenticated users can update placeholder agency logos" ON placeholder_agency_logos;

CREATE POLICY "Only admins can delete placeholder logos"
  ON placeholder_agency_logos
  FOR DELETE
  TO authenticated
  USING (is_admin());

CREATE POLICY "Only admins can insert placeholder logos"
  ON placeholder_agency_logos
  FOR INSERT
  TO authenticated
  WITH CHECK (is_admin());

CREATE POLICY "Only admins can update placeholder logos"
  ON placeholder_agency_logos
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- sidebar_ads: Restrict updates to admins
DROP POLICY IF EXISTS "Authenticated users can update sidebar ads" ON sidebar_ads;
CREATE POLICY "Only admins can update sidebar ads"
  ON sidebar_ads
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- spotlight_applications: Restrict updates to admins
DROP POLICY IF EXISTS "Authenticated users can update spotlight applications" ON spotlight_applications;
CREATE POLICY "Only admins can update spotlight applications"
  ON spotlight_applications
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- spotlight_placements: Restrict to admins
DROP POLICY IF EXISTS "Authenticated users can delete spotlight placements" ON spotlight_placements;
DROP POLICY IF EXISTS "Authenticated users can insert spotlight placements" ON spotlight_placements;
DROP POLICY IF EXISTS "Authenticated users can update spotlight placements" ON spotlight_placements;

CREATE POLICY "Only admins can delete spotlight placements"
  ON spotlight_placements
  FOR DELETE
  TO authenticated
  USING (is_admin());

CREATE POLICY "Only admins can insert spotlight placements"
  ON spotlight_placements
  FOR INSERT
  TO authenticated
  WITH CHECK (is_admin());

CREATE POLICY "Only admins can update spotlight placements"
  ON spotlight_placements
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- state_content: Restrict to admins
DROP POLICY IF EXISTS "Authenticated users can insert state content" ON state_content;
DROP POLICY IF EXISTS "Authenticated users can update state content" ON state_content;

CREATE POLICY "Only admins can insert state content"
  ON state_content
  FOR INSERT
  TO authenticated
  WITH CHECK (is_admin());

CREATE POLICY "Only admins can update state content"
  ON state_content
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- state_faqs: Restrict to admins
DROP POLICY IF EXISTS "Authenticated users can delete FAQs" ON state_faqs;
DROP POLICY IF EXISTS "Authenticated users can insert FAQs" ON state_faqs;

CREATE POLICY "Only admins can delete FAQs"
  ON state_faqs
  FOR DELETE
  TO authenticated
  USING (is_admin());

CREATE POLICY "Only admins can insert FAQs"
  ON state_faqs
  FOR INSERT
  TO authenticated
  WITH CHECK (is_admin());

-- state_pages: Restrict to admins
DROP POLICY IF EXISTS "Authenticated users can insert state pages" ON state_pages;
DROP POLICY IF EXISTS "Authenticated users can update state pages" ON state_pages;

CREATE POLICY "Only admins can insert state pages"
  ON state_pages
  FOR INSERT
  TO authenticated
  WITH CHECK (is_admin());

CREATE POLICY "Only admins can update state pages"
  ON state_pages
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- top25_applications: Restrict updates to admins
DROP POLICY IF EXISTS "Authenticated users can update top25 applications" ON top25_applications;
CREATE POLICY "Only admins can update top25 applications"
  ON top25_applications
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());

-- top25_slots: Restrict updates to admins
DROP POLICY IF EXISTS "Authenticated users can update slots" ON top25_slots;
CREATE POLICY "Only admins can update slots"
  ON top25_slots
  FOR UPDATE
  TO authenticated
  USING (is_admin())
  WITH CHECK (is_admin());