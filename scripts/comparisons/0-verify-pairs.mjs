// Verifies the new-batch-pairs.json list: dedupes, checks both tools exist
// and are published, checks the canonical slug doesn't already have a
// comparison, and resolves alphabetical tool_a/tool_b ordering.
import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { createClient } from '@supabase/supabase-js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..');

function loadEnv() {
  const envText = readFileSync(join(REPO_ROOT, '.env.local'), 'utf-8');
  for (const line of envText.split('\n')) {
    const m = line.match(/^([A-Z0-9_]+)=(.*)$/);
    if (m) process.env[m[1]] = m[2];
  }
}
loadEnv();

const supabase = createClient(process.env.VITE_SUPABASE_URL, process.env.VITE_SUPABASE_ANON_KEY);

const rawPairs = JSON.parse(readFileSync(join(__dirname, 'new-batch-pairs.json'), 'utf-8'));
const existingSlugs = new Set(
  readFileSync(join(__dirname, '..', '..', 'src', 'data', 'comparisonContent', 'index.ts'), 'utf-8')
    .split('\n')
    .map((l) => l.match(/from '\.\/([a-z0-9-]+)'/))
    .filter(Boolean)
    .map((m) => m[1])
);

async function main() {
  // Fetch all published tools (id, slug) once.
  const allSlugs = [...new Set(rawPairs.flat())];
  const toolsBySlug = new Map();
  const PAGE = 1000;
  for (let i = 0; i < allSlugs.length; i += PAGE) {
    const chunk = allSlugs.slice(i, i + PAGE);
    const { data, error } = await supabase.from('tools').select('id, slug, name, status').in('slug', chunk);
    if (error) throw error;
    for (const t of data) toolsBySlug.set(t.slug, t);
  }

  const seenPairKey = new Set();
  const seenCanonicalSlug = new Set();
  const valid = [];
  const dropped = [];

  for (const [a, b] of rawPairs) {
    if (a === b) { dropped.push({ pair: [a, b], reason: 'self-pair' }); continue; }
    const pairKey = [a, b].sort().join('|');
    if (seenPairKey.has(pairKey)) { dropped.push({ pair: [a, b], reason: 'duplicate-within-list' }); continue; }
    seenPairKey.add(pairKey);

    const toolA = toolsBySlug.get(a);
    const toolB = toolsBySlug.get(b);
    if (!toolA) { dropped.push({ pair: [a, b], reason: `slug not found: ${a}` }); continue; }
    if (!toolB) { dropped.push({ pair: [a, b], reason: `slug not found: ${b}` }); continue; }
    if (toolA.status !== 'published') { dropped.push({ pair: [a, b], reason: `not published: ${a}` }); continue; }
    if (toolB.status !== 'published') { dropped.push({ pair: [a, b], reason: `not published: ${b}` }); continue; }

    const [first, second] = [toolA, toolB].sort((x, y) => x.slug.localeCompare(y.slug));
    const canonicalSlug = `${first.slug}-vs-${second.slug}`;
    if (existingSlugs.has(canonicalSlug) || seenCanonicalSlug.has(canonicalSlug)) {
      dropped.push({ pair: [a, b], reason: `comparison already exists: ${canonicalSlug}` });
      continue;
    }
    seenCanonicalSlug.add(canonicalSlug);

    valid.push({
      slug: canonicalSlug,
      tool_a_id: first.id, tool_a_slug: first.slug, tool_a_name: first.name,
      tool_b_id: second.id, tool_b_slug: second.slug, tool_b_name: second.name,
    });
  }

  console.log(`Input pairs: ${rawPairs.length}`);
  console.log(`Valid: ${valid.length}`);
  console.log(`Dropped: ${dropped.length}`);
  if (dropped.length) {
    console.log('\nDropped pairs:');
    for (const d of dropped) console.log(`  ${d.pair.join(' / ')} — ${d.reason}`);
  }

  writeFileSync(join(__dirname, 'verified-pairs.json'), JSON.stringify(valid, null, 2), 'utf-8');
  console.log(`\nWrote verified-pairs.json (${valid.length} pairs)`);
}

main().catch((err) => { console.error(err); process.exit(1); });
