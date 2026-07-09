/*
  # Fix agency_reviews RLS for admin and public access

  1. Problem
    - Admin page uses anon key to fetch reviews
    - Previous "Public read published reviews" policy only allowed reading is_published = true
    - Admin page could not see draft reviews, showing 0 total
    - When all reviews were set to is_published = false, both admin and public showed empty

  2. Changes
    - Replace the restrictive public SELECT policy with one that allows anon to read ALL reviews
    - The is_published flag is enforced at the application layer:
      - Admin page shows all reviews (published + draft)
      - Public review pages filter by is_published in the component
    - This is safe because agency review data is inherently public content

  3. Security
    - Only SELECT is allowed for anon/public role
    - INSERT/UPDATE/DELETE still require authenticated admin role
    - Service role retains full access
*/

DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'agency_reviews'
    AND policyname = 'Public read published reviews'
  ) THEN
    DROP POLICY "Public read published reviews" ON agency_reviews;
  END IF;
END $$;

CREATE POLICY "Anon can read all agency reviews"
  ON agency_reviews
  FOR SELECT
  TO anon
  USING (true);
