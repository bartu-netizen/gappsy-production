/*
  # Fix agency_metrics NULL Guard

  ## Problem
  The update_agency_metrics() trigger function tries to insert into agency_metrics
  even when agency_id is NULL (placeholder agencies). This violates the NOT NULL
  constraint on agency_metrics.agency_id column.

  Error: null value in column "agency_id" of relation "agency_metrics" violates not-null constraint (23502)

  ## Solution
  Add a guard at the start of the function to return early when NEW.agency_id IS NULL.
  This allows placeholder agency submissions to succeed without touching agency_metrics.

  ## Impact
  - Placeholder agencies (agency_id = null) → Skip metrics update, return successfully
  - Real agencies (agency_id set) → Update metrics normally
  - No breaking changes to existing functionality

  ## Testing
  - Insert with agency_id = null → Should succeed, no metrics write
  - Insert with agency_id = UUID → Should succeed, metrics updated
*/

-- Recreate the function with NULL guard
CREATE OR REPLACE FUNCTION public.update_agency_metrics()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
BEGIN
  -- Early return if agency_id is NULL (placeholder agencies)
  -- Placeholder agencies should not update metrics
  IF NEW.agency_id IS NULL THEN
    RETURN NEW;
  END IF;

  -- Ensure metrics record exists (only for real agencies)
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

-- Verify the function was created
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_proc
    WHERE proname = 'update_agency_metrics'
    AND pronamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public')
  ) THEN
    RAISE EXCEPTION 'Function update_agency_metrics was not created successfully';
  END IF;
  
  RAISE NOTICE '✓ Function update_agency_metrics updated with NULL guard';
END $$;

-- Verify triggers still exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger
    WHERE tgname = 'update_metrics_on_request'
    AND tgrelid = 'public.agency_availability_requests'::regclass
  ) THEN
    RAISE EXCEPTION 'Trigger update_metrics_on_request is missing';
  END IF;
  
  RAISE NOTICE '✓ Trigger update_metrics_on_request exists';
END $$;
