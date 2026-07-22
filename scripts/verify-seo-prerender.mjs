import { readFileSync, readdirSync, existsSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const distDir = join(__dirname, '..', 'dist');

const CHECKS = {
  TITLE: /<title>[^<]{10,}<\/title>/i,
  CANONICAL: /<link[^>]+rel=["']canonical["'][^>]+href=["']https:\/\/www\.gappsy\.com\/marketing-agencies-in-[a-z0-9-]+-united-states\/["']/i,
  ROBOTS_INDEX: /<meta[^>]+name=["']robots["'][^>]+content=["'][^"']*index[^"']*["']/i,
  NO_NOINDEX: /<meta[^>]+name=["']robots["'][^>]+content=["'][^"']*noindex[^"']*["']/i,
  H1: /<h1[^>]*>/i,
  AGENCIES_LIST: /<ol[^>]*>/i,
  MIN_LI_COUNT: null,
  JSONLD_SCHEMA: /<script[^>]+type=["']application\/ld\+json["']/i,
  ITEMLIST: /"@type"\s*:\s*"ItemList"/,
  ITEMLIST_ORDER: /"itemListOrder"\s*:\s*"https:\/\/schema\.org\/ItemListOrderAscending"/,
  CANONICAL_SELF: null,
};

let totalChecked = 0;
let totalFailed = 0;
const failures = [];

function checkFile(filePath, stateSlug, stateName) {
  if (!existsSync(filePath)) {
    failures.push({ file: filePath, issue: 'FILE_MISSING' });
    totalFailed++;
    return;
  }

  const html = readFileSync(filePath, 'utf-8');
  const fileLabel = `${stateName} (${stateSlug})`;

  const checks = [
    {
      name: 'Has <title>',
      pass: CHECKS.TITLE.test(html),
      critical: true,
    },
    {
      name: 'Has canonical pointing to correct URL',
      pass: CHECKS.CANONICAL.test(html),
      critical: true,
    },
    {
      name: 'Has robots: index,follow',
      pass: CHECKS.ROBOTS_INDEX.test(html),
      critical: true,
    },
    {
      name: 'Does NOT have noindex',
      pass: !CHECKS.NO_NOINDEX.test(html),
      critical: true,
    },
    {
      name: 'Has <h1>',
      pass: CHECKS.H1.test(html),
      critical: true,
    },
    {
      name: 'Has agency ordered list',
      pass: CHECKS.AGENCIES_LIST.test(html),
      critical: true,
    },
    {
      name: 'Has at least 25 agencies',
      pass: (html.match(/<li[^>]*>/gi) || []).length >= 25,
      critical: true,
    },
    {
      name: 'Has JSON-LD schema',
      pass: CHECKS.JSONLD_SCHEMA.test(html),
      critical: false,
    },
    {
      name: 'ItemList schema present',
      pass: CHECKS.ITEMLIST.test(html),
      critical: false,
    },
    {
      name: 'ItemList uses Ascending order',
      pass: CHECKS.ITEMLIST_ORDER.test(html),
      critical: false,
    },
  ];

  const failedChecks = checks.filter(c => !c.pass);
  if (failedChecks.length > 0) {
    failedChecks.forEach(c => {
      failures.push({ file: fileLabel, issue: c.name, critical: c.critical });
      if (c.critical) totalFailed++;
    });
    return false;
  }
  return true;
}

console.log('\n🔍 SEO Regression Check — Prerendered State Pages\n');

if (!existsSync(distDir)) {
  console.error('❌ dist/ directory not found. Run build first.');
  process.exit(1);
}

const stateFiles = readdirSync(distDir)
  .filter(f => f.match(/^marketing-agencies-in-[a-z0-9-]+-united-states\.html$/));

if (stateFiles.length === 0) {
  console.error('❌ No prerendered state HTML files found in dist/');
  process.exit(1);
}

console.log(`   Checking ${stateFiles.length} prerendered state files...\n`);

for (const file of stateFiles) {
  const stateSlug = file.replace('marketing-agencies-in-', '').replace('-united-states.html', '');
  const stateName = stateSlug.split('-').map(w => w[0].toUpperCase() + w.slice(1)).join(' ');
  const filePath = join(distDir, file);
  const passed = checkFile(filePath, stateSlug, stateName);
  totalChecked++;
  if (passed) {
    process.stdout.write('.');
  } else {
    process.stdout.write('F');
  }
}

console.log('\n');
console.log(`\n📊 Results: ${totalChecked} files checked`);

if (failures.length === 0) {
  console.log('✅ All SEO checks passed — state pages are production-safe\n');
  process.exit(0);
}

const criticalFailures = failures.filter(f => f.critical !== false);
const warnings = failures.filter(f => f.critical === false);

if (warnings.length > 0) {
  console.log(`⚠️  Warnings (${warnings.length}):`);
  warnings.forEach(f => console.log(`   ⚠  ${f.file}: ${f.issue}`));
  console.log('');
}

if (criticalFailures.length > 0) {
  console.error(`❌ CRITICAL failures (${criticalFailures.length}) — build cannot ship:`);
  criticalFailures.forEach(f => console.error(`   ✗  ${f.file}: ${f.issue}`));
  console.error('');
  process.exit(1);
}

process.exit(0);
