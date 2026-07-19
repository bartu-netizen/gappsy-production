#!/usr/bin/env node
// Given a list of comparison slugs (one per line via --slugs-file, or the
// bundled severe-slugs.txt), dumps the FULL set of overlapping 8-word
// phrases per member tool (not capped like the summary report), plus which
// field(s) of the content JSON each phrase actually lives in — so a fix-it
// pass can target exact sentences instead of re-reading everything.

import { readFileSync, writeFileSync } from 'fs';
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

const slugsFileIdx = process.argv.indexOf('--slugs-file');
const slugsFile = slugsFileIdx >= 0 ? process.argv[slugsFileIdx + 1] : '/tmp/severe-slugs.txt';
const targetSlugs = new Set(readFileSync(slugsFile, 'utf8').split('\n').map((s) => s.trim()).filter(Boolean));

function normalizeWords(text) {
  return (text || '').toLowerCase().replace(/[^a-z0-9\s]/g, ' ').split(/\s+/).filter(Boolean);
}
function shingles(text, size = 8) {
  const words = normalizeWords(text);
  const set = new Set();
  for (let i = 0; i <= words.length - size; i++) set.add(words.slice(i, i + size).join(' '));
  return set;
}

const twoToolRows = [];
{
  let from = 0;
  while (true) {
    const { data, error } = await supabase
      .from('tool_comparisons')
      .select('id, slug, tool_a:tools!tool_comparisons_tool_a_id_fkey(id,slug,name), tool_b:tools!tool_comparisons_tool_b_id_fkey(id,slug,name)')
      .eq('status', 'published')
      .in('slug', [...targetSlugs])
      .range(from, from + 999);
    if (error) throw new Error(error.message);
    twoToolRows.push(...(data || []));
    if (!data || data.length < 1000) break;
    from += 1000;
  }
}
const groupRows = [];
{
  const { data, error } = await supabase
    .from('tool_group_comparisons')
    .select('id, slug, title, tool_group_comparison_members(sort_order, tools(id,slug,name))')
    .in('slug', [...targetSlugs]);
  if (error) throw new Error(error.message);
  groupRows.push(...(data || []));
}

const pagesBySlug = new Map();
for (const row of twoToolRows) {
  if (!row.tool_a || !row.tool_b) continue;
  pagesBySlug.set(row.slug, { type: 2, members: [row.tool_a, row.tool_b] });
}
for (const row of groupRows) {
  const members = (row.tool_group_comparison_members || []).filter((m) => m.tools).sort((a, b) => a.sort_order - b.sort_order).map((m) => m.tools);
  if (members.length >= 2) pagesBySlug.set(row.slug, { type: 3, members });
}

const uniqueToolIds = [...new Set([...pagesBySlug.values()].flatMap((p) => p.members.map((m) => m.id)))];

async function fetchChunks(table, select, ids) {
  const out = [];
  for (let i = 0; i < ids.length; i += 200) {
    const { data, error } = await supabase.from(table).select(select).in('tool_id', ids.slice(i, i + 200));
    if (error) throw new Error(error.message);
    out.push(...(data || []));
  }
  return out;
}
const { data: toolRows } = await supabase.from('tools').select('id, slug, short_description, long_description').in('id', uniqueToolIds);
const contentBlockRows = await fetchChunks('tool_content_blocks', 'tool_id, heading, paragraphs', uniqueToolIds);
const featureRows = await fetchChunks('tool_features', 'tool_id, title, description', uniqueToolIds);
const prosRows = await fetchChunks('tool_pros', 'tool_id, text', uniqueToolIds);
const consRows = await fetchChunks('tool_cons', 'tool_id, text', uniqueToolIds);

const toolSourceText = new Map();
for (const t of toolRows || []) toolSourceText.set(t.id, [t.short_description, t.long_description].filter(Boolean).join(' \n '));
for (const b of contentBlockRows) toolSourceText.set(b.tool_id, `${toolSourceText.get(b.tool_id) || ''} \n ${b.heading || ''} \n ${(b.paragraphs || []).join(' \n ')}`);
for (const f of featureRows) toolSourceText.set(f.tool_id, `${toolSourceText.get(f.tool_id) || ''} \n ${f.title || ''} ${f.description || ''}`);
for (const p of prosRows) toolSourceText.set(p.tool_id, `${toolSourceText.get(p.tool_id) || ''} \n ${p.text || ''}`);
for (const c of consRows) toolSourceText.set(c.tool_id, `${toolSourceText.get(c.tool_id) || ''} \n ${c.text || ''}`);

const toolShingles = new Map();
for (const [id, text] of toolSourceText.entries()) toolShingles.set(id, shingles(text));

function parseContentFile(path) {
  const raw = readFileSync(path, 'utf8');
  const match = raw.match(/=\s*(\{[\s\S]*\})\s*;\s*\n*\s*export default/);
  return match ? JSON.parse(match[1]) : null;
}

function fieldsOf(content, type) {
  const fields = {};
  fields.verdict = content.verdict;
  if (type === 2) {
    fields.bestForToolA = content.bestForToolA;
    fields.bestForToolB = content.bestForToolB;
    fields.whoNeedsBoth = content.whoNeedsBoth;
    (content.keyDifferences || []).forEach((d, i) => {
      fields[`keyDifferences[${i}].toolA`] = d.toolA;
      fields[`keyDifferences[${i}].toolB`] = d.toolB;
      fields[`keyDifferences[${i}].whyItMatters`] = d.whyItMatters;
      fields[`keyDifferences[${i}].benefitsWho`] = d.benefitsWho;
    });
  } else {
    Object.entries(content.bestFor || {}).forEach(([slug, v]) => { fields[`bestFor.${slug}`] = v; });
    (content.highlights || []).forEach((h, i) => { fields[`highlights[${i}].description`] = h.description; });
  }
  (content.featureMatrix || []).forEach((g, gi) => (g.rows || []).forEach((r, ri) => { if (r.note) fields[`featureMatrix[${gi}].rows[${ri}].note`] = r.note; }));
  (content.faqs || []).forEach((f, i) => { fields[`faqs[${i}].answer`] = f.answer; });
  return fields;
}

const out = [];
for (const slug of targetSlugs) {
  const page = pagesBySlug.get(slug);
  if (!page) { console.log(`SKIP (not found/published): ${slug}`); continue; }
  const dir = page.type === 2 ? 'comparisonContent' : 'groupComparisonContent';
  const filePath = join(REPO_ROOT, 'src/data', dir, `${slug}.ts`);
  const content = parseContentFile(filePath);
  if (!content) { console.log(`SKIP (parse failed): ${slug}`); continue; }
  const fields = fieldsOf(content, page.type);

  const perTool = [];
  for (const member of page.members) {
    const memberShingles = toolShingles.get(member.id);
    if (!memberShingles) continue;
    const hitFields = [];
    for (const [fieldPath, text] of Object.entries(fields)) {
      const fieldShingles = shingles(text);
      const shared = [...fieldShingles].filter((s) => memberShingles.has(s));
      if (shared.length > 0) hitFields.push({ field: fieldPath, text, sharedPhrases: shared });
    }
    if (hitFields.length > 0) perTool.push({ tool: member.slug, hitFields });
  }
  out.push({ slug, type: page.type, filePath: filePath.replace(REPO_ROOT + '/', ''), perTool });
}

writeFileSync(join(REPO_ROOT, 'scripts/content-audit/flagged-details.json'), JSON.stringify(out, null, 2));
console.log(`Wrote details for ${out.length} pages to scripts/content-audit/flagged-details.json`);
