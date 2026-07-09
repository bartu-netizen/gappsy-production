/*
  # Fix Database Security and Performance Issues

  ## Changes Made

  1. **Add Missing Foreign Key Indexes**
     - `agency_availability_requests.agency_id` → Add index
     - `agency_views.agency_id` → Add index
     - `spotlight_applications.reviewed_by` → Add index
     - `top25_applications.reviewed_by` → Add index

  2. **Drop Unused Indexes**
     - `idx_agency_reviews_slug` (unused)
     - `idx_agency_reviews_state` (unused)
     - `idx_agency_availability_requests_source_page` (unused)
     - `idx_owner_demo_events_user_id` (unused)
     - `idx_owner_demo_events_event_name` (unused)
     - `idx_owner_demo_events_created_at` (unused)
     - `idx_top25_slots_updated_at` (unused)
     - `idx_agency_availability_requests_agency_name` (unused)
     - `idx_state_pages_active` (unused)

  3. **Fix Duplicate Indexes**
     - Drop `unique_state_rank` constraint (duplicate of `top25_slots_state_slug_rank_key`)

  4. **Fix Function Search Path**
     - Update `enforce_rank1_vazagency` function with immutable search_path

  ## Performance Impact
  - Improved query performance on foreign key lookups
  - Reduced index maintenance overhead
  - Fixed security warnings

  ## Important Notes
  - Auth DB Connection Strategy must be configured manually in Supabase dashboard
  - Cannot be fixed via SQL migration
*/

-- ============================================================
-- 1. ADD MISSING FOREIGN KEY INDEXES
-- ============================================================

-- Index for agency_availability_requests.agency_id
CREATE INDEX IF NOT EXISTS idx_agency_availability_requests_agency_id 
ON agency_availability_requests(agency_id);

-- Index for agency_views.agency_id
CREATE INDEX IF NOT EXISTS idx_agency_views_agency_id 
ON agency_views(agency_id);

-- Index for spotlight_applications.reviewed_by
CREATE INDEX IF NOT EXISTS idx_spotlight_applications_reviewed_by 
ON spotlight_applications(reviewed_by);

-- Index for top25_applications.reviewed_by
CREATE INDEX IF NOT EXISTS idx_top25_applications_reviewed_by 
ON top25_applications(reviewed_by);

-- ============================================================
-- 2. DROP UNUSED INDEXES
-- ============================================================

-- Drop unused indexes on agency_reviews
DROP INDEX IF EXISTS idx_agency_reviews_slug;
DROP INDEX IF EXISTS idx_agency_reviews_state;

-- Drop unused indexes on agency_availability_requests
DROP INDEX IF EXISTS idx_agency_availability_requests_source_page;
DROP INDEX IF EXISTS idx_agency_availability_requests_agency_name;

-- Drop unused indexes on owner_demo_events
DROP INDEX IF EXISTS idx_owner_demo_events_user_id;
DROP INDEX IF EXISTS idx_owner_demo_events_event_name;
DROP INDEX IF EXISTS idx_owner_demo_events_created_at;

-- Drop unused indexes on top25_slots
DROP INDEX IF EXISTS idx_top25_slots_updated_at;

-- Drop unused indexes on state_pages
DROP INDEX IF EXISTS idx_state_pages_active;

-- ============================================================
-- 3. FIX DUPLICATE INDEXES
-- ============================================================

-- Drop unique_state_rank constraint (duplicate of top25_slots_state_slug_rank_key)
-- Both enforce the same uniqueness: (state_slug, rank)
ALTER TABLE top25_slots DROP CONSTRAINT IF EXISTS unique_state_rank;

-- ============================================================
-- 4. FIX FUNCTION SEARCH PATH
-- ============================================================

-- Recreate function with SECURITY DEFINER and explicit search_path
CREATE OR REPLACE FUNCTION public.enforce_rank1_vazagency()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  -- Ensure VazAgency always has rank 1 on every state
  IF NEW.agency_name = 'VazAgency' AND NEW.rank != 1 THEN
    RAISE EXCEPTION 'VazAgency must always have rank 1';
  END IF;

  -- Prevent any other agency from taking rank 1
  IF NEW.rank = 1 AND NEW.agency_name != 'VazAgency' THEN
    RAISE EXCEPTION 'Rank 1 is reserved for VazAgency';
  END IF;

  RETURN NEW;
END;
$$;

-- Add comment to function
COMMENT ON FUNCTION public.enforce_rank1_vazagency() IS 
'Enforces that VazAgency always occupies rank 1 on every state. Security definer with explicit search_path.';
