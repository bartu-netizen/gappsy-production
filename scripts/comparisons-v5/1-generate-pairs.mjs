// Generates high-value candidate comparison pairs from the newly published
// batch-3/4 tools (911 tools) plus the existing catalog, grouped by the
// most precise category signal available (narrow source_category_label
// for batch-3/4 tools, falling back to the broad Gappsy category), ranked
// by opportunity_score / established-tool status, and paired with nearby
// same-group tools — the shape real "X vs Y" search queries take.
import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..');

const allTools = JSON.parse(readFileSync(join(__dirname, 'all-published-tools.json'), 'utf-8'));
const narrowLabels = JSON.parse(readFileSync(join(__dirname, 'narrow-labels.json'), 'utf-8'));
const narrowBySlug = new Map(narrowLabels.map((r) => [r.slug, r]));

// Existing comparison slugs (both directions) — never propose an already-existing pair.
const indexTs = readFileSync(join(REPO_ROOT, 'src', 'data', 'comparisonContent', 'index.ts'), 'utf-8');
const existingSlugs = new Set(
  indexTs.split('\n').map((l) => l.match(/from '\.\/([a-z0-9-]+)'/)).filter(Boolean).map((m) => m[1])
);
console.log('Existing comparison pages:', existingSlugs.size);

// Group key: the mapped Gappsy category_slug (already correctly split by
// the per-tool overrides applied at import time, e.g. "CRM & Sales" was
// split into crm vs sales) — far more semantically precise than the raw
// manifest label, which lumps unrelated product types together.
function groupKey(t) {
  return `cat:${t.category_slug}`;
}

const groups = new Map();
for (const t of allTools) {
  const key = groupKey(t);
  if (!groups.has(key)) groups.set(key, []);
  groups.get(key).push(t);
}

// Score: established (pre-batch3/4) tools get a high baseline (they're the
// well-known anchors real search queries reference); batch3/4 tools are
// ranked by their manifest opportunity_score.
function score(t) {
  const narrow = narrowBySlug.get(t.slug);
  if (!narrow) return 20; // established/older catalog tool
  return Number(narrow.opportunity_score) || 5;
}

// Secondary sort key within a category: cluster tools that share the same
// raw manifest label next to each other so adjacent-rank pairing favors
// genuinely similar products (e.g. two Time Tracking tools) over merely
// same-broad-category ones.
function narrowLabelOf(t) {
  return narrowBySlug.get(t.slug)?.source_category_label || '';
}

const candidatePairs = [];
const seenPairKeys = new Set();

function addPair(a, b) {
  if (a.slug === b.slug) return;
  // Scope to this task: at least one side must be a newly imported (batch
  // 3/4) tool — pure old-vs-old pairs are out of scope here.
  if (!narrowBySlug.has(a.slug) && !narrowBySlug.has(b.slug)) return;
  const pairKey = [a.slug, b.slug].sort().join('|');
  if (seenPairKeys.has(pairKey)) return;
  const canonicalSlug = [a.slug, b.slug].sort().join('-vs-');
  if (existingSlugs.has(canonicalSlug)) return;
  seenPairKeys.add(pairKey);
  candidatePairs.push({ a: a.slug, b: b.slug, groupKey: groupKey(a), scoreSum: score(a) + score(b) });
}

for (const [key, list] of groups) {
  if (list.length < 2) continue;
  // Primary sort: narrow label (clusters same-sub-niche tools together).
  // Secondary sort: score desc (established/high-opportunity tools first
  // within each sub-niche cluster).
  const sorted = [...list].sort((x, y) => {
    const labelCmp = narrowLabelOf(x).localeCompare(narrowLabelOf(y));
    if (labelCmp !== 0) return labelCmp;
    return score(y) - score(x);
  });

  // Adjacent-rank pairing: each tool paired with its immediate neighbor(s)
  // in the sorted list — mirrors how real competitors cluster by market position.
  for (let i = 0; i < sorted.length - 1; i++) {
    addPair(sorted[i], sorted[i + 1]);
  }

  // Anchor pairing: within each narrow-label sub-niche present in this
  // category, pair only the single top-scoring batch3/4 tool with the
  // best-matching established (pre-batch3/4) tool in the same broad
  // category — one strong "new tool vs the market leader" pair per
  // sub-niche, not one per tool (avoids pairing an anchor with every
  // loosely-related tool in a broad bucket).
  const established = sorted.filter((t) => !narrowBySlug.has(t.slug));
  if (established.length) {
    const anchor = established[0]; // highest-rated established tool in this broad category
    const byNarrowLabel = new Map();
    for (const t of sorted) {
      if (!narrowBySlug.has(t.slug)) continue;
      const label = narrowLabelOf(t);
      if (!byNarrowLabel.has(label)) byNarrowLabel.set(label, []);
      byNarrowLabel.get(label).push(t);
    }
    for (const [, subList] of byNarrowLabel) {
      const top = subList[0]; // subList is already sorted by score desc within its label
      if (top.slug !== anchor.slug) addPair(anchor, top);
    }
  }
}

candidatePairs.sort((x, y) => y.scoreSum - x.scoreSum);

console.log('Total candidate pairs generated:', candidatePairs.length);
console.log('Sample top 20 by score:');
for (const p of candidatePairs.slice(0, 20)) console.log(`  ${p.a} vs ${p.b} (${p.groupKey}, score ${p.scoreSum})`);

writeFileSync(join(__dirname, 'candidate-pairs-full.json'), JSON.stringify(candidatePairs, null, 2), 'utf-8');
console.log('\nWrote candidate-pairs-full.json');
