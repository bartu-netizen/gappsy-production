#!/usr/bin/env node
// Reusable across every enrichment batch. Usage:
//   node scripts/bulk-import-500/3-apply-enrichment.mjs <batch-input.json> <output-sql-path>
//
// <batch-input.json> is an array of:
//   { tool_id, slug, name, enrichment: { short_description, pricing_model,
//     starting_price, founded_year, company_size, headquarters, languages,
//     long_form_blocks, features, pros, cons, faqs, use_cases,
//     pricing_plans, tags, seo_meta_description } }
//
// Writes one idempotent SQL file: updates the tools row (fills real,
// AI-drafted content — never fabricated stats — and flips status to
// published/noindex=false/sitemap_eligible=true), then inserts
// features/pros/cons/faqs/use_cases/pricing_plans/content_blocks/tag
// links. Every text value is dollar-quoted so apostrophes in real
// editorial prose never need manual escaping.
import { readFileSync, writeFileSync } from 'fs';

const [, , inputPath, outputPath] = process.argv;
if (!inputPath || !outputPath) {
  console.error('Usage: node 3-apply-enrichment.mjs <batch-input.json> <output-sql-path>');
  process.exit(1);
}

const TAG_IDS = {
  ai: 'c296bd6a-c865-41d7-8807-5dce653dd3f5',
  'no-code': '87a92d11-ee13-4164-9910-61410254388a',
  api: '96595ec7-e449-4fd5-803d-e73ba922c0ca',
  'web-app': '4137e3dc-5b54-4d6a-adfa-85ce8104e38f',
  ios: '5e4d4807-cae2-410c-9e7a-df0798a917cb',
  android: '7336153f-a26b-491c-b927-faf4f5a8d103',
  mac: 'f24fb236-dfcf-452c-9b9e-02926f4383d9',
  windows: '381992fc-7997-449c-9c68-511f0dce4b99',
  freemium: 'd5f794d8-1509-49c9-ac15-6834dce260e9',
  'free-trial': '610c2598-d057-4727-bf3b-e907b0daed7f',
  'free-plan': '326f20ae-646d-484a-96b8-335f75262ea9',
  templates: 'ee5576d4-5994-49f9-84c2-c9a84cc884f6',
  'self-hosted': 'efe7ced3-7cfa-4b39-9792-3427d24fa58d',
  'open-source': '97eb8f3e-e378-4a5d-b2a5-331706e86e50',
};

function dq(str) {
  if (str === null || str === undefined) return 'NULL';
  let tag = '$q$';
  let n = 0;
  while (String(str).includes(tag)) { n += 1; tag = `$q${n}$`; }
  return `${tag}${str}${tag}`;
}
function dqArray(arr) {
  if (!arr || arr.length === 0) return "'{}'";
  return `ARRAY[${arr.map((s) => dq(s)).join(', ')}]::text[]`;
}
function jsonb(value) {
  return `${dq(JSON.stringify(value))}::jsonb`;
}
function intOrNull(n) {
  return n === null || n === undefined ? 'NULL' : Number(n);
}

const batch = JSON.parse(readFileSync(inputPath, 'utf-8'));

let sql = `-- Enrichment batch: ${batch.map((b) => b.name).join(', ')}\n-- Publishes ${batch.length} bulk-imported tool(s) with full editorial content.\n\n`;

for (const item of batch) {
  const { tool_id, enrichment: e } = item;
  if (!tool_id || !e) throw new Error(`Malformed batch entry: ${JSON.stringify(item).slice(0, 200)}`);

  sql += `-- ── ${item.name} ──────────────────────────────────────────────\n`;
  sql += `UPDATE tools SET\n`;
  sql += `  short_description = ${dq(e.short_description)},\n`;
  sql += `  pricing_model = ${dq(e.pricing_model)},\n`;
  sql += `  starting_price = ${dq(e.starting_price)},\n`;
  sql += `  founded_year = ${intOrNull(e.founded_year)},\n`;
  sql += `  company_size = ${dq(e.company_size)},\n`;
  sql += `  headquarters = ${dq(e.headquarters)},\n`;
  sql += `  languages = ${dqArray(e.languages)},\n`;
  sql += `  seo_meta_description = ${dq(e.seo_meta_description)},\n`;
  sql += `  og_description = ${dq(e.seo_meta_description)},\n`;
  sql += `  status = 'published',\n`;
  sql += `  noindex = false,\n`;
  sql += `  sitemap_eligible = true,\n`;
  sql += `  published_at = COALESCE(published_at, now()),\n`;
  sql += `  updated_at = now()\n`;
  sql += `WHERE id = '${tool_id}';\n\n`;

  sql += `UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '${tool_id}' AND logo IS NULL AND website IS NOT NULL;\n\n`;

  (e.features || []).forEach((f, i) => {
    sql += `INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('${tool_id}', ${dq(f.title)}, ${dq(f.description)}, ${i});\n`;
  });
  sql += '\n';
  (e.pros || []).forEach((p, i) => { sql += `INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('${tool_id}', ${dq(p)}, ${i});\n`; });
  sql += '\n';
  (e.cons || []).forEach((c, i) => { sql += `INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('${tool_id}', ${dq(c)}, ${i});\n`; });
  sql += '\n';
  (e.faqs || []).forEach((f, i) => { sql += `INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('${tool_id}', ${dq(f.question)}, ${dq(f.answer)}, ${i});\n`; });
  sql += '\n';
  (e.use_cases || []).forEach((u, i) => { sql += `INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('${tool_id}', ${dq(u.title)}, ${dq(u.description)}, ${dq(u.audience)}, ${i});\n`; });
  sql += '\n';
  (e.pricing_plans || []).forEach((p, i) => {
    sql += `INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('${tool_id}', ${dq(p.plan_name)}, ${dq(p.price)}, ${dq(p.billing_cycle)}, ${jsonb(p.features || [])}, ${i});\n`;
  });
  sql += '\n';
  (e.long_form_blocks || []).forEach((b, i) => {
    sql += `INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('${tool_id}', ${dq(b.id)}, ${dq(b.heading)}, ${b.level || 2}, ${dqArray(b.paragraphs)}, ${i});\n`;
  });
  sql += '\n';
  for (const tag of (e.tags || [])) {
    const tagId = TAG_IDS[tag];
    if (!tagId) { console.warn(`  (skipping unknown tag "${tag}" for ${item.name})`); continue; }
    sql += `INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('${tool_id}', '${tagId}') ON CONFLICT DO NOTHING;\n`;
  }
  sql += '\n';
}

writeFileSync(outputPath, sql, 'utf-8');
console.log(`Wrote ${outputPath} (${sql.length} bytes, ${batch.length} tools)`);
