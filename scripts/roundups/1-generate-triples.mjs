// Generates candidate 3-tool "roundup" triples: same shape of logic as
// scripts/comparisons-v5/1-generate-pairs.mjs (group by sub-niche, rank by
// a quality score, cluster nearby-ranked tools) but generalized to pick
// groups of 3 unique tools instead of pairs, and prioritized toward tools
// that don't yet appear in ANY published comparison page (2-tool compare
// or 3-tool roundup) — per the explicit brief: surface coverage gaps first.
//
// Inputs (checked into this dir, refreshed via a live Supabase query before
// each run — see the query snippets in the accompanying README/commit):
//   all-published-tools.json  [{ id, slug, name, rating, category_slug }]
//   used-tool-ids.json        [tool_id, ...]  (already in a published compare/roundup)
//   tool-tags.json            [{ tool_id, tag_slug }, ...]
//
// Output: candidate-triples.json, an array of
//   { slugs: [a,b,c], ids: [idA,idB,idC], names: [...], categorySlug, tagSlug, scoreSum }
// sorted best-first. Caller picks the top N for a pilot batch.
import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..');

const allTools = JSON.parse(readFileSync(join(__dirname, 'all-published-tools.json'), 'utf-8'));
const usedIds = new Set(JSON.parse(readFileSync(join(__dirname, 'used-tool-ids.json'), 'utf-8')));
const tagLinks = JSON.parse(readFileSync(join(__dirname, 'tool-tags.json'), 'utf-8'));

// Existing roundup slugs — never propose an already-existing triple.
let existingRoundupSlugs = new Set();
try {
  const indexTs = readFileSync(join(REPO_ROOT, 'src', 'data', 'roundupContent', 'index.ts'), 'utf-8');
  existingRoundupSlugs = new Set(
    indexTs.split('\n').map((l) => l.match(/from '\.\/([a-z0-9-]+)'/)).filter(Boolean).map((m) => m[1])
  );
} catch {}
console.log('Existing roundup pages:', existingRoundupSlugs.size);

const toolById = new Map(allTools.map((t) => [t.id, t]));

// Generic tags that echo the broad category itself or are too vague to mark
// a real sub-niche (would otherwise cluster huge, incoherent groups).
const GENERIC_TAGS = new Set([
  'ai', 'saas', 'software', 'tool', 'tools', 'platform', 'app', 'apps',
  'developer-tools', 'productivity', 'productivity-tool', 'productivity-software',
  'automation', 'cloud', 'cloud-based', 'web-app', 'freemium', 'open-source',
  'business-software', 'enterprise-software', 'subscription-service',
]);

const tagsByTool = new Map();
for (const { tool_id, tag_slug } of tagLinks) {
  if (GENERIC_TAGS.has(tag_slug)) continue;
  if (!toolById.has(tool_id)) continue;
  if (!tagsByTool.has(tool_id)) tagsByTool.set(tool_id, new Set());
  tagsByTool.get(tool_id).add(tag_slug);
}

function score(t) {
  const r = Number(t.rating) || 0;
  const unusedBonus = usedIds.has(t.id) ? 0 : 5; // prioritize coverage gaps
  return r + unusedBonus;
}

// Build tag -> [tools] clusters, scoped within each tool's own category so a
// shared tag never bridges two unrelated broad categories.
const clusterMap = new Map(); // key: `${category_slug}::${tag_slug}` -> tools[]
for (const t of allTools) {
  const tags = tagsByTool.get(t.id);
  if (!tags) continue;
  for (const tag of tags) {
    const key = `${t.category_slug}::${tag}`;
    if (!clusterMap.has(key)) clusterMap.set(key, []);
    clusterMap.get(key).push(t);
  }
}

const candidateTriples = [];
const usedInThisRun = new Set(); // tool ids already assigned to a triple this run — maximize pilot breadth
const seenTripleKeys = new Set();

function tryCluster(key, list) {
  if (list.length < 3) return;
  // Prefer tight clusters (3-8 tools) — large ones (>8) usually mean the tag
  // is still too generic for a genuine "these 3 compete head-to-head" page.
  if (list.length > 8) return;

  const available = list.filter((t) => !usedInThisRun.has(t.id));
  if (available.length < 3) return;

  const sorted = [...available].sort((x, y) => score(y) - score(x));
  const top3 = sorted.slice(0, 3);

  const ids = top3.map((t) => t.id).sort();
  const tripleKey = ids.join('|');
  if (seenTripleKeys.has(tripleKey)) return;

  const slugs = [...top3].map((t) => t.slug).sort();
  const canonicalSlug = slugs.join('-vs-');
  if (existingRoundupSlugs.has(canonicalSlug)) return;

  seenTripleKeys.add(tripleKey);
  for (const t of top3) usedInThisRun.add(t.id);

  const [categorySlug, tagSlug] = key.split('::');
  candidateTriples.push({
    slug: canonicalSlug,
    slugs,
    ids: top3.map((t) => t.id),
    names: top3.map((t) => t.name),
    categorySlug,
    tagSlug,
    scoreSum: top3.reduce((s, t) => s + score(t), 0),
    allUnused: top3.every((t) => !usedIds.has(t.id)),
  });
}

// Rank clusters by (a) all-unused first — the explicit "no existing
// comparison" brief — then (b) tighter clusters (closer to exactly 3, the
// clearest sign of a real sub-niche rather than a loose grouping).
const clusterEntries = [...clusterMap.entries()].sort((a, b) => {
  const aAllUnused = a[1].every((t) => !usedIds.has(t.id));
  const bAllUnused = b[1].every((t) => !usedIds.has(t.id));
  if (aAllUnused !== bAllUnused) return aAllUnused ? -1 : 1;
  return a[1].length - b[1].length;
});

for (const [key, list] of clusterEntries) {
  tryCluster(key, list);
}

candidateTriples.sort((a, b) => {
  if (a.allUnused !== b.allUnused) return a.allUnused ? -1 : 1;
  return b.scoreSum - a.scoreSum;
});

console.log('Total candidate triples generated:', candidateTriples.length);
console.log('All-unused triples (zero prior comparison presence):', candidateTriples.filter((t) => t.allUnused).length);
console.log('\nSample top 20:');
for (const t of candidateTriples.slice(0, 20)) {
  console.log(`  ${t.slug}  [${t.categorySlug} / ${t.tagSlug}]  score=${t.scoreSum.toFixed(1)}  allUnused=${t.allUnused}`);
}

writeFileSync(join(__dirname, 'candidate-triples-full.json'), JSON.stringify(candidateTriples, null, 2), 'utf-8');
console.log('\nWrote candidate-triples-full.json');
