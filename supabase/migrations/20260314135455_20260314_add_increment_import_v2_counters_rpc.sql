/*
  # V2 Import — Atomic counter increment RPC

  Adds a single function to atomically increment all job counters in one call.
  Called by each worker chunk after it finishes processing rows.
  Avoids read-modify-write races when multiple chunks complete concurrently.
*/

CREATE OR REPLACE FUNCTION increment_import_v2_counters(
  p_job_id uuid,
  p_agencies_created integer DEFAULT 0,
  p_agencies_updated integer DEFAULT 0,
  p_emails_added integer DEFAULT 0,
  p_errors_count integer DEFAULT 0
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE other_agencies_import_jobs_v2
  SET
    agencies_created  = agencies_created  + p_agencies_created,
    agencies_updated  = agencies_updated  + p_agencies_updated,
    emails_added      = emails_added      + p_emails_added,
    errors_count      = errors_count      + p_errors_count,
    chunks_processed  = chunks_processed  + 1,
    updated_at        = now()
  WHERE id = p_job_id;
END;
$$;
