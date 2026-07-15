/*
  Tool page view + outbound click tracking — fully additive.

  Per-event logging (not just counters), matching the existing convention
  in this repo for analytics-style tables (vendor_funnel_events, audit
  logs): every page view and every outbound click ("Visit Website" etc.)
  gets its own row with IP/country/user-agent/timestamp, so /wp-admin can
  show real breakdowns (by day, by country) rather than only a running
  total. Country comes from Netlify Edge Functions' built-in context.geo
  (see netlify/edge-functions/track-event.js) — no external geo-IP service.

  RLS: both tables are service-role only (no anon/authenticated policies),
  same pattern as every other tracking table in this repo — the public
  ingest edge function (track-tool-event) uses the service-role key, the
  browser never talks to these tables directly.
*/

CREATE TABLE IF NOT EXISTS tool_page_views (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id       uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  ip_address    text,
  country_code  text,
  country_name  text,
  user_agent    text,
  referrer      text,
  created_at    timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_page_views_tool_created ON tool_page_views (tool_id, created_at);
CREATE INDEX IF NOT EXISTS idx_tool_page_views_created ON tool_page_views (created_at);

ALTER TABLE tool_page_views ENABLE ROW LEVEL SECURITY;
-- No policies — service-role only (track-tool-event / admin-tool-analytics).

CREATE TABLE IF NOT EXISTS tool_outbound_clicks (
  id               uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id          uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  link_type        text NOT NULL DEFAULT 'visit_website' CHECK (link_type IN ('visit_website', 'affiliate', 'other')),
  destination_url  text,
  ip_address       text,
  country_code     text,
  country_name     text,
  user_agent       text,
  referrer         text,
  created_at       timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_outbound_clicks_tool_created ON tool_outbound_clicks (tool_id, created_at);
CREATE INDEX IF NOT EXISTS idx_tool_outbound_clicks_created ON tool_outbound_clicks (created_at);

ALTER TABLE tool_outbound_clicks ENABLE ROW LEVEL SECURITY;
-- No policies — service-role only.
