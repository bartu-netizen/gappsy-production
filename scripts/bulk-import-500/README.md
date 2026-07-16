# Bulk 500-target import — 2026-07-16

Imports the 500 preselected software targets (50 Traffic Anchors, 300
Monetization Targets, 150 Emerging Opportunities) into the `tools` table as
structured, unreviewed stub records — no descriptions, pricing, ratings, or
company facts are fabricated. Content enrichment (long descriptions,
pricing, screenshots, comparisons, FAQs) is a deliberately separate,
later task.

## What actually happened

1. **`source-500-list.txt`** — the exact 500-line source list, verbatim.
2. **`existing-tools-snapshot.json`** — a full dump of every `tools` row
   (all statuses) at import time, used for duplicate detection.
3. **`1-process-import.mjs`** — parses the source list, cross-references
   each entry against the existing catalog by normalized slug OR normalized
   full URL (protocol/`www.`/trailing-slash stripped — NOT just root domain,
   so distinct sibling products under one company's domain, e.g. Microsoft
   365 vs. Microsoft Teams vs. Azure, are correctly treated as separate),
   and resolves each entry's category label to a real `tool_categories` slug
   (reusing an existing category wherever a reasonable match exists — the
   site already had a far more granular taxonomy than the source list's ~28
   labels, e.g. `ai-writing`, `ai-image-generation`, `crm`, `customer-support`
   already existed; only 4 genuinely new categories were needed). Output:
   `processed-results.json`, `category-ids-snapshot.json`.
4. **`2-generate-sql.mjs`** — turns that into the two migrations below.
   **Historical record — do not re-run against an already-imported
   database** (it mints fresh random UUIDs each run).
5. **`duplicate-report.md`** — every one of the 64 entries that matched an
   existing tool, and why.
6. **`new-tools-manifest.json`** — the 436 genuinely new tools, with the
   UUID each one actually got.
7. **`validate-import.mjs`** — read-only, safe to re-run anytime:
   `node scripts/bulk-import-500/validate-import.mjs`.

## Database changes (already applied to production)

- `supabase/migrations/20260716120000_20260716_bulk_500_import_schema.sql`
  — 4 new `tool_categories` rows (`documents-esignature`, `healthcare`,
  `field-service`, `retail-pos`) + a new `tool_strategic_metadata` table
  (tool_id, strategic_segment, traffic/seo/paid_listing scores, source
  category label, list rank, import batch). Admin/service-role only, no
  public SELECT policy — same convention as `tool_import_history`.
- `supabase/migrations/20260716130000_20260716_bulk_500_import_seed.sql`
  — 436 new `tools` rows (`status = 'needs_review'`, `source = 'bulk'`,
  `noindex = true`, `sitemap_eligible = false` — invisible to the public
  site and excluded from the sitemap/prerender pipeline until a human
  reviews and publishes them), their primary `tool_category_links`, and
  500 `tool_strategic_metadata` rows (436 for the new tools + 64 attached
  to the existing tools that matched, so the strategic signal on tools
  Gappsy already lists isn't discarded).
- `supabase/migrations/20260716140000_20260716_bulk_500_new_category_descriptions.sql`
  — a follow-up fix found by actually running `npm run build`: the 4 new
  categories had no `description`/`seo_description`, and this repo's
  category-page prerender **hard-fails the whole build** without one. Adds
  a real, generic (not tool-specific) one-sentence description + SEO
  description per new category, matching the exact style of every
  existing category row.

Both migrations are idempotent (`ON CONFLICT DO NOTHING` throughout,
keyed on `tools.slug` / `tool_categories.slug` / `tool_strategic_metadata.tool_id`)
— re-running either file is always safe.

## Results

- **500** list entries processed, **0** parse failures, **0** within-list
  slug collisions.
- **436** genuinely new tools created (`status = 'needs_review'`).
- **64** duplicates detected against the existing ~146-tool catalog and
  skipped — see `duplicate-report.md` for the full list and match reason
  (slug or URL) for each. Their strategic segment/scores were still
  recorded, attached to the existing tool.
- **4** new categories created; the other ~28 source-list category labels
  all mapped onto existing categories (see `1-process-import.mjs`'s
  `SIMPLE_LABEL_MAP` / `OVERRIDES` for the exact mapping and the per-tool
  overrides used for labels spanning more than one existing category,
  e.g. "Ecommerce & Website Builders" → `ecommerce` or `website-builders`
  depending on the specific tool).
- Segment breakdown of the 500: 50 traffic_anchor / 300 monetization_target
  / 150 emerging_opportunity — reconciles exactly with the source list.

## Testing locally

```bash
npm run dev
# visit /wp-admin/tools (or wherever the admin tool list lives) and filter
# by status=needs_review to see the 436 imported stubs
node scripts/bulk-import-500/validate-import.mjs
```

The 436 new tools are `needs_review` + `noindex` + not sitemap-eligible, so
they do **not** appear on any public page, the sitemap, or the prerendered
build output — confirmed via a live anon-key query returning zero rows for
`source = 'bulk'`, and via a full `npm run build`: still exactly **144**
prerendered tool pages (unchanged), **65** category pages (61 existing + the
4 new ones, now that they have real descriptions), **5** comparison pages,
`npm run lint`/`npm run typecheck` show only pre-existing issues in files
this task never touched, zero new failures.

## Not deployed

No `git push`, no Netlify deploy was performed for this task. The three
migrations were applied directly to the linked Supabase project (additive,
pre-approved per this repo's standing autonomous-execution policy — schema/
data changes to Supabase don't go through the Netlify frontend deploy
pipeline). The repo is otherwise untouched and ready for `npm run dev`
local testing.
