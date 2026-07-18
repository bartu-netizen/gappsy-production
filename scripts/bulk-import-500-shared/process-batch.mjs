// Generic processor for the compact pipe-delimited batch format used by
// batches 11 (v7), 12 (v8), 13 (v9), 10 (v10):
//   rank|name|url|categoryLabel|tier
// Usage: node process-batch.mjs <batchDir> <existingToolsSnapshotPath>
// Writes <batchDir>/processed-results.json, duplicate-report.md,
// new-tools-manifest.json. Does NOT touch the DB or migrations.
import { readFileSync, writeFileSync } from 'fs';
import { resolveCategory, TIER_SCORES } from './category-map.mjs';

const [, , batchDir, existingSnapshotPath] = process.argv;
if (!batchDir || !existingSnapshotPath) {
  console.error('Usage: node process-batch.mjs <batchDir> <existingToolsSnapshotPath>');
  process.exit(1);
}

function slugify(name) {
  return name
    .toLowerCase()
    .normalize('NFKD').replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

function normalizeUrl(u) {
  try {
    const p = new URL(u);
    const host = p.hostname.toLowerCase().replace(/^www\./, '');
    const path = p.pathname.replace(/\/+$/, '');
    return `${host}${path}`;
  } catch {
    return String(u).toLowerCase().replace(/^https?:\/\//, '').replace(/^www\./, '').replace(/\/+$/, '');
  }
}

const raw = readFileSync(`${batchDir}/source-500-list.txt`, 'utf-8');
const lines = raw.split('\n').map((l) => l.trim()).filter(Boolean);

const parsed = [];
const parseFailures = [];
for (const line of lines) {
  const parts = line.split('|');
  if (parts.length !== 5) { parseFailures.push(line); continue; }
  const [rank, name, url, categoryLabel, tier] = parts;
  if (!TIER_SCORES[tier]) { parseFailures.push(line); continue; }
  parsed.push({
    rank: Number(rank),
    name: name.trim(),
    url: url.trim(),
    categoryLabel: categoryLabel.trim(),
    tier,
    requestedSlug: slugify(name.trim()),
  });
}

console.log(`Parsed ${parsed.length} / ${lines.length} lines. Failures: ${parseFailures.length}`);
if (parseFailures.length) parseFailures.forEach((l) => console.log('  PARSE FAIL: ' + l));
if (parsed.length !== 500) console.log(`!!! WARNING: expected 500 parsed rows, got ${parsed.length}`);

const ranks = parsed.map((p) => p.rank).sort((a, b) => a - b);
const rankIssues = [];
for (let i = 0; i < ranks.length; i++) if (ranks[i] !== i + 1) rankIssues.push(`Expected rank ${i + 1}, got ${ranks[i]}`);
if (rankIssues.length) console.log('RANK ISSUES:', rankIssues.slice(0, 10));

const existingTools = JSON.parse(readFileSync(existingSnapshotPath, 'utf-8'));
const existingBySlug = new Map(existingTools.map((t) => [t.slug, t]));
const existingByUrl = new Map(existingTools.filter((t) => t.website).map((t) => [normalizeUrl(t.website), t]));

const results = parsed.map((item) => {
  const normUrl = normalizeUrl(item.url);
  const bySlug = existingBySlug.get(item.requestedSlug);
  const byUrl = existingByUrl.get(normUrl);
  const matched = bySlug || byUrl;
  const scores = TIER_SCORES[item.tier];
  return {
    ...item,
    normUrl,
    isDuplicate: Boolean(matched),
    matchedExistingId: matched ? matched.id : null,
    matchedExistingSlug: matched ? matched.slug : null,
    matchedExistingName: matched ? matched.name : null,
    matchReason: bySlug ? 'slug' : (byUrl ? 'url' : null),
    categorySlug: resolveCategory(item.categoryLabel, item.name),
    trafficScore: scores.traffic,
    seoScore: scores.seo,
    paidListingScore: scores.paid,
    opportunityScore: scores.opportunity,
    priorityTier: scores.tier,
  };
});

const seenSlugs = new Set();
for (const r of results) {
  if (r.isDuplicate) continue;
  if (seenSlugs.has(r.requestedSlug)) {
    r.isDuplicate = true;
    r.matchReason = 'within-list-collision';
  } else {
    seenSlugs.add(r.requestedSlug);
  }
}

const duplicates = results.filter((r) => r.isDuplicate);
const newTools = results.filter((r) => !r.isDuplicate);

console.log(`\nDuplicates (skip): ${duplicates.length}`);
console.log(`New tools to import: ${newTools.length}`);

writeFileSync(`${batchDir}/processed-results.json`, JSON.stringify({ parsed, results, duplicates, newTools, parseFailures }, null, 2));
console.log(`Wrote ${batchDir}/processed-results.json`);

let report = `# Duplicate report\n\nTotal list entries: ${results.length}\nGenuinely new tools: ${newTools.length}\nDuplicates skipped: ${duplicates.length}\n\n| # | Requested name | Requested slug | Matched existing | Existing slug | Reason |\n|---|---|---|---|---|---|\n`;
for (const d of duplicates) report += `| ${d.rank} | ${d.name} | ${d.requestedSlug} | ${d.matchedExistingName || '(within-list dup)'} | ${d.matchedExistingSlug || '-'} | ${d.matchReason} |\n`;
writeFileSync(`${batchDir}/duplicate-report.md`, report, 'utf-8');
console.log(`Wrote ${batchDir}/duplicate-report.md`);
