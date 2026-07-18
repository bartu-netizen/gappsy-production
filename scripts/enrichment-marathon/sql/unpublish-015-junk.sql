-- '015' (send.fudaoyuan.icu) was published from an earlier bulk import with a
-- description that doesn't match reality: live verification during the
-- enrichment marathon pilot found the site is a bare, unbranded React app
-- shell (just "File"/"Text" text, no product name, no functioning content) —
-- a parked/dev/test deployment on a throwaway .icu domain, not a real product.
UPDATE tools SET
  status = 'needs_review',
  noindex = true,
  sitemap_eligible = false,
  updated_at = now()
WHERE slug = '015';
