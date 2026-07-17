import { readFileSync, writeFileSync, mkdirSync, existsSync, unlinkSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath, pathToFileURL } from 'url';
import { tmpdir } from 'os';
import { createClient } from '@supabase/supabase-js';
import { build as esbuildBuild } from 'esbuild';
import { injectToolSEOTags } from './tool-seo-generator.js';
import { loadGetToolContent, fetchInChunks } from './prerender-tools.js';
import { generateComparisonSEOData, generateComparisonJSONLD, generateComparisonStaticBodyHTML } from './comparison-seo-generator.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..');

const SLUG_PATTERN = /^[a-z0-9-]+$/;

// Mirrors src/components/tools/detail/ToolFactsSidebar.tsx's PLATFORM_TAGS —
// tag slugs with no dedicated `tools` column, read from tool_tag_links.
const PLATFORM_TAG_LABELS = {
  'web-app': 'Web',
  ios: 'iOS',
  android: 'Android',
  mac: 'Mac',
  windows: 'Windows',
  'chrome-extension': 'Browser Extension',
  'desktop-app': 'Desktop App',
  'mobile-app': 'Mobile App',
};

function initSupabase() {
  const supabaseUrl = process.env.VITE_SUPABASE_URL;
  const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;
  if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase credentials not found in environment for comparison prerender');
  }
  return createClient(supabaseUrl, supabaseKey);
}

// Bundles src/data/comparisonContent/index.ts (TypeScript, used by the React
// client) into a temp ESM file so this plain Node build script can read it
// too — mirrors loadGetToolContent in prerender-tools.js.
async function loadGetComparisonContent() {
  const outfile = join(tmpdir(), `gappsy-comparison-content-${Date.now()}.mjs`);
  await esbuildBuild({
    entryPoints: [join(projectRoot, 'src/data/comparisonContent/index.ts')],
    bundle: true,
    format: 'esm',
    platform: 'node',
    outfile,
  });
  try {
    const mod = await import(pathToFileURL(outfile).href);
    return mod.getComparisonContent;
  } finally {
    try { unlinkSync(outfile); } catch { /* best-effort cleanup */ }
  }
}

async function fetchPublishedComparisons(supabase) {
  const { data, error } = await supabase
    .from('tool_comparisons')
    .select(
      'id, slug, created_at, updated_at, tool_a:tools!tool_comparisons_tool_a_id_fkey(id,slug,name,logo,pricing_model,starting_price,rating,review_count,status), tool_b:tools!tool_comparisons_tool_b_id_fkey(id,slug,name,logo,pricing_model,starting_price,rating,review_count,status)'
    )
    .eq('status', 'published')
    .order('slug', { ascending: true });

  if (error) throw new Error(`Failed to fetch published comparisons: ${error.message}`);
  // Defense in depth: RLS already enforces both tools published, but a
  // service-role-free client running this script uses the anon key same as
  // production, so this filter is redundant-but-cheap insurance against a
  // malformed embed (missing tool_a/tool_b) ever reaching the writer below.
  return (data || []).filter((c) => c.tool_a?.status === 'published' && c.tool_b?.status === 'published');
}

async function fetchTagsByToolId(supabase, toolIds) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await fetchInChunks(toolIds, (ids) => supabase.from('tool_tag_links').select('tool_id, tool_tags(slug)').in('tool_id', ids));
  if (error) throw new Error(`Failed to fetch tool tags: ${error.message}`);
  const map = new Map();
  for (const row of data || []) {
    const slugs = map.get(row.tool_id) || new Set();
    if (row.tool_tags?.slug) slugs.add(row.tool_tags.slug);
    map.set(row.tool_id, slugs);
  }
  return map;
}

async function fetchCategoriesByToolId(supabase, toolIds) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await fetchInChunks(toolIds, (ids) => supabase
    .from('tool_category_links')
    .select('tool_id, primary_category, tool_categories!inner(slug, name, status)')
    .in('tool_id', ids)
    .eq('tool_categories.status', 'published'));
  if (error) throw new Error(`Failed to fetch tool categories: ${error.message}`);
  const map = new Map();
  for (const row of data || []) {
    const existing = map.get(row.tool_id);
    if (!existing || row.primary_category) map.set(row.tool_id, row.tool_categories);
  }
  return map;
}

