// v2 triple generator: the pilot (1-generate-triples.mjs) clustered purely
// by ONE shared tag within a category, which produced roughly 55% false
// positives on manual review (e.g. a chess-platform codebase grouped with
// game-server management panels because both happened to share the "api"
// tag). This version requires every pair within a candidate triple to
// share at least MIN_SHARED_TAGS non-generic tags — a much stronger
// transitive coherence signal — by finding triangles in a tag-overlap
// graph instead of single-tag clusters.
import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..');

const MIN_SHARED_TAGS = 2;
const MAX_CATEGORY_CANDIDATES = 4000; // safety cap on pair-comparisons per category

const allTools = JSON.parse(readFileSync(join(__dirname, 'all-published-tools.json'), 'utf-8'));
const usedIds = new Set(JSON.parse(readFileSync(join(__dirname, 'used-tool-ids.json'), 'utf-8')));
const tagLinks = JSON.parse(readFileSync(join(__dirname, 'tool-tags.json'), 'utf-8'));

let existingGroupComparisonSlugs = new Set();
try {
  const indexTs = readFileSync(join(REPO_ROOT, 'src', 'data', 'groupComparisonContent', 'index.ts'), 'utf-8');
  existingGroupComparisonSlugs = new Set(
    indexTs.split('\n').map((l) => l.match(/from '\.\/([a-z0-9-]+)'/)).filter(Boolean).map((m) => m[1])
  );
} catch {}
console.log('Existing group comparison pages:', existingGroupComparisonSlugs.size);

const toolById = new Map(allTools.map((t) => [t.id, t]));

// Generic tags that echo the broad category itself or are too vague to
// mark a real sub-niche on their own. Deliberately kept small: the pilot's
// single-tag clustering was unreliable not because any one tag was
// inherently bad, but because it only required ONE match. Requiring
// MIN_SHARED_TAGS overlapping tags (not a bigger stoplist) is what fixes
// coherence here — an aggressive stoplist just starves the graph of edges.
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
  const unusedBonus = usedIds.has(t.id) ? 0 : 5;
  return r + unusedBonus;
}

function sharedTagCount(idA, idB) {
  const a = tagsByTool.get(idA);
  const b = tagsByTool.get(idB);
  if (!a || !b) return 0;
  let count = 0;
  for (const t of a) if (b.has(t)) count++;
  return count;
}

// Group tools by category first — a shared-tag graph is only built within
// a category, never across, so "api" can't bridge a chess engine and a
// game-server panel just because they're both loosely "developer tools".
const byCategory = new Map();
for (const t of allTools) {
  if (!tagsByTool.has(t.id)) continue; // no non-generic tags at all — nothing to cluster on
  if (!byCategory.has(t.category_slug)) byCategory.set(t.category_slug, []);
  byCategory.get(t.category_slug).push(t);
}

const candidateTriples = [];
const seenTripleKeys = new Set();

for (const [categorySlug, tools] of byCategory) {
  if (tools.length < 3) continue;
  if (tools.length > 90) continue; // very large categories -> pair-comparison cap safety, skip for now

  // Build adjacency: edge between two tools if they share >= MIN_SHARED_TAGS
  // non-generic tags. This is the "real competitor" signal — coincidental
  // single-tag overlap is exactly what produced bad matches in the pilot.
  const n = tools.length;
  const edges = []; // [i, j, sharedCount]
  let comparisons = 0;
  for (let i = 0; i < n; i++) {
    for (let j = i + 1; j < n; j++) {
      comparisons++;
      if (comparisons > MAX_CATEGORY_CANDIDATES) break;
      const shared = sharedTagCount(tools[i].id, tools[j].id);
      if (shared >= MIN_SHARED_TAGS) edges.push([i, j, shared]);
    }
    if (comparisons > MAX_CATEGORY_CANDIDATES) break;
  }
  if (edges.length < 3) continue;

  // Adjacency list for triangle-finding.
  const adj = new Map();
  for (const [i, j] of edges) {
    if (!adj.has(i)) adj.set(i, new Set());
    if (!adj.has(j)) adj.set(j, new Set());
    adj.get(i).add(j);
    adj.get(j).add(i);
  }
  const edgeWeight = new Map();
  for (const [i, j, w] of edges) edgeWeight.set(`${i}|${j}`, w);
  function weight(i, j) {
    return edgeWeight.get(i < j ? `${i}|${j}` : `${j}|${i}`) || 0;
  }

  // Find triangles: for every edge (i,j), look for a common neighbor k
  // such that i-k and j-k are also edges (mutual 2+-tag overlap on every
  // side of the triple, not just one shared pair).
  const foundTriangles = [];
  for (const [i, j] of edges) {
    const neighborsI = adj.get(i);
    const neighborsJ = adj.get(j);
    for (const k of neighborsI) {
      if (k <= j) continue; // dedupe: only count each triangle once (i<j<k)
      if (neighborsJ.has(k)) {
        foundTriangles.push([i, j, k]);
      }
    }
  }

  for (const [i, j, k] of foundTriangles) {
    const triTools = [tools[i], tools[j], tools[k]];
    const ids = triTools.map((t) => t.id).sort();
    const tripleKey = ids.join('|');
    if (seenTripleKeys.has(tripleKey)) continue;

    const slugs = [...triTools].map((t) => t.slug).sort();
    const canonicalSlug = slugs.join('-vs-');
    if (existingGroupComparisonSlugs.has(canonicalSlug)) continue;

    seenTripleKeys.add(tripleKey);

    const avgSharedTags = (weight(i, j) + weight(i, k) + weight(j, k)) / 3;
    const scoreSum = triTools.reduce((s, t) => s + score(t), 0);
    const allUnused = triTools.every((t) => !usedIds.has(t.id));

    // The set of tags common to ALL THREE tools (not just pairwise) is the
    // clearest human-readable label for why this triple was proposed.
    const tagSetsIntersect = triTools
      .map((t) => tagsByTool.get(t.id) || new Set())
      .reduce((acc, s) => new Set([...acc].filter((x) => s.has(x))));

    candidateTriples.push({
      slug: canonicalSlug,
      slugs,
      ids: triTools.map((t) => t.id),
      names: triTools.map((t) => t.name),
      categorySlug,
      commonTags: [...tagSetsIntersect],
      avgSharedTags,
      scoreSum,
      allUnused,
    });
  }
}

// Rank: all-unused first (coverage-gap priority), then by average shared-tag
// strength (tighter coherence first), then by quality score.
candidateTriples.sort((a, b) => {
  if (a.allUnused !== b.allUnused) return a.allUnused ? -1 : 1;
  if (b.avgSharedTags !== a.avgSharedTags) return b.avgSharedTags - a.avgSharedTags;
  return b.scoreSum - a.scoreSum;
});

console.log('Total candidate triples generated:', candidateTriples.length);
console.log('All-unused triples:', candidateTriples.filter((t) => t.allUnused).length);
console.log('\nSample top 30:');
for (const t of candidateTriples.slice(0, 30)) {
  console.log(`  ${t.slug}  [${t.categorySlug}]  tags=${t.commonTags.join(',')}  avgShared=${t.avgSharedTags.toFixed(1)}  score=${t.scoreSum.toFixed(1)}  allUnused=${t.allUnused}`);
}

writeFileSync(join(__dirname, 'candidate-triples-v2.json'), JSON.stringify(candidateTriples, null, 2), 'utf-8');
console.log('\nWrote candidate-triples-v2.json');
