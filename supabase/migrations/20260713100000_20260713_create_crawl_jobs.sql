-- Crawl integration: Approved For Crawl -> Crawl4AI -> reviewable draft.
-- Fully additive. One job per discovery candidate; app-layer enforces at
-- most one active job at a time for this phase (see admin-crawl-jobs).
--
-- Raw Crawl4AI output is NOT stored unbounded: raw_extraction_ref holds a
-- size-capped, explicitly-truncated snapshot (see _shared/crawlExtractionAdapter.ts
-- RAW_SNAPSHOT_MAX_BYTES). The full structured result the review UI reads is
-- normalized_extraction, produced by the CrawlProvider adapter — never a
-- direct dependency on Crawl4AI's raw response shape.

CREATE TABLE IF NOT EXISTS crawl_jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  discovery_candidate_id uuid NOT NULL REFERENCES discovered_tools(id) ON DELETE CASCADE,

  requested_url text NOT NULL,
  normalized_url text,

  status text NOT NULL DEFAULT 'queued' CHECK (status IN (
    'queued', 'starting', 'crawling', 'extracting',
    'completed', 'failed', 'cancelled', 'needs_review'
  )),
  progress integer NOT NULL DEFAULT 0 CHECK (progress >= 0 AND progress <= 100),

  started_at timestamptz,
  completed_at timestamptz,
  duration_ms integer,
  retry_count integer NOT NULL DEFAULT 0,

  -- error_code is a short machine-readable enum-ish string (e.g.
  -- 'gateway_unreachable', 'timeout', 'invalid_url', 'private_ip_blocked').
  -- error_message is always a sanitized, safe-for-browser string — never a
  -- raw exception/stack trace (enforced by the edge functions, not by DB).
  error_code text,
  error_message text,

  crawl4ai_version text,
  discovered_pages integer NOT NULL DEFAULT 0,
  crawled_pages integer NOT NULL DEFAULT 0,
  source_urls jsonb NOT NULL DEFAULT '[]'::jsonb,

  raw_extraction_ref jsonb,
  normalized_extraction jsonb,
  review_state jsonb NOT NULL DEFAULT '{}'::jsonb,

  created_draft_tool_id uuid REFERENCES tools(id) ON DELETE SET NULL,

  created_by text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS crawl_jobs_discovery_candidate_idx ON crawl_jobs (discovery_candidate_id);
CREATE INDEX IF NOT EXISTS crawl_jobs_status_idx ON crawl_jobs (status);
CREATE INDEX IF NOT EXISTS crawl_jobs_created_at_idx ON crawl_jobs (created_at);
CREATE INDEX IF NOT EXISTS crawl_jobs_created_draft_tool_idx ON crawl_jobs (created_draft_tool_id);

-- One-active-job-per-candidate is enforced in the admin-crawl-jobs edge
-- function (clear, retryable error) rather than a DB constraint, since the
-- "max 1 active" rule is a Phase-3 product limit for this MVP, not a
-- permanent schema invariant — bulk crawling later relaxes it without a
-- migration.

ALTER TABLE crawl_jobs ENABLE ROW LEVEL SECURITY;
-- No policies — admin/service-role only, same pattern as discovered_tools,
-- discovery_import_batches, and tool_import_history. Never exposed to
-- public/anon clients.
