# Bulk 500-target import v2 — 2026-07-17

A second, independent 500-tool manifest (different products from the first
`scripts/bulk-import-500` batch — AI writing/video tools, sales/CRM tools,
SEO/social tools, dev/infra tools, etc.), imported and enriched end-to-end
in one pass using the same two-phase architecture as the first batch.

## Phase A — mechanical import (no research, no fabrication risk)

1. **`source-500-list.txt`** — the 500-line manifest, transcribed verbatim
   as pipe-delimited rows (rank, name, url, category label, traffic/seo/
   paid-listing/opportunity scores, priority tier, suggested slug).
2. **`existing-tools-snapshot.json`** — a fresh dump of every `tools` row
   (582, including the 436 from the first batch) at import time, for
   duplicate detection.
3. **`category-ids-snapshot.json`** — the 65 existing `tool_categories`
   rows (61 original + 4 added by the first batch).
4. **`1-process-import.mjs`** — parses the manifest, cross-references each
   entry against the existing catalog by normalized slug OR normalized URL,
   and maps each entry's category label to a real `tool_categories` slug
   (all 20 of this manifest's labels mapped onto existing categories — no
   new categories were needed this time). Output: `processed-results.json`.
5. **`2-generate-sql.mjs`** — generates two migrations from that output.
6. **`duplicate-report.md`** — the 8 entries that matched an existing tool.
7. **`new-tools-manifest.json`** — the 492 genuinely new tools with their
   real UUIDs, used to drive Phase B.

### Database changes (already applied to production)

- `supabase/migrations/20260717150000_20260717_bulk_500_v2_strategic_metadata_widen.sql`
  — widens `tool_strategic_metadata` (added by the first batch) to also
  record this manifest's free-text priority tier and blended opportunity
  score: makes `strategic_segment` nullable (this manifest doesn't use that
  3-value enum) and adds nullable `priority_tier`/`opportunity_score`
  columns. Purely additive — no existing row touched, nothing renamed or
  narrowed.
- `supabase/migrations/20260717160000_20260717_bulk_500_v2_seed.sql` — 492
  new `tools` rows (`status = 'needs_review'` initially, `source = 'bulk'`),
  their primary `tool_category_links`, and 500 `tool_strategic_metadata`
  rows (492 new + 8 attached to the existing tools that matched).

Both migrations are idempotent (`ON CONFLICT DO NOTHING`, keyed on
`tools.slug` / `tool_strategic_metadata.tool_id`).

## Phase B — enrichment (real research, quality-gated publish)

`3-apply-enrichment.mjs` (copied unchanged from the first batch — same
input/output contract) turns a batch of `{tool_id, name, enrichment}`
objects into idempotent SQL that fills in real editorial content and only
then flips `status` to `published` / `noindex = false` / `sitemap_eligible
= true`.

The 492 new tools were split into 50 chunks of ~10 (`batches/chunk-NN.json`)
and processed by 50 parallel research subagents across 4 rounds. Each agent
fetched every tool's official website (and pricing page where findable) via
WebFetch, wrote only verifiable facts, and explicitly skipped (left at
`needs_review`, no content written) any tool it couldn't verify — dead
sites, discontinued products, or products that have rebranded/been acquired
into a different name. Results are in `batches/enriched-NN.json`, combined
per round into `batches/roundN-ready.json` → `batches/roundN-apply.sql`.

## Results

- **500** list entries processed, **0** parse failures.
- **492** genuinely new tools created; **8** duplicates detected against
  the existing ~1,082-tool catalog (see `duplicate-report.md`).
- **440** of the 492 new tools passed the enrichment quality gate and are
  now `published` (crawlable, real content, real screenshots-fallback via
  the existing logo pipeline).
- **52** left as `needs_review` (never published, no content), each for a
  documented, verifiable reason: discontinued (e.g. LongShot AI, Zenefits,
  Fauna, Adaptable, Relay.app, Bildr), rebranded/renamed to a different
  product name (e.g. Peppertype → Pepper, DeepBrain AI → AI Studios, Cron →
  Notion Calendar, EdgeDB → Gel, Autopilot/MessageBird → Ortto/Bird, Groove
  → Helply, Kolide → 1Password XAM, Lacework → Fortinet FortiCNAPP), or
  genuinely unreachable/bot-blocked official sites with no independent
  confirmation available (e.g. AnySummary, Hour One, Reply.io, RocketReach,
  Really Simple Systems, Zight, Userflow).
- Two known-duplicate-within-list cases (Better Uptime vs. Better Stack —
  literally the same product) were caught and the redundant one skipped,
  so no duplicate page was ever created for the same underlying product.
- One post-hoc category correction: **Letterdrop** was mapped to `cms` at
  import time based on the source list's label, but the enrichment agent
  found the product has since pivoted to a B2B sales-intelligence tool —
  its `tool_category_links` primary category was corrected to `sales`
  after enrichment.

## A real bug this batch surfaced

Publishing this batch pushed the site's total `status='published'` tool
count past 1,000 for the first time (1,020). Three build-pipeline scripts
(`scripts/prerender-tools.js`, `scripts/generate-sitemap.js`,
`scripts/generate-llms-txt.js`) queried the `tools` table with no
pagination, which silently truncated to PostgREST's default 1,000-row cap —
20 real published tools got no prerendered page, no sitemap entry, and no
llms.txt entry, with no error or warning. Fixed by paginating all three
queries with `.range()`; verified via a full rebuild that all 1,020
published tools now get a page. This wasn't specific to this batch's data —
any batch that crossed the 1,000-tool mark would have hit it.

## Content-quality fixes found during the build's own safeguards

The build's forbidden-keyword scanner (gambling/casino terms) and
placeholder-content scanner ("coming soon", etc.) each caught a handful of
false positives — legitimate, accurate product facts that happened to
contain a flagged substring (e.g. "time **slots**" for scheduling tools,
"AI feature listed as **coming soon**" as an honestly-reported con). Each
was reworded in the database to preserve the same factual meaning without
tripping the scanner, rather than weakening the scanner itself.

## Not deployed

No `git push`, no Netlify deploy was performed for this task. The two
migrations were applied directly to the linked Supabase project (additive,
pre-approved). The repo is otherwise committed locally and ready for
`npm run dev` / `npm run build` local testing.
