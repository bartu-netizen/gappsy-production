// Generic migration generator for the compact-format batches (11/12/13/10).
// Usage: node generate-sql.mjs <batchDir> <categorySnapshotPath> <importBatchLabel> <migrationOutPath>
// Reads <batchDir>/processed-results.json (written by process-batch.mjs).
// Idempotent (ON CONFLICT DO NOTHING). New tools land as
// status='needs_review', noindex=true, sitemap_eligible=false — invisible to
// the public site until a separate editorial-enrichment pass reviews and
// publishes them (same pattern as batch 6).
import { readFileSync, writeFileSync } from 'fs';
import { randomUUID } from 'crypto';

const [, , batchDir, categorySnapshotPath, importBatchLabel, outPath] = process.argv;
if (!batchDir || !categorySnapshotPath || !importBatchLabel || !outPath) {
  console.error('Usage: node generate-sql.mjs <batchDir> <categorySnapshotPath> <importBatchLabel> <migrationOutPath>');
  process.exit(1);
}

function dq(str) {
  if (str === null || str === undefined) return 'NULL';
  let tag = '$q$';
  let n = 0;
  while (String(str).includes(tag)) { n += 1; tag = `$q${n}$`; }
  return `${tag}${str}${tag}`;
}

const { newTools, duplicates } = JSON.parse(readFileSync(`${batchDir}/processed-results.json`, 'utf-8'));
const categories = JSON.parse(readFileSync(categorySnapshotPath, 'utf-8'));
const categoryIdBySlug = new Map(categories.map((c) => [c.slug, c.id]));

let sql = `-- Bulk import ${importBatchLabel}: ${newTools.length} new commercial-SaaS tools,\n`;
sql += `-- landed as status='needs_review', noindex=true, sitemap_eligible=false.\n`;
sql += `-- Invisible to the public site until a separate editorial-enrichment pass\n`;
sql += `-- reviews and publishes each one (same pattern as prior bulk-import batches).\n\n`;

const newToolIds = new Map();
for (const t of newTools) {
  const id = randomUUID();
  newToolIds.set(t.rank, id);
  const categoryId = categoryIdBySlug.get(t.categorySlug);
  if (!categoryId) throw new Error(`No category id for slug ${t.categorySlug} (tool ${t.name})`);

  sql += `INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)\n`;
  sql += `VALUES ('${id}', ${dq(t.requestedSlug)}, ${dq(t.name)}, ${dq(t.url)}, 'needs_review', 'bulk', true, false, false, false, 0, 0)\n`;
  sql += `ON CONFLICT (slug) DO NOTHING;\n`;
  sql += `INSERT INTO tool_category_links (tool_id, category_id, primary_category)\n`;
  sql += `SELECT '${id}', '${categoryId}', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '${id}')\n`;
  sql += `ON CONFLICT DO NOTHING;\n\n`;
}

sql += `\n-- Strategic metadata — one row per list entry (new tool or matched existing).\n`;
for (const t of newTools) {
  const id = newToolIds.get(t.rank);
  sql += `INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)\n`;
  sql += `SELECT '${id}', ${dq(t.categoryLabel)}, ${t.rank}, ${t.trafficScore}, ${t.seoScore}, ${t.paidListingScore}, ${dq(t.priorityTier)}, ${t.opportunityScore}, ${dq(importBatchLabel)} WHERE EXISTS (SELECT 1 FROM tools WHERE id = '${id}')\n`;
  sql += `ON CONFLICT (tool_id) DO NOTHING;\n`;
}
for (const d of duplicates) {
  if (!d.matchedExistingId) continue;
  sql += `INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)\n`;
  sql += `VALUES ('${d.matchedExistingId}', ${dq(d.categoryLabel)}, ${d.rank}, ${d.trafficScore}, ${d.seoScore}, ${d.paidListingScore}, ${dq(d.priorityTier)}, ${d.opportunityScore}, ${dq(importBatchLabel)})\n`;
  sql += `ON CONFLICT (tool_id) DO NOTHING;\n`;
}

writeFileSync(outPath, sql, 'utf-8');
console.log(`Wrote ${outPath} (${sql.length} bytes): ${newTools.length} new tool inserts`);

const manifest = newTools.map((t) => ({ rank: t.rank, id: newToolIds.get(t.rank), slug: t.requestedSlug, name: t.name, website: t.url, categorySlug: t.categorySlug }));
writeFileSync(`${batchDir}/new-tools-manifest.json`, JSON.stringify(manifest, null, 2), 'utf-8');
console.log(`Wrote ${batchDir}/new-tools-manifest.json`);
