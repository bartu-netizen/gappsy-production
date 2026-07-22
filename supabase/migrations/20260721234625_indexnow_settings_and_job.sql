-- IndexNow: lets Bing/Yandex/Seznam/Naver crawl new/changed pages quickly
-- without relying on their own crawl scheduler discovering the sitemap.
-- Google does not consume IndexNow, so this is a Bing/Yandex-side win only
-- (see the Google Indexing API discussion for the Google-side equivalent,
-- deliberately out of scope here since it needs a new external credential).
--
-- Singleton row (id boolean PK, same pattern as crawl_settings) tracking
-- the watermark of the last successful submission, so each scheduler run
-- only resubmits tools/categories/comparisons whose updated_at is newer
-- than the last submission instead of resending the whole catalog every
-- tick.
CREATE TABLE IF NOT EXISTS indexnow_settings (
  id boolean PRIMARY KEY DEFAULT true CHECK (id = true),
  api_key text NOT NULL,
  last_submitted_at timestamptz,
  updated_at timestamptz NOT NULL DEFAULT now()
);

INSERT INTO indexnow_settings (id, api_key, last_submitted_at)
VALUES (true, '4449d930607a86915d05eccfed0be67f', NULL)
ON CONFLICT (id) DO NOTHING;

-- Hourly is frequent enough to notify Bing/Yandex of new content quickly
-- without hammering IndexNow's endpoint on every one-minute scheduler tick.
INSERT INTO scheduled_jobs (job_key, name, job_type, schedule_type, interval_seconds, enabled, next_run_at, config)
VALUES ('indexnow_submit', 'IndexNow Submit', 'indexnow_submit', 'interval', 3600, true, now(), '{}'::jsonb)
ON CONFLICT (job_key) DO NOTHING;
