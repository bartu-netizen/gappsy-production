// Generates the two migrations for the v2 500-target bulk import.
// Idempotent (ON CONFLICT DO NOTHING throughout) — safe to apply once;
// do not re-run after applying (mints fresh random UUIDs each time).
import { readFileSync, writeFileSync } from 'fs';
import { randomUUID } from 'crypto';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const SCRATCH = dirname(fileURLToPath(import.meta.url));
const MIGRATIONS = join(SCRATCH, '..', '..', 'supabase', 'migrations');

const { newTools, duplicates } = JSON.parse(readFileSync(`${SCRATCH}/processed-results.json`, 'utf-8'));
const existingCategories = JSON.parse(readFileSync(`${SCRATCH}/category-ids-snapshot.json`, 'utf-8'));
const categoryIdBySlug = new Map(existingCategories.map((c) => [c.slug, c.id]));

function dq(str) {
  if (str === null || str === undefined) return 'NULL';
  let tag = '$q$';
  let n = 0;
  while (String(str).includes(tag)) { n += 1; tag = `$q${n}$`; }
  return `${tag}${str}${tag}`;
}

const IMPORT_BATCH = 'gappsy-500-2026-07-17-v2';

// ---------- Migration 1: widen tool_strategic_metadata (additive) ----------
// The prior 500-batch used a fixed 3-value strategic_segment enum
// (traffic_anchor/monetization_target/emerging_opportunity). This new
// manifest uses a different model (free-text priority tier + a single
// blended opportunity score) that doesn't fit that enum. Widening rather
// than replacing: strategic_segment becomes optional (NULL for v2 rows,
// unchanged for v1 rows), two new nullable columns capture the v2 fields.
// No existing row is touched, no column removed/renamed/narrowed.
const schemaSql = `-- Bulk import v2 (500 more preselected software targets) — widen
-- tool_strategic_metadata to also record the free-text priority tier and
-- blended opportunity score this manifest uses, without touching the
-- original strategic_segment enum used by the first 500-target batch.
ALTER TABLE tool_strategic_metadata ALTER COLUMN strategic_segment DROP NOT NULL;
ALTER TABLE tool_strategic_metadata ADD COLUMN IF NOT EXISTS priority_tier text;
ALTER TABLE tool_strategic_metadata ADD COLUMN IF NOT EXISTS opportunity_score numeric;
`;
writeFileSync(`${MIGRATIONS}/20260717150000_20260717_bulk_500_v2_strategic_metadata_widen.sql`, schemaSql, 'utf-8');
console.log('Wrote schema migration:', schemaSql.length, 'bytes');

// ---------- Migration 2: seed data ----------
let seedSql = `-- Data for the v2 500-target bulk import (see 20260717150000 for the
-- companion schema widening). Idempotent: every INSERT is ON CONFLICT DO
-- NOTHING keyed on tools.slug or tool_strategic_metadata.tool_id.
-- New tools land as status='needs_review', noindex=true,
-- sitemap_eligible=false — invisible to the public site until enrichment
-- (Phase B) reviews and publishes them.

`;

const newToolIds = new Map(); // rank -> generated uuid

for (const t of newTools) {
  const id = randomUUID();
  newToolIds.set(t.rank, id);
  seedSql += `INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)\n`;
  seedSql += `VALUES ('${id}', ${dq(t.requestedSlug)}, ${dq(t.name)}, ${dq(t.url)}, 'needs_review', 'bulk', true, false, false, false, 0, 0)\n`;
  seedSql += `ON CONFLICT (slug) DO NOTHING;\n`;

  const categoryId = categoryIdBySlug.get(t.categorySlug);
  if (!categoryId) throw new Error(`No category id resolved for slug ${t.categorySlug} (tool ${t.name})`);
  seedSql += `INSERT INTO tool_category_links (tool_id, category_id, primary_category)\n`;
  seedSql += `SELECT '${id}', '${categoryId}', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '${id}')\n`;
  seedSql += `ON CONFLICT DO NOTHING;\n\n`;
}

seedSql += `\n-- Strategic metadata — one row per list entry (new tool or matched existing).\n`;
for (const t of newTools) {
  const id = newToolIds.get(t.rank);
  seedSql += `INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)\n`;
  seedSql += `SELECT '${id}', ${dq(t.categoryLabel)}, ${t.rank}, ${t.trafficScore}, ${t.seoScore}, ${t.paidListingScore}, ${dq(t.priorityTier)}, ${t.opportunityScore}, ${dq(IMPORT_BATCH)} WHERE EXISTS (SELECT 1 FROM tools WHERE id = '${id}')\n`;
  seedSql += `ON CONFLICT (tool_id) DO NOTHING;\n`;
}
for (const d of duplicates) {
  seedSql += `INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)\n`;
  seedSql += `VALUES ('${d.matchedExistingId}', ${dq(d.categoryLabel)}, ${d.rank}, ${d.trafficScore}, ${d.seoScore}, ${d.paidListingScore}, ${dq(d.priorityTier)}, ${d.opportunityScore}, ${dq(IMPORT_BATCH)})\n`;
  seedSql += `ON CONFLICT (tool_id) DO NOTHING;\n`;
}

writeFileSync(`${MIGRATIONS}/20260717160000_20260717_bulk_500_v2_seed.sql`, seedSql, 'utf-8');
console.log('Wrote seed migration:', seedSql.length, 'bytes');
console.log(`  ${newTools.length} new tool inserts, ${newTools.length} category links, ${newTools.length + duplicates.length} strategic metadata rows`);

// ---------- Duplicate report ----------
let report = `# Bulk 500-import v2 duplicate report\n\nTotal list entries: 500\nGenuinely new tools imported: ${newTools.length}\nDuplicates matched against existing catalog (skipped, metadata attached to existing tool): ${duplicates.length}\n\n## Duplicates\n\n| List # | Requested name | Requested slug | Matched existing tool | Existing slug | Match reason |\n|---|---|---|---|---|---|\n`;
for (const d of duplicates) {
  report += `| ${d.rank} | ${d.name} | ${d.requestedSlug} | ${d.matchedExistingName} | ${d.matchedExistingSlug} | ${d.matchReason} |\n`;
}
writeFileSync(`${SCRATCH}/duplicate-report.md`, report, 'utf-8');
console.log('Wrote duplicate-report.md');

// ---------- New tools manifest (drives Phase B enrichment) ----------
const newToolsManifest = newTools.map((t) => ({ rank: t.rank, id: newToolIds.get(t.rank), slug: t.requestedSlug, name: t.name, website: t.url, categorySlug: t.categorySlug }));
writeFileSync(`${SCRATCH}/new-tools-manifest.json`, JSON.stringify(newToolsManifest, null, 2), 'utf-8');
console.log('Wrote new-tools-manifest.json');
