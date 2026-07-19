#!/usr/bin/env node
// Reusable across every roundup batch. Usage:
//   node scripts/roundups/apply-roundups.mjs <batch-input.json> <output-sql-path>
//
// <batch-input.json> is an array of:
//   { slug, title, tools: [{ tool_id, slug, name, best_for? }, ...] (exactly 3+),
//     content: RoundupContent }
//
// For each item: writes src/data/roundupContent/{slug}.ts, then regenerates
// src/data/roundupContent/index.ts from every file present in that
// directory (idempotent — safe to re-run). Also writes one SQL file that
// inserts the tool_roundups row (published) and the tool_roundup_members
// rows for every tool, all idempotent (ON CONFLICT / subquery-scoped).
import { readFileSync, writeFileSync, readdirSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..');
const CONTENT_DIR = join(REPO_ROOT, 'src', 'data', 'roundupContent');

const [, , inputPath, outputSqlPath] = process.argv;
if (!inputPath || !outputSqlPath) {
  console.error('Usage: node apply-roundups.mjs <batch-input.json> <output-sql-path>');
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
  const safe = /^[0-9]/.test(camel) ? `_${camel}` : camel;
  return `${safe}Content`;
}

const batch = JSON.parse(readFileSync(inputPath, 'utf-8'));

let sql = `-- Roundup batch: ${batch.map((b) => b.slug).join(', ')}\n-- Publishes ${batch.length} roundup page(s) with editorial content.\n\n`;

for (const item of batch) {
  const { slug, title, tools, content } = item;
  if (!slug || !title || !Array.isArray(tools) || tools.length < 3 || !content) {
    throw new Error(`Malformed batch entry: ${JSON.stringify(item).slice(0, 200)}`);
  }

  // 1. Write the content TS file.
  const varName = slugToVarName(slug);
  const filePath = join(CONTENT_DIR, `${slug}.ts`);
  const ts = `import type { RoundupContent } from './types';\n\nconst ${varName}: RoundupContent = ${JSON.stringify(content, null, 2)};\n\nexport default ${varName};\n`;
  writeFileSync(filePath, ts, 'utf-8');

  // 2. SQL: tool_roundups row (published).
  sql += `-- ── ${tools.map((t) => t.name).join(' vs ')} (${slug}) ──────────────────────────────────────────────\n`;
  sql += `INSERT INTO tool_roundups (slug, title, verdict, status)\n`;
  sql += `VALUES (${dq(slug)}, ${dq(title)}, ${dq(content.verdict)}, 'published')\n`;
  sql += `ON CONFLICT (slug) DO NOTHING;\n\n`;

  // 3. SQL: tool_roundup_members, one row per tool, resolved via subquery
  // against the just-inserted (or pre-existing) roundup slug.
  tools.forEach((t, i) => {
    const bestFor = content.bestFor?.[t.slug] ?? t.best_for ?? null;
    sql += `INSERT INTO tool_roundup_members (roundup_id, tool_id, sort_order, best_for)\n`;
    sql += `SELECT tr.id, '${t.tool_id}', ${i}, ${dq(bestFor)}\n`;
    sql += `FROM tool_roundups tr WHERE tr.slug = ${dq(slug)}\n`;
    sql += `ON CONFLICT (roundup_id, tool_id) DO NOTHING;\n\n`;
  });
}

writeFileSync(outputSqlPath, sql, 'utf-8');
console.log(`Wrote ${outputSqlPath} (${sql.length} bytes, ${batch.length} roundups)`);

// 4. Regenerate index.ts from every content file present (idempotent).
const files = readdirSync(CONTENT_DIR)
  .filter((f) => f.endsWith('.ts') && f !== 'types.ts' && f !== 'index.ts')
  .map((f) => f.replace(/\.ts$/, ''))
  .sort();

let indexTs = `import type { RoundupContent } from './types';\n`;
for (const slug of files) {
  indexTs += `import ${slugToVarName(slug)} from './${slug}';\n`;
}
indexTs += `\n// Registry of per-roundup editorial content, keyed by canonical slug.\n`;
indexTs += `// A published tool_roundups row with no entry here still renders on\n`;
indexTs += `// /roundup/:slug using DB-sourced facts only — this is purely additive.\n`;
indexTs += `const ROUNDUP_CONTENT: Record<string, RoundupContent> = {\n`;
for (const slug of files) {
  indexTs += `  '${slug}': ${slugToVarName(slug)},\n`;
}
indexTs += `};\n\n`;
indexTs += `export function getRoundupContent(slug: string): RoundupContent | undefined {\n`;
indexTs += `  return ROUNDUP_CONTENT[slug];\n`;
indexTs += `}\n\n`;
indexTs += `export type { RoundupContent, RoundupHighlight, RoundupFAQ, RoundupFeatureMatrixGroup, RoundupFeatureMatrixRow, FeatureStatus } from './types';\n`;

writeFileSync(join(CONTENT_DIR, 'index.ts'), indexTs, 'utf-8');
console.log(`Regenerated index.ts (${files.length} roundups registered)`);
