-- Adds real geo data to smart_search_logs so admins can see which
-- city/country a query came from, not just its raw IP. Mirrors the same
-- Netlify context.geo relay pattern already used for
-- tool_page_views/tool_outbound_clicks (see netlify/edge-functions/
-- track-event.js) — no external geo-IP service, no extra cost.
ALTER TABLE smart_search_logs ADD COLUMN IF NOT EXISTS city text;
ALTER TABLE smart_search_logs ADD COLUMN IF NOT EXISTS country_code text;
ALTER TABLE smart_search_logs ADD COLUMN IF NOT EXISTS country_name text;
