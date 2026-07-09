/*
  # Fix Security and Performance Issues

  1. Security Improvements
    - Fix RLS policies to use (select auth.uid()) for better performance
    - Prevents re-evaluation of auth.uid() for each row
    
  2. Performance Improvements
    - Remove unused indexes that consume storage and slow down writes
    - Fix function search_path to be immutable and secure
    
  3. Changes
    - Update RLS policies on stripe_customers, stripe_subscriptions, stripe_orders
    - Drop unused indexes on other_agencies, agency_views, agency_availability_requests
    - Recreate update_agency_metrics function with proper search_path
*/

-- =====================================================
-- 1. FIX RLS POLICIES (Performance)
-- =====================================================

-- Fix stripe_customers RLS policy
DROP POLICY IF EXISTS "Users can view their own customer data" ON stripe_customers;
CREATE POLICY "Users can view their own customer data"
  ON stripe_customers
  FOR SELECT
  TO authenticated
  USING (
    user_id = (SELECT auth.uid()) 
    AND deleted_at IS NULL
  );

-- Fix stripe_subscriptions RLS policy
DROP POLICY IF EXISTS "Users can view their own subscription data" ON stripe_subscriptions;
CREATE POLICY "Users can view their own subscription data"
  ON stripe_subscriptions
  FOR SELECT
  TO authenticated
  USING (
    customer_id IN (
      SELECT customer_id
      FROM stripe_customers
      WHERE user_id = (SELECT auth.uid())
      AND deleted_at IS NULL
    )
    AND deleted_at IS NULL
  );

-- Fix stripe_orders RLS policy
DROP POLICY IF EXISTS "Users can view their own order data" ON stripe_orders;
CREATE POLICY "Users can view their own order data"
  ON stripe_orders
  FOR SELECT
  TO authenticated
  USING (
    customer_id IN (
      SELECT customer_id
      FROM stripe_customers
      WHERE user_id = (SELECT auth.uid())
      AND deleted_at IS NULL
    )
    AND deleted_at IS NULL
  );

-- =====================================================
-- 2. DROP UNUSED INDEXES (Performance & Storage)
-- =====================================================

-- Drop unused index on other_agencies
DROP INDEX IF EXISTS idx_other_agencies_slug;

-- Drop unused indexes on agency_views
DROP INDEX IF EXISTS idx_agency_views_agency_id;
DROP INDEX IF EXISTS idx_agency_views_created_at;

-- Drop unused indexes on agency_availability_requests
DROP INDEX IF EXISTS idx_agency_availability_requests_agency_id;
DROP INDEX IF EXISTS idx_agency_availability_requests_created_at;

-- =====================================================
-- 3. FIX FUNCTION SEARCH_PATH (Security)
-- =====================================================

-- Recreate function with proper search_path
CREATE OR REPLACE FUNCTION public.update_agency_metrics()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
BEGIN
  -- Ensure metrics record exists
  INSERT INTO public.agency_metrics (agency_id)
  VALUES (NEW.agency_id)
  ON CONFLICT (agency_id) DO NOTHING;

  -- Update based on which table triggered this
  IF TG_TABLE_NAME = 'agency_views' THEN
    UPDATE public.agency_metrics
    SET
      view_count_last_30_days = (
        SELECT COUNT(*)
        FROM public.agency_views
        WHERE agency_id = NEW.agency_id
        AND created_at > now() - interval '30 days'
      ),
      last_view_at = NEW.created_at,
      updated_at = now()
    WHERE agency_id = NEW.agency_id;
  ELSIF TG_TABLE_NAME = 'agency_availability_requests' THEN
    UPDATE public.agency_metrics
    SET
      availability_requests_last_30_days = (
        SELECT COUNT(*)
        FROM public.agency_availability_requests
        WHERE agency_id = NEW.agency_id
        AND created_at > now() - interval '30 days'
      ),
      last_request_at = NEW.created_at,
      updated_at = now()
    WHERE agency_id = NEW.agency_id;
  END IF;

  RETURN NEW;
END;
$$;
