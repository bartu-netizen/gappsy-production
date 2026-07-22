#!/usr/bin/env node
/**
 * Build safeguards for prerendered tool pages (requirement #12 of the
 * tool-page SEO task). Fails the build (exit 1) when:
 *   - a generated tool page is missing a title, canonical, or meta description
 *   - a generated tool page is accidentally noindexed
 *   - two tool pages share an identical title or canonical (duplicate content)
 *   - a generated tool page contains placeholder/boilerplate copy
 *   - the number of generated tool files doesn't match what prerender-tools.js
 *     reported it successfully generated (catches a silent generation failure)
 */
import { readFileSync, readdirSync, existsSync, statSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const distDir = join(__dirname, '..', 'dist');
const toolsDir = join(distDir, 'tools');

const PLACEHOLDER_PATTERNS = [
  /lorem ipsum/i,
  /\bplaceholder\b/i,
  /\bcoming soon\b/i,
  /\btodo\b/i,
  // the retired generic meta-description fallback, matched precisely so
  // legitimate copy that happens to say "learn about" isn't flagged
  /learn about [^.]+: pricing, features, and reviews\./i,
];

const errors = [];
const fail = (msg) => errors.push(msg);

console.log('\n🔍 SEO Build Safeguards — Prerendered Tool Pages\n');

if (!existsSync(toolsDir)) {
  console.log('ℹ️  No dist/tools directory found — no published tools to verify. Skipping.\n');
  process.exit(0);
}

// Each published tool is a subdirectory dist/tools/{slug}/index.html —
// no flat dist/tools/{slug}.html file (see public/_redirects for why: an
// explicit rewrite to a flat file was tried and reverted after production
// testing showed it misbehaving for missing-target requests).
const toolSlugs = readdirSync(toolsDir).filter((name) => statSync(join(toolsDir, name)).isDirectory());

if (toolSlugs.length === 0) {
  console.log('ℹ️  No prerendered tool files found — no published tools. Skipping.\n');
  process.exit(0);
}

console.log(`   Checking ${toolSlugs.length} prerendered tool file(s)...\n`);

const seenTitles = new Map();
const seenCanonicals = new Map();

for (const slug of toolSlugs) {
  const indexPath = join(toolsDir, slug, 'index.html');
  if (!existsSync(indexPath)) {
    fail(`${slug}: dist/tools/${slug}/index.html is missing`);
    continue;
  }
  const html = readFileSync(indexPath, 'utf-8');

  const titleMatches = html.match(/<title>([^<]*)<\/title>/g) || [];
  const canonicalMatches = html.match(/<link[^>]+rel=["']canonical["'][^>]*>/g) || [];
  const descriptionMatches = html.match(/<meta[^>]+name=["']description["'][^>]*>/g) || [];
  const robotsMatch = html.match(/<meta[^>]+name=["']robots["'][^>]+content=["']([^"']+)["']/i);

  if (titleMatches.length === 0) fail(`${slug}: missing <title>`);
  if (titleMatches.length > 1) fail(`${slug}: duplicate <title> (${titleMatches.length} found)`);

  if (canonicalMatches.length === 0) fail(`${slug}: missing canonical link`);
  if (canonicalMatches.length > 1) fail(`${slug}: duplicate canonical link (${canonicalMatches.length} found)`);

  if (descriptionMatches.length === 0) fail(`${slug}: missing meta description`);
  if (descriptionMatches.length > 1) fail(`${slug}: duplicate meta description (${descriptionMatches.length} found)`);

  if (!robotsMatch) {
    fail(`${slug}: missing robots meta`);
  } else if (!/index/i.test(robotsMatch[1]) || /noindex/i.test(robotsMatch[1])) {
    fail(`${slug}: accidentally noindexed (robots="${robotsMatch[1]}")`);
  }

  if (!/<h1[^>]*>/i.test(html)) fail(`${slug}: missing <h1>`);

  const titleText = titleMatches[0]?.replace(/<\/?title>/g, '');
  if (titleText) {
    if (seenTitles.has(titleText)) {
      fail(`${slug}: duplicate title also used by "${seenTitles.get(titleText)}" — "${titleText}"`);
    } else {
      seenTitles.set(titleText, slug);
    }
  }

  const canonicalHrefMatch = canonicalMatches[0]?.match(/href=["']([^"']+)["']/);
  const canonicalHref = canonicalHrefMatch?.[1];
  if (canonicalHref) {
    if (seenCanonicals.has(canonicalHref)) {
      fail(`${slug}: duplicate canonical also used by "${seenCanonicals.get(canonicalHref)}" — ${canonicalHref}`);
    } else {
      seenCanonicals.set(canonicalHref, slug);
    }
  }

  for (const pattern of PLACEHOLDER_PATTERNS) {
    if (pattern.test(html)) {
      fail(`${slug}: contains placeholder/boilerplate content matching ${pattern}`);
    }
  }
}

// Cross-check against what prerender-tools.js reported generating.
const markerPath = join(distDir, '__prerendered-tools.txt');
if (existsSync(markerPath)) {
  const marker = readFileSync(markerPath, 'utf-8');
  const successMatch = marker.match(/Tools Success:\s*(\d+)/);
  if (successMatch) {
    const expectedCount = Number(successMatch[1]);
    if (expectedCount !== toolSlugs.length) {
      fail(`Generated tool file count (${toolSlugs.length}) does not match prerender-tools.js's reported success count (${expectedCount})`);
    }
  }
} else {
  fail('Missing dist/__prerendered-tools.txt deploy marker');
}

console.log(`\n📊 Results: ${toolSlugs.length} tool file(s) checked`);

if (errors.length > 0) {
  console.error(`\n❌ CRITICAL failures (${errors.length}) — build cannot ship:`);
  errors.forEach((e) => console.error(`   ✗ ${e}`));
  console.error('');
  process.exit(1);
}

console.log('✅ All tool-page SEO safeguards passed\n');
process.exit(0);
