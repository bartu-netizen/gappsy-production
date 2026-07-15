import { readFileSync, writeFileSync, mkdirSync, existsSync, unlinkSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath, pathToFileURL } from 'url';
import { tmpdir } from 'os';
import { createClient } from '@supabase/supabase-js';
import { build as esbuildBuild } from 'esbuild';
import {
  generateToolSEOData,
  generateToolJSONLD,
  generateToolStaticBodyHTML,
  injectToolSEOTags,
} from './tool-seo-generator.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..');

const SLUG_PATTERN = /^[a-z0-9-]+$/;

function initSupabase() {
  const supabaseUrl = process.env.VITE_SUPABASE_URL;
  const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;
  if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase credentials not found in environment for tool prerender');
  }
  return createClient(supabaseUrl, supabaseKey);
}

// Bundles the optional per-tool `extendedContent` overlay (TypeScript, used
// by the React client) into a temp ESM file so this plain Node build script
// can read it too — an in-memory lookup, not a DB call, so it never affects
// the per-tool query count at scale. Any tool without an entry (49,999 of
// 50,000, today every tool except Canva) simply gets `undefined` back.
export async function loadGetToolContent() {
  const outfile = join(tmpdir(), `gappsy-tool-content-${Date.now()}.mjs`);
  await esbuildBuild({
    entryPoints: [join(projectRoot, 'src/data/toolContent/index.ts')],
    bundle: true,
    format: 'esm',
    platform: 'node',
    outfile,
  });
  try {
    const mod = await import(pathToFileURL(outfile).href);
    return mod.getToolContent;
  } finally {
    try { unlinkSync(outfile); } catch { /* best-effort cleanup */ }
  }
}

function groupBy(rows, keyFn) {
  const map = new Map();
  for (const row of rows || []) {
    const key = keyFn(row);
    if (!map.has(key)) map.set(key, []);
    map.get(key).push(row);
  }
  return map;
}

async function fetchAllPublishedTools(supabase) {
  const { data: tools, error } = await supabase
    .from('tools')
    .select(
      'id, slug, name, logo, website, affiliate_link, short_description, long_description, pricing_model, starting_price, youtube_url, rating, review_count, verified, featured, updated_at, founded_year, company_size, headquarters, languages'
    )
    .eq('status', 'published')
    .order('name', { ascending: true });

  if (error) throw new Error(`Failed to fetch published tools: ${error.message}`);
  return tools || [];
}