async function fetchPricingPlansByToolId(supabase, toolIds) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await fetchInChunks(toolIds, (ids) => supabase
    .from('tool_pricing_plans')
    .select('tool_id, plan_name, price, billing_cycle, sort_order')
    .in('tool_id', ids)
    .order('sort_order', { ascending: true }));
  if (error) throw new Error(`Failed to fetch tool pricing plans: ${error.message}`);
  const map = new Map();
  for (const row of data || []) {
    const list = map.get(row.tool_id) || [];
    list.push(row);
    map.set(row.tool_id, list);
  }
  return map;
}

function buildFacts(tool, tagSlugs) {
  return {
    rating: tool.rating || 0,
    reviewCount: tool.review_count || 0,
    pricingModel: tool.pricing_model || null,
    startingPrice: tool.starting_price || null,
    hasFreePlan: tagSlugs.has('free-plan') || tagSlugs.has('freemium'),
    hasFreeTrial: tagSlugs.has('free-trial'),
    hasApi: tagSlugs.has('api'),
    hasAI: tagSlugs.has('ai'),
    hasTeamCollaboration: tagSlugs.has('real-time-collaboration') || tagSlugs.has('team-management'),
    platforms: Object.entries(PLATFORM_TAG_LABELS).filter(([slug]) => tagSlugs.has(slug)).map(([, label]) => label),
  };
}

