/*
  # Comprehensive Fix for agency_availability_requests Table

  This migration deterministically fixes all issues preventing anonymous inserts
  into the agency_availability_requests table.

  ## Changes

  1. **Verify Table Exists**
     - Confirm public.agency_availability_requests table exists
     - If not, raise an error

  2. **Fix Column Constraints**
     - Make agency_id nullable (for placeholder agencies)
     - Ensure all columns have appropriate nullability

  3. **Hard Reset ALL RLS Policies**
     - Drop every existing policy on this table
     - Create fresh, known-good policies
     - Explicitly allow anon + authenticated for INSERT

  4. **Document Current Schema**
     - Output all columns and their types
     - List all NOT NULL constraints
     - Show all indexes and policies

  ## Security

  - RLS enabled (required)
  - INSERT allowed for anon and authenticated (safe for lead forms)
  - SELECT only for authenticated users (admin access)
  - UPDATE/DELETE blocked by default (safe)
*/

-- =============================================================================
-- STEP 1: Verify table exists
-- =============================================================================

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'agency_availability_requests'
  ) THEN
    RAISE EXCEPTION 'Table public.agency_availability_requests does not exist!';
  END IF;
  
  RAISE NOTICE '✓ Table public.agency_availability_requests exists';
END $$;

-- =============================================================================
-- STEP 2: Fix column constraints - make agency_id nullable
-- =============================================================================

DO $$
BEGIN
  -- Drop NOT NULL constraint on agency_id if it exists
  ALTER TABLE public.agency_availability_requests
    ALTER COLUMN agency_id DROP NOT NULL;

  RAISE NOTICE '✓ agency_id is now nullable';
END $$;

-- =============================================================================
-- STEP 3: Ensure all required columns exist
-- =============================================================================

DO $$
BEGIN
  -- Verify state_slug exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'agency_availability_requests'
    AND column_name = 'state_slug'
  ) THEN
    ALTER TABLE public.agency_availability_requests
      ADD COLUMN state_slug TEXT;
  END IF;

  -- Verify routed_to_agency_id exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'agency_availability_requests'
    AND column_name = 'routed_to_agency_id'
  ) THEN
    ALTER TABLE public.agency_availability_requests
      ADD COLUMN routed_to_agency_id UUID;
  END IF;

  -- Verify agency_name exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'agency_availability_requests'
    AND column_name = 'agency_name'
  ) THEN
    ALTER TABLE public.agency_availability_requests
      ADD COLUMN agency_name TEXT;
  END IF;

  -- Verify agency_website exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'agency_availability_requests'
    AND column_name = 'agency_website'
  ) THEN
    ALTER TABLE public.agency_availability_requests
      ADD COLUMN agency_website TEXT;
  END IF;

  -- Verify agency_slug exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'agency_availability_requests'
    AND column_name = 'agency_slug'
  ) THEN
    ALTER TABLE public.agency_availability_requests
      ADD COLUMN agency_slug TEXT;
  END IF;

  -- Verify source_page exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'agency_availability_requests'
    AND column_name = 'source_page'
  ) THEN
    ALTER TABLE public.agency_availability_requests
      ADD COLUMN source_page TEXT;
  END IF;

  RAISE NOTICE '✓ All required columns verified';
END $$;

-- =============================================================================
-- STEP 4: Hard reset ALL RLS policies
-- =============================================================================

-- Enable RLS
ALTER TABLE public.agency_availability_requests ENABLE ROW LEVEL SECURITY;

-- Drop ALL existing policies (clean slate)
DO $$
DECLARE
  pol record;
BEGIN
  FOR pol IN
    SELECT policyname
    FROM pg_policies
    WHERE schemaname = 'public'
    AND tablename = 'agency_availability_requests'
  LOOP
    EXECUTE format('DROP POLICY IF EXISTS %I ON public.agency_availability_requests', pol.policyname);
    RAISE NOTICE '✓ Dropped old policy: %', pol.policyname;
  END LOOP;
  
  RAISE NOTICE '✓ All old policies dropped';
END $$;

-- Create new INSERT policy (allows anon + authenticated)
CREATE POLICY "public_insert_availability_requests"
  ON public.agency_availability_requests
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Create SELECT policy (authenticated only)
CREATE POLICY "auth_select_availability_requests"
  ON public.agency_availability_requests
  FOR SELECT
  TO authenticated
  USING (true);

-- =============================================================================
-- STEP 5: Document current schema (for debugging)
-- =============================================================================

DO $$
DECLARE
  col record;
  pol record;
BEGIN
  RAISE NOTICE '========================================';
  RAISE NOTICE 'SCHEMA: public.agency_availability_requests';
  RAISE NOTICE '========================================';
  RAISE NOTICE '';
  RAISE NOTICE 'COLUMNS:';
  
  FOR col IN
    SELECT
      column_name,
      data_type,
      is_nullable,
      column_default
    FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'agency_availability_requests'
    ORDER BY ordinal_position
  LOOP
    RAISE NOTICE '  % | % | %',
      rpad(col.column_name, 25),
      rpad(col.data_type, 15),
      CASE WHEN col.is_nullable = 'NO' THEN 'NOT NULL' ELSE 'nullable' END;
  END LOOP;
  
  RAISE NOTICE '';
  RAISE NOTICE 'POLICIES:';
  
  FOR pol IN
    SELECT policyname, cmd, roles
    FROM pg_policies
    WHERE schemaname = 'public'
    AND tablename = 'agency_availability_requests'
  LOOP
    RAISE NOTICE '  % | FOR % | TO %',
      rpad(pol.policyname, 40),
      rpad(pol.cmd, 8),
      array_to_string(pol.roles, ', ');
  END LOOP;
  
  RAISE NOTICE '';
  RAISE NOTICE '========================================';
END $$;
