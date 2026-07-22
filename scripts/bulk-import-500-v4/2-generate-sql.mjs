// Generates the migrations for the v4 500-target bulk import (batch 4).
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

const IMPORT_BATCH = 'gappsy-500-2026-07-17-v4';

// ---------- Migration 1: 3 new categories (additive) ----------
let schemaSql = `-- Bulk import v4 (500 more preselected software targets, batch 4, heavy
-- open-source/self-hosted mix) — 3 genuinely new tool_categories rows for
-- clusters with no existing equivalent (dedicated time-tracking apps,
-- self-hosted media/audio/streaming servers, and the AI infrastructure /
-- MLOps / observability tooling cluster), each with enough real tools in
-- this manifest (11, 23, 34 respectively) to justify a dedicated category.
-- Category descriptions match the style/length of existing category rows
-- (see the follow-up description migration below, mirroring the pattern
-- from the first bulk-500 batch that required this for the prerender build).

`;
for (const c of NEW_CATEGORIES_WITH_IDS) {
  schemaSql += `INSERT INTO tool_categories (id, slug, name, status) VALUES ('${c.id}', ${dq(c.slug)}, ${dq(c.name)}, 'published') ON CONFLICT (slug) DO NOTHING;\n`;
}
writeFileSync(`${MIGRATIONS}/20260718100000_20260718_bulk_500_v4_categories.sql`, schemaSql, 'utf-8');
console.log('Wrote categories migration:', schemaSql.length, 'bytes');

// ---------- Migration 2: category descriptions (required by prerender build) ----------
const CATEGORY_DESCRIPTIONS = {
  'time-tracking': {
    description: 'Time-tracking software for logging hours, monitoring productivity, and billing clients accurately.',
    seo_description: 'Compare the best time-tracking software for logging hours and monitoring team productivity.',
  },
  'media-tools': {
    description: 'Self-hosted media servers and audio/video production tools for streaming, editing, and managing photos, music, and video.',
    seo_description: 'Compare the best self-hosted media servers and audio/video tools for streaming and production.',
  },
  'ai-infrastructure': {
    description: 'AI infrastructure, MLOps, and observability tooling for training, deploying, monitoring, and serving machine learning and LLM applications.',
    seo_description: 'Compare the best AI infrastructure and MLOps tools for training, deploying, and monitoring ML models.',
  },
};
let descSql = `-- Follow-up fix (same pattern as prior bulk-500 batches): the prerender
-- category-page build hard-fails without a description/seo_description on
-- every category row, so the 3 new categories from the companion migration
-- need one before the next build runs.
`;
for (const c of NEW_CATEGORIES_WITH_IDS) {
  const d = CATEGORY_DESCRIPTIONS[c.slug];
  descSql += `UPDATE tool_categories SET description = ${dq(d.description)}, seo_description = ${dq(d.seo_description)} WHERE slug = ${dq(c.slug)} AND description IS NULL;\n`;
}
writeFileSync(`${MIGRATIONS}/20260718101000_20260718_bulk_500_v4_category_descriptions.sql`, descSql, 'utf-8');
console.log('Wrote category descriptions migration:', descSql.length, 'bytes');

// ---------- Migration 3: seed data (new tools + category links + strategic metadata) ----------
let seedSql = `-- Data for the v4 500-target bulk import (batch 4, see 20260718100000 for
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
  seedSql += `INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)\n`;
  seedSql += `VALUES ('${d.matchedExistingId}', ${dq(d.categoryLabel)}, ${d.rank}, ${d.trafficScore}, ${d.seoScore}, ${d.paidListingScore}, ${dq(d.priorityTier)}, ${d.opportunityScore}, ${dq(IMPORT_BATCH)})\n`;
  seedSql += `ON CONFLICT (tool_id) DO NOTHING;\n`;
}

writeFileSync(`${MIGRATIONS}/20260718110000_20260718_bulk_500_v4_seed.sql`, seedSql, 'utf-8');
console.log('Wrote seed migration:', seedSql.length, 'bytes');
console.log(`  ${newTools.length} new tool inserts, ${newTools.length} category links, ${newTools.length + duplicates.length} strategic metadata rows`);

// ---------- Duplicate report ----------
let report = `# Bulk 500-import v4 (batch 4) duplicate report\n\nTotal list entries: 500\nGenuinely new tools imported: ${newTools.length}\nDuplicates matched against existing catalog (skipped, metadata attached to existing tool): ${duplicates.length}\n\n## Duplicates\n\n| List # | Requested name | Requested slug | Matched existing tool | Existing slug | Match reason |\n|---|---|---|---|---|---|\n`;
for (const d of duplicates) {
  report += `| ${d.rank} | ${d.name} | ${d.requestedSlug} | ${d.matchedExistingName} | ${d.matchedExistingSlug} | ${d.matchReason} |\n`;
}
writeFileSync(`${SCRATCH}/duplicate-report.md`, report, 'utf-8');
console.log('Wrote duplicate-report.md');

// ---------- New tools manifest (drives Phase B enrichment) ----------
const newToolsManifest = newTools.map((t) => ({ rank: t.rank, id: newToolIds.get(t.rank), slug: t.requestedSlug, name: t.name, website: t.url, categorySlug: t.categorySlug }));
writeFileSync(`${SCRATCH}/new-tools-manifest.json`, JSON.stringify(newToolsManifest, null, 2), 'utf-8');
console.log('Wrote new-tools-manifest.json');
