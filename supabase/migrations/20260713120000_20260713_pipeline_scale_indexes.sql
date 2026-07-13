/*
  # Pipeline scale hardening: indexes + dedup/race-condition constraints

  Additive-only migration produced by a Principal Engineer review of the
  Discovery -> Crawl -> Extraction -> Normalization -> Tool Draft -> AI Queue
  pipeline, targeting correctness and query performance at 100,000+ tools /
  millions of crawl + enrichment jobs.

  1. discovered_tools
     - Composite indexes for the admin Discovery Queue's actual sort/filter
       query (status + quality_score / confidence_score / updated_at), which
       previously only had single-column indexes and would force a full sort
       of the filtered set at scale.
     - Unique index on official_website (exact URL) so two concurrent
       ingests of the exact same URL can no longer both win the
       check-then-insert race in discoveryIngest.ts — the loser now gets a
       normal unique-violation the app already needs to treat as "duplicate".
       Deliberately NOT on hostname: hostname is a shared registrable
       domain by design for multi-tenant hosts (github.com, npmjs.com, ...)
       and legitimately repeats across distinct real tools.

  2. crawl_jobs
     - Composite (status, created_at) index for the "next queued job"
       dequeue query and the admin queue list view, replacing two
       independently-useless single-column indexes at high row counts.
     - Partial unique index enforcing at most one non-terminal crawl job per
       discovery candidate at the database level (previously only enforced
       by an application-level count-then-insert check, which races).

  3. enrichment_jobs
     - Composite (status, created_at) index for queue polling, mirroring the
       crawl_jobs fix above.

  4. tools
     - Trigram index on slug to support the admin search's
       `.or('name.ilike...,slug.ilike...')` pattern, which previously only
       had a trigram index on name and fell back to a sequential scan for
       the slug half of that OR.
*/

-- 1. discovered_tools ------------------------------------------------------

CREATE INDEX IF NOT EXISTS discovered_tools_status_quality_idx
  ON discovered_tools (status, quality_score DESC);

CREATE INDEX IF NOT EXISTS discovered_tools_status_confidence_idx
  ON discovered_tools (status, confidence_score DESC);

CREATE INDEX IF NOT EXISTS discovered_tools_status_updated_at_idx
  ON discovered_tools (status, updated_at DESC);

CREATE UNIQUE INDEX IF NOT EXISTS discovered_tools_official_website_unique_idx
  ON discovered_tools (official_website);

-- 2. crawl_jobs --------------------------------------------------------------

CREATE INDEX IF NOT EXISTS crawl_jobs_status_created_at_idx
  ON crawl_jobs (status, created_at);

CREATE UNIQUE INDEX IF NOT EXISTS crawl_jobs_one_active_per_candidate_idx
  ON crawl_jobs (discovery_candidate_id)
  WHERE status IN ('queued', 'starting', 'crawling', 'extracting', 'needs_review');

-- 3. enrichment_jobs ----------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_enrichment_jobs_status_created_at
  ON enrichment_jobs (status, created_at);

-- 4. tools ---------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_tools_slug_trgm
  ON tools USING gin (slug gin_trgm_ops);
