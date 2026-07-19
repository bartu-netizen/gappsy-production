#!/usr/bin/env node
// Audits every published /compare page (2-tool and 3-tool) for two SEO/LLM
// risks: (1) thin content — too little original prose to be worth indexing,
// and (2) duplicate content — prose that verbatim-overlaps the site's own
// /tools/:slug pages for the same tools, which the pipeline was originally
// grounded in. Read-only: fetches from Supabase with the public anon key
// (same access the site itself uses) and parses the local comparisonContent
// / groupComparisonContent .ts files, which are plain JSON object literals.
//
// Usage: node scripts/content-audit/audit-compare-pages.mjs [--out report.json]

import { readFileSync, readdirSync, writeFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import { createClient } from '@supabase/supabase-js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..');

function loadEnvLocal() {
  const raw = readFileSync(join(REPO_ROOT, '.env.local'), 'utf8');
  const env = {};
  for (const line of raw.split('\n')) {
    const m = line.match(/^([A-Z0-9_]+)=(.*)$/);
    if (m) env[m[1]] = m[2].trim();
  }
  return env;
}

const env = loadEnvLocal();
const supabase = createClient(env.VITE_SUPABASE_URL, env.VITE_SUPABASE_ANON_KEY);

const SHINGLE_SIZE = 8;
const THIN_WORD_THRESHOLD = 400;
const CRITICAL_THIN_WORD_THRESHOLD = 250;
const OVERLAP_FLAG_SHINGLES = 3;

function normalizeWords(text) {
  return (text || '')
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, ' ')
    .split(/\s+/)
    .filter(Boolean);
}

function wordCount(text) {
  return normalizeWords(text).length;
}

function shingles(text, size = SHINGLE_SIZE) {
  const words = normalizeWords(text);
  const set = new Set();
  for (let i = 0; i <= words.length - size; i++) {
    set.add(words.slice(i, i + size).join(' '));
  }
  return set;
}

async function fetchAllInChunks(table, select, ids, idColumn = 'id', chunkSize = 200) {
  const out = [];
  for (let i = 0; i < ids.length; i += chunkSize) {
    const chunk = ids.slice(i, i + chunkSize);
    const { data, error } = await supabase.from(table).select(select).in(idColumn, chunk);
    if (error) throw new Error(`${table} fetch failed: ${error.message}`);
    out.push(...(data || []));
  }
  return out;
}

// ---------------------------------------------------------------------------
// 1. Load published comparisons + group comparisons (member tool slugs/ids).
// ---------------------------------------------------------------------------
console.log('Fetching published comparisons from Supabase...');

const twoToolRows = [];
{
  let from = 0;
  const pageSize = 1000;
  while (true) {
    const { data, error } = await supabase
      .from('tool_comparisons')
      .select('id, slug, tool_a:tools!tool_comparisons_tool_a_id_fkey(id,slug,name), tool_b:tools!tool_comparisons_tool_b_id_fkey(id,slug,name)')
      .eq('status', 'published')
      .range(from, from + pageSize - 1);
    if (error) throw new Error(`tool_comparisons fetch failed: ${error.message}`);
    twoToolRows.push(...(data || []));
    if (!data || data.length < pageSize) break;
    from += pageSize;
  }
}

const groupRows = [];
{
  let from = 0;
  const pageSize = 1000;
  while (true) {
    const { data, error } = await supabase
      .from('tool_group_comparisons')
      .select('id, slug, title, tool_group_comparison_members(sort_order, tools(id,slug,name))')
      .range(from, from + pageSize - 1);
    if (error) throw new Error(`tool_group_comparisons fetch failed: ${error.message}`);
    groupRows.push(...(data || []));
    if (!data || data.length < pageSize) break;
    from += pageSize;
  }
}

console.log(`  2-tool comparisons: ${twoToolRows.length}`);
console.log(`  3-tool comparisons: ${groupRows.length}`);

const pagesBySlug = new Map();
for (const row of twoToolRows) {
  if (!row.tool_a || !row.tool_b) continue;
  pagesBySlug.set(row.slug, { type: 2, members: [row.tool_a, row.tool_b] });
}
for (const row of groupRows) {
  const members = (row.tool_group_comparison_members || [])
    .filter((m) => m.tools)
    .sort((a, b) => a.sort_order - b.sort_order)
    .map((m) => m.tools);
  if (members.length < 2) continue;
  pagesBySlug.set(row.slug, { type: 3, members, title: row.title });
}

