import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const SCRATCH = dirname(fileURLToPath(import.meta.url));

// ---------- 1. Parse the raw 500-line list ----------
const raw = readFileSync(`${SCRATCH}/source-500-list.txt`, 'utf-8');
const lines = raw.split('\n').map((l) => l.trim()).filter(Boolean);

const LINE_RE = /^(\d+)\.\s+(.+?)\s*\|\s*(https?:\/\/\S+?)\s*\|\s*(.+?)\s*\|\s*(Traffic Anchor|Monetization Target|Emerging Opportunity)\s*\|\s*Traffic\s+(\d+)\/10\s*\|\s*SEO\s+(\d+)\/10\s*\|\s*Paid-listing\s+(\d+)\/10\s*\|\s*Gappsy URL\s+(\/tools\/[a-z0-9-]+\/)\s*$/;

const parsed = [];
const parseFailures = [];
for (const line of lines) {
  const m = line.match(LINE_RE);
  if (!m) {
    parseFailures.push(line);
    continue;
  }
  const [, rank, name, url, categoryLabel, segmentRaw, traffic, seo, paidListing, gappsyUrl] = m;
  const segmentMap = {
    'Traffic Anchor': 'traffic_anchor',
    'Monetization Target': 'monetization_target',
    'Emerging Opportunity': 'emerging_opportunity',
  };
  const slug = gappsyUrl.replace(/^\/tools\//, '').replace(/\/$/, '');
  parsed.push({
    rank: Number(rank),
    name: name.trim(),
    url: url.trim(),
    categoryLabel: categoryLabel.trim(),
    segment: segmentMap[segmentRaw],
    trafficScore: Number(traffic),
    seoScore: Number(seo),
    paidListingScore: Number(paidListing),
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

// Verify rank sequence 1..500 with no gaps/dupes
const ranks = parsed.map((p) => p.rank).sort((a, b) => a - b);
const rankIssues = [];
for (let i = 0; i < 500; i++) {
  if (ranks[i] !== i + 1) rankIssues.push(`Expected rank ${i + 1}, got ${ranks[i]}`);
}
if (rankIssues.length) console.log('RANK ISSUES:', rankIssues.slice(0, 10));

// ---------- 2. Load existing tools ----------
const existingTools = JSON.parse(readFileSync(`${SCRATCH}/existing-tools-snapshot.json`, 'utf-8'));

function normalizeUrl(u) {
  try {
    const parsed = new URL(u);
    let host = parsed.hostname.toLowerCase().replace(/^www\./, '');
    let path = parsed.pathname.replace(/\/+$/, ''); // strip trailing slash(es)
    return `${host}${path}`;
  } catch {
    return u.toLowerCase().replace(/^https?:\/\//, '').replace(/^www\./, '').replace(/\/+$/, '');
  }
}

const existingBySlug = new Map(existingTools.map((t) => [t.slug, t]));
const existingByUrl = new Map(existingTools.map((t) => [normalizeUrl(t.website), t]));

// ---------- 3. Category mapping ----------
// Existing categories confirmed present in the DB (slug -> true), so any
// mapping below is guaranteed to resolve to a real row.
const EXISTING_CATEGORY_SLUGS = new Set([
  'accounting','ai','ai-chatbots','ai-coding','ai-image-generation','ai-video-generation','ai-voice','ai-writing',
  'analytics','api-tools','automation','business-intelligence','calendar','cloud-storage','cms','collaboration',
  'communication','content-marketing','crm','customer-support','databases','design','developer-tools','devops',
  'documentation','ecommerce','email-marketing','file-management','finance','forms','graphic-design','help-desk',
  'hosting','hr','invoicing','knowledge-base','legal','live-chat','low-code','marketing','no-code','online-learning',
  'password-managers','payments','photo-editing','product-management','productivity','project-management',
  'recruitment','sales','scheduling','security','seo','social-media','surveys','task-management','team-chat',
  'translation','video-conferencing','video-editing','website-builders',
]);

// 4 genuinely new categories (nothing in the existing set covers them)
const NEW_CATEGORIES = [
  { slug: 'documents-esignature', name: 'Documents & E-signature' },
  { slug: 'healthcare', name: 'Healthcare & Wellness' },
  { slug: 'field-service', name: 'Real Estate, Construction & Field Service' },
  { slug: 'retail-pos', name: 'Retail, Restaurant & POS' },
];
const NEW_CATEGORY_SLUGS = new Set(NEW_CATEGORIES.map((c) => c.slug));

// Simple 1:1 label -> category mappings
const SIMPLE_LABEL_MAP = {
  'AI Assistants & Search': 'ai-chatbots',
  'AI Writing & Content': 'ai-writing',
  'CRM & Sales': 'crm',
  'Customer Support & Success': 'customer-support',
  'Marketing Automation & Email': 'email-marketing',
  'Project & Work Management': 'project-management',
  'Developer Tools & Cloud': 'developer-tools',
  'Documents, PDF & E-signature': 'documents-esignature',
  'Social Media Management': 'social-media',
  'Scheduling, Time & Workforce': 'scheduling',
  'Communication, Phone & Messaging': 'communication',
  'Education & Learning': 'online-learning',
  'File Transfer, Backup & Storage': 'cloud-storage',
  'Healthcare & Wellness Software': 'healthcare',
  'Legal, Contract & Compliance': 'legal',
  'Real Estate, Construction & Field Service': 'field-service',
  'Video Conferencing, Webinar & Events': 'video-conferencing',
  'Retail, Restaurant & POS': 'retail-pos',
};

// Per-tool name lists for labels that span >1 existing category.
// Anything in a label not explicitly listed here falls back to the
// label's "default" (second) bucket.
const OVERRIDES = {
  'AI Image, Video & Audio': {
    buckets: { image: 'ai-image-generation', video: 'ai-video-generation', voice: 'ai-voice' },
    default: 'video',
    image: ['Midjourney', 'Adobe Firefly', 'DALL-E', 'Stable Diffusion', 'Leonardo AI', 'Ideogram', 'Topaz Labs', 'Clipdrop', 'Remove.bg'],
    voice: ['ElevenLabs', 'Murf', 'Speechify', 'Suno', 'Udio'],
  },
  'No-Code, Automation & AI Coding': {
    buckets: { nocode: 'no-code', automation: 'automation', aicoding: 'ai-coding' },
    default: 'aicoding',
    nocode: ['Bubble', 'Glide', 'Adalo', 'Softr', 'AppSheet', 'Retool', 'Appsmith', 'Microsoft Power Apps'],
    automation: ['Zapier', 'Make', 'IFTTT', 'n8n', 'Microsoft Power Automate'],
  },
  'SEO, Analytics & Advertising': {
    buckets: { seo: 'seo', analytics: 'analytics' },
    default: 'analytics',
    seo: ['Semrush', 'Ahrefs', 'Moz Pro', 'Screaming Frog', 'Ubersuggest', 'SE Ranking', 'Serpstat', 'Mangools', 'Majestic', 'SpyFu', 'AdEspresso'],
  },
  'Finance, Accounting & Payments': {
    buckets: { accounting: 'accounting', payments: 'payments' },
    default: 'payments',
    accounting: ['QuickBooks Online', 'Xero', 'FreshBooks', 'Sage Accounting', 'Zoho Books', 'Wave', 'Odoo Accounting', 'Expensify', 'Dext'],
  },
  'Data, BI & Databases': {
    buckets: { bi: 'business-intelligence', db: 'databases' },
    default: 'db',
    bi: ['Microsoft Power BI', 'Tableau', 'Looker', 'Qlik Sense', 'Domo', 'Sisense', 'Metabase', 'Grafana', 'Looker Studio', 'Alteryx', 'KNIME', 'Talend', 'Databricks'],
  },
  'HR, Recruiting & Payroll': {
    buckets: { hr: 'hr', recruiting: 'recruitment' },
    default: 'hr',
    recruiting: ['Greenhouse', 'Lever', 'Workable', 'JazzHR', 'Ashby', 'Breezy HR', 'Teamtailor', 'Recruitee', 'Zoho Recruit', 'LinkedIn Recruiter'],
  },
  'Forms, Surveys & Research': {
    buckets: { forms: 'forms', surveys: 'surveys' },
    default: 'forms',
    surveys: ['SurveyMonkey', 'Qualtrics', 'Alchemer', 'QuestionPro', 'UserTesting', 'Maze', 'Dovetail', 'Lookback', 'UserZoom', 'Hotjar Surveys'],
  },
  'Security, IT & Passwords': {
    buckets: { pw: 'password-managers', sec: 'security' },
    default: 'sec',
    pw: ['1Password', 'LastPass', 'Dashlane', 'NordPass', 'Keeper', 'Bitwarden'],
  },
  'Ecommerce & Website Builders': {
    buckets: { ecom: 'ecommerce', site: 'website-builders' },
    default: 'site',
    ecom: ['Shopify', 'WooCommerce', 'BigCommerce', 'PrestaShop', 'Magento Open Source', 'Ecwid', 'Sellfy', 'Gumroad', 'Thinkific', 'Teachable', 'Kajabi', 'Podia', 'Thinkific Plus'],
  },
  'Design & Creative': {
    buckets: { design: 'design', graphic: 'graphic-design', video: 'video-editing' },
    default: 'design',
    graphic: ['Adobe Illustrator'],
    video: ['Final Cut Pro', 'DaVinci Resolve'],
  },
  'Productivity & Collaboration': {
    buckets: { prod: 'productivity', collab: 'collaboration' },
    default: 'prod',
    collab: ['Slack', 'Zoom', 'Microsoft Teams', 'Discord', 'Google Workspace', 'Microsoft 365'],
  },
};

function resolveCategory(item) {
  if (SIMPLE_LABEL_MAP[item.categoryLabel]) return SIMPLE_LABEL_MAP[item.categoryLabel];
  const override = OVERRIDES[item.categoryLabel];
  if (!override) {
    throw new Error(`No mapping for category label: "${item.categoryLabel}" (tool: ${item.name})`);
  }
  for (const [bucketKey, names] of Object.entries(override)) {
    if (bucketKey === 'buckets' || bucketKey === 'default') continue;
    if (names.includes(item.name)) return override.buckets[bucketKey];
  }
  return override.buckets[override.default];
}

// ---------- 4. Cross-reference against existing tools + assign category ----------
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

// Within-list slug collisions (two NEW entries requesting the same slug)
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

// Sanity: any category slug that's neither existing nor in our new-categories list?
const unknownCategories = results
  .map((r) => r.categorySlug)
  .filter((slug) => !EXISTING_CATEGORY_SLUGS.has(slug) && !NEW_CATEGORY_SLUGS.has(slug));
if (unknownCategories.length) {
  console.log('!!! UNKNOWN CATEGORY SLUGS (bug in mapping):', [...new Set(unknownCategories)]);
}

writeFileSync(`${SCRATCH}/processed_results.json`, JSON.stringify({ parsed, results, duplicates, newTools, withinListCollisions, parseFailures }, null, 2));
console.log(`\nWrote processed_results.json (${results.length} total rows)`);
