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
async function loadGetToolContent() {
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
    return { categoryLinksByTool: new Map(), tagLinksByTool: new Map(), pricingByTool: new Map(), reviewsByTool: new Map() };
  }

  const [catResult, tagResult, pricingResult, reviewsResult] = await Promise.all([
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
  ]);

  if (catResult.error) throw new Error(`Failed to fetch tool categories: ${catResult.error.message}`);
  if (tagResult.error) throw new Error(`Failed to fetch tool tags: ${tagResult.error.message}`);
  if (pricingResult.error) throw new Error(`Failed to fetch tool pricing: ${pricingResult.error.message}`);
  if (reviewsResult.error) throw new Error(`Failed to fetch tool reviews: ${reviewsResult.error.message}`);

  return {
    categoryLinksByTool: groupBy(catResult.data, (r) => r.tool_id),
    tagLinksByTool: groupBy(tagResult.data, (r) => r.tool_id),
    pricingByTool: groupBy(pricingResult.data, (r) => r.tool_id),
    reviewsByTool: groupBy(reviewsResult.data, (r) => r.tool_id),
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

      const extendedContent = getToolContent(tool.slug);
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
