/*
  # Enable pg_cron and Schedule Automatic Queue Worker

  ## Summary
  Enables the pg_cron extension and creates a scheduled job that automatically
  processes the email verification queue every 30 minutes.

  ## Changes

  ### 1. Enable pg_cron Extension
  - Enables pg_cron in the cron schema
  - Required for scheduled background jobs

  ### 2. Scheduled Job: mark_due_retries_as_queued
  - Runs every 30 minutes
  - Marks retry emails that are due as ready for processing
  - Updates verification_state to 'queued'

  ### 3. Tracking Table: cron_job_runs
  - Records when cron jobs run
  - Provides visibility into scheduled job execution

  ## Notes
  - Emails with validation_status = 'retry' are marked as queued when due
  - The actual ListClean API call happens via edge function
  - Queue worker can be triggered by: import, manual UI, or cron schedule
*/

-- Enable pg_cron extension
CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA cron;

-- Enable pg_net extension for HTTP calls
CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;

-- Grant usage
GRANT USAGE ON SCHEMA cron TO postgres;

-- Create a table to track cron job runs
CREATE TABLE IF NOT EXISTS cron_job_runs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  job_name TEXT NOT NULL,
  run_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  status TEXT NOT NULL DEFAULT 'triggered',
  result JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Enable RLS
ALTER TABLE cron_job_runs ENABLE ROW LEVEL SECURITY;

-- Index for recent runs
CREATE INDEX IF NOT EXISTS idx_cron_job_runs_job_name_run_at
ON cron_job_runs(job_name, run_at DESC);

-- Create function to mark due retries as queued
CREATE OR REPLACE FUNCTION mark_due_retries_as_queued()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_updated_count INT;
BEGIN
  -- Mark retry emails that are due as queued for processing
  WITH updated AS (
    UPDATE other_agency_emails
    SET verification_state = 'queued'
    WHERE validation_status IN ('retry', 'unknown_retry')
      AND verification_next_retry_at <= now()
      AND verification_attempt_count < 6
      AND verification_state = 'retry_scheduled'
    RETURNING id
  )
  SELECT COUNT(*) INTO v_updated_count FROM updated;

  -- Record that we ran
  INSERT INTO cron_job_runs (job_name, status, result)
  VALUES (
    'mark_due_retries',
    'completed',
    jsonb_build_object(
      'marked_at', now(),
      'emails_marked_queued', v_updated_count
    )
  );
END;
$$;

-- Create function to trigger queue worker via pg_net HTTP call
CREATE OR REPLACE FUNCTION trigger_queue_worker_http()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, extensions
AS $$
DECLARE
  v_supabase_url TEXT;
  v_service_role_key TEXT;
  v_request_id BIGINT;
BEGIN
  -- Get secrets from vault
  SELECT decrypted_secret INTO v_supabase_url
  FROM vault.decrypted_secrets
  WHERE name = 'supabase_url'
  LIMIT 1;

  SELECT decrypted_secret INTO v_service_role_key
  FROM vault.decrypted_secrets
  WHERE name = 'supabase_service_role_key'
  LIMIT 1;

  -- If secrets available, make HTTP call
  IF v_supabase_url IS NOT NULL AND v_service_role_key IS NOT NULL THEN
    SELECT extensions.http_post(
      v_supabase_url || '/functions/v1/other-agencies-listclean-process-queue',
      '{}'::text,
      'application/json',
      ARRAY[
        extensions.http_header('Authorization', 'Bearer ' || v_service_role_key)
      ]
    ) INTO v_request_id;

    INSERT INTO cron_job_runs (job_name, status, result)
    VALUES (
      'trigger_queue_worker',
      'triggered',
      jsonb_build_object('triggered_at', now(), 'request_id', v_request_id)
    );
  ELSE
    -- Fallback: just mark retries as queued, rely on next import to process
    PERFORM mark_due_retries_as_queued();
  END IF;
EXCEPTION WHEN OTHERS THEN
  -- Log error but don't fail
  INSERT INTO cron_job_runs (job_name, status, result)
  VALUES (
    'trigger_queue_worker',
    'error',
    jsonb_build_object('error', SQLERRM, 'attempted_at', now())
  );
END;
$$;

-- Schedule the retry marking job to run every 30 minutes
-- Using direct function call syntax
DO $$
BEGIN
  -- Remove existing job if it exists
  PERFORM cron.unschedule('mark-due-retries-for-verification');
EXCEPTION WHEN OTHERS THEN
  NULL; -- Job doesn't exist, ignore
END $$;

SELECT cron.schedule(
  'mark-due-retries-for-verification',
  '*/30 * * * *',
  'SELECT mark_due_retries_as_queued()'
);
