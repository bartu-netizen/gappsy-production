import { readFileSync, writeFileSync, mkdirSync, existsSync, unlinkSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath, pathToFileURL } from 'url';
import { tmpdir } from 'os';
import { createClient } from '@supabase/supabase-js';
import { build as esbuildBuild } from 'esbuild';
import { injectToolSEOTags } from './tool-seo-generator.js';
import { generateGroupComparisonSEOData, generateGroupComparisonJSONLD, generateGroupComparisonStaticBodyHTML } from './group-comparison-seo-generator.js';

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

async function fetchPublishedGroupComparisons(supabase) {
  const { data, error } = await supabase
    .from('tool_group_comparisons')
    .select(
      'id, slug, title, created_at, updated_at, tool_group_comparison_members(sort_order, tools(id,slug,name,logo,pricing_model,starting_price,status))'
    )
    .eq('status', 'published')
    .order('slug', { ascending: true });

  if (error) throw new Error(`Failed to fetch published group comparisons: ${error.message}`);
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

      const groupComparisonContent = getGroupComparisonContent(groupComparison.slug);
      const seoData = generateGroupComparisonSEOData({ groupComparison, tools: groupComparison.tools, groupComparisonContent });
      const jsonLd = generateGroupComparisonJSONLD({
        groupComparison,
        tools: groupComparison.tools,
        groupComparisonContent,
        seoData,
        createdAt: groupComparison.created_at,
        updatedAt: groupComparison.updated_at,
      });
      const staticBodyHTML = generateGroupComparisonStaticBodyHTML({ groupComparison, tools: groupComparison.tools, groupComparisonContent, seoData });
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
