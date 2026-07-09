/**
 * Regression guard: verifies all 52 state URLs are valid and unique.
 * Run: node scripts/verify-state-urls.js
 * Also called automatically during build via package.json.
 */

import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = join(__dirname, '..');

// Read the canonical state list directly from source (no transpile needed — it's plain JS-compatible)
const usStatesSource = readFileSync(join(root, 'src/lib/usStates.ts'), 'utf8');
const stateUrlsSource = readFileSync(join(root, 'src/lib/stateUrls.ts'), 'utf8');

// Extract slug list from usStates.ts via regex
const slugMatches = [...usStatesSource.matchAll(/slug:\s*'([a-z0-9-]+)'/g)];
const slugs = slugMatches.map(m => m[1]);

// Validate count
const EXPECTED_COUNT = 52;
if (slugs.length !== EXPECTED_COUNT) {
  console.error(`❌ FAIL: Expected ${EXPECTED_COUNT} state slugs, found ${slugs.length}`);
  console.error('Slugs found:', slugs);
  process.exit(1);
}

// Validate each URL matches the pattern
const URL_PATTERN = /^\/marketing-agencies-in-[a-z0-9-]+-united-states\/$/;
const errors = [];

for (const slug of slugs) {
  const url = `/marketing-agencies-in-${slug}-united-states/`;
  if (!URL_PATTERN.test(url)) {
    errors.push(`  Slug "${slug}" produced invalid URL: "${url}"`);
  }
}

// Check for duplicates
const uniqueSlugs = new Set(slugs);
if (uniqueSlugs.size !== slugs.length) {
  const dupes = slugs.filter((s, i) => slugs.indexOf(s) !== i);
  errors.push(`  Duplicate slugs: ${dupes.join(', ')}`);
}

// Validate all slugs from stateUrls.ts SLUG_TO_REGION are present in usStates
const regionMatches = [...stateUrlsSource.matchAll(/'([a-z0-9-]+)':\s*'(Northeast|Midwest|South|West|Territories)'/g)];
const regionSlugs = regionMatches.map(m => m[1]);
const slugSet = new Set(slugs);
for (const rs of regionSlugs) {
  if (!slugSet.has(rs)) {
    errors.push(`  Slug "${rs}" in SLUG_TO_REGION not found in US_STATES`);
  }
}
// Check all US_STATES slugs have a region assignment
for (const slug of slugs) {
  const hasRegion = stateUrlsSource.includes(`'${slug}':`);
  if (!hasRegion) {
    errors.push(`  Slug "${slug}" has no region assignment in stateUrls.ts`);
  }
}

if (errors.length > 0) {
  console.error('❌ State URL verification FAILED:');
  errors.forEach(e => console.error(e));
  process.exit(1);
}

console.log(`✅ State URL verification passed: ${slugs.length} states, all URLs valid, all regions assigned.`);
