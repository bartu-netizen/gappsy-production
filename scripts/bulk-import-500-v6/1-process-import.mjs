// Bulk 500-target import (v6, 2026-07) — batch 6, heavily open-source/
// self-hosted (Awesome-Selfhosted catalog). Parses the numbered
// "N. Software: X | Official Website: Y | Primary Category: Z | ..." source
// list, cross-references every entry against the CURRENT tools catalog
// (fresh snapshot including all 2037 tools from batches 1-5), and resolves
// each entry's "Primary Category" label to a real tool_categories slug.
import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const SCRATCH = dirname(fileURLToPath(import.meta.url));

// ---------- 1. Parse the raw 500-line numbered list ----------
const raw = readFileSync(`${SCRATCH}/source-500-list.txt`, 'utf-8');
const lines = raw.split('\n').map((l) => l.trim()).filter(Boolean);

const LINE_RE = /^(\d+)\.\s*Software:\s*(.+?)\s*\|\s*Official Website:\s*(.+?)\s*\|\s*Primary Category:\s*(.+?)\s*\|\s*Traffic Potential:\s*([\d.]+)\s*\|\s*SEO Rankability:\s*([\d.]+)\s*\|\s*Paid Listing Potential:\s*([\d.]+)\s*\|\s*Gappsy Opportunity:\s*([\d.]+)\s*\|\s*Priority:\s*(.+?)\s*\|\s*Suggested Gappsy URL:\s*(\/tools\/[a-z0-9-]+\/?)/;

