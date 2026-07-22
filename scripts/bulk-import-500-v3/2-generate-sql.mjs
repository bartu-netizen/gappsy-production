// Generates the migrations for the v3 500-target bulk import (batch 3).
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

const IMPORT_BATCH = 'gappsy-500-2026-07-17-v3';

// ---------- Migration 1: 5 new categories (additive) ----------
let schemaSql = `-- Bulk import v3 (500 more preselected software targets, batch 3) —
-- 5 genuinely new tool_categories rows for labels with no existing
-- equivalent (ERP suites, procurement/spend management, reputation
-- management, community forum platforms, podcast hosting), each with
-- enough real tools in this manifest to justify a dedicated category.
-- Category descriptions match the style/length of existing category rows
-- (see the follow-up description migration below, mirroring the pattern
-- from the first bulk-500 batch that required this for the prerender build).

`;
for (const c of NEW_CATEGORIES_WITH_IDS) {
  schemaSql += `INSERT INTO tool_categories (id, slug, name, status) VALUES ('${c.id}', ${dq(c.slug)}, ${dq(c.name)}, 'published') ON CONFLICT (slug) DO NOTHING;\n`;
}
writeFileSync(`${MIGRATIONS}/20260717180000_20260717_bulk_500_v3_categories.sql`, schemaSql, 'utf-8');
console.log('Wrote categories migration:', schemaSql.length, 'bytes');

// ---------- Migration 2: category descriptions (required by prerender build) ----------
const CATEGORY_DESCRIPTIONS = {
  'erp': {
    description: 'ERP and business-management platforms that unify accounting, inventory, manufacturing, and operations in one system.',
    seo_description: 'Compare the best ERP and business-management software for unifying accounting, inventory, and operations.',
  },
  'procurement': {
    description: 'Procurement and spend-management software for purchase orders, vendor management, and SaaS spend control.',
    seo_description: 'Compare the best procurement and spend-management tools for purchase orders and vendor management.',
  },
  'reputation-management': {
    description: 'Reputation-management platforms for monitoring, collecting, and responding to online customer reviews.',
    seo_description: 'Compare the best reputation-management software for monitoring and responding to customer reviews.',
  },
  'community': {
    description: 'Community platforms for hosting branded discussion forums, member spaces, and customer communities.',
    seo_description: 'Compare the best community platforms for hosting branded forums and member communities.',
  },
  'podcast-hosting': {
    description: 'Podcast hosting platforms for publishing, distributing, and monetizing podcast episodes across listening apps.',
    seo_description: 'Compare the best podcast hosting platforms for publishing and distributing episodes.',
  },
};
let descSql = `-- Follow-up fix (same pattern as the first bulk-500 batch): the prerender
-- category-page build hard-fails without a description/seo_description on
-- every category row, so the 5 new categories from the companion migration
-- need one before the next build runs.
`;
for (const c of NEW_CATEGORIES_WITH_IDS) {
  const d = CATEGORY_DESCRIPTIONS[c.slug];
  descSql += `UPDATE tool_categories SET description = ${dq(d.description)}, seo_description = ${dq(d.seo_description)} WHERE slug = ${dq(c.slug)} AND description IS NULL;\n`;
}
writeFileSync(`${MIGRATIONS}/20260717181000_20260717_bulk_500_v3_category_descriptions.sql`, descSql, 'utf-8');
console.log('Wrote category descriptions migration:', descSql.length, 'bytes');

// ---------- Migration 3: seed data (new tools + category links + strategic metadata) ----------
let seedSql = `-- Data for the v3 500-target bulk import (batch 3, see 20260717180000 for
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

writeFileSync(`${MIGRATIONS}/20260717190000_20260717_bulk_500_v3_seed.sql`, seedSql, 'utf-8');
console.log('Wrote seed migration:', seedSql.length, 'bytes');
console.log(`  ${newTools.length} new tool inserts, ${newTools.length} category links, ${newTools.length + duplicates.length} strategic metadata rows`);

// ---------- Duplicate report ----------
let report = `# Bulk 500-import v3 (batch 3) duplicate report\n\nTotal list entries: 500\nGenuinely new tools imported: ${newTools.length}\nDuplicates matched against existing catalog (skipped, metadata attached to existing tool): ${duplicates.length}\n\n## Duplicates\n\n| List # | Requested name | Requested slug | Matched existing tool | Existing slug | Match reason |\n|---|---|---|---|---|---|\n`;
for (const d of duplicates) {
  report += `| ${d.rank} | ${d.name} | ${d.requestedSlug} | ${d.matchedExistingName} | ${d.matchedExistingSlug} | ${d.matchReason} |\n`;
}
writeFileSync(`${SCRATCH}/duplicate-report.md`, report, 'utf-8');
console.log('Wrote duplicate-report.md');

// ---------- New tools manifest (drives Phase B enrichment) ----------
const newToolsManifest = newTools.map((t) => ({ rank: t.rank, id: newToolIds.get(t.rank), slug: t.requestedSlug, name: t.name, website: t.url, categorySlug: t.categorySlug }));
writeFileSync(`${SCRATCH}/new-tools-manifest.json`, JSON.stringify(newToolsManifest, null, 2), 'utf-8');
console.log('Wrote new-tools-manifest.json');
