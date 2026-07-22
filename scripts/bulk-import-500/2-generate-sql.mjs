// HISTORICAL RECORD — this generated the two 20260716* migrations already
// applied to production. Re-running it would mint fresh random UUIDs and
// overwrite those files with a DIFFERENT (but structurally identical)
// migration, out of sync with what's actually in the database — don't
// re-run this against an already-imported database. Kept for audit: this
// is exactly how tool_strategic_metadata's tool_id values were derived.
import { readFileSync, writeFileSync } from 'fs';
import { randomUUID } from 'crypto';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const SCRATCH = dirname(fileURLToPath(import.meta.url));
const MIGRATIONS = join(SCRATCH, '..', '..', 'supabase', 'migrations');

const { newTools, duplicates } = JSON.parse(readFileSync(`${SCRATCH}/processed-results.json`, 'utf-8'));
const existingCategories = JSON.parse(readFileSync(`${SCRATCH}/category-ids-snapshot.json`, 'utf-8'));
const categoryIdBySlug = new Map(existingCategories.map((c) => [c.slug, c.id]));

const NEW_CATEGORIES = [
  { slug: 'documents-esignature', name: 'Documents & E-signature', id: randomUUID() },
  { slug: 'healthcare', name: 'Healthcare & Wellness', id: randomUUID() },
  { slug: 'field-service', name: 'Real Estate, Construction & Field Service', id: randomUUID() },
  { slug: 'retail-pos', name: 'Retail, Restaurant & POS', id: randomUUID() },
];
for (const c of NEW_CATEGORIES) categoryIdBySlug.set(c.slug, c.id);

function dq(str) {
  if (str === null || str === undefined) return 'NULL';
  let tag = '$q$';
  let n = 0;
  while (String(str).includes(tag)) { n += 1; tag = `$q${n}$`; }
  return `${tag}${str}${tag}`;
}

// ---------- Migration 1: schema (new categories + tool_strategic_metadata table) ----------
let schemaSql = `-- Bulk import of 500 preselected software targets (monetization-first list:
-- 50 Traffic Anchors, 300 Monetization Targets, 150 Emerging Opportunities).
-- Fully additive: 4 new tool_categories rows for labels with no existing
-- equivalent, plus a new tool_strategic_metadata table to record each
-- tool's strategic segment and traffic/SEO/paid-listing scores from this
-- list without touching any existing tools column.

`;
for (const c of NEW_CATEGORIES) {
  schemaSql += `INSERT INTO tool_categories (id, slug, name, status) VALUES ('${c.id}', ${dq(c.slug)}, ${dq(c.name)}, 'published') ON CONFLICT (slug) DO NOTHING;\n`;
}
schemaSql += `
-- One row per tool that appeared on the 500-target list — for genuinely
-- new tools, tool_id points at the new draft/needs_review row created in
-- the companion seed migration; for names that matched an EXISTING tool
-- (see the duplicate report), tool_id points at that existing tool instead,
-- so the strategic signal isn't just discarded. Admin-only: no public SELECT
-- policy, matching the tool_import_history convention for internal-only data.
CREATE TABLE IF NOT EXISTS tool_strategic_metadata (
  id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id             uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE UNIQUE,
  strategic_segment   text NOT NULL CHECK (strategic_segment IN ('traffic_anchor', 'monetization_target', 'emerging_opportunity')),
  traffic_score       smallint NOT NULL CHECK (traffic_score BETWEEN 0 AND 10),
  seo_score           smallint NOT NULL CHECK (seo_score BETWEEN 0 AND 10),
  paid_listing_score  smallint NOT NULL CHECK (paid_listing_score BETWEEN 0 AND 10),
  source_category_label text,
  list_rank           integer,
  import_batch        text NOT NULL DEFAULT 'gappsy-500-2026-07',
  created_at          timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_strategic_metadata_segment ON tool_strategic_metadata (strategic_segment);

ALTER TABLE tool_strategic_metadata ENABLE ROW LEVEL SECURITY;
-- Deliberately no policies: admin/service-role only, same convention as
-- tool_import_history.
`;

writeFileSync(`${MIGRATIONS}/20260716120000_20260716_bulk_500_import_schema.sql`, schemaSql, 'utf-8');
console.log('Wrote schema migration:', schemaSql.length, 'bytes');

// ---------- Migration 2: seed data (new tools + category links + strategic metadata) ----------
let seedSql = `-- Data for the 500-target bulk import (see 20260716120000 for schema).
-- Idempotent: every INSERT below is ON CONFLICT DO NOTHING keyed on the
-- natural unique constraint (tools.slug, or tool_strategic_metadata.tool_id).
-- Re-running this file is always safe.

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

seedSql += `\n-- Strategic metadata — one row per list entry, whether it became a new\n-- tool above or matched an existing one (see the duplicate report).\n`;
for (const t of newTools) {
  const id = newToolIds.get(t.rank);
  seedSql += `INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)\n`;
  seedSql += `SELECT '${id}', ${dq(t.segment)}, ${t.trafficScore}, ${t.seoScore}, ${t.paidListingScore}, ${dq(t.categoryLabel)}, ${t.rank} WHERE EXISTS (SELECT 1 FROM tools WHERE id = '${id}')\n`;
  seedSql += `ON CONFLICT (tool_id) DO NOTHING;\n`;
}
for (const d of duplicates) {
  seedSql += `INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)\n`;
  seedSql += `VALUES ('${d.matchedExistingId}', ${dq(d.segment)}, ${d.trafficScore}, ${d.seoScore}, ${d.paidListingScore}, ${dq(d.categoryLabel)}, ${d.rank})\n`;
  seedSql += `ON CONFLICT (tool_id) DO NOTHING;\n`;
}

writeFileSync(`${MIGRATIONS}/20260716130000_20260716_bulk_500_import_seed.sql`, seedSql, 'utf-8');
console.log('Wrote seed migration:', seedSql.length, 'bytes');
console.log(`  ${newTools.length} new tool inserts, ${newTools.length} category links, ${newTools.length + duplicates.length} strategic metadata rows`);

// ---------- Duplicate report ----------
let report = `# Bulk 500-import duplicate report\n\nTotal list entries: 500\nGenuinely new tools imported: ${newTools.length}\nDuplicates matched against existing catalog (skipped, metadata attached to existing tool): ${duplicates.length}\n\n## Duplicates\n\n| List # | Requested name | Requested slug | Matched existing tool | Existing slug | Match reason |\n|---|---|---|---|---|---|\n`;
for (const d of duplicates) {
  report += `| ${d.rank} | ${d.name} | ${d.requestedSlug} | ${d.matchedExistingName} | ${d.matchedExistingSlug} | ${d.matchReason} |\n`;
}
writeFileSync(`${SCRATCH}/duplicate-report.md`, report, 'utf-8');
console.log('Wrote duplicate-report.md');

// ---------- New tools list (for the validation script + final summary) ----------
const newToolsManifest = newTools.map((t) => ({ rank: t.rank, id: newToolIds.get(t.rank), slug: t.requestedSlug, name: t.name, categorySlug: t.categorySlug, segment: t.segment }));
writeFileSync(`${SCRATCH}/new-tools-manifest.json`, JSON.stringify(newToolsManifest, null, 2), 'utf-8');
console.log('Wrote new-tools-manifest.json');
