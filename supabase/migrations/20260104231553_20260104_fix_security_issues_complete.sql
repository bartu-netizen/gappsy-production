/*
  # Fix Database Security Issues - Complete

  1. Unindexed Foreign Keys
    - Add index on `owner_demo_events.owner_user_id` for the foreign key constraint
  
  2. Remove Unused Indexes
    - Drop `idx_agency_availability_requests_agency_id` (unused)
    - Drop `idx_agency_views_agency_id` (unused)
    - Drop `idx_spotlight_applications_reviewed_by` (unused)
    - Drop `idx_top25_applications_reviewed_by` (unused)
    - Drop `idx_admin_secrets_key` (unused)
  
  3. Fix Function Search Path
    - Update `enforce_rank1_vazagency` function to have immutable search_path
  
  Security Changes:
  - Ensures foreign key performance by adding covering index
  - Removes unused indexes to reduce storage and maintenance overhead
  - Prevents function behavior from changing based on role search_path settings
*/

-- Create index for foreign key on owner_demo_events
CREATE INDEX IF NOT EXISTS idx_owner_demo_events_owner_user_id 
  ON public.owner_demo_events(owner_user_id);

-- Drop unused indexes (using CASCADE to handle dependencies)
DROP INDEX IF EXISTS public.idx_agency_availability_requests_agency_id CASCADE;
DROP INDEX IF EXISTS public.idx_agency_views_agency_id CASCADE;
DROP INDEX IF EXISTS public.idx_spotlight_applications_reviewed_by CASCADE;
DROP INDEX IF EXISTS public.idx_top25_applications_reviewed_by CASCADE;
DROP INDEX IF EXISTS public.idx_admin_secrets_key CASCADE;

-- Fix mutable search_path on function - use VOLATILE for trigger function
DROP FUNCTION IF EXISTS public.enforce_rank1_vazagency() CASCADE;

CREATE FUNCTION public.enforce_rank1_vazagency()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  VOLATILE
  SECURITY DEFINER
  SET search_path = 'public'
AS $$
BEGIN
  IF NEW.name = 'VAZAGENCY' AND NEW.rank IS NOT NULL AND NEW.rank != 1 THEN
    NEW.rank := 1;
  END IF;
  RETURN NEW;
END;
$$;

-- Recreate the trigger
DROP TRIGGER IF EXISTS enforce_rank1_vazagency_trigger ON public.top25_slots CASCADE;

CREATE TRIGGER enforce_rank1_vazagency_trigger
  BEFORE INSERT OR UPDATE ON public.top25_slots
  FOR EACH ROW
  EXECUTE FUNCTION public.enforce_rank1_vazagency();
