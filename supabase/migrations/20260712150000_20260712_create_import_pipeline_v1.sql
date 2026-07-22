-- Software Import Pipeline (Phase 4): job-lifecycle scaffolding for
-- tool_import_history, plus an editorial-notes field on tools. Purely
-- additive, no scraping/AI wired up here — this is infrastructure a future
-- extraction engine plugs into.
--
-- 1. tool_import_history.status widens from ('pending','success','failed')
--    to also allow the full job lifecycle: queued, fetching, extracting,
--    review_required, ready, published, cancelled. Old values stay legal
--    (existing Phase 3 rows are untouched) — new rows going forward use the
--    richer vocabulary.
-- 2. tool_import_history gains progress (0-100), pages_processed, and
--    created_by (the admin's email, always derived server-side from the
--    verified session — never client-supplied).
-- 3. tools.editorial_notes — free-text, admin-only, never rendered on the
--    public site (no RLS change needed since it's just another column
--    behind the same existing publish-gated SELECT policy).

ALTER TABLE tool_import_history DROP CONSTRAINT IF EXISTS tool_import_history_status_check;
ALTER TABLE tool_import_history ADD CONSTRAINT tool_import_history_status_check
  CHECK (status IN (
    'pending', 'success', 'failed',
    'queued', 'fetching', 'extracting', 'review_required', 'ready', 'published', 'cancelled'
  ));

ALTER TABLE tool_import_history ADD COLUMN IF NOT EXISTS progress integer NOT NULL DEFAULT 100;
ALTER TABLE tool_import_history DROP CONSTRAINT IF EXISTS tool_import_history_progress_range;
ALTER TABLE tool_import_history ADD CONSTRAINT tool_import_history_progress_range
  CHECK (progress >= 0 AND progress <= 100);

ALTER TABLE tool_import_history ADD COLUMN IF NOT EXISTS pages_processed integer NOT NULL DEFAULT 0;
ALTER TABLE tool_import_history ADD COLUMN IF NOT EXISTS created_by text;

ALTER TABLE tools ADD COLUMN IF NOT EXISTS editorial_notes text;
