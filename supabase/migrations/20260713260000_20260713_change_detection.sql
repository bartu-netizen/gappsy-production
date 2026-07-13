/*
  # Change detection — bounded fingerprint tracking for published tools

  Additive-only. Tracks a small, bounded fingerprint per (tool, page_type)
  — never raw HTML — so a scheduled scan can tell "did anything worth a
  recrawl actually change" without re-running the full Crawl4AI pipeline
  on every tool, every day. See _shared/changeDetection.ts for the
  hashing/classification logic that populates and reads this table.

  1. tool_page_fingerprints — one row per (tool_id, page_type). Two
     fingerprint concepts, matching the spec's "content fingerprint" +
     "relevant extracted fingerprint":
       - content_fingerprint: a SHA-256 hash of the whole normalized page
         (cheap "did the bytes change at all" signal).
       - extracted_fingerprint: a small, page-type-specific structured
         extract (jsonb, always small — a handful of strings, never raw
         HTML) used to tell MEANINGFUL change from noise (a footer year
         changing hashes differently but extracts identically).
  2. change_detection_rules — configurable per-page-type thresholds
     (mirrors publishing_rules' pattern): how many changed structured
     items count as "critical," whether meaningful/critical changes queue
     a recrawl, and a failure-backoff ceiling.
*/

CREATE TABLE IF NOT EXISTS tool_page_fingerprints (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  page_type text NOT NULL CHECK (page_type IN (
    'homepage', 'pricing', 'features', 'integrations', 'docs', 'favicon', 'robots', 'sitemap'
  )),
  canonical_url text NOT NULL,

  content_fingerprint text,
  extracted_fingerprint jsonb NOT NULL DEFAULT '{}'::jsonb,
  http_status integer,
  http_metadata jsonb NOT NULL DEFAULT '{}'::jsonb,

  first_seen_at timestamptz NOT NULL DEFAULT now(),
  last_checked_at timestamptz NOT NULL DEFAULT now(),
  last_changed_at timestamptz,
  consecutive_failures integer NOT NULL DEFAULT 0,

  last_change_severity text NOT NULL DEFAULT 'no_change'
    CHECK (last_change_severity IN ('no_change', 'minor', 'meaningful', 'critical', 'unavailable')),
  last_change_evidence jsonb NOT NULL DEFAULT '{}'::jsonb,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  UNIQUE (tool_id, page_type)
);

CREATE INDEX IF NOT EXISTS idx_tool_page_fingerprints_due
  ON tool_page_fingerprints (last_checked_at);

CREATE INDEX IF NOT EXISTS idx_tool_page_fingerprints_tool
  ON tool_page_fingerprints (tool_id);

ALTER TABLE tool_page_fingerprints ENABLE ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS change_detection_rules (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  page_type text UNIQUE NOT NULL CHECK (page_type IN (
    'homepage', 'pricing', 'features', 'integrations', 'docs', 'favicon', 'robots', 'sitemap'
  )),
  min_changed_items_for_critical integer NOT NULL DEFAULT 3 CHECK (min_changed_items_for_critical >= 1),
  recrawl_on_meaningful boolean NOT NULL DEFAULT true,
  recrawl_on_critical boolean NOT NULL DEFAULT true,
  max_consecutive_failures_before_backoff integer NOT NULL DEFAULT 3 CHECK (max_consecutive_failures_before_backoff >= 1),
  enabled boolean NOT NULL DEFAULT true,
  updated_at timestamptz NOT NULL DEFAULT now(),
  updated_by text
);

ALTER TABLE change_detection_rules ENABLE ROW LEVEL SECURITY;

-- Pricing changes are the highest-stakes signal (a single price change is
-- worth a recrawl on its own) — lower critical threshold than the others.
INSERT INTO change_detection_rules (page_type, min_changed_items_for_critical, recrawl_on_meaningful, recrawl_on_critical) VALUES
  ('homepage', 2, true, true),
  ('pricing', 1, true, true),
  ('features', 3, true, true),
  ('integrations', 3, true, true),
  ('docs', 5, false, true),
  ('favicon', 1, false, true),
  ('robots', 1, true, true),
  ('sitemap', 1, false, true)
ON CONFLICT (page_type) DO NOTHING;
