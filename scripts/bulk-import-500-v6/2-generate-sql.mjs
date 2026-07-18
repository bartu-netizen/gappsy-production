// Generates the migrations for the v6 500-target bulk import (batch 6).
// Idempotent (ON CONFLICT DO NOTHING throughout) — safe to apply once;
// do not re-run after applying (mints fresh random UUIDs each time).
import { readFileSync, writeFileSync } from 'fs';
import { randomUUID } from 'crypto';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const SCRATCH = dirname(fileURLToPath(import.meta.url));
const MIGRATIONS = join(SCRATCH, '..', '..', 'supabase', 'migrations');

const { newTools, duplicates, newCategories } = JSON.parse(readFileSync(`${SCRATCH}/processed-results.json`, 'utf-8'));
const existingCategories = JSON.parse(readFileSync(`${SCRATCH}/category-ids-snapshot.json`, 'utf-8'));
const categoryIdBySlug = new Map(existingCategories.map((c) => [c.slug, c.id]));

const NEW_CATEGORIES_WITH_IDS = newCategories.map((c) => ({ ...c, id: randomUUID() }));
for (const c of NEW_CATEGORIES_WITH_IDS) categoryIdBySlug.set(c.slug, c.id);

function dq(str) {
  if (str === null || str === undefined) return 'NULL';
  let tag = '$q$';
  let n = 0;
  while (String(str).includes(tag)) { n += 1; tag = `$q${n}$`; }
  return `${tag}${str}${tag}`;
}

const IMPORT_BATCH = 'gappsy-500-2026-07-17-v6';

// ---------- Migration 1: 2 new categories (additive) ----------
let schemaSql = `-- Bulk import v6 (500 more preselected software targets, batch 6, heavy
-- Awesome-Selfhosted / open-source mix) — 2 genuinely new tool_categories
-- rows for clusters with no existing equivalent (game engines/servers/admin
-- panels, and IoT/home-automation platforms), each with enough real tools
-- in this manifest (28, 17 respectively) to justify a dedicated category.

`;
for (const c of NEW_CATEGORIES_WITH_IDS) {
  schemaSql += `INSERT INTO tool_categories (id, slug, name, status) VALUES ('${c.id}', ${dq(c.slug)}, ${dq(c.name)}, 'published') ON CONFLICT (slug) DO NOTHING;\n`;
}
writeFileSync(`${MIGRATIONS}/20260718200000_20260718_bulk_500_v6_categories.sql`, schemaSql, 'utf-8');
console.log('Wrote categories migration:', schemaSql.length, 'bytes');

// ---------- Migration 2: category descriptions (required by prerender build) ----------
const CATEGORY_DESCRIPTIONS = {
  'gaming': {
    description: 'Game engines, dedicated game servers, and admin/control panels for hosting, managing, and playing multiplayer and self-hosted games.',
    seo_description: 'Compare the best game servers, game engines, and hosting panels for multiplayer gaming.',
  },
  'iot': {
    description: 'Internet of Things and home automation platforms for controlling smart devices, sensors, and connected hardware.',
    seo_description: 'Compare the best IoT and home automation platforms for controlling smart devices and sensors.',
  },
};
let descSql = `-- Follow-up fix (same pattern as prior bulk-500 batches): the prerender
-- category-page build hard-fails without a description/seo_description on
-- every category row, so the 2 new categories from the companion migration
-- need one before the next build runs.
`;
for (const c of NEW_CATEGORIES_WITH_IDS) {
  const d = CATEGORY_DESCRIPTIONS[c.slug];
  descSql += `UPDATE tool_categories SET description = ${dq(d.description)}, seo_description = ${dq(d.seo_description)} WHERE slug = ${dq(c.slug)} AND description IS NULL;\n`;
}
writeFileSync(`${MIGRATIONS}/20260718201000_20260718_bulk_500_v6_category_descriptions.sql`, descSql, 'utf-8');
console.log('Wrote category descriptions migration:', descSql.length, 'bytes');

// ---------- Migration 3: seed data (new tools + category links + strategic metadata) ----------
let seedSql = `-- Data for the v6 500-target bulk import (batch 6, see 20260718200000 for
-- the companion new-categories migration). Idempotent: every INSERT is
-- ON CONFLICT DO NOTHING keyed on tools.slug or
-- tool_strategic_metadata.tool_id. New tools land as
-- status='needs_review', noindex=true, sitemap_eligible=false — invisible
-- to the public site until enrichment (Phase B) reviews and publishes them.

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
  if (!d.matchedExistingId) continue;
  seedSql += `INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)\n`;
  seedSql += `VALUES ('${d.matchedExistingId}', ${dq(d.categoryLabel)}, ${d.rank}, ${d.trafficScore}, ${d.seoScore}, ${d.paidListingScore}, ${dq(d.priorityTier)}, ${d.opportunityScore}, ${dq(IMPORT_BATCH)})\n`;
  seedSql += `ON CONFLICT (tool_id) DO NOTHING;\n`;
}

writeFileSync(`${MIGRATIONS}/20260718210000_20260718_bulk_500_v6_seed.sql`, seedSql, 'utf-8');
console.log('Wrote seed migration:', seedSql.length, 'bytes');
console.log(`  ${newTools.length} new tool inserts, ${newTools.length} category links, strategic metadata rows for all list entries with a resolved tool id`);

// ---------- Duplicate report ----------
let report = `# Bulk 500-import v6 (batch 6) duplicate report\n\nTotal list entries: 500\nGenuinely new tools imported: ${newTools.length}\nDuplicates matched against existing catalog (skipped): ${duplicates.length}\n\n## Duplicates\n\n| List # | Requested name | Requested slug | Matched existing tool | Existing slug | Match reason |\n|---|---|---|---|---|---|\n`;
for (const d of duplicates) {
  report += `| ${d.rank} | ${d.name} | ${d.requestedSlug} | ${d.matchedExistingName || '(within-list dup)'} | ${d.matchedExistingSlug || '-'} | ${d.matchReason} |\n`;
}
writeFileSync(`${SCRATCH}/duplicate-report.md`, report, 'utf-8');
console.log('Wrote duplicate-report.md');

// ---------- New tools manifest (drives Phase B enrichment) ----------
const newToolsManifest = newTools.map((t) => ({ rank: t.rank, id: newToolIds.get(t.rank), slug: t.requestedSlug, name: t.name, website: t.url, categorySlug: t.categorySlug }));
writeFileSync(`${SCRATCH}/new-tools-manifest.json`, JSON.stringify(newToolsManifest, null, 2), 'utf-8');
console.log('Wrote new-tools-manifest.json');
