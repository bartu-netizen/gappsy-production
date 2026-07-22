// Bulk 500-target import (v3, 2026-07) — batch 3. Parses the pipe-delimited
// source list, cross-references every entry against the CURRENT tools
// catalog (id/slug/website snapshot taken fresh right before this script
// ran — includes all 1074 tools from batches 1+2), and resolves each
// entry's "Primary Category" label to a real tool_categories slug.
import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const SCRATCH = dirname(fileURLToPath(import.meta.url));

// ---------- 1. Parse the raw 500-line pipe-delimited list ----------
const raw = readFileSync(`${SCRATCH}/source-500-list.txt`, 'utf-8');
const lines = raw.split('\n').map((l) => l.trim()).filter(Boolean);

const parsed = [];
const parseFailures = [];
for (const line of lines) {
  const parts = line.split('|');
  if (parts.length !== 10) {
    parseFailures.push(line);
    continue;
  }
  const [rank, name, url, categoryLabel, traffic, seo, paid, opportunity, priority, suggestedUrl] = parts;
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
for (let i = 0; i < parsed.length; i++) {
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
const existingByUrl = new Map(existingTools.map((t) => [normalizeUrl(t.website), t]));

// ---------- 3. Category mapping ----------
const EXISTING_CATEGORY_SLUGS = new Set([
  'accounting','ai','ai-chatbots','ai-coding','ai-image-generation','ai-video-generation','ai-voice','ai-writing',
  'analytics','api-tools','automation','business-intelligence','calendar','cloud-storage','cms','collaboration',
  'communication','content-marketing','crm','customer-support','databases','design','developer-tools','devops',
  'documentation','documents-esignature','ecommerce','email-marketing','field-service','file-management','finance',
  'forms','graphic-design','healthcare','help-desk','hosting','hr','invoicing','knowledge-base','legal','live-chat',
  'low-code','marketing','no-code','online-learning','password-managers','payments','photo-editing',
  'product-management','productivity','project-management','recruitment','retail-pos','sales','scheduling',
  'security','seo','social-media','surveys','task-management','team-chat','translation','video-conferencing',
  'video-editing','website-builders',
]);

// 5 genuinely new categories — none of the existing 65 cover ERP suites,
// spend/procurement management, review/reputation management, community
// forum platforms, or podcast hosting, and each has enough real tools in
// this manifest (8, 9, 11, ~32, 16 respectively) to justify a dedicated,
// reusable category rather than forcing them into an ill-fitting existing one.
const NEW_CATEGORIES = [
  { slug: 'erp', name: 'ERP & Business Management' },
  { slug: 'procurement', name: 'Procurement & Spend Management' },
  { slug: 'reputation-management', name: 'Reputation Management' },
  { slug: 'community', name: 'Community Platforms' },
  { slug: 'podcast-hosting', name: 'Podcast Hosting' },
];
const NEW_CATEGORY_SLUGS = new Set(NEW_CATEGORIES.map((c) => c.slug));

// Default label -> slug mapping (used unless a per-tool override below fires)
const DEFAULT_LABEL_MAP = {
  'CRM & Sales': 'sales',
  'ERP & Business Management': 'erp',
  'HR & Recruiting': 'hr',
  'Knowledge Management': 'knowledge-base',
  'Productivity & Collaboration': 'productivity',
  'Project & Work Management': 'project-management',
  'Developer Tools': 'developer-tools',
  'Product Management': 'product-management',
  'Product Adoption': 'product-management',
  'Product Analytics': 'analytics',
  'Web Analytics': 'analytics',
  'Data & Analytics': 'automation',
  'Automation': 'automation',
  'Monitoring & Observability': 'devops',
  'Security & IT': 'security',
  'Documents & E-signature': 'documents-esignature',
  'Contract Management': 'legal',
  'Legal Tech': 'legal',
  'Healthcare Software': 'healthcare',
  'Reputation Management': 'reputation-management',
  'Local SEO': 'seo',
  'Restaurant Software': 'retail-pos',
  'Procurement Software': 'procurement',
  'Finance & Billing': 'finance',
  'Community & Customer Marketing': 'community',
  'Community Platforms': 'community',
  'Video & Events': 'video-conferencing',
  'Video & Audio': 'video-editing',
  'Podcast Hosting': 'podcast-hosting',
};

// Per-tool-name overrides for labels spanning >1 existing category (CRM
// systems vs sales-engagement tools within "CRM & Sales"; recruitment ATS
// vs generic HR within "HR & Recruiting"; payments/invoicing split within
// "Finance & Billing").
const NAME_OVERRIDES = {
  // CRM & Sales: actual CRM systems -> crm (sales default above covers
  // sales-engagement/CPQ/comp/enablement tools)
  'SuiteCRM': 'crm', 'EspoCRM': 'crm', 'YetiForce': 'crm', 'OroCRM': 'crm', 'Monica': 'crm',
  // HR & Recruiting: dedicated ATS/recruiting tools -> recruitment (hr default above)
  'OpenCATS': 'recruitment', 'Recruiterflow': 'recruitment', 'Recruit CRM': 'recruitment', 'Dover': 'recruitment',
  'Metaview': 'recruitment', 'Paraform': 'recruitment', 'Juicebox': 'recruitment', 'Findem': 'recruitment',
  'HireEZ': 'recruitment', 'SeekOut': 'recruitment',
  // Finance & Billing: payment/banking accounts -> payments (finance default above)
  'PayEm': 'payments', 'Soldo': 'payments', 'Found': 'payments', 'Lili': 'payments', 'North One': 'payments',
  'Bluevine': 'payments', 'Arc': 'payments', 'Pipe': 'payments', 'Capchase': 'payments', 'Boopos': 'payments',
  'Clearco': 'payments',
};

function resolveCategory(item) {
  if (NAME_OVERRIDES[item.name]) return NAME_OVERRIDES[item.name];
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

const duplicates = results.filter((r) => r.isDuplicate);
const newTools = results.filter((r) => !r.isDuplicate);

console.log(`\nDuplicates (skip, attach metadata to existing): ${duplicates.length}`);
console.log(`New tools to import: ${newTools.length}`);
console.log(`Within-list slug collisions: ${withinListCollisions.length}`);
if (withinListCollisions.length) console.log(withinListCollisions);

const unknownCategories = results.map((r) => r.categorySlug).filter((slug) => !EXISTING_CATEGORY_SLUGS.has(slug) && !NEW_CATEGORY_SLUGS.has(slug));
if (unknownCategories.length) {
  console.log('!!! UNKNOWN CATEGORY SLUGS (bug in mapping):', [...new Set(unknownCategories)]);
}

writeFileSync(`${SCRATCH}/processed-results.json`, JSON.stringify({ parsed, results, duplicates, newTools, withinListCollisions, parseFailures, newCategories: NEW_CATEGORIES }, null, 2));
console.log(`\nWrote processed-results.json (${results.length} total rows)`);