// A fixed set of bulk queries regardless of tool count — the scaling answer
// for requirement #14. 50 tools or 50,000 tools, this is the same ~4 round
// trips, never one query per tool.
async function fetchRelatedData(supabase, toolIds) {
  if (toolIds.length === 0) {
    return {
      categoryLinksByTool: new Map(), tagLinksByTool: new Map(), pricingByTool: new Map(), reviewsByTool: new Map(),
      featuresByTool: new Map(), prosByTool: new Map(), consByTool: new Map(), useCasesByTool: new Map(), faqsByTool: new Map(),
      alternativesByTool: new Map(), comparisonLinksByTool: new Map(), contentBlocksByTool: new Map(),
    };
  }

  const [catResult, tagResult, pricingResult, reviewsResult, featuresResult, prosResult, consResult, useCasesResult, faqsResult, alternativesResult, comparisonLinksResult, contentBlocksResult] = await Promise.all([
    supabase
      .from('tool_category_links')
      .select('tool_id, category_id, primary_category, tool_categories!inner(slug, name, status)')
      .in('tool_id', toolIds)
      .eq('tool_categories.status', 'published'),
    supabase.from('tool_tag_links').select('tool_id, tool_tags(slug, name)').in('tool_id', toolIds),
    supabase
      .from('tool_pricing_plans')
      .select('tool_id, id, plan_name, price, billing_cycle, description, features, sort_order')
      .in('tool_id', toolIds)
      .order('sort_order', { ascending: true }),
    supabase
      .from('tool_reviews')
      .select('tool_id, id, author_name, author_title, rating, quote, source, created_at')
      .in('tool_id', toolIds)
      .eq('status', 'published')
      .order('sort_order', { ascending: true }),
    // Database-backed editorial content — DB-first, file-fallback per field
    // (mirrors src/pages/ToolDetailPage.tsx's dbFeatures/dbPros/etc, so the
    // prerendered HTML crawlers see always matches what hydrates).
    supabase.from('tool_features').select('tool_id, title, description, sort_order').in('tool_id', toolIds).order('sort_order', { ascending: true }),
    supabase.from('tool_pros').select('tool_id, text, sort_order').in('tool_id', toolIds).order('sort_order', { ascending: true }),
    supabase.from('tool_cons').select('tool_id, text, sort_order').in('tool_id', toolIds).order('sort_order', { ascending: true }),
    supabase.from('tool_use_cases').select('tool_id, title, description, audience, sort_order').in('tool_id', toolIds).order('sort_order', { ascending: true }),
    supabase.from('tool_faqs').select('tool_id, question, answer, sort_order').in('tool_id', toolIds).eq('status', 'published').order('sort_order', { ascending: true }),
    supabase.from('tool_alternatives').select('tool_id, alternative_name, alternative_url, alternative_logo, description, pros, cons, pricing_summary, sort_order').in('tool_id', toolIds).not('description', 'is', null).order('sort_order', { ascending: true }),
    supabase.from('tool_comparison_links').select('tool_id, label, href, sort_order').in('tool_id', toolIds).order('sort_order', { ascending: true }),
    supabase.from('tool_content_blocks').select('tool_id, block_key, heading, level, paragraphs, sort_order').in('tool_id', toolIds).order('sort_order', { ascending: true }),
  ]);

  if (catResult.error) throw new Error(`Failed to fetch tool categories: ${catResult.error.message}`);
  if (tagResult.error) throw new Error(`Failed to fetch tool tags: ${tagResult.error.message}`);
  if (pricingResult.error) throw new Error(`Failed to fetch tool pricing: ${pricingResult.error.message}`);
  if (reviewsResult.error) throw new Error(`Failed to fetch tool reviews: ${reviewsResult.error.message}`);
  if (featuresResult.error) throw new Error(`Failed to fetch tool features: ${featuresResult.error.message}`);
  if (prosResult.error) throw new Error(`Failed to fetch tool pros: ${prosResult.error.message}`);
  if (consResult.error) throw new Error(`Failed to fetch tool cons: ${consResult.error.message}`);
  if (useCasesResult.error) throw new Error(`Failed to fetch tool use cases: ${useCasesResult.error.message}`);
  if (faqsResult.error) throw new Error(`Failed to fetch tool faqs: ${faqsResult.error.message}`);
  if (alternativesResult.error) throw new Error(`Failed to fetch tool alternatives: ${alternativesResult.error.message}`);
  if (comparisonLinksResult.error) throw new Error(`Failed to fetch tool comparison links: ${comparisonLinksResult.error.message}`);
  if (contentBlocksResult.error) throw new Error(`Failed to fetch tool content blocks: ${contentBlocksResult.error.message}`);

  return {
    categoryLinksByTool: groupBy(catResult.data, (r) => r.tool_id),
    tagLinksByTool: groupBy(tagResult.data, (r) => r.tool_id),
    pricingByTool: groupBy(pricingResult.data, (r) => r.tool_id),
    reviewsByTool: groupBy(reviewsResult.data, (r) => r.tool_id),
    featuresByTool: groupBy(featuresResult.data, (r) => r.tool_id),
    prosByTool: groupBy(prosResult.data, (r) => r.tool_id),
    consByTool: groupBy(consResult.data, (r) => r.tool_id),
    useCasesByTool: groupBy(useCasesResult.data, (r) => r.tool_id),
    faqsByTool: groupBy(faqsResult.data, (r) => r.tool_id),
    alternativesByTool: groupBy(alternativesResult.data, (r) => r.tool_id),
    comparisonLinksByTool: groupBy(comparisonLinksResult.data, (r) => r.tool_id),
    contentBlocksByTool: groupBy(contentBlocksResult.data, (r) => r.tool_id),
  };
}

const DB_FEATURE_ICON = 'CheckCircle2';