// ---------------------------------------------------------------------------
// 2. Fetch each member tool's own on-page prose (the duplicate-content
//    source of truth) — short/long description, content-block paragraphs,
//    features, pros, cons, exactly what ToolDetailPage renders.
// ---------------------------------------------------------------------------
const uniqueToolIds = [...new Set([...pagesBySlug.values()].flatMap((p) => p.members.map((m) => m.id)))];
console.log(`Fetching on-page content for ${uniqueToolIds.length} unique tools referenced across all comparisons...`);

const toolRows = await fetchAllInChunks('tools', 'id, slug, short_description, long_description', uniqueToolIds);
const contentBlockRows = await fetchAllInChunks('tool_content_blocks', 'tool_id, heading, paragraphs', uniqueToolIds, 'tool_id');
const featureRows = await fetchAllInChunks('tool_features', 'tool_id, title, description', uniqueToolIds, 'tool_id');
const prosRows = await fetchAllInChunks('tool_pros', 'tool_id, text', uniqueToolIds, 'tool_id');
const consRows = await fetchAllInChunks('tool_cons', 'tool_id, text', uniqueToolIds, 'tool_id');

const toolSourceText = new Map(); // tool_id -> combined prose string
const toolShingles = new Map(); // tool_id -> Set<string>
for (const t of toolRows) {
  toolSourceText.set(t.id, [t.short_description, t.long_description].filter(Boolean).join(' \n '));
}
for (const b of contentBlockRows) {
  const prev = toolSourceText.get(b.tool_id) || '';
  const paras = Array.isArray(b.paragraphs) ? b.paragraphs.join(' \n ') : '';
  toolSourceText.set(b.tool_id, `${prev} \n ${b.heading || ''} \n ${paras}`);
}
for (const f of featureRows) {
  const prev = toolSourceText.get(f.tool_id) || '';
  toolSourceText.set(f.tool_id, `${prev} \n ${f.title || ''} ${f.description || ''}`);
}
for (const p of prosRows) {
  const prev = toolSourceText.get(p.tool_id) || '';
  toolSourceText.set(p.tool_id, `${prev} \n ${p.text || ''}`);
}
for (const c of consRows) {
  const prev = toolSourceText.get(c.tool_id) || '';
  toolSourceText.set(c.tool_id, `${prev} \n ${c.text || ''}`);
}
for (const [toolId, text] of toolSourceText.entries()) {
  toolShingles.set(toolId, shingles(text));
}

// ---------------------------------------------------------------------------
// 3. Parse local comparisonContent + groupComparisonContent .ts files
//    (plain JSON object literals) and extract the prose fields.
// ---------------------------------------------------------------------------
function parseContentFile(path) {
  const raw = readFileSync(path, 'utf8');
  const match = raw.match(/=\s*(\{[\s\S]*\})\s*;\s*\n*\s*export default/);
  if (!match) return null;
  try {
    return JSON.parse(match[1]);
  } catch {
    return null;
  }
}

function extractTwoToolProse(content) {
  const parts = [content.verdict, content.bestForToolA, content.bestForToolB, content.whoNeedsBoth];
  for (const d of content.keyDifferences || []) {
    parts.push(d.title, d.toolA, d.toolB, d.whyItMatters, d.benefitsWho);
  }
  for (const g of content.featureMatrix || []) {
    for (const r of g.rows || []) if (r.note) parts.push(r.note);
  }
  for (const f of content.faqs || []) {
    parts.push(f.question, f.answer);
  }
  return parts.filter(Boolean).join(' \n ');
}

function extractThreeToolProse(content) {
  const parts = [content.verdict, ...Object.values(content.bestFor || {})];
  for (const h of content.highlights || []) {
    parts.push(h.title, h.description);
  }
  for (const g of content.featureMatrix || []) {
    for (const r of g.rows || []) if (r.note) parts.push(r.note);
  }
  for (const f of content.faqs || []) {
    parts.push(f.question, f.answer);
  }
  return parts.filter(Boolean).join(' \n ');
}

const twoToolDir = join(REPO_ROOT, 'src/data/comparisonContent');
const groupDir = join(REPO_ROOT, 'src/data/groupComparisonContent');

const results = [];
let unregisteredCount = 0;

for (const file of readdirSync(twoToolDir)) {
  if (!file.endsWith('.ts') || file === 'index.ts' || file === 'types.ts') continue;
  const slug = file.replace(/\.ts$/, '');
  const page = pagesBySlug.get(slug);
  if (!page || page.type !== 2) {
    unregisteredCount++;
    continue;
  }
  const content = parseContentFile(join(twoToolDir, file));
  if (!content) continue;
  const prose = extractTwoToolProse(content);
  results.push({ slug, type: 2, members: page.members, prose });
}

