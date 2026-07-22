// Bulk 500-target import (v2, 2026-07) — parses the pipe-delimited source
// list, cross-references every entry against the CURRENT tools catalog
// (id/slug/website snapshot taken fresh right before this script ran, i.e.
// includes the 436 tools from the first bulk-500 batch), and resolves each
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

// ---------- 2. Load existing tools (fresh snapshot, includes prior bulk batch) ----------
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

// Default label -> slug mapping (used unless a per-tool override below fires)
const DEFAULT_LABEL_MAP = {
  'AI & Agents': 'ai',
  'AI Video & Audio': 'ai-video-generation',
  'Sales & Lead Gen': 'sales',
  'CRM & Revenue': 'crm',
  'Marketing & Growth': 'marketing',
  'SEO & Content': 'seo',
  'Social & Creator': 'social-media',
  'Productivity & PM': 'productivity',
  'Developer Tools': 'developer-tools',
  'Cloud & Infrastructure': 'hosting',
  'Databases & Backend': 'databases',
  'No-code & Automation': 'automation',
  'Website & Commerce': 'website-builders',
  'Customer Support': 'customer-support',
  'HR & Recruiting': 'hr',
  'Finance & Billing': 'finance',
  'Product Analytics': 'analytics',
  'Security & IT': 'security',
  'Forms & Scheduling': 'forms',
  'Design & Creative': 'design',
};

