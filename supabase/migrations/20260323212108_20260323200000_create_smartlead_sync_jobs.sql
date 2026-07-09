/*
  # Create smartlead_sync_jobs table

  ## Purpose
  Tracks background Smartlead inbox sync jobs that process campaigns in small,
  bounded chunks so no single HTTP request can time out.

  ## Architecture
  Instead of running one giant blocking sync, the frontend:
  1. Calls kickoff → gets a job_id immediately
  2. Calls tick(job_id) in a loop — each tick processes ONE page of leads from ONE campaign
  3. Polls status until done

  This completely eliminates the timeout that plagued the old `?action=pull` flow.

  ## New Tables
  - `smartlead_sync_jobs`
    - id (uuid pk)
    - status: queued | running | success | error
    - triggered_by: who started the job (manual / auto)
    - campaign_ids: jsonb array of campaign objects to process
    - cursor_campaign_index: which campaign we're currently processing
    - cursor_lead_offset: which lead page offset within the current campaign
    - campaigns_total, campaigns_processed, leads_processed,
      conversations_upserted, inbox_worthy_leads,
      message_histories_fetched, messages_inserted: progress counters
    - last_error: last error message if any
    - errors: jsonb array of recent error strings (capped at 50)
    - started_at, updated_at, completed_at, created_at

  ## Security
  - RLS enabled; no public policies (only accessible via service role in edge functions)
*/

CREATE TABLE IF NOT EXISTS smartlead_sync_jobs (
  id                        uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  status                    text        NOT NULL DEFAULT 'queued',
  triggered_by              text        NOT NULL DEFAULT 'manual',
  campaign_ids              jsonb       NOT NULL DEFAULT '[]',
  cursor_campaign_index     integer     NOT NULL DEFAULT 0,
  cursor_lead_offset        integer     NOT NULL DEFAULT 0,
  campaigns_total           integer     NOT NULL DEFAULT 0,
  campaigns_processed       integer     NOT NULL DEFAULT 0,
  leads_processed           integer     NOT NULL DEFAULT 0,
  conversations_upserted    integer     NOT NULL DEFAULT 0,
  inbox_worthy_leads        integer     NOT NULL DEFAULT 0,
  message_histories_fetched integer     NOT NULL DEFAULT 0,
  messages_inserted         integer     NOT NULL DEFAULT 0,
  last_error                text,
  errors                    jsonb       NOT NULL DEFAULT '[]',
  started_at                timestamptz NOT NULL DEFAULT now(),
  updated_at                timestamptz NOT NULL DEFAULT now(),
  completed_at              timestamptz,
  created_at                timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT smartlead_sync_jobs_status_check
    CHECK (status IN ('queued', 'running', 'success', 'error'))
);

CREATE INDEX IF NOT EXISTS idx_smartlead_sync_jobs_status
  ON smartlead_sync_jobs (status, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_smartlead_sync_jobs_created_at
  ON smartlead_sync_jobs (created_at DESC);

ALTER TABLE smartlead_sync_jobs ENABLE ROW LEVEL SECURITY;
