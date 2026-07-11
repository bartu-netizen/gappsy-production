#!/usr/bin/env node
/**
 * SEO indexability regression check.
 *
 * Rules:
 *   - State pages (/marketing-agencies-in-*-united-states/) must NEVER
 *     contain noindex in their prerendered HTML.
 *   - Sitemap must only contain allowlisted URLs.
 *   - Funnel pages must carry useNoindex (React meta) in source.
 *   - Netlify config must X-Robots-Tag: noindex,nofollow for funnel paths.
 *   - robots.txt must NOT Disallow /your-agency (root must stay crawlable).
 *   - No file in src/ public/data or netlify.toml may reference gappsy.bolt.host.
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.join(__dirname, '..');

const errors = [];
const fail = (msg) => errors.push(msg);

function readIfExists(p) {
  try { return fs.readFileSync(p, 'utf8'); } catch { return null; }
}

// 1. State pages must not be noindex in prerendered HTML.
const distDir = path.join(ROOT, 'dist');
if (fs.existsSync(distDir)) {
  const stateHtmlDirs = fs.readdirSync(distDir).filter(
    (name) => /^marketing-agencies-in-[a-z-]+-united-states$/.test(name)
  );
  if (stateHtmlDirs.length < 52) {
    fail(`Expected >=52 prerendered state pages, got ${stateHtmlDirs.length}`);
  }
  for (const dir of stateHtmlDirs) {
    const html = readIfExists(path.join(distDir, dir, 'index.html'));
    if (!html) { fail(`Missing prerendered HTML for ${dir}`); continue; }
    const robotsMatch = html.match(/<meta[^>]+name=["']robots["'][^>]+content=["']([^"']+)["']/i);
    if (robotsMatch && /noindex/i.test(robotsMatch[1])) {
      fail(`State page ${dir} has noindex in robots meta: ${robotsMatch[1]}`);
    }
    const canonMatch = html.match(/<link[^>]+rel=["']canonical["'][^>]+href=["']([^"']+)["']/i);
    if (!canonMatch) fail(`State page ${dir} missing canonical link`);
    else if (!canonMatch[1].startsWith('https://www.gappsy.com/')) {
      fail(`State page ${dir} canonical not on canonical domain: ${canonMatch[1]}`);
    }
    if (/gappsy\.bolt\.host/.test(html)) {
      fail(`State page ${dir} contains gappsy.bolt.host`);
    }
  }
}

// 2. Sitemap allowlist.
const sitemap = readIfExists(path.join(ROOT, 'public', 'sitemap.xml'));
if (!sitemap) fail('Missing public/sitemap.xml');
else {
  const locs = Array.from(sitemap.matchAll(/<loc>([^<]+)<\/loc>/g)).map((m) => m[1]);
  const allowed = [
    /^https:\/\/www\.gappsy\.com\/$/,
    /^https:\/\/www\.gappsy\.com\/marketing-agencies\/$/,
    /^https:\/\/www\.gappsy\.com\/marketing-agencies\/usa\/$/,
    /^https:\/\/www\.gappsy\.com\/marketing-agencies-in-[a-z-]+-united-states\/$/,
    /^https:\/\/www\.gappsy\.com\/your-agency$/,
    /^https:\/\/www\.gappsy\.com\/appbuilder\/$/,
    /^https:\/\/www\.gappsy\.com\/analytics\/$/,
    /^https:\/\/www\.gappsy\.com\/proof\/$/,
    /^https:\/\/www\.gappsy\.com\/about\/$/,
    /^https:\/\/www\.gappsy\.com\/contact\/$/,
    /^https:\/\/www\.gappsy\.com\/editorial-policy\/$/,
    /^https:\/\/www\.gappsy\.com\/terms\/$/,
    /^https:\/\/www\.gappsy\.com\/privacy\/$/,
    /^https:\/\/www\.gappsy\.com\/tools\/[a-z0-9-]+\/$/,
    /^https:\/\/www\.gappsy\.com\/tool-categories\/$/,
    /^https:\/\/www\.gappsy\.com\/tool-categories\/[a-z0-9-]+\/$/,
    /^https:\/\/www\.gappsy\.com\/compare\/$/,
    /^https:\/\/www\.gappsy\.com\/compare\/[a-z0-9-]+-vs-[a-z0-9-]+\/$/,
  ];
  for (const loc of locs) {
    if (!allowed.some((re) => re.test(loc))) {
      fail(`Sitemap contains non-allowlisted URL: ${loc}`);
    }
  }
  const stateCount = locs.filter((l) => /marketing-agencies-in-[a-z-]+-united-states\/$/.test(l)).length;
  if (stateCount < 52) fail(`Sitemap has ${stateCount} state URLs, expected >=52`);
}

// 3. Funnel pages must include useNoindex.
const funnelPages = [
  'RequestReplayPage', 'SmartContinuePage', 'ManageListingPage',
  'OfferRedirectPage', 'ActivationUpgradePage', 'StandardUpgradeOfferPage',
  'SpotlightConfirmPage', 'Top25ConfirmPage', 'Top25UpgradeLandingPage',
  'Top25ClaimConfirmPage', 'OrderCompletePage', 'EmailPreferencesPage',
];
for (const f of funnelPages) {
  const src = readIfExists(path.join(ROOT, 'src', 'pages', `${f}.tsx`));
  if (!src) { fail(`Missing funnel page: ${f}`); continue; }
  if (!src.includes('useNoindex')) {
    fail(`Funnel page ${f} does not call useNoindex()`);
  }
}

// 4. YourAgency child pages must carry noindex; root page must not.
const profile = readIfExists(path.join(ROOT, 'src', 'pages', 'YourAgencyProfilePage.tsx'));
if (profile && !/const noindexMeta = true/.test(profile)) {
  fail('YourAgencyProfilePage must set noindexMeta = true');
}
const tokenPage = readIfExists(path.join(ROOT, 'src', 'pages', 'YourAgencyTokenPage.tsx'));
if (tokenPage && !/const noindexMeta = true/.test(tokenPage)) {
  fail('YourAgencyTokenPage must set noindexMeta = true');
}
const searchPage = readIfExists(path.join(ROOT, 'src', 'pages', 'YourAgencySearchPage.tsx'));
if (searchPage && /noindex={true}/.test(searchPage)) {
  fail('YourAgencySearchPage must not be noindex (root must be indexable)');
}

// 5. Netlify X-Robots-Tag presence for critical funnel paths.
const netlifyToml = readIfExists(path.join(ROOT, 'netlify.toml'));
if (!netlifyToml) fail('Missing netlify.toml');
else {
  const requiredPaths = [
    '/continue/*', '/request-replay/*', '/manage-listing/*', '/offer/*',
    '/activation/*', '/standard/*', '/spotlight/*', '/top-25/*', '/top25/*',
    '/order/*', '/success', '/email-preferences', '/your-agency/*',
  ];
  for (const p of requiredPaths) {
    const block = new RegExp(`\\[\\[headers\\]\\][\\s\\S]*?for\\s*=\\s*"${p.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}"[\\s\\S]*?X-Robots-Tag\\s*=\\s*"noindex`, 'm');
    if (!block.test(netlifyToml)) {
      fail(`netlify.toml missing X-Robots-Tag noindex header for ${p}`);
    }
  }
  // Root /your-agency must NOT be noindex. Scan only the block that
  // starts at `for = "/your-agency"` (not `/your-agency/*`) up to the
  // next `[[headers]]` or `[[redirects]]` section.
  const rootYaMatch = netlifyToml.match(/for\s*=\s*"\/your-agency"\s*\n([\s\S]*?)(?=\n\[\[)/);
  if (rootYaMatch && /X-Robots-Tag\s*=\s*"[^"]*noindex/i.test(rootYaMatch[1])) {
    fail('netlify.toml must NOT set noindex X-Robots-Tag on /your-agency root');
  }
}

// 6. robots.txt must NOT disallow /your-agency root.
const robots = readIfExists(path.join(ROOT, 'public', 'robots.txt'));
if (!robots) fail('Missing public/robots.txt');
else if (/^Disallow:\s*\/your-agency\s*$/m.test(robots)) {
  fail('robots.txt must not Disallow /your-agency (root must be crawlable)');
}

// 7. No bolt.host references in shipped source/config.
const scanForBolt = [
  ['src', ['.tsx', '.ts']],
  ['public/data', ['.json']],
];
for (const [rel, exts] of scanForBolt) {
  const dir = path.join(ROOT, rel);
  if (!fs.existsSync(dir)) continue;
  const walk = (d) => {
    for (const entry of fs.readdirSync(d, { withFileTypes: true })) {
      const full = path.join(d, entry.name);
      if (entry.isDirectory()) walk(full);
      else if (exts.some((e) => entry.name.endsWith(e))) {
        const content = readIfExists(full);
        if (content && /gappsy\.bolt\.host/.test(content)) {
          fail(`gappsy.bolt.host reference found in ${path.relative(ROOT, full)}`);
        }
      }
    }
  };
  walk(dir);
}
if (netlifyToml && /gappsy\.bolt\.host/.test(netlifyToml)) {
  fail('gappsy.bolt.host reference found in netlify.toml');
}

// Report
if (errors.length > 0) {
  console.error('SEO indexability regression check FAILED:');
  for (const e of errors) console.error('  - ' + e);
  process.exit(1);
}
console.log('SEO indexability regression check passed.');
