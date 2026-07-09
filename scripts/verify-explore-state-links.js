#!/usr/bin/env node
/**
 * Regression guard: Verify "Explore Other States" internal links
 *
 * Asserts:
 *   1. US_STATES has exactly 52 entries
 *   2. No duplicate slugs
 *   3. Every generated href matches /marketing-agencies-in-[a-z0-9-]+-united-states/
 *   4. All 52 slugs have a region assignment (no falls-through to undefined)
 *   5. Build output contains real <a href="..."> tags (if dist/ exists)
 */

import { readFileSync, existsSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = join(__dirname, '..');

let passed = 0;
let failed = 0;

function assert(condition, message) {
  if (condition) {
    console.log(`  PASS  ${message}`);
    passed++;
  } else {
    console.error(`  FAIL  ${message}`);
    failed++;
  }
}

function top25StateUrl(slug) {
  return `/marketing-agencies-in-${slug}-united-states/`;
}

// ─── 1. Load US_STATES from source ────────────────────────────────────────────
const usStatesPath = join(ROOT, 'src/lib/usStates.ts');
const usStatesSource = readFileSync(usStatesPath, 'utf8');

const slugMatches = [...usStatesSource.matchAll(/slug:\s*'([^']+)'/g)];
const US_STATE_SLUGS = slugMatches.map(m => m[1]);

console.log('\n=== Explore State Links Regression Guard ===\n');

// ─── 2. Count check ───────────────────────────────────────────────────────────
console.log('[1] State count check:');
assert(US_STATE_SLUGS.length === 52, `US_STATES contains exactly 52 entries (found ${US_STATE_SLUGS.length})`);

// ─── 3. Duplicate slug check ─────────────────────────────────────────────────
console.log('\n[2] Duplicate slug check:');
const slugSet = new Set(US_STATE_SLUGS);
assert(slugSet.size === US_STATE_SLUGS.length, `No duplicate slugs (${US_STATE_SLUGS.length - slugSet.size} duplicates found)`);

// ─── 4. URL format check ─────────────────────────────────────────────────────
console.log('\n[3] URL format check:');
const URL_PATTERN = /^\/marketing-agencies-in-[a-z0-9-]+-united-states\/$/;
let urlFormatErrors = 0;
for (const slug of US_STATE_SLUGS) {
  const url = top25StateUrl(slug);
  if (!URL_PATTERN.test(url)) {
    console.error(`       Bad URL for "${slug}": ${url}`);
    urlFormatErrors++;
  }
}
assert(urlFormatErrors === 0, `All 52 URLs match pattern /marketing-agencies-in-[a-z0-9-]+-united-states/ (${urlFormatErrors} bad)`);

// ─── 5. Region assignment check ──────────────────────────────────────────────
console.log('\n[4] Region assignment check:');
const stateUrlsPath = join(ROOT, 'src/lib/stateUrls.ts');
const stateUrlsSource = readFileSync(stateUrlsPath, 'utf8');

const regionMatches = [...stateUrlsSource.matchAll(/'([^']+)':\s*'(Northeast|Midwest|South|West|Territories)'/g)];
const slugsWithRegion = new Set(regionMatches.map(m => m[1]));

let missingRegions = 0;
for (const slug of US_STATE_SLUGS) {
  if (!slugsWithRegion.has(slug)) {
    console.error(`       Missing region for slug: "${slug}"`);
    missingRegions++;
  }
}
assert(missingRegions === 0, `All 52 states have a region assignment (${missingRegions} missing)`);

// ─── 6. Component uses <a href> not <Link to> ─────────────────────────────────
console.log('\n[5] Component uses native <a href> (not Link):');
const exploreComponentPath = join(ROOT, 'src/components/ExploreOtherStates.tsx');
const exploreSource = readFileSync(exploreComponentPath, 'utf8');

assert(!exploreSource.includes("from 'react-router-dom'"), 'ExploreOtherStates does NOT import from react-router-dom');
assert(exploreSource.includes('<a'), 'ExploreOtherStates uses <a> elements');
assert(exploreSource.includes('href={url}'), 'ExploreOtherStates uses href={url}');
assert(!exploreSource.includes('<Link'), 'ExploreOtherStates does NOT use <Link>');

// ─── 7. App.tsx has trailing-slash route ─────────────────────────────────────
console.log('\n[6] App.tsx has trailing-slash state route:');
const appPath = join(ROOT, 'src/App.tsx');
const appSource = readFileSync(appPath, 'utf8');
assert(
  appSource.includes('/marketing-agencies-in-:stateSlug-united-states/'),
  'App.tsx has trailing-slash route for state pages'
);

// ─── 8. JS bundle check: ensure href pattern is present in built JS ───────────
console.log('\n[7] JS bundle check (dist/assets/):');
const distAssetsDir = join(ROOT, 'dist/assets');
if (existsSync(distAssetsDir)) {
  const { readdirSync } = await import('fs');
  const jsFiles = readdirSync(distAssetsDir).filter(f => f.endsWith('.js'));
  let foundHrefPattern = false;
  for (const f of jsFiles) {
    const content = readFileSync(join(distAssetsDir, f), 'utf8');
    if (content.includes('marketing-agencies-in-') && content.includes('-united-states/')) {
      foundHrefPattern = true;
      break;
    }
  }
  assert(foundHrefPattern, 'JS bundle contains state URL href pattern (marketing-agencies-in-*-united-states/)');
} else {
  console.log('  SKIP  dist/assets/ not found (run build first)');
}

// ─── Summary ─────────────────────────────────────────────────────────────────
console.log(`\n${'─'.repeat(50)}`);
console.log(`Results: ${passed} passed, ${failed} failed`);
if (failed > 0) {
  console.error('\nREGRESSION DETECTED — fix the issues above before deploying.\n');
  process.exit(1);
} else {
  console.log('\nAll checks passed. Explore state links are correctly configured.\n');
}
