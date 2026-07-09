/*
  # Add location columns to manage_funnel_events

  1. Modified Tables
    - `manage_funnel_events`
      - `country` (text) — Cloudflare CF-IPCountry header value
      - `city` (text) — Cloudflare CF-IPCity header value
      - `region` (text) — Cloudflare CF-Region header value

  2. Notes
    - Existing `request_ip` and `user_agent` columns are preserved unchanged
    - New columns are nullable — old rows will have NULL values
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'manage_funnel_events' AND column_name = 'country'
  ) THEN
    ALTER TABLE manage_funnel_events ADD COLUMN country text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'manage_funnel_events' AND column_name = 'city'
  ) THEN
    ALTER TABLE manage_funnel_events ADD COLUMN city text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'manage_funnel_events' AND column_name = 'region'
  ) THEN
    ALTER TABLE manage_funnel_events ADD COLUMN region text;
  END IF;
END $$;
