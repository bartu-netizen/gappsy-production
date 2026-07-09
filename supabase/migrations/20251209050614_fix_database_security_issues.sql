/*
  # Fix Database Security Issues
  
  This migration addresses security and performance issues identified in the database:
  
  1. **Remove Unused Indexes** (13 indexes)
     - Drops indexes that have not been used, improving write performance and reducing storage
     - Includes indexes on: top25_applications, agency_views, spotlight_applications, 
       agency_availability_requests, placeholder_agency_logos, spotlight_placements, other_agencies
  
  2. **Consolidate Duplicate RLS Policies**
     - Removes duplicate permissive policies on `other_agencies` table for INSERT and UPDATE
     - Keeps the more descriptive authenticated policies, removes the redundant public policies
     - Prevents policy conflicts and improves security clarity
  
  3. **Secure Function Search Paths**
     - Adds `SET search_path = ''` to all SECURITY DEFINER functions
     - Prevents search path manipulation attacks
     - Affects functions: update_placeholder_logos_updated_at, increment_spotlight_views,
       track_spotlight_click, increment_agency_views, track_agency_click
  
  ## Security Impact
  - Reduces attack surface by removing unused indexes
  - Eliminates policy confusion from duplicates
  - Prevents privilege escalation via search_path manipulation
*/

-- =====================================================
-- 1. DROP UNUSED INDEXES
-- =====================================================

-- Drop unused indexes on top25_applications
DROP INDEX IF EXISTS idx_top25_applications_reviewed_by;

-- Drop unused indexes on agency_views
DROP INDEX IF EXISTS idx_agency_views_agency_id;

-- Drop unused indexes on spotlight_applications
DROP INDEX IF EXISTS idx_spotlight_applications_reviewed_by;

-- Drop unused indexes on agency_availability_requests
DROP INDEX IF EXISTS idx_agency_availability_requests_agency_id;
DROP INDEX IF EXISTS idx_agency_availability_routed_to;

-- Drop unused indexes on placeholder_agency_logos
DROP INDEX IF EXISTS idx_placeholder_logos_state;

-- Drop unused indexes on spotlight_placements
DROP INDEX IF EXISTS idx_spotlight_state;
DROP INDEX IF EXISTS idx_spotlight_paid;

-- Drop unused indexes on other_agencies
DROP INDEX IF EXISTS idx_other_agencies_is_paid_listing;
DROP INDEX IF EXISTS idx_other_agencies_has_lead_matching;
DROP INDEX IF EXISTS idx_other_agencies_featured;
DROP INDEX IF EXISTS idx_other_agencies_services_gin;
DROP INDEX IF EXISTS idx_other_agencies_search;

-- =====================================================
-- 2. FIX DUPLICATE PERMISSIVE POLICIES
-- =====================================================

-- Drop duplicate INSERT policy (keep the authenticated one)
DROP POLICY IF EXISTS "other_agencies_insert_all" ON other_agencies;

-- Drop duplicate UPDATE policy (keep the authenticated one)
DROP POLICY IF EXISTS "other_agencies_update_all" ON other_agencies;

-- =====================================================
-- 3. FIX FUNCTION SEARCH PATHS
-- =====================================================

-- Fix update_placeholder_logos_updated_at trigger function
CREATE OR REPLACE FUNCTION public.update_placeholder_logos_updated_at()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = ''
AS $function$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$function$;

-- Fix increment_spotlight_views function
CREATE OR REPLACE FUNCTION public.increment_spotlight_views(spotlight_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $function$
BEGIN
  UPDATE public.spotlight_placements 
  SET view_count = view_count + 1
  WHERE id = spotlight_id;
END;
$function$;

-- Fix track_spotlight_click function
CREATE OR REPLACE FUNCTION public.track_spotlight_click(spotlight_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $function$
BEGIN
  UPDATE public.spotlight_placements 
  SET 
    click_count = click_count + 1,
    last_clicked_at = NOW()
  WHERE id = spotlight_id;
END;
$function$;

-- Fix increment_agency_views function
CREATE OR REPLACE FUNCTION public.increment_agency_views(agency_id uuid, tier text)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $function$
BEGIN
  IF tier = 'other' THEN
    UPDATE public.other_agencies 
    SET view_count = view_count + 1
    WHERE id = agency_id;
  END IF;
END;
$function$;

-- Fix track_agency_click function
CREATE OR REPLACE FUNCTION public.track_agency_click(agency_id uuid, tier text)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $function$
BEGIN
  IF tier = 'other' THEN
    UPDATE public.other_agencies 
    SET 
      click_count = click_count + 1,
      last_clicked_at = NOW()
    WHERE id = agency_id;
  END IF;
END;
$function$;