const parsed = [];
const parseFailures = [];
for (const line of lines) {
  const m = line.match(LINE_RE);
  if (!m) {
    parseFailures.push(line);
    continue;
  }
  const [, rank, name, url, categoryLabel, traffic, seo, paid, opportunity, priority, suggestedUrl] = m;
  const slug = suggestedUrl.replace(/^\/tools\//, '').replace(/\/$/, '');
  parsed.push({
    rank: Number(rank),
    name: name.trim(),
    url: url.trim(),
    categoryLabel: categoryLabel.trim(),
    trafficScore: Number(traffic),
    seoScore: Number(seo),
    paidListingScore: Number(paid),
    opportunityScore: Number(opportunity),
    priorityTier: priority.trim(),
    requestedSlug: slug,
  });
}

console.log(`Parsed ${parsed.length} / ${lines.length} lines. Failures: ${parseFailures.length}`);
if (parseFailures.length) {
  console.log('PARSE FAILURES:');
  parseFailures.forEach((l) => console.log('  ' + l));
}
if (parsed.length !== 500) {
  console.log(`!!! WARNING: expected 500 parsed rows, got ${parsed.length}`);
}

const ranks = parsed.map((p) => p.rank).sort((a, b) => a - b);
const rankIssues = [];
for (let i = 0; i < ranks.length; i++) {
  if (ranks[i] !== i + 1) rankIssues.push(`Expected rank ${i + 1}, got ${ranks[i]}`);
}
if (rankIssues.length) console.log('RANK ISSUES:', rankIssues.slice(0, 10));

// ---------- 2. Load existing tools (fresh snapshot, includes prior batches) ----------
const existingTools = JSON.parse(readFileSync(`${SCRATCH}/existing-tools-snapshot.json`, 'utf-8'));

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

const existingBySlug = new Map(existingTools.map((t) => [t.slug, t]));
const existingByUrl = new Map(existingTools.filter((t) => t.website).map((t) => [normalizeUrl(t.website), t]));

// ---------- 3. Category mapping ----------
const EXISTING_CATEGORY_SLUGS = new Set(
  JSON.parse(readFileSync(`${SCRATCH}/category-ids-snapshot.json`, 'utf-8')).map((c) => c.slug)
);

// 2 genuinely new categories — Gaming (28 tools: game engines, game
// servers, admin panels) and IoT (17 tools: home automation, smart-home
// platforms, firmware) have no existing equivalent and a real, substantial
// tool count in this manifest justifying a dedicated category. Every other
// niche cluster below threshold (genealogy, manufacturing/3D-printing,
// mapping/GPS, inventory, CSA/industry) folds into the closest existing
// generic category instead of proliferating thin new ones.
const NEW_CATEGORIES = [
  { slug: 'gaming', name: 'Gaming & Game Servers' },
  { slug: 'iot', name: 'Internet of Things (IoT) & Home Automation' },
];
const NEW_CATEGORY_SLUGS = new Set(NEW_CATEGORIES.map((c) => c.slug));

const DEFAULT_LABEL_MAP = {
  'Analytics': 'analytics',
  'Document Management': 'documents-esignature',
  'Workflow Automation': 'automation',
  'Blogging Platforms': 'cms',
  'Scheduling': 'scheduling',
  'Bookmark Management': 'productivity',
  'Calendar & Contacts': 'calendar',
  'Team Communication': 'team-chat',
  'Email Software': 'communication',
  'Email Infrastructure': 'communication',
  'Email Marketing': 'email-marketing',
  'VoIP Software': 'communication',
  'Community Platforms': 'community',
  'Video Conferencing': 'video-conferencing',
  'Industry Software': 'productivity',
  'Event Management': 'scheduling',
  'CMS': 'cms',
  'CRM': 'crm',
  'Databases': 'databases',
  'Network Utilities': 'devops',
  'E-book Management': 'media-tools',
  'Library Software': 'media-tools',
  'E-commerce': 'ecommerce',
  'Feed Readers': 'productivity',
  'File Management': 'file-management',
  'Cloud Storage': 'cloud-storage',
  'File Sharing': 'file-management',
  'Gaming Software': 'gaming',
  'Genealogy Software': 'productivity',
  'AI & Agents': 'ai-infrastructure',
  'Collaboration Software': 'collaboration',
  'Health & Fitness Software': 'healthcare',
  'HR Software': 'hr',
  'IoT Software': 'iot',
  'Inventory Management': 'erp',
  'Knowledge Management': 'knowledge-base',
  'Learning Management': 'online-learning',
  'Manufacturing Software': 'productivity',
  'Mapping & GIS': 'productivity',
  'Media Management': 'media-tools',
  'Audio Streaming': 'media-tools',
  'Media Streaming': 'media-tools',
  'Video Streaming': 'media-tools',
  'Utilities': 'productivity',
};

function resolveCategory(item) {
  const mapped = DEFAULT_LABEL_MAP[item.categoryLabel];
  if (!mapped) throw new Error(`No mapping for category label: "${item.categoryLabel}" (tool: ${item.name})`);
  return mapped;
}

// ---------- 4. Cross-reference + assign category ----------
const results = parsed.map((item) => {
  const normUrl = normalizeUrl(item.url);
  const bySlug = existingBySlug.get(item.requestedSlug);
  const byUrl = existingByUrl.get(normUrl);
  const matched = bySlug || byUrl;
  const matchReason = bySlug ? 'slug' : (byUrl ? 'url' : null);
  const categorySlug = resolveCategory(item);
  return {
    ...item,
    normUrl,
    isDuplicate: Boolean(matched),
    matchedExistingId: matched ? matched.id : null,
    matchedExistingSlug: matched ? matched.slug : null,
    matchedExistingName: matched ? matched.name : null,
    matchReason,
    categorySlug,
    isNewCategory: NEW_CATEGORY_SLUGS.has(categorySlug),
  };
});

const slugCounts = new Map();
for (const r of results) {
  if (r.isDuplicate) continue;
  slugCounts.set(r.requestedSlug, (slugCounts.get(r.requestedSlug) || 0) + 1);
}
const withinListCollisions = [...slugCounts.entries()].filter(([, count]) => count > 1);

// A within-list slug collision means the SECOND (and later) occurrence
// would silently violate the slug UNIQUE constraint at apply time — treat
// every occurrence after the first as a duplicate-to-skip instead.
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
console.log(`Within-list slug collisions: ${withinListCollisions.length}`);
if (withinListCollisions.length) console.log(withinListCollisions);

const unknownCategories = results.map((r) => r.categorySlug).filter((slug) => !EXISTING_CATEGORY_SLUGS.has(slug) && !NEW_CATEGORY_SLUGS.has(slug));
if (unknownCategories.length) {
  console.log('!!! UNKNOWN CATEGORY SLUGS (bug in mapping):', [...new Set(unknownCategories)]);
}

writeFileSync(`${SCRATCH}/processed-results.json`, JSON.stringify({ parsed, results, duplicates, newTools, withinListCollisions, parseFailures, newCategories: NEW_CATEGORIES }, null, 2));
console.log(`\nWrote processed-results.json (${results.length} total rows)`);
