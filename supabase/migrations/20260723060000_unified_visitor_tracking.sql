/*
  # Unified visitor tracking

  Every existing analytics table (tool_page_views, tool_outbound_clicks,
  smart_search_logs, tool_chat_messages, vendor_onboarding_sessions,
  vendor_funnel_events) lives in its own silo with no shared identity, so a
  single visitor's journey (search -> tool page -> chat -> claim click ->
  payment funnel -> paid/dropped) can't be reconstructed today. All of them
  get the SAME visitor_id column added here — the existing, already-generic
  `gappsy_visitor_id` (src/utils/funnelTracking.ts's getVisitorId(), a
  crypto.randomUUID() persisted in localStorage) reused site-wide instead of
  inventing a second identity scheme.

  Also adds:
  - site_page_views: generic page-view + time-on-page logging for EVERY page
    (not just tool detail pages, which tool_page_views already covers) —
    the backbone of "which pages, how long".
  - 'claim_listing' / 'get_featured' as real tool_outbound_clicks.link_type
    values, so those specific CTA clicks are distinguishable from a generic
    "Visit Website" click.

  All additive — no column drops, no type narrowing, no data loss.
*/

CREATE TABLE IF NOT EXISTS site_page_views (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  visitor_id      text,
  path            text NOT NULL,
  referrer        text,
  utm_source      text,
  utm_medium      text,
  utm_campaign    text,
  ip_address      text,
  country_code    text,
  country_name    text,
  city            text,
  user_agent      text,
  duration_seconds integer,
  created_at      timestamptz NOT NULL DEFAULT now(),
  updated_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_site_page_views_visitor_created ON site_page_views (visitor_id, created_at);
CREATE INDEX IF NOT EXISTS idx_site_page_views_path_created ON site_page_views (path, created_at);
CREATE INDEX IF NOT EXISTS idx_site_page_views_created ON site_page_views (created_at);

ALTER TABLE site_page_views ENABLE ROW LEVEL SECURITY;
-- No policies — service-role only (track-site-page-view / admin-visitor-journey).

ALTER TABLE tool_page_views ADD COLUMN IF NOT EXISTS visitor_id text;
ALTER TABLE tool_page_views ADD COLUMN IF NOT EXISTS utm_source text;
ALTER TABLE tool_page_views ADD COLUMN IF NOT EXISTS utm_medium text;
ALTER TABLE tool_page_views ADD COLUMN IF NOT EXISTS utm_campaign text;
ALTER TABLE tool_page_views ADD COLUMN IF NOT EXISTS duration_seconds integer;
CREATE INDEX IF NOT EXISTS idx_tool_page_views_visitor ON tool_page_views (visitor_id, created_at);

ALTER TABLE tool_outbound_clicks ADD COLUMN IF NOT EXISTS visitor_id text;
CREATE INDEX IF NOT EXISTS idx_tool_outbound_clicks_visitor ON tool_outbound_clicks (visitor_id, created_at);

ALTER TABLE tool_outbound_clicks DROP CONSTRAINT IF EXISTS tool_outbound_clicks_link_type_check;
ALTER TABLE tool_outbound_clicks ADD CONSTRAINT tool_outbound_clicks_link_type_check
  CHECK (link_type IN ('visit_website', 'affiliate', 'other', 'claim_listing', 'get_featured'));

ALTER TABLE smart_search_logs ADD COLUMN IF NOT EXISTS visitor_id text;
CREATE INDEX IF NOT EXISTS idx_smart_search_logs_visitor ON smart_search_logs (visitor_id, created_at);

ALTER TABLE tool_chat_messages ADD COLUMN IF NOT EXISTS visitor_id text;
CREATE INDEX IF NOT EXISTS idx_tool_chat_messages_visitor ON tool_chat_messages (visitor_id, created_at);

ALTER TABLE vendor_onboarding_sessions ADD COLUMN IF NOT EXISTS visitor_id text;
CREATE INDEX IF NOT EXISTS idx_vendor_onboarding_sessions_visitor ON vendor_onboarding_sessions (visitor_id, created_at);

ALTER TABLE vendor_funnel_events ADD COLUMN IF NOT EXISTS visitor_id text;
CREATE INDEX IF NOT EXISTS idx_vendor_funnel_events_visitor ON vendor_funnel_events (visitor_id, created_at);
