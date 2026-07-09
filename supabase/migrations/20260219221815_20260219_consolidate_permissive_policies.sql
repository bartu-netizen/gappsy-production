/*
  # Consolidate Multiple Permissive Policies

  Merge redundant permissive SELECT policies that serve the same purpose
*/

-- agency_listings_index: Keep one unified policy
DROP POLICY IF EXISTS "Anyone can read active listings" ON public.agency_listings_index;
DROP POLICY IF EXISTS "Anyone can read agency listings index" ON public.agency_listings_index;

CREATE POLICY "Public read agency listings"
  ON public.agency_listings_index
  FOR SELECT
  TO public
  USING (is_active = true);

-- agency_reviews: Consolidate into single policy
DROP POLICY IF EXISTS "Anyone can view agency reviews" ON public.agency_reviews;
DROP POLICY IF EXISTS "Public read published reviews" ON public.agency_reviews;
DROP POLICY IF EXISTS "agency_reviews_public_select" ON public.agency_reviews;
DROP POLICY IF EXISTS "agency_reviews_authenticated_select_all" ON public.agency_reviews;

CREATE POLICY "Public read published agency reviews"
  ON public.agency_reviews
  FOR SELECT
  TO public
  USING (is_published = true);

CREATE POLICY "Authenticated read all agency reviews"
  ON public.agency_reviews
  FOR SELECT
  TO authenticated
  USING (true);

-- other_agencies: Consolidate into single policy
DROP POLICY IF EXISTS "Anyone can view agencies" ON public.other_agencies;
DROP POLICY IF EXISTS "Public read active agencies" ON public.other_agencies;

CREATE POLICY "Public read active agencies"
  ON public.other_agencies
  FOR SELECT
  TO public
  USING (is_active = true);
