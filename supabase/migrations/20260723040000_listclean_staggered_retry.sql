-- Staggered ListClean retry delays for "unknown" results (tools
-- pipelines) — previously a "retry" result got reset to NULL and was
-- immediately eligible for resubmission on the very next tick (~5 min
-- later), which almost always just re-confirms the same "unknown" result
-- since nothing about the target mailserver changed in 5 minutes. Real
-- backoff (8h -> 16h -> 40h -> 72h) gives conditions an actual chance to
-- change between attempts, same spirit as the marketing-agencies
-- pipeline's own next_retry_at concept (other-agencies-listclean-
-- process-queue), just staggered instead of one fixed 48h delay.
ALTER TABLE tool_contact_emails
  ADD COLUMN IF NOT EXISTS listclean_next_retry_at timestamptz;

ALTER TABLE discovered_tool_contact_emails
  ADD COLUMN IF NOT EXISTS listclean_next_retry_at timestamptz;

CREATE INDEX IF NOT EXISTS tool_contact_emails_listclean_retry_idx
  ON tool_contact_emails (listclean_next_retry_at)
  WHERE listclean_status IS NULL;

CREATE INDEX IF NOT EXISTS discovered_tool_contact_emails_listclean_retry_idx
  ON discovered_tool_contact_emails (listclean_next_retry_at)
  WHERE listclean_status IS NULL;