// Merges DB-backed editorial content over file-based extendedContent,
// per field independently — a tool with no DB rows for a given field (e.g.
// Canva and Figma today, which have none) falls back to that field's file
// content unchanged. Returns undefined only when neither source has any
// content at all, matching extendedContent's original "no entry" contract.
function mergeExtendedContent(extendedContent, related, toolId) {
  const dbFeatures = related.featuresByTool.get(toolId) || [];
  const dbPros = related.prosByTool.get(toolId) || [];
  const dbCons = related.consByTool.get(toolId) || [];
  const dbUseCases = related.useCasesByTool.get(toolId) || [];
  const dbFaqs = related.faqsByTool.get(toolId) || [];
  const dbAlternatives = related.alternativesByTool.get(toolId) || [];
  const dbComparisons = related.comparisonLinksByTool.get(toolId) || [];
  const dbContentBlocks = related.contentBlocksByTool.get(toolId) || [];

  if (
    dbFeatures.length === 0 && dbPros.length === 0 && dbCons.length === 0 && dbUseCases.length === 0 && dbFaqs.length === 0 &&
    dbAlternatives.length === 0 && dbComparisons.length === 0 && dbContentBlocks.length === 0
  ) {
    return extendedContent;
  }

  return {
    longForm: dbContentBlocks.length > 0
      ? dbContentBlocks.map((b) => ({ id: b.block_key, heading: b.heading, level: b.level, paragraphs: b.paragraphs || [] }))
      : extendedContent?.longForm || [],
    features: dbFeatures.length > 0
      ? dbFeatures.map((f) => ({ icon: DB_FEATURE_ICON, title: f.title, description: f.description || '', benefits: [] }))
      : extendedContent?.features || [],
    pros: dbPros.length > 0 ? dbPros.map((r) => r.text) : extendedContent?.pros || [],
    cons: dbCons.length > 0 ? dbCons.map((r) => r.text) : extendedContent?.cons || [],
    faqs: dbFaqs.length > 0 ? dbFaqs.map((f) => ({ question: f.question, answer: f.answer })) : extendedContent?.faqs || [],
    useCases: dbUseCases.length > 0
      ? dbUseCases.map((u) => ({ title: u.title, description: u.description || '', audience: u.audience || '' }))
      : extendedContent?.useCases || [],
    alternatives: dbAlternatives.length > 0
      ? dbAlternatives.map((a) => ({
          name: a.alternative_name || '',
          description: a.description || '',
          pros: a.pros || [],
          cons: a.cons || [],
          pricingSummary: a.pricing_summary || '',
          href: a.alternative_url || '#',
          logo: a.alternative_logo || undefined,
        }))
      : extendedContent?.alternatives || [],
    comparisons: dbComparisons.length > 0
      ? dbComparisons.map((c) => ({ label: c.label, href: c.href }))
      : extendedContent?.comparisons || [],
    transcript: extendedContent?.transcript,
  };
}

function buildToolContext(tool, related, allToolsBySlugId) {
  const categoryLinks = related.categoryLinksByTool.get(tool.id) || [];
  const categories = categoryLinks.map((r) => r.tool_categories).filter(Boolean);
  const primaryLink = categoryLinks.find((r) => r.primary_category) || categoryLinks[0] || null;
  const primaryCategory = primaryLink?.tool_categories || null;
  const primaryCategoryId = primaryLink?.category_id || null;

  const tags = (related.tagLinksByTool.get(tool.id) || []).map((r) => r.tool_tags).filter(Boolean);
  const pricingPlans = (related.pricingByTool.get(tool.id) || []).map((p) => ({
    ...p,
    features: Array.isArray(p.features) ? p.features : [],
  }));
  const reviews = related.reviewsByTool.get(tool.id) || [];

  // Related tools computed from the already-fetched category-link rows —
  // zero additional queries, works identically at 50 or 50,000 tools.
  let relatedTools = [];
  if (primaryCategoryId) {
    const sameCategoryToolIds = new Set();
    for (const [otherToolId, links] of related.categoryLinksByTool.entries()) {
      if (otherToolId === tool.id) continue;
      if (links.some((l) => l.category_id === primaryCategoryId)) sameCategoryToolIds.add(otherToolId);
    }
    relatedTools = [...sameCategoryToolIds]
      .map((id) => allToolsBySlugId.get(id))
      .filter(Boolean)
      .slice(0, 5);
  }

  return { categories, primaryCategory, tags, pricingPlans, reviews, relatedTools };
}

