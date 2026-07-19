/*
  Homepage "smart search" — logging + rate limiting for the new AI query
  router (smart-search-route edge function) that replaces the old
  state-only search bar. One row per query, same "per-event table, count
  via SQL" convention as tool_chat_messages / tool_page_views.

  RLS: service-role only — the browser never talks to this table
  directly, only through smart-search-route (service-role).
*/

CREATE TABLE IF NOT EXISTS smart_search_logs (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id    text NOT NULL,
  query         text NOT NULL,
  result_type   text,
  result_path   text,
  ip_address    text,
  created_at    timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_smart_search_logs_session ON smart_search_logs (session_id, created_at);
CREATE INDEX IF NOT EXISTS idx_smart_search_logs_ip_created ON smart_search_logs (ip_address, created_at);

ALTER TABLE smart_search_logs ENABLE ROW LEVEL SECURITY;
-- No policies — service-role only (smart-search-route edge function).