export async function prerenderComparisons(options = {}) {
  const { distDir: customDistDir, failOnError = true } = options;
  const distDir = customDistDir || join(projectRoot, 'dist');
  const baseHtmlPath = join(distDir, 'index.html');

  console.log('\n🚀 Starting pre-render for comparison pages...\n');

  if (!existsSync(baseHtmlPath)) {
    throw new Error('dist/index.html not found. Run Vite build first.');
  }
  const baseHtml = readFileSync(baseHtmlPath, 'utf-8');

  const supabase = initSupabase();
  const comparisons = await fetchPublishedComparisons(supabase);
  console.log(`📡 Found ${comparisons.length} published comparison(s)\n`);

  // An empty approved-comparisons set is a valid, expected state (see
  // CLAUDE.md: comparisons must never be auto-generated for every possible
  // pair) — unlike the fixed 52-state-page count, zero here is not a
  // failure, it just means nothing to prerender yet.
  if (comparisons.length === 0) {
    writeFileSync(
      join(distDir, '__prerendered-comparisons.txt'),
      `PRERENDER_COMPARISONS_COMPLETE\nTimestamp: ${new Date().toISOString()}\nComparisons Total: 0\n`,
      'utf-8'
    );
    return { success: true, successCount: 0, errorCount: 0, failedComparisons: [], comparisonsSummary: [] };
  }

  const toolIds = [...new Set(comparisons.flatMap((c) => [c.tool_a.id, c.tool_b.id]))];

  // Index comparisons by the tool IDs they involve, so each page can list
  // sibling comparisons that share either tool (mirrors the live
  // CompareDetailPage.tsx "Related Comparisons" section, but crawlable).
  const comparisonsByToolId = new Map();
  for (const c of comparisons) {
    for (const toolId of [c.tool_a.id, c.tool_b.id]) {
      const list = comparisonsByToolId.get(toolId) || [];
      list.push(c);
      comparisonsByToolId.set(toolId, list);
    }
  }
  function findRelatedComparisons(comparison) {
    const siblings = new Map();
    for (const toolId of [comparison.tool_a.id, comparison.tool_b.id]) {
      for (const other of comparisonsByToolId.get(toolId) || []) {
        if (other.slug !== comparison.slug) siblings.set(other.slug, other);
      }
    }
    return [...siblings.values()].sort((a, b) => a.slug.localeCompare(b.slug)).slice(0, 8);
  }
  const [tagsByToolId, categoriesByToolId, pricingPlansByToolId] = await Promise.all([
    fetchTagsByToolId(supabase, toolIds),
    fetchCategoriesByToolId(supabase, toolIds),
    fetchPricingPlansByToolId(supabase, toolIds),
  ]);
  const [getComparisonContent, getToolContent] = await Promise.all([loadGetComparisonContent(), loadGetToolContent()]);

  let successCount = 0;
  let errorCount = 0;
  const failedComparisons = [];
  const comparisonsSummary = [];
  const buildTimestamp = new Date().toISOString();

  for (const comparison of comparisons) {
    const { tool_a: toolA, tool_b: toolB } = comparison;
    try {
      if (!SLUG_PATTERN.test(comparison.slug)) {
        throw new Error(`slug "${comparison.slug}" is not filesystem-safe`);
      }
      const expectedSlug = `${toolA.slug}-vs-${toolB.slug}`;
      if (comparison.slug !== expectedSlug) {
        throw new Error(`stored slug "${comparison.slug}" does not match canonical ordering "${expectedSlug}"`);
      }

      const comparisonContent = getComparisonContent(comparison.slug);
      const seoData = generateComparisonSEOData({ toolA, toolB, comparisonContent });
      const jsonLd = generateComparisonJSONLD({
        toolA,
        toolB,
        comparisonContent,
        seoData,
        createdAt: comparison.created_at,
        updatedAt: comparison.updated_at,
      });
      const factsA = buildFacts(toolA, tagsByToolId.get(toolA.id) || new Set());
      const factsB = buildFacts(toolB, tagsByToolId.get(toolB.id) || new Set());
      const staticBodyHTML = generateComparisonStaticBodyHTML({
        toolA,
        toolB,
        factsA,
        factsB,
        categoryA: categoriesByToolId.get(toolA.id) || null,
        categoryB: categoriesByToolId.get(toolB.id) || null,
        plansA: pricingPlansByToolId.get(toolA.id) || [],
        plansB: pricingPlansByToolId.get(toolB.id) || [],
        contentA: getToolContent(toolA.slug),
        contentB: getToolContent(toolB.slug),
        comparisonContent,
        seoData,
        relatedComparisons: findRelatedComparisons(comparison),
      });
      const html = injectToolSEOTags(baseHtml, seoData, jsonLd, staticBodyHTML);

      const comparisonDir = join(distDir, 'compare', comparison.slug);
      mkdirSync(comparisonDir, { recursive: true });
      writeFileSync(join(comparisonDir, 'index.html'), html, 'utf-8');

      console.log(`✅ ${(`${toolA.name} vs ${toolB.name}`).padEnd(32)} → ${comparisonContent ? 'editorial content' : 'DB facts only'}`);
      successCount++;
      comparisonsSummary.push({ slug: comparison.slug, title: seoData.title, canonical: seoData.canonical });
    } catch (error) {
      console.error(`❌ ${toolA?.name || '?'} vs ${toolB?.name || '?'} → Error: ${error.message}`);
      errorCount++;
      failedComparisons.push({ slug: comparison.slug, error: error.message });
      if (failOnError) {
        throw new Error(`Comparison "${comparison.slug}" failed to generate: ${error.message}`);
      }
    }
  }

  console.log(`\n📊 Comparison prerender complete:`);
  console.log(`   ✅ Success: ${successCount} comparison page(s)`);
  if (errorCount > 0) console.log(`   ❌ Failed: ${errorCount} comparison page(s)`);

  const markerContent = `PRERENDER_COMPARISONS_COMPLETE
Timestamp: ${buildTimestamp}
Comparisons Total: ${comparisons.length}
Comparisons Success: ${successCount}
Comparisons Failed: ${errorCount}

${comparisonsSummary.map((c) => `- ${c.slug}: ${c.title}`).join('\n')}
`;
  writeFileSync(join(distDir, '__prerendered-comparisons.txt'), markerContent, 'utf-8');
  console.log(`\n✅ Deploy marker written to dist/__prerendered-comparisons.txt`);

  if (errorCount > 0 && failOnError) {
    throw new Error(`Comparison prerender failed for ${errorCount} comparison(s). Build cannot continue.`);
  }

  return { success: errorCount === 0, successCount, errorCount, failedComparisons, comparisonsSummary };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  prerenderComparisons().catch((error) => {
    console.error('\n❌ Comparison prerender failed:', error.message);
    process.exit(1);
  });
}
