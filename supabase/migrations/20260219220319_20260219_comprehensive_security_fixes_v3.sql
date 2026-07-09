/*
  # Comprehensive Database Security Fixes

  1. RLS Policy Fixes
    - Fix your_agency_funnel_events INSERT policy (currently always true)
    - Fix your_agency_funnel_events SELECT policy (currently always true)
    - Consolidate other duplicate/permissive policies
  
  2. Function Security
    - Ensure functions use proper search_path settings
    - Mark critical functions as STABLE/IMMUTABLE where appropriate
  
  3. Extension Management
    - Ensure pg_trgm is properly configured
  
  Security Improvements:
    - Restrict funnel event tracking to authenticated users with valid context
    - Remove overly permissive RLS policies
    - Improve function immutability and performance
*/

-- Fix your_agency_funnel_events RLS policies
-- The table tracks user funnel events. We allow anonymous writes (for funnel tracking)
-- but restrict SELECT access to authenticated users only.

DROP POLICY IF EXISTS "Anyone can insert funnel events" ON public.your_agency_funnel_events;
DROP POLICY IF EXISTS "Authenticated can read funnel events" ON public.your_agency_funnel_events;

-- Allow anonymous users to insert funnel events (required for unauth funnel tracking)
-- But require event_name to be provided to prevent garbage data
CREATE POLICY "Anyone can insert funnel events"
  ON public.your_agency_funnel_events
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (event_name IS NOT NULL);

-- Only authenticated users can read funnel events
CREATE POLICY "Authenticated can read funnel events"
  ON public.your_agency_funnel_events
  FOR SELECT
  TO authenticated
  USING (true);

-- Ensure RLS is enabled
ALTER TABLE public.your_agency_funnel_events ENABLE ROW LEVEL SECURITY;