export async function prerenderTools(options = {}) {
  const { distDir: customDistDir, failOnError = true } = options;
  const distDir = customDistDir || join(projectRoot, 'dist');
  const baseHtmlPath = join(distDir, 'index.html');

  console.log('\n🚀 Starting pre-render for tool pages...\n');

  if (!existsSync(baseHtmlPath)) {
    throw new Error('dist/index.html not found. Run Vite build first.');
  }
  const baseHtml = readFileSync(baseHtmlPath, 'utf-8');

  const supabase = initSupabase();
  const tools = await fetchAllPublishedTools(supabase);
  console.log(`📡 Found ${tools.length} published tool(s)\n`);

  if (tools.length === 0) {
    writeFileSync(
      join(distDir, '__prerendered-tools.txt'),
      `PRERENDER_TOOLS_COMPLETE\nTimestamp: ${new Date().toISOString()}\nTools Total: 0\n`,
      'utf-8'
    );
    return { success: true, successCount: 0, errorCount: 0, failedTools: [], toolsSummary: [] };
  }

  const toolIds = tools.map((t) => t.id);
  const related = await fetchRelatedData(supabase, toolIds);
  const allToolsById = new Map(tools.map((t) => [t.id, t]));
  const getToolContent = await loadGetToolContent();

  let successCount = 0;
  let errorCount = 0;
  const failedTools = [];
  const toolsSummary = [];
  const buildTimestamp = new Date().toISOString();

  for (const tool of tools) {
    try {
      if (!SLUG_PATTERN.test(tool.slug)) {
        throw new Error(`slug "${tool.slug}" is not filesystem-safe`);
      }

      const context = buildToolContext(tool, related, allToolsById);
      const seoData = generateToolSEOData(tool);

      if (!seoData.title) throw new Error('missing title');
      if (!seoData.description) {
        throw new Error('missing short_description and long_description — cannot generate a real (non-generic) meta description');
      }

      const fileContent = getToolContent(tool.slug);
      const extendedContent = mergeExtendedContent(fileContent, related, tool.id);
      const jsonLd = generateToolJSONLD({ tool, ...context, extendedContent, seoData });
      const staticBodyHTML = generateToolStaticBodyHTML({ tool, ...context, extendedContent });
      const html = injectToolSEOTags(baseHtml, seoData, jsonLd, staticBodyHTML);

      // Directory + index.html only — Netlify serves an exact static-file
      // match before evaluating any redirect rule, so this needs no entry
      // in public/_redirects (see that file's comment for why the explicit
      // rewrite-rule approach used for state pages was tried and reverted
      // for tools specifically).
      const toolDir = join(distDir, 'tools', tool.slug);
      mkdirSync(toolDir, { recursive: true });
      writeFileSync(join(toolDir, 'index.html'), html, 'utf-8');

      console.log(`✅ ${tool.name.padEnd(24)} → ${context.primaryCategory?.name || 'uncategorized'}, ${context.pricingPlans.length} plans, ${context.reviews.length} reviews${extendedContent ? ', extended content' : ''}`);
      successCount++;
      toolsSummary.push({ slug: tool.slug, name: tool.name, title: seoData.title, canonical: seoData.canonical });
    } catch (error) {
      console.error(`❌ ${tool.name || tool.slug} → Error: ${error.message}`);
      errorCount++;
      failedTools.push({ slug: tool.slug, name: tool.name, error: error.message });
      if (failOnError) {
        throw new Error(`Tool "${tool.name}" (${tool.slug}) failed to generate: ${error.message}`);
      }
    }
  }

  console.log(`\n📊 Tool prerender complete:`);
  console.log(`   ✅ Success: ${successCount} tool pages`);
  if (errorCount > 0) console.log(`   ❌ Failed: ${errorCount} tool pages`);

  const markerContent = `PRERENDER_TOOLS_COMPLETE
Timestamp: ${buildTimestamp}
Tools Total: ${tools.length}
Tools Success: ${successCount}
Tools Failed: ${errorCount}

${toolsSummary.map((t) => `- ${t.name} (${t.slug}): ${t.title}`).join('\n')}
`;
  writeFileSync(join(distDir, '__prerendered-tools.txt'), markerContent, 'utf-8');
  console.log(`\n✅ Deploy marker written to dist/__prerendered-tools.txt`);

  if (errorCount > 0 && failOnError) {
    throw new Error(`Tool prerender failed for ${errorCount} tool(s). Build cannot continue.`);
  }

  return { success: errorCount === 0, successCount, errorCount, failedTools, toolsSummary };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  prerenderTools().catch((error) => {
    console.error('\n❌ Tool prerender failed:', error.message);
    process.exit(1);
  });
}
