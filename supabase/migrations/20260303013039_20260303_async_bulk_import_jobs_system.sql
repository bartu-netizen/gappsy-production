/*
  # Async Bulk Import Jobs System

  This migration creates a production-ready async import job architecture for Other Agencies,
  enabling server-side processing of large files (5000+ rows) with:
  - Job status tracking
  - Chunk-based processing (internal backend chunking, not user-driven)
  - Automatic ListClean queue triggering
  - Per-state analytics and verification pipeline tracking
  - Continues processing even if browser closes or user goes offline

  1. NEW TABLES
    - other_agencies_import_jobs (main job tracking)
    - other_agencies_import_job_chunks (chunk-level progress)
    - other_agencies_state_stats (per-state analytics cache)
    - other_agencies_state_stats_snapshot (historical snapshots for charts)

  2. ENHANCED other_agencies TABLE
    - Add import_job_id FK for origin tracking
    - Add import_source for scraper/manual classification
    - Add created_by_admin for audit

  3. ENHANCED other_agency_emails TABLE
    - Add import_job_id FK for batch tracking
    - Add created_by_admin for audit

  4. INDEX ADDITIONS
    - Optimized queries for state-level stats
    - Verification pipeline aggregations
    - Import job progress tracking

  5. SECURITY
    - Service role only access
    - Admin-only visibility policies
    - No public exposure of import job internals
*/

-- ============================================================
-- PHASE 1: Enhance other_agencies table with import tracking
-- ============================================================

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'import_job_id'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN import_job_id uuid;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'import_source'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN import_source text DEFAULT 'manual';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies' AND column_name = 'created_by_admin'
  ) THEN
    ALTER TABLE other_agencies ADD COLUMN created_by_admin text;
  END IF;
END $$;

-- ============================================================
-- PHASE 2: Enhance other_agency_emails table with import tracking
-- ============================================================

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'import_job_id'
  ) THEN
    ALTER TABLE other_agency_emails ADD COLUMN import_job_id uuid;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'created_by_admin'
  ) THEN
    ALTER TABLE other_agency_emails ADD COLUMN created_by_admin text;
  END IF;
END $$;

-- ============================================================
-- PHASE 3: Create main import jobs table (async job queue)
-- ============================================================

CREATE TABLE IF NOT EXISTS other_agencies_import_jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug text NOT NULL,
  source_filename text NOT NULL,
  source_rows_total integer NOT NULL DEFAULT 0,
  source_rows_processed integer NOT NULL DEFAULT 0,
  status text NOT NULL DEFAULT 'queued' CHECK (status IN (
    'queued',
    'parsing',
    'processing',
    'completed',
    'partial_success',
    'failed',
    'cancelled'
  )),
  chunk_size integer NOT NULL DEFAULT 500,
  chunks_total integer NOT NULL DEFAULT 0,
  chunks_processed integer NOT NULL DEFAULT 0,
  progress_percent integer NOT NULL DEFAULT 0,
  started_at timestamptz,
  completed_at timestamptz,
  last_error text,
  summary_json jsonb DEFAULT '{}'::jsonb,
  listclean_auto_kick_attempted boolean DEFAULT false,
  listclean_auto_kick_started boolean DEFAULT false,
  listclean_auto_kick_already_running boolean DEFAULT false,
  listclean_auto_kick_error text,
  created_by_admin text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_import_jobs_state_slug ON other_agencies_import_jobs(state_slug);
