/*
  # Tighten other_agency_emails RLS Policies

  1. Problem
    - "Authenticated can view all emails" allows ANY authenticated user to see ALL emails
    - This is too broad and unnecessary
  
  2. Solution
    - Remove overly permissive "Authenticated can view all emails" policy
    - Keep anon policy (limited by agency is_active)
    - Admin/service role access unchanged (via service_role_key)
  
  3. Result
    - Anon: Can view emails of active agencies (for public state pages)
    - Authenticated: No direct access (must use admin endpoints)
    - Service role: Full access (for admin functions)
*/

DROP POLICY IF EXISTS "Authenticated can view all emails" ON other_agency_emails;
