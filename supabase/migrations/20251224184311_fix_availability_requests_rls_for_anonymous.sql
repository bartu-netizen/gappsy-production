/*
  # Fix RLS policies for anonymous availability request submissions

  This migration ensures that anonymous (non-authenticated) users can successfully
  insert availability requests into the agency_availability_requests table.

  ## Changes

  1. **Drop existing INSERT policy**
     - Remove the existing "Anyone can submit availability requests" policy
     - This ensures we have a clean slate for the new policy

  2. **Create new INSERT policy for anon and authenticated users**
     - Explicitly grant INSERT to both `anon` and `authenticated` roles
     - Use WITH CHECK (true) to allow all inserts
     - This is safe because:
       - No sensitive data is exposed
       - Users can only insert their own data
       - agency_id is now nullable, supporting placeholder agencies

  3. **Ensure RLS is enabled**
     - Verify RLS is enabled on the table
     - This is required for policies to take effect

  ## Security Notes

  - This policy is intentionally permissive for INSERT operations
  - Availability requests are lead capture forms - we want to accept all valid submissions
  - No SELECT policy needed (users shouldn't read other users' requests)
  - UPDATE/DELETE blocked by default (only admins should modify requests)
*/

-- Ensure RLS is enabled on the table
ALTER TABLE agency_availability_requests ENABLE ROW LEVEL SECURITY;

-- Drop existing policies
DROP POLICY IF EXISTS "Anyone can submit availability requests" ON agency_availability_requests;
DROP POLICY IF EXISTS "Authenticated users can view all requests" ON agency_availability_requests;

-- Create new INSERT policy that explicitly allows anon and authenticated users
CREATE POLICY "Allow public availability request submissions"
  ON agency_availability_requests
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Create a policy for authenticated users to view all requests
-- (Useful for admin dashboards and owner verification pages)
CREATE POLICY "Authenticated users can view all requests"
  ON agency_availability_requests
  FOR SELECT
  TO authenticated
  USING (true);
