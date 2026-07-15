/*
  "Ask Gappsy" AI chat — message logging + rate limiting, fully additive.

  Every user + assistant message gets a row (not just a counter) so admin
  can review real conversations later (quality checks, cost monitoring,
  spotting bad prompts) and so the ask-gappsy edge function can enforce a
  sliding-window rate limit per session without any external service —
  same "per-event table, count via SQL" convention as tool_page_views /
  tool_outbound_clicks.

  tool_id is nullable: populated for tool-page conversations, null for the
  homepage's directory-wide chat. session_id is a client-generated opaque
  id (not tied to any account — this chat has no auth requirement), used
  both to group a conversation's messages and as the rate-limit key.

  RLS: service-role only, same as every other tracking table in this repo —
  the browser never talks to this table directly, only through
  ask-gappsy (service-role) and admin-ask-gappsy-log (admin-gated).
*/

CREATE TABLE IF NOT EXISTS tool_chat_messages (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id  text NOT NULL,
  tool_id     uuid REFERENCES tools(id) ON DELETE CASCADE,
  role        text NOT NULL CHECK (role IN ('user', 'assistant')),
  content     text NOT NULL,
  ip_address  text,
  created_at  timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_chat_messages_session ON tool_chat_messages (session_id, created_at);
CREATE INDEX IF NOT EXISTS idx_tool_chat_messages_tool ON tool_chat_messages (tool_id, created_at);
CREATE INDEX IF NOT EXISTS idx_tool_chat_messages_ip_created ON tool_chat_messages (ip_address, created_at);

ALTER TABLE tool_chat_messages ENABLE ROW LEVEL SECURITY;
-- No policies — service-role only (ask-gappsy edge function).
