// Rounds 1-2 (pairs-01..pairs-16, 160 pairs) are already generated/applied
// and stay untouched. This regenerates pairs-17..pairs-50 (the remaining
// 340 slots) from the full candidate pool, applying a per-tool cap so no
// single "anchor" tool (e.g. activepieces, openarchiver) gets paired
// against many topically-unrelated narrow-label sub-niches just because
// they share a broad Gappsy category — that produced zero-search-value
// pairs like "Activepieces vs a package registry tool".
import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));

const allCandidates = JSON.parse(readFileSync(join(__dirname, 'candidate-pairs-full.json'), 'utf-8'));

// Pairs already locked in by rounds 1-2 (chunks 01-16).
const lockedPairKeys = new Set();
for (let n = 1; n <= 16; n++) {
  const num = String(n).padStart(2, '0');
  const chunk = JSON.parse(readFileSync(join(__dirname, 'rounds', `pairs-${num}.json`), 'utf-8'));
  for (const p of chunk) lockedPairKeys.add([p.slug.split('-vs-')[0], p.slug].join('|')); // not used, just for safety
}
// Simpler: rebuild locked set directly from the original verified-pairs used for those chunks.
const verifiedAll = JSON.parse(readFileSync(join(__dirname, 'verified-pairs.json'), 'utf-8'));
const lockedSlugs = new Set(verifiedAll.slice(0, 160).map((p) => p.slug));

const MAX_PER_TOOL = 4;
const usageCount = new Map();
// Pre-seed usage counts from the 160 already-locked pairs so the cap accounts for them too.
for (const p of verifiedAll.slice(0, 160)) {
  usageCount.set(p.tool_a_slug, (usageCount.get(p.tool_a_slug) || 0) + 1);
  usageCount.set(p.tool_b_slug, (usageCount.get(p.tool_b_slug) || 0) + 1);
}

const lockedCandidateKeys = new Set(verifiedAll.slice(0, 160).map((p) => [p.tool_a_slug, p.tool_b_slug].sort().join('|')));

const selected = [];
for (const cand of allCandidates) {
  if (selected.length >= 340) break;
  const pairKey = [cand.a, cand.b].sort().join('|');
  if (lockedCandidateKeys.has(pairKey)) continue; // already used in rounds 1-2
  const usedA = usageCount.get(cand.a) || 0;
  const usedB = usageCount.get(cand.b) || 0;
  if (usedA >= MAX_PER_TOOL || usedB >= MAX_PER_TOOL) continue;
  selected.push(cand);
  usageCount.set(cand.a, usedA + 1);
  usageCount.set(cand.b, usedB + 1);
}

console.log('Selected additional pairs (capped, dedup vs rounds 1-2):', selected.length);

const freq = {};
for (const c of selected) { freq[c.a] = (freq[c.a]||0)+1; freq[c.b] = (freq[c.b]||0)+1; }
const top = Object.entries(freq).sort((a,b)=>b[1]-a[1]).slice(0, 10);
console.log('Max reuse in new selection:', top.map(([k,v])=>`${k}:${v}`).join(', '));

writeFileSync(join(__dirname, 'new-batch-pairs-remaining.json'), JSON.stringify(selected.map((p) => [p.a, p.b])), 'utf-8');
console.log('Wrote new-batch-pairs-remaining.json');
