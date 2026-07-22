// Expands the group-comparison candidate pool beyond the initial 450-triple
// selection (selected-triples-v2.json). The marathon run against that first
// batch landed at roughly a 20-25% coherence-check acceptance rate, well
// short of the ~400-page target, so this draws a much larger second wave
// from the same 64,478-candidate pool (candidate-triples-v2.json), skipping
// every slug already selected in wave 1, with relaxed per-tool/per-category
// caps (more candidates survive) but the same MIN_AVG_SHARED quality floor.
import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));

const MIN_AVG_SHARED = 2.0;
const MAX_USES_PER_TOOL = 4; // relaxed from 2 in wave 1
const MAX_PER_CATEGORY = 120; // relaxed from 40 in wave 1
const TARGET_COUNT = 2200;

const candidates = JSON.parse(readFileSync(join(__dirname, 'candidate-triples-v2.json'), 'utf-8'));
const wave1 = JSON.parse(readFileSync(join(__dirname, 'selected-triples-v2.json'), 'utf-8'));
const wave1Slugs = new Set(wave1.map((t) => t.slug));

candidates.sort((a, b) => {
  if (a.allUnused !== b.allUnused) return a.allUnused ? -1 : 1;
  if (b.avgSharedTags !== a.avgSharedTags) return b.avgSharedTags - a.avgSharedTags;
  return b.scoreSum - a.scoreSum;
});

const usesPerTool = new Map();
const perCategory = new Map();
const selected = [];

for (const c of candidates) {
  if (selected.length >= TARGET_COUNT) break;
  if (wave1Slugs.has(c.slug)) continue;
  if (c.avgSharedTags < MIN_AVG_SHARED) continue;
  const catCount = perCategory.get(c.categorySlug) || 0;
  if (catCount >= MAX_PER_CATEGORY) continue;
  let toolsOk = true;
  for (const id of c.ids) {
    if ((usesPerTool.get(id) || 0) >= MAX_USES_PER_TOOL) { toolsOk = false; break; }
  }
  if (!toolsOk) continue;

  selected.push(c);
  perCategory.set(c.categorySlug, catCount + 1);
  for (const id of c.ids) usesPerTool.set(id, (usesPerTool.get(id) || 0) + 1);
}

console.log('Wave 2 selected:', selected.length);
console.log('All-unused in wave 2:', selected.filter((t) => t.allUnused).length);
console.log('Unique categories:', perCategory.size);

writeFileSync(join(__dirname, 'selected-triples-wave2.json'), JSON.stringify(selected, null, 2), 'utf-8');
console.log('Wrote selected-triples-wave2.json');
