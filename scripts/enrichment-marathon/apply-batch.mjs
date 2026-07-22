#!/usr/bin/env node
// Generalized enrichment-apply for the full-catalog marathon. Unlike the
// batch-6-era 3-apply-enrichment.mjs (which only ever ran once per tool),
// this is safe to re-run for a tool that already has partial content:
// child-row tables are cleared for that tool_id before the fresh set is
// inserted (no duplicate/conflicting rows), and scalar tools columns use
// COALESCE so a blank/omitted field never clobbers existing real data.
//
// Usage: node apply-batch.mjs <batch-input.json> <output-sql-path>
//
// <batch-input.json>: array of
//   { tool_id, slug, name, enrichment: { short_description, pricing_model,
//     starting_price, founded_year, company_size, headquarters, languages,
//     seo_title, seo_meta_description, llm_readable_summary,
//     long_form_blocks, features, pros, cons, faqs, use_cases,
//     pricing_plans, tags, publish } }
//
// `publish: true` flips a needs_review tool to published (only set this when
// the tool now has real short_description + at least a few features/faqs —
// the calling agent decides, this script just trusts the flag). Every text
// value is dollar-quoted.
import { readFileSync, writeFileSync } from 'fs';

const [, , inputPath, outputPath] = process.argv;
if (!inputPath || !outputPath) {
  console.error('Usage: node apply-batch.mjs <batch-input.json> <output-sql-path>');
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
function intOrNull(n) { return n === null || n === undefined ? 'NULL' : Number(n); }

// Guard against the build's own placeholder-content scanner
// (scripts/verify-seo-tools.mjs PLACEHOLDER_PATTERNS) so a bad batch never
// reaches `npm run build` and fails the whole thing after the fact.
const PLACEHOLDER_PATTERNS = [/lorem ipsum/i, /\bplaceholder\b/i, /\bcoming soon\b/i, /\btodo\b/i];
function checkPlaceholder(text, where) {
  if (!text) return;
  for (const p of PLACEHOLDER_PATTERNS) {
    if (p.test(text)) throw new Error(`Placeholder pattern ${p} matched in ${where}: "${text.slice(0, 120)}"`);
  }
}

const batch = JSON.parse(readFileSync(inputPath, 'utf-8'));

let sql = `-- Enrichment marathon batch: ${batch.map((b) => b.name).join(', ')}\n\n`;

for (const item of batch) {
  const { tool_id, enrichment: e, name } = item;
  if (!tool_id || !e) throw new Error(`Malformed batch entry: ${JSON.stringify(item).slice(0, 200)}`);

  checkPlaceholder(e.short_description, `${name}.short_description`);
  checkPlaceholder(e.seo_meta_description, `${name}.seo_meta_description`);
  checkPlaceholder(e.seo_title, `${name}.seo_title`);
  (e.long_form_blocks || []).forEach((b) => (b.paragraphs || []).forEach((p) => checkPlaceholder(p, `${name}.content_block[${b.id}]`)));
  (e.faqs || []).forEach((f) => checkPlaceholder(f.answer, `${name}.faq`));

  sql += `-- ── ${name} ──────────────────────────────────────────────\n`;
  sql += `UPDATE tools SET\n`;
  sql += `  short_description = COALESCE(${dq(e.short_description)}, short_description),\n`;
  sql += `  pricing_model = COALESCE(${dq(e.pricing_model)}, pricing_model),\n`;
  sql += `  starting_price = COALESCE(${dq(e.starting_price)}, starting_price),\n`;
  sql += `  founded_year = COALESCE(${intOrNull(e.founded_year)}, founded_year),\n`;
  sql += `  company_size = COALESCE(${dq(e.company_size)}, company_size),\n`;
  sql += `  headquarters = COALESCE(${dq(e.headquarters)}, headquarters),\n`;
  if (e.languages && e.languages.length) sql += `  languages = ${dqArray(e.languages)},\n`;
  sql += `  seo_title = COALESCE(${dq(e.seo_title)}, seo_title),\n`;
  sql += `  seo_meta_description = COALESCE(${dq(e.seo_meta_description)}, seo_meta_description),\n`;
  sql += `  llm_readable_summary = COALESCE(${dq(e.llm_readable_summary)}, llm_readable_summary),\n`;
  if (e.publish) {
    sql += `  status = 'published',\n`;
    sql += `  noindex = false,\n`;
    sql += `  sitemap_eligible = true,\n`;
    sql += `  published_at = COALESCE(published_at, now()),\n`;
  }
  sql += `  updated_at = now()\n`;
  sql += `WHERE id = '${tool_id}';\n\n`;

  sql += `UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '${tool_id}' AND logo IS NULL AND website IS NOT NULL;\n\n`;

  // Idempotent: clear this tool's rows for each child table before
  // inserting the fresh set, so re-running a batch (e.g. after fixing one
  // tool's content) never duplicates or conflicts with prior rows.
  if (e.features?.length) {
    sql += `DELETE FROM tool_features WHERE tool_id = '${tool_id}';\n`;
    e.features.forEach((f, i) => checkPlaceholder(f.description, `${name}.feature[${i}]`));
    e.features.forEach((f, i) => { sql += `INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('${tool_id}', ${dq(f.title)}, ${dq(f.description)}, ${i});\n`; });
    sql += '\n';
  }
  if (e.pros?.length) {
    sql += `DELETE FROM tool_pros WHERE tool_id = '${tool_id}';\n`;
    e.pros.forEach((p, i) => { sql += `INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('${tool_id}', ${dq(p)}, ${i});\n`; });
    sql += '\n';
  }
  if (e.cons?.length) {
    sql += `DELETE FROM tool_cons WHERE tool_id = '${tool_id}';\n`;
    e.cons.forEach((c, i) => { sql += `INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('${tool_id}', ${dq(c)}, ${i});\n`; });
    sql += '\n';
  }
  if (e.faqs?.length) {
    sql += `DELETE FROM tool_faqs WHERE tool_id = '${tool_id}';\n`;
    e.faqs.forEach((f, i) => { sql += `INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('${tool_id}', ${dq(f.question)}, ${dq(f.answer)}, ${i}, 'published');\n`; });
    sql += '\n';
  }
  if (e.use_cases?.length) {
    sql += `DELETE FROM tool_use_cases WHERE tool_id = '${tool_id}';\n`;
    e.use_cases.forEach((u, i) => { sql += `INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('${tool_id}', ${dq(u.title)}, ${dq(u.description)}, ${dq(u.audience)}, ${i});\n`; });
    sql += '\n';
  }
  if (e.pricing_plans?.length) {
    sql += `DELETE FROM tool_pricing_plans WHERE tool_id = '${tool_id}';\n`;
    e.pricing_plans.forEach((p, i) => {
      const featuresJson = JSON.stringify(p.features || []);
      sql += `INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('${tool_id}', ${dq(p.plan_name)}, ${dq(p.price)}, ${dq(p.billing_cycle)}, ${dq(p.description || null)}, ${dq(featuresJson)}::jsonb, ${i});\n`;
    });
    sql += '\n';
  }
  if (e.long_form_blocks?.length) {
    sql += `DELETE FROM tool_content_blocks WHERE tool_id = '${tool_id}';\n`;
    e.long_form_blocks.forEach((b, i) => {
      const paragraphsArr = dqArray(b.paragraphs || []);
      sql += `INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('${tool_id}', ${dq(b.id)}, ${dq(b.heading)}, ${intOrNull(b.level || 2)}, ${paragraphsArr}, ${i});\n`;
    });
    sql += '\n';
  }
  if (e.tags?.length) {
    for (const tagSlug of e.tags) {
      const tagId = TAG_IDS[tagSlug];
      if (!tagId) { console.warn(`  WARN: unknown tag "${tagSlug}" for ${name}, skipping`); continue; }
      sql += `INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('${tool_id}', '${tagId}') ON CONFLICT DO NOTHING;\n`;
    }
    sql += '\n';
  }
}

writeFileSync(outputPath, sql, 'utf-8');
console.log(`Wrote ${outputPath} (${sql.length} bytes) for ${batch.length} tools`);