// Per-tool-name overrides for labels spanning >1 existing category.
const NAME_OVERRIDES = {
  // AI Video & Audio: voice/audio tools -> ai-voice (video default above)
  'Krisp': 'ai-voice', 'Auphonic': 'ai-voice', 'Resemble AI': 'ai-voice', 'PlayHT': 'ai-voice',
  'LOVO': 'ai-voice', 'WellSaid Labs': 'ai-voice', 'Listnr': 'ai-voice', 'Rask AI': 'ai-voice',
  'Podcastle': 'ai-voice', 'Cleanvoice': 'ai-voice',
  // CRM & Revenue: subscription/revenue analytics -> analytics (crm default above)
  'RevenueCat': 'analytics', 'ChartMogul': 'analytics', 'Baremetrics': 'analytics', 'Maxio': 'analytics',
  // Marketing & Growth: transactional/email-infra -> email-marketing (marketing default above)
  'Ortto': 'email-marketing', 'Encharge': 'email-marketing', 'Userlist': 'email-marketing', 'Loops': 'email-marketing',
  'Resend': 'email-marketing', 'Postmark': 'email-marketing', 'Mailgun': 'email-marketing', 'SendGrid': 'email-marketing',
  'Elastic Email': 'email-marketing', 'EmailOctopus': 'email-marketing', 'Campaigner': 'email-marketing',
  'Benchmark Email': 'email-marketing', 'Sender': 'email-marketing', 'SendPulse': 'email-marketing',
  'Maropost': 'email-marketing', 'Autopilot': 'email-marketing', 'Vero': 'email-marketing',
  // Productivity & PM: knowledge-base wikis, communication apps, calendar apps
  'Slite': 'knowledge-base', 'Nuclino': 'knowledge-base', 'Tettra': 'knowledge-base', 'Guru': 'knowledge-base',
  'Document360': 'knowledge-base', 'Helpjuice': 'knowledge-base', 'Archbee': 'knowledge-base',
  'ClickHelp': 'knowledge-base', 'Slab': 'knowledge-base', 'Outline': 'knowledge-base',
  'Superhuman': 'communication', 'Spark Mail': 'communication', 'Missive': 'communication', 'Spike': 'communication',
  'Twist': 'communication', 'Threads': 'communication',
  'Motion': 'calendar', 'Akiflow': 'calendar', 'Sunsama': 'calendar', 'Routine': 'calendar', 'Morgen': 'calendar',
  'Amie': 'calendar', 'Cron': 'calendar',
  // Developer Tools: infra observability/uptime -> devops (developer-tools default above)
  'UptimeRobot': 'devops', 'Pingdom': 'devops', 'Instatus': 'devops', 'Pulsetic': 'devops', 'Checkly': 'devops',
  'Better Uptime': 'devops', 'Better Stack': 'devops', 'Sematext': 'devops', 'Papertrail': 'devops', 'Axiom': 'devops',
  // No-code & Automation: true no-code app builders -> no-code (automation default above)
  'Ninox': 'no-code', 'Stacker': 'no-code', 'Noloco': 'no-code', 'WeWeb': 'no-code', 'Bildr': 'no-code',
  'Bravo Studio': 'no-code', 'Kissflow': 'no-code', 'Pipefy': 'no-code', 'Tallyfy': 'no-code',
  // Website & Commerce: headless CMS / blogging -> cms (website-builders default above)
  'Ghost': 'cms', 'Substack': 'cms', 'Letterdrop': 'cms', 'ButterCMS': 'cms', 'Contentful': 'cms',
  'Storyblok': 'cms', 'Prismic': 'cms', 'DatoCMS': 'cms', 'Strapi': 'cms', 'Sanity': 'cms', 'Directus': 'cms',
  'Payload CMS': 'cms', 'Hygraph': 'cms',
  // Customer Support: live-chat widgets and dedicated help-desk ticketing
  'Userlike': 'live-chat', 'Smartsupp': 'live-chat', 'Chaport': 'live-chat', 'JivoChat': 'live-chat',
  'HelpCrunch': 'help-desk', 'SupportBee': 'help-desk', 'ProProfs Help Desk': 'help-desk', 'LiveAgent': 'help-desk',
  'TeamSupport': 'help-desk', 'Deskpro': 'help-desk',
  // HR & Recruiting: dedicated ATS/recruiting tools -> recruitment (hr default above)
  'Pinpoint': 'recruitment', 'Manatal': 'recruitment', 'Comeet': 'recruitment', 'Jobvite': 'recruitment',
  'SmartRecruiters': 'recruitment', 'iCIMS': 'recruitment', 'Bullhorn': 'recruitment', 'Gem': 'recruitment',
  'Fetcher': 'recruitment', 'AmazingHiring': 'recruitment',
  // Finance & Billing: payment processors and invoicing/billing platforms
  'Tipalti': 'payments', 'AvidXchange': 'payments', 'Melio': 'payments', 'Payoneer': 'payments',
  'GoCardless': 'payments', 'Mollie': 'payments', 'Checkout.com': 'payments', 'Braintree': 'payments',
  'FastSpring': 'invoicing', 'Lemon Squeezy': 'invoicing', 'Orb': 'invoicing', 'Metronome': 'invoicing',
  'Billsby': 'invoicing',
  // Forms & Scheduling: dedicated scheduling tools -> scheduling (forms default above)
  'Cal.com': 'scheduling', 'SavvyCal': 'scheduling', 'Zencal': 'scheduling', 'OnceHub': 'scheduling',
  'YouCanBookMe': 'scheduling', 'Setmore': 'scheduling', 'Appointlet': 'scheduling', 'Calday': 'scheduling',
  'Doodle': 'scheduling', 'Rallly': 'scheduling', 'LettuceMeet': 'scheduling', 'Zeeg': 'scheduling',
  'Cronofy': 'scheduling',
  // Design & Creative: graphic-design templates, video/screen recording, photo capture
  'Visme': 'graphic-design', 'Piktochart': 'graphic-design', 'Venngage': 'graphic-design', 'Snappa': 'graphic-design',
  'RelayThat': 'graphic-design', 'Marq': 'graphic-design', 'Kittl': 'graphic-design', 'Artboard Studio': 'graphic-design',
  'Rotato': 'video-editing', 'Shots': 'video-editing', 'Screen Studio': 'video-editing', 'Tella': 'video-editing',
  'ScreenFlow': 'video-editing', 'Camtasia': 'video-editing', 'Jitter': 'video-editing',
  'CleanShot X': 'photo-editing', 'Xnapper': 'photo-editing', 'Zight': 'photo-editing',
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

const unknownCategories = results.map((r) => r.categorySlug).filter((slug) => !EXISTING_CATEGORY_SLUGS.has(slug));
if (unknownCategories.length) {
  console.log('!!! UNKNOWN CATEGORY SLUGS (bug in mapping):', [...new Set(unknownCategories)]);
}

writeFileSync(`${SCRATCH}/processed-results.json`, JSON.stringify({ parsed, results, duplicates, newTools, withinListCollisions, parseFailures }, null, 2));
console.log(`\nWrote processed-results.json (${results.length} total rows)`);
