/*
  # Real homepage screenshot capture

  Additive. crawlRunner.ts now calls Crawl4AI's dedicated /screenshot
  endpoint (via crawler-gateway/server.js) alongside the normal /crawl
  call, uploads the resulting PNG to the existing tool-media Storage
  bucket, and stores the public URL here — a genuine rendered-page image,
  distinct from crawlExtractionAdapter.ts's screenshot_candidates (which
  is only a filename/alt-text guess over scraped <img> tags). Null
  whenever the gateway's screenshot call failed/timed out/came back
  oversized; never blocks or fails the crawl itself.

  crawlDraftCreation.ts reads this column and, when present, attaches it
  as the first (sort_order 0) row in the new draft's screenshots array,
  ahead of any filename-guessed candidates.
*/

ALTER TABLE crawl_jobs ADD COLUMN IF NOT EXISTS homepage_screenshot_url text;
