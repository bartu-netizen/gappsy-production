#!/usr/bin/env node
/**
 * SEO Regression Check Script
 * Fetches pages with both normal and Googlebot UA, extracts critical SEO signals,
 * and fails with exit code 1 if any regression is detected.
 *
 * Usage:
 *   node scripts/seo-regression-check.mjs [--save baseline|after]
 */

import { writeFileSync, mkdirSync, existsSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = join(__dirname, '..');

const SAVE_MODE = process.argv.includes('--save')
  ? process.argv[process.argv.indexOf('--save') + 1]
  : null;

const NORMAL_UA =
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36';
const GOOGLEBOT_UA =
  'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)';

const TEST_URLS = [
  {
    name: 'Homepage',
    url: 'https://www.gappsy.com/',
    expectNoindex: false,
    expectH1: true,
    expectCanonical: 'https://www.gappsy.com/',
  },
  {
    name: 'New Jersey State Page',
    url: 'https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/',
    expectNoindex: false,
    expectH1: true,
    expectCanonical:
      'https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/',
  },
  {
    name: 'California State Page',
    url: 'https://www.gappsy.com/marketing-agencies-in-california-united-states/',
    expectNoindex: false,
    expectH1: true,
    expectCanonical:
      'https://www.gappsy.com/marketing-agencies-in-california-united-states/',
  },
  {
    name: 'Texas State Page',
    url: 'https://www.gappsy.com/marketing-agencies-in-texas-united-states/',
    expectNoindex: false,
    expectH1: true,
    expectCanonical:
      'https://www.gappsy.com/marketing-agencies-in-texas-united-states/',
  },
  {
    name: '/your-agency (funnel)',
    url: 'https://www.gappsy.com/your-agency',
    expectNoindex: false,
    expectH1: true,
    expectCanonical: 'https://www.gappsy.com/your-agency',
  },
];

function extractTitle(html) {
  const m = html.match(/<title[^>]*>([\s\S]*?)<\/title>/i);
  return m ? m[1].trim() : null;
}

function extractMeta(html, name) {
  const patterns = [
    new RegExp(`<meta\\s+name=["']${name}["']\\s+content=["']([^"']*?)["']`, 'i'),
    new RegExp(`<meta\\s+content=["']([^"']*?)["']\\s+name=["']${name}["']`, 'i'),
  ];
  for (const p of patterns) {
    const m = html.match(p);
    if (m) return m[1].trim();
  }
  return null;
}

function extractCanonical(html) {
  const m = html.match(/<link\s+rel=["']canonical["']\s+href=["']([^"']*?)["']/i)
    || html.match(/<link\s+href=["']([^"']*?)["']\s+rel=["']canonical["']/i);
  return m ? m[1].trim() : null;
}

function countJsonLd(html) {
  const matches = html.match(/<script\s+type=["']application\/ld\+json["'][^>]*>/gi);
  return matches ? matches.length : 0;
}

function hasH1(html) {
  return /<h1[\s>]/i.test(html);
}

function hasLoadingPlaceholder(html) {
  return />\s*Loading\.\.\.\s*</i.test(html) || />\s*Loading…\s*</i.test(html);
}

async function fetchPage(url, ua) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 20000);
  try {
    const res = await fetch(url, {
      headers: {
        'User-Agent': ua,
        Accept: 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.9',
        'Cache-Control': 'no-cache',
      },
      redirect: 'follow',
      signal: controller.signal,
    });
    clearTimeout(timeout);
    const html = await res.text();
    return { ok: true, status: res.status, html, finalUrl: res.url };
  } catch (err) {
    clearTimeout(timeout);
    return { ok: false, error: err.message, html: '', status: 0, finalUrl: url };
  }
}

function analyzeHtml(html, ua) {
  return {
    ua,
    title: extractTitle(html),
    description: extractMeta(html, 'description'),
    robots: extractMeta(html, 'robots'),
    canonical: extractCanonical(html),
    jsonLdCount: countJsonLd(html),
    hasH1: hasH1(html),
    hasLoadingPlaceholder: hasLoadingPlaceholder(html),
    htmlLength: html.length,
  };
}

async function checkPage(testCase) {
  console.log(`\n${'─'.repeat(60)}`);
  console.log(`  ${testCase.name}`);
  console.log(`  ${testCase.url}`);
  console.log('─'.repeat(60));

  const [normalResult, googlebotResult] = await Promise.all([
    fetchPage(testCase.url, NORMAL_UA),
    fetchPage(testCase.url, GOOGLEBOT_UA),
  ]);

  const errors = [];
  const warnings = [];

  if (!normalResult.ok) {
    errors.push(`FETCH FAILED (normal UA): ${normalResult.error}`);
    return { testCase, errors, warnings, normal: null, googlebot: null };
  }

  const normal = analyzeHtml(normalResult.html, 'Normal UA');
  const googlebot = googlebotResult.ok
    ? analyzeHtml(googlebotResult.html, 'Googlebot')
    : null;

  // Print normal UA analysis
  console.log(`  Status: ${normalResult.status}`);
  console.log(`  Final URL: ${normalResult.finalUrl}`);
  console.log(`  Title: ${normal.title ?? '(MISSING)'}`);
  console.log(`  Description: ${normal.description ? normal.description.substring(0, 80) + '...' : '(MISSING)'}`);
  console.log(`  Canonical: ${normal.canonical ?? '(MISSING)'}`);
  console.log(`  Robots: ${normal.robots ?? '(not set — defaults to index,follow)'}`);
  console.log(`  JSON-LD count: ${normal.jsonLdCount}`);
  console.log(`  H1 present: ${normal.hasH1}`);
  console.log(`  Loading placeholder: ${normal.hasLoadingPlaceholder}`);
  console.log(`  HTML length: ${normal.htmlLength.toLocaleString()} chars`);

  if (googlebot) {
    console.log(`  Googlebot HTML length: ${googlebot.htmlLength.toLocaleString()} chars`);
    const diff = Math.abs(normal.htmlLength - googlebot.htmlLength);
    const diffPct = ((diff / normal.htmlLength) * 100).toFixed(1);
    if (diff > 5000 && parseFloat(diffPct) > 15) {
      warnings.push(
        `Googlebot HTML differs significantly from normal UA: ${diffPct}% difference (${diff} chars)`
      );
    } else {
      console.log(`  Googlebot parity: OK (diff ${diffPct}%, ${diff} chars)`);
    }
  }

  // SEO checks
  if (!normal.title) errors.push('TITLE missing');
  if (!normal.description) warnings.push('Meta description missing');
  if (!normal.canonical) errors.push('CANONICAL missing');

  if (testCase.expectNoindex === false) {
    if (normal.robots && /noindex/i.test(normal.robots)) {
      errors.push(`UNEXPECTED NOINDEX: robots="${normal.robots}"`);
    }
    if (normal.robots && /nofollow/i.test(normal.robots)) {
      warnings.push(`nofollow found: robots="${normal.robots}"`);
    }
  }

  if (testCase.expectH1 && !normal.hasH1) {
    errors.push('H1 MISSING — crawlable content may be broken');
  }

  if (normal.hasLoadingPlaceholder) {
    errors.push('LOADING PLACEHOLDER detected — page may not be prerendered correctly');
  }

  if (testCase.expectCanonical && normal.canonical) {
    if (normal.canonical !== testCase.expectCanonical && normal.canonical !== testCase.expectCanonical.replace(/\/$/, '')) {
      warnings.push(
        `Canonical mismatch: expected "${testCase.expectCanonical}", got "${normal.canonical}"`
      );
    }
  }

  if (errors.length) {
    console.log(`  ❌ ERRORS (${errors.length}):`);
    errors.forEach((e) => console.log(`     • ${e}`));
  }
  if (warnings.length) {
    console.log(`  ⚠️  WARNINGS (${warnings.length}):`);
    warnings.forEach((w) => console.log(`     • ${w}`));
  }
  if (!errors.length && !warnings.length) {
    console.log('  ✅ All SEO checks passed');
  }

  return { testCase, errors, warnings, normal, googlebot, html: normalResult.html };
}

async function main() {
  console.log('');
  console.log('═'.repeat(60));
  console.log('  SEO REGRESSION CHECK');
  console.log(`  Mode: ${SAVE_MODE ? `saving as ${SAVE_MODE.toUpperCase()}` : 'live check'}`);
  console.log(`  Date: ${new Date().toISOString()}`);
  console.log('═'.repeat(60));

  const results = [];
  for (const testCase of TEST_URLS) {
    const result = await checkPage(testCase);
    results.push(result);
  }

  // Summary
  const allErrors = results.flatMap((r) => r.errors.map((e) => `[${r.testCase.name}] ${e}`));
  const allWarnings = results.flatMap((r) => r.warnings.map((w) => `[${r.testCase.name}] ${w}`));

  console.log('\n' + '═'.repeat(60));
  console.log('  SUMMARY');
  console.log('═'.repeat(60));

  if (allErrors.length === 0) {
    console.log('  ✅ No SEO errors detected.');
  } else {
    console.log(`  ❌ ${allErrors.length} SEO ERROR(S):`);
    allErrors.forEach((e) => console.log(`     • ${e}`));
  }

  if (allWarnings.length === 0) {
    console.log('  ✅ No warnings.');
  } else {
    console.log(`  ⚠️  ${allWarnings.length} WARNING(S):`);
    allWarnings.forEach((w) => console.log(`     • ${w}`));
  }

  // Save output if requested
  if (SAVE_MODE) {
    const docsDir = join(ROOT, 'docs');
    if (!existsSync(docsDir)) mkdirSync(docsDir, { recursive: true });

    const filename = SAVE_MODE === 'baseline' ? 'SEO_BASELINE.txt' : 'SEO_AFTER.txt';
    const outputPath = join(docsDir, filename);

    const output = results
      .map((r) => {
        const n = r.normal;
        if (!n) return `[${r.testCase.name}]\nFETCH FAILED\n`;
        return [
          `[${r.testCase.name}]`,
          `URL: ${r.testCase.url}`,
          `Title: ${n.title}`,
          `Description: ${n.description}`,
          `Canonical: ${n.canonical}`,
          `Robots: ${n.robots ?? '(not set)'}`,
          `JSON-LD count: ${n.jsonLdCount}`,
          `H1 present: ${n.hasH1}`,
          `Loading placeholder: ${n.hasLoadingPlaceholder}`,
          `HTML length: ${n.htmlLength}`,
          `Googlebot length: ${r.googlebot?.htmlLength ?? 'N/A'}`,
          `Errors: ${r.errors.join(' | ') || 'none'}`,
          `Warnings: ${r.warnings.join(' | ') || 'none'}`,
          '',
        ].join('\n');
      })
      .join('\n');

    writeFileSync(outputPath, `SEO REGRESSION SNAPSHOT\nDate: ${new Date().toISOString()}\n\n${output}`);
    console.log(`\n  Saved to: docs/${filename}`);
  }

  console.log('');

  if (allErrors.length > 0) {
    process.exit(1);
  }
}

main().catch((err) => {
  console.error('Script error:', err);
  process.exit(1);
});
