import { readFileSync, writeFileSync, mkdirSync, existsSync, unlinkSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath, pathToFileURL } from 'url';
import { tmpdir } from 'os';
import { createClient } from '@supabase/supabase-js';
import { build as esbuildBuild } from 'esbuild';
import { injectToolSEOTags } from './tool-seo-generator.js';
import { generateGroupComparisonSEOData, generateGroupComparisonJSONLD, generateGroupComparisonStaticBodyHTML } from './group-comparison-seo-generator.js';
import {
  buildFactsFlags,
  fetchTagsByToolId,
  fetchCategoriesByToolId,
  fetchPricingPlansByToolId,
  fetchProsByToolId,
  fetchConsByToolId,
  fetchUseCasesByToolId,
  fetchScreenshotsByToolId,
} from './compare-prerender-shared.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..');

const SLUG_PATTERN = /^[a-z0-9-]+$/;
const MIN_GROUP_COMPARISON_TOOLS = 3;

function initSupabase() {
  const supabaseUrl = process.env.VITE_SUPABASE_URL;
  const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;
  if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase credentials not found in environment for group comparison prerender');
  }
  return createClient(supabaseUrl, supabaseKey);
}

// Bundles src/data/groupComparisonContent/index.ts (TypeScript, used by the
// React client) into a temp ESM file so this plain Node build script can
// read it too — mirrors loadGetComparisonContent in prerender-comparisons.js.
async function loadGetGroupComparisonContent() {
  const outfile = join(tmpdir(), `gappsy-group-comparison-content-${Date.now()}.mjs`);
  await esbuildBuild({
    entryPoints: [join(projectRoot, 'src/data/groupComparisonContent/index.ts')],
    bundle: true,
    format: 'esm',
    platform: 'node',
    outfile,
  });
  try {
    const mod = await import(pathToFileURL(outfile).href);
    return mod.getGroupComparisonContent;
  } finally {
    try { unlinkSync(outfile); } catch { /* best-effort cleanup */ }
  }
}

// PostgREST caps a single response at 1000 rows by default. A plain
// .select() with no .range() silently returns only the first page once the
// table passes that cap — no error, so a growing tool_group_comparisons
// table would quietly drop pages from the prerendered build rather than
// fail loudly (see fetchAllPublishedTools in prerender-tools.js).
async function fetchPublishedGroupComparisons(supabase) {
  const PAGE_SIZE = 1000;
  const data = [];
  for (let page = 0; ; page++) {
    const { data: pageData, error } = await supabase
      .from('tool_group_comparisons')
      .select(
        'id, slug, title, created_at, updated_at, tool_group_comparison_members(sort_order, tools(id,slug,name,logo,pricing_model,starting_price,rating,review_count,status))'
      )
      .eq('status', 'published')
      .order('slug', { ascending: true })
      .range(page * PAGE_SIZE, page * PAGE_SIZE + PAGE_SIZE - 1);

    if (error) throw new Error(`Failed to fetch published group comparisons: ${error.message}`);
    data.push(...(pageData || []));
    if (!pageData || pageData.length < PAGE_SIZE) break;
  }
  // Defense in depth: RLS already enforces every member tool published, but
  // a service-role-free client running this script uses the anon key same
  // as production, so this filter is redundant-but-cheap insurance against a
  // malformed embed ever reaching the writer below.
  return (data || [])
    .map((r) => ({
      ...r,
      tools: (r.tool_group_comparison_members || [])
        .filter((m) => m.tools?.status === 'published')
        .sort((a, b) => a.sort_order - b.sort_order)
        .map((m) => m.tools),
    }))
    .filter((r) => r.tools.length >= MIN_GROUP_COMPARISON_TOOLS);
}

