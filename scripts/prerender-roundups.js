import { readFileSync, writeFileSync, mkdirSync, existsSync, unlinkSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath, pathToFileURL } from 'url';
import { tmpdir } from 'os';
import { createClient } from '@supabase/supabase-js';
import { build as esbuildBuild } from 'esbuild';
import { injectToolSEOTags } from './tool-seo-generator.js';
import { generateRoundupSEOData, generateRoundupJSONLD, generateRoundupStaticBodyHTML } from './roundup-seo-generator.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..');

const SLUG_PATTERN = /^[a-z0-9-]+$/;
const MIN_ROUNDUP_TOOLS = 3;

function initSupabase() {
  const supabaseUrl = process.env.VITE_SUPABASE_URL;
  const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;
  if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase credentials not found in environment for roundup prerender');
  }
  return createClient(supabaseUrl, supabaseKey);
}

// Bundles src/data/roundupContent/index.ts (TypeScript, used by the React
// client) into a temp ESM file so this plain Node build script can read it
// too — mirrors loadGetComparisonContent in prerender-comparisons.js.
async function loadGetRoundupContent() {
  const outfile = join(tmpdir(), `gappsy-roundup-content-${Date.now()}.mjs`);
  await esbuildBuild({
    entryPoints: [join(projectRoot, 'src/data/roundupContent/index.ts')],
    bundle: true,
    format: 'esm',
    platform: 'node',
    outfile,
  });
  try {
    const mod = await import(pathToFileURL(outfile).href);
    return mod.getRoundupContent;
  } finally {
    try { unlinkSync(outfile); } catch { /* best-effort cleanup */ }
  }
}

async function fetchPublishedRoundups(supabase) {
  const { data, error } = await supabase
    .from('tool_roundups')
    .select(
      'id, slug, title, created_at, updated_at, tool_roundup_members(sort_order, tools(id,slug,name,logo,pricing_model,starting_price,status))'
    )
    .eq('status', 'published')
    .order('slug', { ascending: true });

  if (error) throw new Error(`Failed to fetch published roundups: ${error.message}`);
  // Defense in depth: RLS already enforces every member tool published, but
  // a service-role-free client running this script uses the anon key same
  // as production, so this filter is redundant-but-cheap insurance against a
  // malformed embed ever reaching the writer below.
  return (data || [])
    .map((r) => ({
      ...r,
      tools: (r.tool_roundup_members || [])
        .filter((m) => m.tools?.status === 'published')
        .sort((a, b) => a.sort_order - b.sort_order)
        .map((m) => m.tools),
    }))
    .filter((r) => r.tools.length >= MIN_ROUNDUP_TOOLS);
}

export async function prerenderRoundups(options = {}) {
  const { distDir: customDistDir, failOnError = true } = options;
  const distDir = customDistDir || join(projectRoot, 'dist');
  const baseHtmlPath = join(distDir, 'index.html');

  console.log('\n🚀 Starting pre-render for roundup pages...\n');

  if (!existsSync(baseHtmlPath)) {
    throw new Error('dist/index.html not found. Run Vite build first.');
  }
  const baseHtml = readFileSync(baseHtmlPath, 'utf-8');

  const supabase = initSupabase();
  const roundups = await fetchPublishedRoundups(supabase);
  console.log(`📡 Found ${roundups.length} published roundup(s)\n`);

  // An empty approved-roundups set is a valid, expected state (mirrors
  // prerenderComparisons) — this page type is brand new and starts at 0.
  if (roundups.length === 0) {
    writeFileSync(
      join(distDir, '__prerendered-roundups.txt'),
      `PRERENDER_ROUNDUPS_COMPLETE\nTimestamp: ${new Date().toISOString()}\nRoundups Total: 0\n`,
      'utf-8'
    );
    return { success: true, successCount: 0, errorCount: 0, failedRoundups: [], roundupsSummary: [] };
  }

  const getRoundupContent = await loadGetRoundupContent();

  let successCount = 0;
  let errorCount = 0;
  const failedRoundups = [];
  const roundupsSummary = [];
  const buildTimestamp = new Date().toISOString();

  for (const roundup of roundups) {
    try {
      if (!SLUG_PATTERN.test(roundup.slug)) {
        throw new Error(`slug "${roundup.slug}" is not filesystem-safe`);
      }
      if (roundup.tools.length < MIN_ROUNDUP_TOOLS) {
        throw new Error(`roundup "${roundup.slug}" has fewer than ${MIN_ROUNDUP_TOOLS} published tools`);
      }

      const roundupContent = getRoundupContent(roundup.slug);
      const seoData = generateRoundupSEOData({ roundup, tools: roundup.tools, roundupContent });
      const jsonLd = generateRoundupJSONLD({
        roundup,
        tools: roundup.tools,
        roundupContent,
        seoData,
        createdAt: roundup.created_at,
        updatedAt: roundup.updated_at,
      });
      const staticBodyHTML = generateRoundupStaticBodyHTML({ roundup, tools: roundup.tools, roundupContent, seoData });
      const html = injectToolSEOTags(baseHtml, seoData, jsonLd, staticBodyHTML);

      const roundupDir = join(distDir, 'roundup', roundup.slug);
      mkdirSync(roundupDir, { recursive: true });
      writeFileSync(join(roundupDir, 'index.html'), html, 'utf-8');

      console.log(`✅ ${roundup.title.padEnd(40)} → ${roundupContent ? 'editorial content' : 'DB facts only'}`);
      successCount++;
      roundupsSummary.push({ slug: roundup.slug, title: seoData.title, canonical: seoData.canonical });
    } catch (error) {
      console.error(`❌ ${roundup.title || roundup.slug || '?'} → Error: ${error.message}`);
      errorCount++;
      failedRoundups.push({ slug: roundup.slug, error: error.message });
      if (failOnError) {
        throw new Error(`Roundup "${roundup.slug}" failed to generate: ${error.message}`);
      }
    }
  }

  console.log(`\n📊 Roundup prerender complete:`);
  console.log(`   ✅ Success: ${successCount} roundup page(s)`);
  if (errorCount > 0) console.log(`   ❌ Failed: ${errorCount} roundup page(s)`);

  const markerContent = `PRERENDER_ROUNDUPS_COMPLETE
Timestamp: ${buildTimestamp}
Roundups Total: ${roundups.length}
Roundups Success: ${successCount}
Roundups Failed: ${errorCount}

${roundupsSummary.map((r) => `- ${r.slug}: ${r.title}`).join('\n')}
`;
  writeFileSync(join(distDir, '__prerendered-roundups.txt'), markerContent, 'utf-8');
  console.log(`\n✅ Deploy marker written to dist/__prerendered-roundups.txt`);

  if (errorCount > 0 && failOnError) {
    throw new Error(`Roundup prerender failed for ${errorCount} roundup(s). Build cannot continue.`);
  }

  return { success: errorCount === 0, successCount, errorCount, failedRoundups, roundupsSummary };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  prerenderRoundups().catch((error) => {
    console.error('\n❌ Roundup prerender failed:', error.message);
    process.exit(1);
  });
}
