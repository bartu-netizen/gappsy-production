/*
  # Async Import Pipeline v2: Production-Safe Large-File Processing

  ## Summary
  Rebuilds large-file import architecture to safely handle 100k+ rows without
  compute resource failures. Uses real chunk persistence, server-side parsing,
  streaming storage, and true async orchestration.

  ## Key Changes
  1. Add payload_json field to store actual chunk data
  2. Add storage_path for fallback storage of large payloads
  3. Add retry_count and error_details for resilience
  4. Add chunk_status with detailed error tracking
  5. Add job-level counters for real-time progress
  6. Create job queue table for ordered processing
  
*/

-- ═══════════════════════════════════════════════════════════════════════════
-- PART 1: ENHANCE other_agencies_import_job_chunks WITH PAYLOAD STORAGE
-- ═══════════════════════════════════════════════════════════════════════════

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks' AND column_name = 'payload_json'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks ADD COLUMN payload_json JSONB DEFAULT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks' AND column_name = 'storage_path'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks ADD COLUMN storage_path TEXT DEFAULT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks' AND column_name = 'retry_count'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks ADD COLUMN retry_count INT DEFAULT 0;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks' AND column_name = 'error_details'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks ADD COLUMN error_details TEXT DEFAULT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks' AND column_name = 'processed_at'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks ADD COLUMN processed_at TIMESTAMPTZ DEFAULT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks' AND column_name = 'inserted_count'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks ADD COLUMN inserted_count INT DEFAULT 0;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks' AND column_name = 'updated_count'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks ADD COLUMN updated_count INT DEFAULT 0;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks' AND column_name = 'failed_count'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks ADD COLUMN failed_count INT DEFAULT 0;
  END IF;
END $$;

-- ═══════════════════════════════════════════════════════════════════════════
-- PART 2: ADD JOB-LEVEL COUNTERS FOR REAL-TIME PROGRESS
-- ═══════════════════════════════════════════════════════════════════════════

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'source_storage_path'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN source_storage_path TEXT DEFAULT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'source_file_type'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN source_file_type TEXT DEFAULT 'xlsx';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'total_inserted'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN total_inserted INT DEFAULT 0;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'total_updated'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN total_updated INT DEFAULT 0;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'total_failed'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN total_failed INT DEFAULT 0;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'finalized_at'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN finalized_at TIMESTAMPTZ DEFAULT NULL;
  END IF;
END $$;

-- ═══════════════════════════════════════════════════════════════════════════
-- PART 3: CREATE JOB QUEUE TABLE FOR ORDERED PROCESSING
-- ═══════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS other_agencies_import_queue (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid NOT NULL REFERENCES other_agencies_import_jobs(id) ON DELETE CASCADE,
  chunk_index INT NOT NULL,
  priority INT DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'processing', 'completed', 'failed')),
  attempted_at TIMESTAMPTZ DEFAULT NULL,
  completed_at TIMESTAMPTZ DEFAULT NULL,
  error_reason TEXT DEFAULT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_queue_job_chunk ON other_agencies_import_queue (job_id, chunk_index);
CREATE INDEX IF NOT EXISTS idx_queue_status ON other_agencies_import_queue (status);
CREATE INDEX IF NOT EXISTS idx_queue_priority ON other_agencies_import_queue (priority DESC, created_at ASC);

-- ═══════════════════════════════════════════════════════════════════════════
-- PART 4: UPDATE CHUNK STATUS CONSTRAINT
-- ═══════════════════════════════════════════════════════════════════════════

DO $$
BEGIN
  -- Alter the status check constraint if it exists
  ALTER TABLE other_agencies_import_job_chunks DROP CONSTRAINT IF EXISTS other_agencies_import_job_chunks_status_check;
  ALTER TABLE other_agencies_import_job_chunks ADD CONSTRAINT other_agencies_import_job_chunks_status_check
    CHECK (status IN ('pending', 'processing', 'completed', 'failed'));
EXCEPTION WHEN OTHERS THEN
  NULL;
END $$;

-- ═══════════════════════════════════════════════════════════════════════════
-- PART 5: ADD INDEXES FOR PERFORMANCE
-- ═══════════════════════════════════════════════════════════════════════════

CREATE INDEX IF NOT EXISTS idx_chunks_job_status ON other_agencies_import_job_chunks (job_id, status);
CREATE INDEX IF NOT EXISTS idx_chunks_processed ON other_agencies_import_job_chunks (job_id) WHERE status = 'completed';
CREATE INDEX IF NOT EXISTS idx_chunks_pending ON other_agencies_import_job_chunks (job_id) WHERE status = 'pending';
CREATE INDEX IF NOT EXISTS idx_jobs_status_created ON other_agencies_import_jobs (status, created_at DESC);
