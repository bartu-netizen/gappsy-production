/*
  # Add IP and location fields to funnel_events

  Adds visitor IP address, user agent, and optional geolocation fields to
  funnel_events so admin funnel intelligence can show "probably me" vs real
  visitor context without requiring external API calls.

  1. New columns (all nullable, no defaults — backwards compatible)
    - `ip_address` (text) — raw client IP from CF-Connecting-IP or X-Forwarded-For
    - `user_agent` (text) — browser user-agent string
    - `country` (text) — 2-letter country code if available from CF-IPCountry header
    - `city` (text) — city if provided by Cloudflare CDN headers
    - `region` (text) — region/state if provided by Cloudflare CDN headers

  2. Index
    - idx_funnel_events_ip_address for admin lookups by IP
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'ip_address'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN ip_address text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'user_agent'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN user_agent text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'country'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN country text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'city'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN city text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'region'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN region text;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_funnel_events_ip_address
  ON funnel_events (ip_address)
  WHERE ip_address IS NOT NULL;
