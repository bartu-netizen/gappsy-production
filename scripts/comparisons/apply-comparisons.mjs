#!/usr/bin/env node
// Reusable across every comparison batch. Usage:
//   node scripts/comparisons/apply-comparisons.mjs <batch-input.json> <output-sql-path>
//
// <batch-input.json> is an array of:
//   { slug, tool_a_id, tool_a_slug, tool_a_name, tool_b_id, tool_b_slug,
//     tool_b_name, content: ToolComparisonContent }
//
// For each item: writes src/data/comparisonContent/{slug}.ts, then
// regenerates src/data/comparisonContent/index.ts from every file present
// in that directory (idempotent — safe to re-run). Also writes one SQL
// file that inserts the tool_comparisons row (published) and the
// tool_comparison_links quick-compare rows for both tools, all
// idempotent (ON CONFLICT / WHERE NOT EXISTS).
import { readFileSync, writeFileSync, readdirSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..');
const CONTENT_DIR = join(REPO_ROOT, 'src', 'data', 'comparisonContent');

const [, , inputPath, outputSqlPath] = process.argv;
if (!inputPath || !outputSqlPath) {
  console.error('Usage: node apply-comparisons.mjs <batch-input.json> <output-sql-path>');
  process.exit(1);
}

function dq(str) {
  if (str === null || str === undefined) return 'NULL';
  let tag = '$q$';
  let n = 0;
  while (String(str).includes(tag)) { n += 1; tag = `$q${n}$`; }
  return `${tag}${str}${tag}`;
}

function slugToVarName(slug) {
  const parts = slug.split('-');
  const camel = parts.map((p, i) => (i === 0 ? p : p.charAt(0).toUpperCase() + p.slice(1))).join('');
  return `${camel}Content`;
}

const batch = JSON.parse(readFileSync(inputPath, 'utf-8'));

let sql = `-- Comparison batch: ${batch.map((b) => b.slug).join(', ')}\n-- Publishes ${batch.length} comparison page(s) with editorial content.\n\n`;

for (const item of batch) {
  const { slug, tool_a_id, tool_a_name, tool_b_id, tool_b_name, content } = item;
  if (!slug || !tool_a_id || !tool_b_id || !content) {
    throw new Error(`Malformed batch entry: ${JSON.stringify(item).slice(0, 200)}`);
  }

  // 1. Write the content TS file.
  const varName = slugToVarName(slug);
  const filePath = join(CONTENT_DIR, `${slug}.ts`);
  const ts = `import type { ToolComparisonContent } from './types';\n\nconst ${varName}: ToolComparisonContent = ${JSON.stringify(content, null, 2)};\n\nexport default ${varName};\n`;
  writeFileSync(filePath, ts, 'utf-8');

  // 2. SQL: tool_comparisons row (published).
  sql += `-- ── ${tool_a_name} vs ${tool_b_name} (${slug}) ──────────────────────────────────────────────\n`;
  sql += `INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)\n`;
  sql += `VALUES ('${tool_a_id}', '${tool_b_id}', ${dq(slug)}, 'published')\n`;
  sql += `ON CONFLICT (slug) DO NOTHING;\n\n`;

  // 3. SQL: tool_comparison_links, both directions, idempotent.
  sql += `INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)\n`;
  sql += `SELECT '${tool_a_id}', ${dq(`vs ${tool_b_name}`)}, ${dq(`/compare/${slug}`)}, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '${tool_a_id}'), 0)\n`;
  sql += `WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '${tool_a_id}' AND href = ${dq(`/compare/${slug}`)});\n\n`;

  sql += `INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)\n`;
  sql += `SELECT '${tool_b_id}', ${dq(`vs ${tool_a_name}`)}, ${dq(`/compare/${slug}`)}, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '${tool_b_id}'), 0)\n`;
  sql += `WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '${tool_b_id}' AND href = ${dq(`/compare/${slug}`)});\n\n`;
}

writeFileSync(outputSqlPath, sql, 'utf-8');
console.log(`Wrote ${outputSqlPath} (${sql.length} bytes, ${batch.length} comparisons)`);

// 4. Regenerate index.ts from every content file present (idempotent).
const files = readdirSync(CONTENT_DIR)
  .filter((f) => f.endsWith('.ts') && f !== 'types.ts' && f !== 'index.ts')
  .map((f) => f.replace(/\.ts$/, ''))
  .sort();

let indexTs = `import type { ToolComparisonContent } from './types';\n`;
for (const slug of files) {
  indexTs += `import ${slugToVarName(slug)} from './${slug}';\n`;
}
indexTs += `\n// Registry of per-comparison editorial content, keyed by canonical slug.\n`;
indexTs += `// A published tool_comparisons row with no entry here still renders on\n`;
indexTs += `// /compare/:slug using DB-sourced facts only — this is purely additive.\n`;
indexTs += `const COMPARISON_CONTENT: Record<string, ToolComparisonContent> = {\n`;
for (const slug of files) {
  indexTs += `  '${slug}': ${slugToVarName(slug)},\n`;
}
indexTs += `};\n\n`;
indexTs += `export function getComparisonContent(slug: string): ToolComparisonContent | undefined {\n`;
indexTs += `  return COMPARISON_CONTENT[slug];\n`;
indexTs += `}\n\n`;
indexTs += `export type { ToolComparisonContent, ComparisonDifference, ComparisonFAQ } from './types';\n`;

writeFileSync(join(CONTENT_DIR, 'index.ts'), indexTs, 'utf-8');
console.log(`Regenerated index.ts (${files.length} comparisons registered)`);