for (const file of readdirSync(groupDir)) {
  if (!file.endsWith('.ts') || file === 'index.ts' || file === 'types.ts') continue;
  const slug = file.replace(/\.ts$/, '');
  const page = pagesBySlug.get(slug);
  if (!page || page.type !== 3) {
    unregisteredCount++;
    continue;
  }
  const content = parseContentFile(join(groupDir, file));
  if (!content) continue;
  const prose = extractThreeToolProse(content);
  results.push({ slug, type: 3, members: page.members, prose });
}

console.log(`Parsed ${results.length} comparison content files (${unregisteredCount} local files with no matching published DB row, skipped).`);

// ---------------------------------------------------------------------------
// 4. Score each page: word count + per-member overlap against that tool's
//    own on-page prose.
// ---------------------------------------------------------------------------
const report = [];
for (const page of results) {
  const words = wordCount(page.prose);
  const pageShingles = shingles(page.prose);

  const overlaps = [];
  for (const member of page.members) {
    const memberShingles = toolShingles.get(member.id);
    if (!memberShingles || memberShingles.size === 0) continue;
    const shared = [...pageShingles].filter((s) => memberShingles.has(s));
    if (shared.length > 0) {
      overlaps.push({ tool: member.slug, sharedShingleCount: shared.length, examples: shared.slice(0, 3) });
    }
  }

  const thin = words < THIN_WORD_THRESHOLD;
  const criticallyThin = words < CRITICAL_THIN_WORD_THRESHOLD;
  const duplicateRisk = overlaps.some((o) => o.sharedShingleCount >= OVERLAP_FLAG_SHINGLES);

  report.push({
    slug: page.slug,
    type: page.type,
    tools: page.members.map((m) => m.slug),
    wordCount: words,
    thin,
    criticallyThin,
    duplicateRisk,
    overlaps,
  });
}

// ---------------------------------------------------------------------------
// 5. Summarize.
// ---------------------------------------------------------------------------
const sortedWords = report.map((r) => r.wordCount).sort((a, b) => a - b);
const pct = (p) => sortedWords[Math.floor((sortedWords.length - 1) * p)];

console.log('\n=== WORD COUNT DISTRIBUTION (extracted prose only) ===');
console.log(`  min: ${sortedWords[0]}  p10: ${pct(0.1)}  p50: ${pct(0.5)}  p90: ${pct(0.9)}  max: ${sortedWords[sortedWords.length - 1]}`);

const thinPages = report.filter((r) => r.thin);
const criticalPages = report.filter((r) => r.criticallyThin);
const dupPages = report.filter((r) => r.duplicateRisk);

console.log(`\n=== THIN CONTENT (< ${THIN_WORD_THRESHOLD} words) ===`);
console.log(`  ${thinPages.length} / ${report.length} pages (${criticalPages.length} critically thin, < ${CRITICAL_THIN_WORD_THRESHOLD} words)`);

console.log(`\n=== DUPLICATE CONTENT RISK (>= ${OVERLAP_FLAG_SHINGLES} shared ${SHINGLE_SIZE}-word phrases with a member tool's own page) ===`);
console.log(`  ${dupPages.length} / ${report.length} pages`);

console.log('\nTop 15 thinnest pages:');
for (const r of [...report].sort((a, b) => a.wordCount - b.wordCount).slice(0, 15)) {
  console.log(`  ${r.wordCount}w  /compare/${r.slug}`);
}

console.log('\nTop 15 highest duplicate-content-risk pages:');
for (const r of [...report].sort((a, b) => {
  const aMax = Math.max(0, ...a.overlaps.map((o) => o.sharedShingleCount));
  const bMax = Math.max(0, ...b.overlaps.map((o) => o.sharedShingleCount));
  return bMax - aMax;
}).slice(0, 15)) {
  const maxOverlap = r.overlaps.reduce((m, o) => (o.sharedShingleCount > m.sharedShingleCount ? o : m), { sharedShingleCount: 0 });
  console.log(`  ${maxOverlap.sharedShingleCount} shared phrases (${maxOverlap.tool})  /compare/${r.slug}`);
  if (maxOverlap.examples) for (const ex of maxOverlap.examples) console.log(`      "${ex}"`);
}

const outPath = process.argv.includes('--out')
  ? process.argv[process.argv.indexOf('--out') + 1]
  : join(REPO_ROOT, 'scripts/content-audit/report.json');
writeFileSync(outPath, JSON.stringify({ generatedAt: new Date().toISOString(), thresholds: { THIN_WORD_THRESHOLD, CRITICAL_THIN_WORD_THRESHOLD, OVERLAP_FLAG_SHINGLES, SHINGLE_SIZE }, summary: { total: report.length, thin: thinPages.length, criticallyThin: criticalPages.length, duplicateRisk: dupPages.length }, pages: report }, null, 2));
console.log(`\nFull report written to ${outPath}`);
