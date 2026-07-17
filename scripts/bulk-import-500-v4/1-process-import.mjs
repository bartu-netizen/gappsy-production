// Bulk 500-target import (v4, 2026-07) — batch 4. Parses the pipe-delimited
// source list, cross-references every entry against the CURRENT tools
// catalog (fresh snapshot taken right before this script ran — includes
// all 1569 tools from batches 1+2+3), and resolves each entry's "Primary
// Category" label to a real tool_categories slug.
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
  'ai','ai-writing','ai-chatbots','ai-image-generation','ai-video-generation','ai-voice','ai-coding',
  'automation','marketing','seo','social-media','email-marketing','content-marketing','sales','crm',
  'customer-support','help-desk','live-chat','analytics','business-intelligence','finance','accounting',
  'payments','invoicing','productivity','project-management','task-management','documentation',
  'knowledge-base','collaboration','design','graphic-design','video-editing','photo-editing','no-code',
  'low-code','website-builders','ecommerce','forms','surveys','scheduling','calendar','hr','recruitment',
  'legal','security','password-managers','cloud-storage','file-management','developer-tools','devops',
  'api-tools','databases','cms','hosting','communication','team-chat','video-conferencing','translation',
  'online-learning','product-management','documents-esignature','healthcare','field-service','retail-pos',
  'erp','procurement','reputation-management','community','podcast-hosting',
]);

// 3 genuinely new categories — none of the existing 70 cover dedicated time
// tracking, self-hosted media/audio/streaming tools, or the AI
// infrastructure/MLOps/observability tooling cluster, and each has a real,
// substantial tool count in this manifest (11, 23, 34 respectively) that
// justifies a dedicated, reusable category.
const NEW_CATEGORIES = [
  { slug: 'time-tracking', name: 'Time Tracking' },
  { slug: 'media-tools', name: 'Media & Audio/Video Tools' },
  { slug: 'ai-infrastructure', name: 'AI Infrastructure & MLOps' },
];
const NEW_CATEGORY_SLUGS = new Set(NEW_CATEGORIES.map((c) => c.slug));

const DEFAULT_LABEL_MAP = {
  'CRM': 'crm',
  'ERP & Business Management': 'erp',
  'Accounting': 'accounting',
  'Personal Finance': 'finance',
  'Project Management': 'project-management',
  'Productivity': 'productivity',
  'Knowledge Management': 'knowledge-base',
  'Team Communication': 'team-chat',
  'Video Conferencing': 'video-conferencing',
  'Community Platforms': 'community',
  'Social Networks': 'social-media',
  'Event Management': 'scheduling',
  'Scheduling': 'scheduling',
  'No-Code & Databases': 'no-code',
  'Headless CMS': 'cms',
  'CMS': 'cms',
  'Publishing': 'cms',
  'E-commerce': 'ecommerce',
  'Billing': 'invoicing',
  'Subscription Analytics': 'analytics',
  'Customer Success': 'customer-support',
  'Customer Support': 'customer-support',
  'IT Service Management': 'help-desk',
  'IT Asset Management': 'devops',
  'IT Infrastructure': 'devops',
  'HR Software': 'hr',
  'Time Tracking': 'time-tracking',
  'Electronic Signatures': 'documents-esignature',
  'Document Management': 'documents-esignature',
  'Cloud Storage': 'cloud-storage',
  'Object Storage': 'cloud-storage',
  'Backup': 'file-management',
  'File Synchronization': 'file-management',
  'Offline Content': 'file-management',
  'Read It Later': 'productivity',
  'Bookmarks': 'productivity',
  'Web Archiving': 'productivity',
  'Photo Management': 'cloud-storage',
  'Media Server': 'media-tools',
  'Music Server': 'media-tools',
  'Video Hosting': 'media-tools',
  'Live Streaming': 'media-tools',
  'Video Management': 'media-tools',
  'Audio Streaming': 'media-tools',
  'Podcast Hosting': 'podcast-hosting',
  'Podcasting': 'podcast-hosting',
  'Video Streaming': 'media-tools',
  'Video Production': 'media-tools',
  'Video Editing': 'video-editing',
  'Video Tools': 'video-editing',
  'Audio Editing': 'media-tools',
  'Music Production': 'media-tools',
  'DJ Software': 'media-tools',
  'Music Notation': 'media-tools',
  'Graphic Design': 'graphic-design',
  'Publishing Design': 'graphic-design',
  'Product Design': 'graphic-design',
  'Whiteboarding': 'collaboration',
  'Collaborative Drawing': 'collaboration',
  'Diagramming': 'collaboration',
  'Office Suite': 'productivity',
  'Collaborative Editing': 'collaboration',
  'Spreadsheets': 'productivity',
  'Surveys': 'surveys',
  'Forms': 'forms',
  'Web Analytics': 'analytics',
  'Feature Management': 'developer-tools',
  'Databases': 'databases',
  'Search': 'databases',
  'Vector Databases': 'databases',
  'Backend as a Service': 'developer-tools',
  'APIs': 'api-tools',
  'API Management': 'api-tools',
  'API Testing': 'api-tools',
  'Webhooks': 'api-tools',
  'Notifications': 'developer-tools',
  'Email Marketing': 'email-marketing',
  'Marketing Automation': 'email-marketing',
  'Email Infrastructure': 'developer-tools',
  'Email Testing': 'developer-tools',
  'Email Design': 'email-marketing',
  'Web Design': 'website-builders',
  'Visual Development': 'website-builders',
  'Website Builder': 'website-builders',
  'Static Site Generators': 'developer-tools',
  'Web Frameworks': 'developer-tools',
  'Documentation': 'documentation',
  'API Documentation': 'documentation',
  'Developer Portals': 'developer-tools',
  'DevOps': 'devops',
  'Version Control': 'devops',
  'CI/CD': 'devops',
  'GitOps': 'devops',
  'Kubernetes Management': 'devops',
  'Container Management': 'devops',
  'Cloud Platforms': 'hosting',
  'Cloud Management': 'devops',
  'Virtualization': 'devops',
  'Orchestration': 'devops',
  'Service Networking': 'devops',
  'Security': 'security',
  'Identity Management': 'security',
  'Authorization': 'security',
  'Secrets Management': 'security',
  'Security Operations': 'security',
  'Threat Intelligence': 'security',
  'Digital Forensics': 'security',
  'Device Management': 'security',
  'Security Monitoring': 'security',
  'Network Security': 'security',
  'Vulnerability Management': 'security',
  'Software Supply Chain': 'security',
  'Container Registry': 'devops',
  'Package Registry': 'devops',
  'Monitoring': 'devops',
  'Uptime Monitoring': 'devops',
  'Log Management': 'devops',
  'Observability': 'devops',
  'Error Tracking': 'devops',
  'Data Integration': 'automation',
  'Customer Data Platforms': 'analytics',
  'Business Intelligence': 'business-intelligence',
  'Semantic Layer': 'business-intelligence',
  'Data Transformation': 'automation',
  'Workflow Automation': 'automation',
  'Runbook Automation': 'automation',
  'MLOps': 'ai-infrastructure',
  'AI Observability': 'ai-infrastructure',
  'Prompt Management': 'ai-infrastructure',
  'AI Development': 'ai',
  'AI Assistants': 'ai-chatbots',
  'AI Infrastructure': 'ai-infrastructure',
  'Cloud Computing': 'ai-infrastructure',
  'Data Labeling': 'ai-infrastructure',
  'Computer Vision': 'ai-infrastructure',
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
