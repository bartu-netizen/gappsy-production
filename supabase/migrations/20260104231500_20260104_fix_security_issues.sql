/*
  # Fix Database Security Issues

  1. Unindexed Foreign Keys
    - Add index on `owner_demo_events.owner_user_id` for the foreign key constraint
  
  2. Remove Unused Indexes
    - Drop `idx_agency_availability_requests_agency_id` (unused)
    - Drop `idx_agency_views_agency_id` (unused)
    - Drop `idx_spotlight_applications_reviewed_by` (unused)
    - Drop `idx_top25_applications_reviewed_by` (unused)
    - Drop `idx_admin_secrets_key` (unused)
  
  3. Fix Function Search Path
    - Update `enforce_rank1_vazagency` function to use immutable search_path
  
  Security Changes:
  - Ensures foreign key performance by adding covering index
  - Removes unused indexes to reduce storage and maintenance overhead
  - Prevents function behavior from changing based on role search_path settings
*/

-- Create index for foreign key on owner_demo_events
CREATE INDEX IF NOT EXISTS idx_owner_demo_events_owner_user_id 
  ON public.owner_demo_events(owner_user_id);

-- Drop unused indexes
DROP INDEX IF EXISTS public.idx_agency_availability_requests_agency_id;
DROP INDEX IF EXISTS public.idx_agency_views_agency_id;
DROP INDEX IF EXISTS public.idx_spotlight_applications_reviewed_by;
DROP INDEX IF EXISTS public.idx_top25_applications_reviewed_by;
DROP INDEX IF EXISTS public.idx_admin_secrets_key;

-- Fix mutable search_path on function
CREATE OR REPLACE FUNCTION public.enforce_rank1_vazagency()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  IMMUTABLE
  SECURITY DEFINER
  SET search_path = public
AS $$
BEGIN
  IF NEW.name = 'VAZAGENCY' AND NEW.rank IS NOT NULL AND NEW.rank != 1 THEN
    NEW.rank := 1;
  END IF;
  RETURN NEW;
END;
$$;
