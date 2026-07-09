/*
  # Fix Security and Performance Issues

  ## Changes Made

  1. **RLS Performance Optimization**
     - Fixed `stripe_customers` policy to use `(select auth.uid())` instead of `auth.uid()`
     - Fixed `stripe_subscriptions` policy to use `(select auth.uid())` instead of `auth.uid()`
     - Fixed `stripe_orders` policy to use `(select auth.uid())` instead of `auth.uid()`
     - This prevents re-evaluation of auth function for each row, improving query performance

  2. **RLS Policy Security Fix**
     - Replaced overly permissive `top25_slots` UPDATE policy that allowed unrestricted access
     - New policy restricts updates to only admin users or service role

  3. **Index Cleanup**
     - Dropped unused index `idx_top25_slots_state_available`
     - Replaced with optimized index that better matches query patterns

  ## Security Notes
  - All policies now follow RLS best practices
  - Auth function calls are optimized with subquery pattern
  - UPDATE access to top25_slots is now properly restricted
*/

-- =====================================================
-- 1. Fix stripe_customers RLS policy performance
-- =====================================================

DROP POLICY IF EXISTS "Users can view their own customer data" ON stripe_customers;

CREATE POLICY "Users can view their own customer data"
  ON stripe_customers
  FOR SELECT
  TO authenticated
  USING (user_id = (select auth.uid()) AND deleted_at IS NULL);


-- =====================================================
-- 2. Fix stripe_subscriptions RLS policy performance
-- =====================================================

DROP POLICY IF EXISTS "Users can view their own subscription data" ON stripe_subscriptions;

CREATE POLICY "Users can view their own subscription data"
  ON stripe_subscriptions
  FOR SELECT
  TO authenticated
  USING (
    customer_id IN (
      SELECT customer_id
      FROM stripe_customers
      WHERE user_id = (select auth.uid()) AND deleted_at IS NULL
    )
    AND deleted_at IS NULL
  );


-- =====================================================
-- 3. Fix stripe_orders RLS policy performance
-- =====================================================

DROP POLICY IF EXISTS "Users can view their own order data" ON stripe_orders;

CREATE POLICY "Users can view their own order data"
  ON stripe_orders
  FOR SELECT
  TO authenticated
  USING (
    customer_id IN (
      SELECT customer_id
      FROM stripe_customers
      WHERE user_id = (select auth.uid()) AND deleted_at IS NULL
    )
    AND deleted_at IS NULL
  );


-- =====================================================
-- 4. Fix top25_slots UPDATE policy (security issue)
-- =====================================================

DROP POLICY IF EXISTS "Authenticated users can update slots" ON top25_slots;

-- Only allow service role to update slots (for admin operations and payment processing)
-- Regular authenticated users should not be able to update slots directly
CREATE POLICY "Service role can update slots"
  ON top25_slots
  FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);


-- =====================================================
-- 5. Drop unused index and create optimized replacement
-- =====================================================

-- Drop the unused composite index
DROP INDEX IF EXISTS idx_top25_slots_state_available;

-- Create a more targeted index for common query patterns
-- This index is optimized for queries that filter by state_slug and order by rank
CREATE INDEX IF NOT EXISTS idx_top25_slots_state_rank
  ON top25_slots(state_slug, rank);