export async function prerenderGroupComparisons(options = {}) {
  const { distDir: customDistDir, failOnError = true } = options;
  const distDir = customDistDir || join(projectRoot, 'dist');
  const baseHtmlPath = join(distDir, 'index.html');

  console.log('\n🚀 Starting pre-render for group comparison pages...\n');

  if (!existsSync(baseHtmlPath)) {
    throw new Error('dist/index.html not found. Run Vite build first.');
  }
  const baseHtml = readFileSync(baseHtmlPath, 'utf-8');

  const supabase = initSupabase();
  const groupComparisons = await fetchPublishedGroupComparisons(supabase);
  console.log(`📡 Found ${groupComparisons.length} published group comparison(s)\n`);

  // An empty approved set is a valid, expected state (mirrors
  // prerenderComparisons) — this page type is brand new and starts at 0.
  if (groupComparisons.length === 0) {
    writeFileSync(
      join(distDir, '__prerendered-group-comparisons.txt'),
      `PRERENDER_GROUP_COMPARISONS_COMPLETE\nTimestamp: ${new Date().toISOString()}\nGroup Comparisons Total: 0\n`,
      'utf-8'
    );
    return { success: true, successCount: 0, errorCount: 0, failedGroupComparisons: [], groupComparisonsSummary: [] };
  }

  const getGroupComparisonContent = await loadGetGroupComparisonContent();

  // Same enrichment fetchToolExtras + buildFacts provide client-side for
  // GroupCompareDetailPage.tsx, fetched once for every member tool across
  // every group comparison rather than per-page, then merged in below —
  // this is what makes At a Glance / Pricing / Pros & Cons / Use Cases /
  // Screenshots actually non-empty in the crawlable static HTML.
  const toolIds = [...new Set(groupComparisons.flatMap((g) => g.tools.map((t) => t.id)))];
  const [tagsByToolId, categoriesByToolId, plansByToolId, prosByToolId, consByToolId, useCasesByToolId, screenshotsByToolId] = await Promise.all([
    fetchTagsByToolId(supabase, toolIds),
    fetchCategoriesByToolId(supabase, toolIds),
    fetchPricingPlansByToolId(supabase, toolIds),
    fetchProsByToolId(supabase, toolIds),
    fetchConsByToolId(supabase, toolIds),
    fetchUseCasesByToolId(supabase, toolIds),
    fetchScreenshotsByToolId(supabase, toolIds),
  ]);

  // Index group comparisons by the tool IDs they involve, so each page can
  // list sibling comparisons that share a member (mirrors the live
  // GroupCompareDetailPage.tsx "Related Comparisons" section, but crawlable).
  const groupComparisonsByToolId = new Map();
  for (const g of groupComparisons) {
    for (const tool of g.tools) {
      const list = groupComparisonsByToolId.get(tool.id) || [];
      list.push(g);
      groupComparisonsByToolId.set(tool.id, list);
    }
  }
  function findRelatedGroupComparisons(groupComparison) {
    const siblings = new Map();
    for (const tool of groupComparison.tools) {
      for (const other of groupComparisonsByToolId.get(tool.id) || []) {
        if (other.slug !== groupComparison.slug) siblings.set(other.slug, other);
      }
    }
    return [...siblings.values()].sort((a, b) => a.slug.localeCompare(b.slug)).slice(0, 4);
  }

  let successCount = 0;
  let errorCount = 0;
  const failedGroupComparisons = [];
  const groupComparisonsSummary = [];
  const buildTimestamp = new Date().toISOString();

  for (const groupComparison of groupComparisons) {
    try {
      if (!SLUG_PATTERN.test(groupComparison.slug)) {
        throw new Error(`slug "${groupComparison.slug}" is not filesystem-safe`);
      }
      if (groupComparison.tools.length < MIN_GROUP_COMPARISON_TOOLS) {
        throw new Error(`group comparison "${groupComparison.slug}" has fewer than ${MIN_GROUP_COMPARISON_TOOLS} published tools`);
      }

      const enrichedTools = groupComparison.tools.map((t) => ({
        id: t.id,
        slug: t.slug,
        name: t.name,
        logo: t.logo,
        pricingModel: t.pricing_model || null,
        startingPrice: t.starting_price || null,
        rating: t.rating || 0,
        reviewCount: t.review_count || 0,
        category: categoriesByToolId.get(t.id) || null,
        plans: plansByToolId.get(t.id) || [],
        pros: prosByToolId.get(t.id) || [],
        cons: consByToolId.get(t.id) || [],
        useCases: useCasesByToolId.get(t.id) || [],
        screenshots: screenshotsByToolId.get(t.id) || [],
        ...buildFactsFlags(tagsByToolId.get(t.id) || new Set()),
      }));

      const groupComparisonContent = getGroupComparisonContent(groupComparison.slug);
      const seoData = generateGroupComparisonSEOData({ groupComparison, tools: enrichedTools, groupComparisonContent });
      const jsonLd = generateGroupComparisonJSONLD({
        groupComparison,
        tools: enrichedTools,
        groupComparisonContent,
        seoData,
        createdAt: groupComparison.created_at,
        updatedAt: groupComparison.updated_at,
      });
      const staticBodyHTML = generateGroupComparisonStaticBodyHTML({
        groupComparison,
        tools: enrichedTools,
        groupComparisonContent,
        seoData,
        relatedGroupComparisons: findRelatedGroupComparisons(groupComparison),
      });
      const html = injectToolSEOTags(baseHtml, seoData, jsonLd, staticBodyHTML);

      const groupComparisonDir = join(distDir, 'compare', groupComparison.slug);
      mkdirSync(groupComparisonDir, { recursive: true });
      writeFileSync(join(groupComparisonDir, 'index.html'), html, 'utf-8');

      console.log(`✅ ${groupComparison.title.padEnd(40)} → ${groupComparisonContent ? 'editorial content' : 'DB facts only'}`);
      successCount++;
      groupComparisonsSummary.push({ slug: groupComparison.slug, title: seoData.title, canonical: seoData.canonical });
    } catch (error) {
      console.error(`❌ ${groupComparison.title || groupComparison.slug || '?'} → Error: ${error.message}`);
      errorCount++;
      failedGroupComparisons.push({ slug: groupComparison.slug, error: error.message });
      if (failOnError) {
        throw new Error(`Group comparison "${groupComparison.slug}" failed to generate: ${error.message}`);
      }
    }
  }

  console.log(`\n📊 Group comparison prerender complete:`);
  console.log(`   ✅ Success: ${successCount} group comparison page(s)`);
  if (errorCount > 0) console.log(`   ❌ Failed: ${errorCount} group comparison page(s)`);

  const markerContent = `PRERENDER_GROUP_COMPARISONS_COMPLETE
Timestamp: ${buildTimestamp}
Group Comparisons Total: ${groupComparisons.length}
Group Comparisons Success: ${successCount}
Group Comparisons Failed: ${errorCount}

${groupComparisonsSummary.map((r) => `- ${r.slug}: ${r.title}`).join('\n')}
`;
  writeFileSync(join(distDir, '__prerendered-group-comparisons.txt'), markerContent, 'utf-8');
  console.log(`\n✅ Deploy marker written to dist/__prerendered-group-comparisons.txt`);

  if (errorCount > 0 && failOnError) {
    throw new Error(`Group comparison prerender failed for ${errorCount} group comparison(s). Build cannot continue.`);
  }

  return { success: errorCount === 0, successCount, errorCount, failedGroupComparisons, groupComparisonsSummary };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  prerenderGroupComparisons().catch((error) => {
    console.error('\n❌ Group comparison prerender failed:', error.message);
    process.exit(1);
  });
}
