/*
  # Queue Health Tracking

  ## Summary
  Adds tracking for verification queue health to enable monitoring and diagnostics
  in the admin dashboard.

  ## Changes

  ### 1. New Table: verification_queue_runs
  - Tracks each queue worker run
  - Records selected/processed/matched/unmatched counts
  - Stores timing information
  - Enables queue health visibility

  ### 2. Security
  - RLS enabled
  - Only service role can insert
  - Admins can read via edge functions

  ## Notes
  - This provides visibility into queue health
  - Old runs can be pruned after 30 days
*/

-- Create queue runs tracking table
CREATE TABLE IF NOT EXISTS verification_queue_runs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  run_started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  run_completed_at TIMESTAMPTZ,
  duration_ms INT,
  
  -- Selection stats
  total_selected INT NOT NULL DEFAULT 0,
  unique_emails_submitted INT NOT NULL DEFAULT 0,
  duplicate_rows_collapsed INT NOT NULL DEFAULT 0,
  
  -- Processing stats
  processed INT NOT NULL DEFAULT 0,
  verified_valid INT NOT NULL DEFAULT 0,
  verified_invalid INT NOT NULL DEFAULT 0,
  scheduled_for_retry INT NOT NULL DEFAULT 0,
  finalized_unknown INT NOT NULL DEFAULT 0,
  failed INT NOT NULL DEFAULT 0,
  result_mismatch_count INT NOT NULL DEFAULT 0,
  
  -- ListClean stats
  listclean_batch_id TEXT,
  listclean_results_received INT,
  listclean_results_matched INT,
  listclean_results_unmatched INT,
  listclean_format TEXT, -- 'json' or 'csv'
  
  -- Status
  status TEXT NOT NULL DEFAULT 'running', -- running, completed, failed, paused
  error_message TEXT,
  
  -- Metadata
  triggered_by TEXT, -- 'auto', 'manual', 'import', 'cron'
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Enable RLS
ALTER TABLE verification_queue_runs ENABLE ROW LEVEL SECURITY;

-- Index for recent runs query
CREATE INDEX IF NOT EXISTS idx_verification_queue_runs_started_at 
ON verification_queue_runs(run_started_at DESC);

-- Index for status filtering
CREATE INDEX IF NOT EXISTS idx_verification_queue_runs_status 
ON verification_queue_runs(status);

-- Function to get queue health summary
CREATE OR REPLACE FUNCTION get_queue_health_summary()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_last_run RECORD;
  v_last_24h_stats RECORD;
  v_pending_count INT;
  v_retry_count INT;
BEGIN
  -- Get most recent run
  SELECT * INTO v_last_run
  FROM verification_queue_runs
  ORDER BY run_started_at DESC
  LIMIT 1;
  
  -- Get last 24 hours stats
  SELECT
    COUNT(*) as total_runs,
    SUM(processed) as total_processed,
    SUM(verified_valid) as total_valid,
    SUM(verified_invalid) as total_invalid,
    SUM(failed) as total_failed,
    SUM(result_mismatch_count) as total_mismatch
  INTO v_last_24h_stats
  FROM verification_queue_runs
  WHERE run_started_at > now() - interval '24 hours';
  
  -- Get current queue depth
  SELECT COUNT(*) INTO v_pending_count
  FROM other_agency_emails
  WHERE validation_status = 'pending';
  
  SELECT COUNT(*) INTO v_retry_count
  FROM other_agency_emails
  WHERE validation_status IN ('retry', 'unknown_retry')
    AND (verification_next_retry_at IS NULL OR verification_next_retry_at <= now());

  RETURN jsonb_build_object(
    'last_run', CASE WHEN v_last_run IS NOT NULL THEN jsonb_build_object(
      'id', v_last_run.id,
      'started_at', v_last_run.run_started_at,
      'completed_at', v_last_run.run_completed_at,
      'status', v_last_run.status,
      'selected', v_last_run.total_selected,
      'processed', v_last_run.processed,
      'valid', v_last_run.verified_valid,
      'invalid', v_last_run.verified_invalid,
      'retry', v_last_run.scheduled_for_retry,
      'failed', v_last_run.failed,
      'mismatch', v_last_run.result_mismatch_count,
      'triggered_by', v_last_run.triggered_by
    ) ELSE NULL END,
    'last_24h', jsonb_build_object(
      'total_runs', COALESCE(v_last_24h_stats.total_runs, 0),
      'total_processed', COALESCE(v_last_24h_stats.total_processed, 0),
      'total_valid', COALESCE(v_last_24h_stats.total_valid, 0),
      'total_invalid', COALESCE(v_last_24h_stats.total_invalid, 0),
      'total_failed', COALESCE(v_last_24h_stats.total_failed, 0),
      'total_mismatch', COALESCE(v_last_24h_stats.total_mismatch, 0)
    ),
    'queue_depth', jsonb_build_object(
      'pending', v_pending_count,
      'retry_due', v_retry_count
    )
  );
END;
$$;
