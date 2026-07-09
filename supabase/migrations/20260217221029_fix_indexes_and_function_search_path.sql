/*
  # Fix Indexes and Function Search Path

  1. Index Changes
    - Remove indexes that were flagged as unused
    - Add missing index for owner_demo_events.owner_user_id (unindexed FK)
  
  2. Security Fix
    - Fix is_admin() function to use immutable search_path
    - This prevents search_path injection attacks
*/

-- =====================================================
-- PART 1: DROP UNUSED INDEXES
-- =====================================================

DROP INDEX IF EXISTS idx_agency_availability_requests_agency_id;
DROP INDEX IF EXISTS idx_agency_views_agency_id;
DROP INDEX IF EXISTS idx_spotlight_applications_reviewed_by;
DROP INDEX IF EXISTS idx_top25_applications_reviewed_by;

-- =====================================================
-- PART 2: ADD MISSING FK INDEX
-- =====================================================

-- Add index for owner_demo_events.owner_user_id (unindexed foreign key)
CREATE INDEX IF NOT EXISTS idx_owner_demo_events_owner_user_id
ON owner_demo_events(owner_user_id);

-- =====================================================
-- PART 3: FIX is_admin() FUNCTION SEARCH PATH
-- =====================================================

-- Recreate is_admin() with fixed search_path to prevent injection attacks
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public.admin_secrets
    WHERE user_id = auth.uid()
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, pg_catalog;