CREATE INDEX IF NOT EXISTS idx_import_jobs_status ON other_agencies_import_jobs(status, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_import_jobs_state_status ON other_agencies_import_jobs(state_slug, status);
CREATE INDEX IF NOT EXISTS idx_import_jobs_created_at ON other_agencies_import_jobs(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_import_jobs_updated_at ON other_agencies_import_jobs(updated_at DESC);

ALTER TABLE other_agencies_import_jobs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role access import jobs"
  ON other_agencies_import_jobs FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- ============================================================
-- PHASE 4: Create chunk-level tracking table
-- ============================================================

CREATE TABLE IF NOT EXISTS other_agencies_import_job_chunks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid NOT NULL REFERENCES other_agencies_import_jobs(id) ON DELETE CASCADE,
  chunk_index integer NOT NULL,
  rows_in_chunk integer NOT NULL DEFAULT 0,
  status text NOT NULL DEFAULT 'pending' CHECK (status IN (
    'pending',
    'processing',
    'completed',
    'failed'
  )),
  processed_at timestamptz,
  inserted_agencies integer NOT NULL DEFAULT 0,
  inserted_emails integer NOT NULL DEFAULT 0,
  inserted_phones integer NOT NULL DEFAULT 0,
  skipped_rows integer NOT NULL DEFAULT 0,
  error_count integer NOT NULL DEFAULT 0,
  error_sample_json jsonb DEFAULT '[]'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_import_chunks_job_id ON other_agencies_import_job_chunks(job_id);
CREATE INDEX IF NOT EXISTS idx_import_chunks_status ON other_agencies_import_job_chunks(job_id, status);
CREATE INDEX IF NOT EXISTS idx_import_chunks_index ON other_agencies_import_job_chunks(job_id, chunk_index);

ALTER TABLE other_agencies_import_job_chunks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role access import chunks"
  ON other_agencies_import_job_chunks FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- ============================================================
-- PHASE 5: Create per-state stats cache table
-- ============================================================

CREATE TABLE IF NOT EXISTS other_agencies_state_stats (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug text NOT NULL UNIQUE,
  last_import_job_id uuid REFERENCES other_agencies_import_jobs(id),
  last_import_at timestamptz,
  import_status text,
  rows_imported integer DEFAULT 0,
  rows_processed integer DEFAULT 0,

  -- INVENTORY (pre-clean)
  unique_agencies integer DEFAULT 0,
  agencies_with_0_emails integer DEFAULT 0,
  agencies_with_1_email integer DEFAULT 0,
  agencies_with_2_emails integer DEFAULT 0,
  agencies_with_3plus_emails integer DEFAULT 0,
  total_imported_emails integer DEFAULT 0,
  avg_emails_per_agency numeric(8, 2) DEFAULT 0,
  agencies_with_phone integer DEFAULT 0,
  agencies_with_website integer DEFAULT 0,

  -- VERIFICATION PIPELINE
  pending_verification integer DEFAULT 0,
  verification_processing integer DEFAULT 0,
  verification_retry_scheduled integer DEFAULT 0,
  verification_unknown_retrying integer DEFAULT 0,
  verification_unknown_final integer DEFAULT 0,
  verification_valid integer DEFAULT 0,
  verification_invalid integer DEFAULT 0,
  verification_risky integer DEFAULT 0,
  verification_catch_all integer DEFAULT 0,
  avg_verification_attempts numeric(5, 2) DEFAULT 0,
  last_queue_run_at timestamptz,

  -- POST-CLEAN (agency-level)
  unique_agencies_clean_1plus integer DEFAULT 0,
  agencies_clean_exactly_1 integer DEFAULT 0,
  agencies_clean_2plus integer DEFAULT 0,
  agencies_clean_3plus integer DEFAULT 0,
  avg_clean_emails_per_agency numeric(8, 2) DEFAULT 0,
  clean_coverage_rate numeric(5, 2) DEFAULT 0,

  -- SEND-READY (smartlead prep)
  unique_agencies_ready_for_smartlead integer DEFAULT 0,
  ready_to_sync_emails integer DEFAULT 0,
  role_based_clean_emails integer DEFAULT 0,
  personal_clean_emails integer DEFAULT 0,
  agencies_only_role_based_clean integer DEFAULT 0,
  agencies_with_personal_clean integer DEFAULT 0,
  send_ready_coverage_rate numeric(5, 2) DEFAULT 0,

  -- DATA QUALITY
  pct_without_website numeric(5, 2) DEFAULT 0,
  pct_without_phone numeric(5, 2) DEFAULT 0,
  duplicate_domain_rate numeric(5, 2) DEFAULT 0,
  duplicate_email_rate numeric(5, 2) DEFAULT 0,
  top_import_errors_json jsonb DEFAULT '[]'::jsonb,

  -- CLEANING QUALITY
  valid_rate numeric(5, 2) DEFAULT 0,
  unknown_rate numeric(5, 2) DEFAULT 0,
  risky_rate numeric(5, 2) DEFAULT 0,
  catch_all_rate numeric(5, 2) DEFAULT 0,
  avg_retries_per_unknown numeric(5, 2) DEFAULT 0,

  updated_at timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_state_stats_state_slug ON other_agencies_state_stats(state_slug);
CREATE INDEX IF NOT EXISTS idx_state_stats_updated_at ON other_agencies_state_stats(updated_at DESC);

ALTER TABLE other_agencies_state_stats ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role access state stats"
  ON other_agencies_state_stats FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- ============================================================
-- PHASE 6: Create state stats snapshot table for historical tracking
-- ============================================================

CREATE TABLE IF NOT EXISTS other_agencies_state_stats_snapshots (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_slug text NOT NULL,
  import_job_id uuid REFERENCES other_agencies_import_jobs(id),
  snapshot_type text NOT NULL CHECK (snapshot_type IN ('post_import', 'post_verification', 'hourly', 'daily')),

  -- Key metrics snapshot
  unique_agencies integer,
  total_emails integer,
  valid_emails integer,
  clean_coverage_rate numeric(5, 2),
  ready_to_sync_emails integer,
  ready_agencies integer,
  send_ready_coverage_rate numeric(5, 2),

  metadata_json jsonb DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_state_stats_snapshots_state ON other_agencies_state_stats_snapshots(state_slug, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_state_stats_snapshots_job ON other_agencies_state_stats_snapshots(import_job_id);

ALTER TABLE other_agencies_state_stats_snapshots ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role access state snapshots"
  ON other_agencies_state_stats_snapshots FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- ============================================================
-- PHASE 7: Add FK constraint for tracking
-- ============================================================

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE table_name = 'other_agencies' AND constraint_name = 'fk_other_agencies_import_job'
  ) THEN
    ALTER TABLE other_agencies ADD CONSTRAINT fk_other_agencies_import_job
      FOREIGN KEY (import_job_id) REFERENCES other_agencies_import_jobs(id) ON DELETE SET NULL;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE table_name = 'other_agency_emails' AND constraint_name = 'fk_other_agency_emails_import_job'
  ) THEN
    ALTER TABLE other_agency_emails ADD CONSTRAINT fk_other_agency_emails_import_job
      FOREIGN KEY (import_job_id) REFERENCES other_agencies_import_jobs(id) ON DELETE SET NULL;
  END IF;
END $$;

-- ============================================================
-- PHASE 8: Create helper function for state stats refresh
-- ============================================================

CREATE OR REPLACE FUNCTION refresh_state_stats(p_state_slug text)
RETURNS jsonb AS $$
DECLARE
  v_result jsonb := '{}'::jsonb;
  v_agency_count integer;
  v_email_count integer;
  v_valid_count integer;
BEGIN
  -- INVENTORY COUNTS
  SELECT COUNT(DISTINCT a.id)
  INTO v_agency_count
  FROM other_agencies a
  WHERE a.state_slug = p_state_slug AND a.is_active = true;

  SELECT COUNT(*)
  INTO v_email_count
  FROM other_agency_emails e
  JOIN other_agencies a ON e.agency_id = a.id
  WHERE a.state_slug = p_state_slug AND a.is_active = true;

  -- VERIFICATION VALID COUNT
  SELECT COUNT(*)
  INTO v_valid_count
  FROM other_agency_emails e
  JOIN other_agencies a ON e.agency_id = a.id
  WHERE a.state_slug = p_state_slug
    AND a.is_active = true
    AND e.validation_status = 'valid';

  -- Update/insert stats record
  INSERT INTO other_agencies_state_stats (
    state_slug,
    unique_agencies,
    total_imported_emails,
    verification_valid,
    updated_at
  ) VALUES (p_state_slug, v_agency_count, v_email_count, v_valid_count, now())
  ON CONFLICT (state_slug) DO UPDATE SET
    unique_agencies = v_agency_count,
    total_imported_emails = v_email_count,
    verification_valid = v_valid_count,
    updated_at = now();

  RETURN jsonb_build_object(
    'state_slug', p_state_slug,
    'unique_agencies', v_agency_count,
    'total_imported_emails', v_email_count,
    'verification_valid', v_valid_count
  );
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- PHASE 9: Create safe index additions for performance
-- ============================================================

-- Import tracking indexes
CREATE INDEX IF NOT EXISTS idx_other_agencies_import_job_id ON other_agencies(import_job_id);
CREATE INDEX IF NOT EXISTS idx_other_agency_emails_import_job_id ON other_agency_emails(import_job_id);

-- State-level aggregation indexes
CREATE INDEX IF NOT EXISTS idx_other_agencies_state_active ON other_agencies(state_slug, is_active);

-- Verification pipeline indexes
CREATE INDEX IF NOT EXISTS idx_other_agency_emails_validation_state ON other_agency_emails(validation_status, verification_state) 
  WHERE validation_status IN ('pending', 'unknown');

-- Performance: optimize common aggregation queries
CREATE INDEX IF NOT EXISTS idx_other_agency_emails_agency_state ON other_agency_emails(agency_id, validation_status);
