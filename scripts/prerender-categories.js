import { readFileSync, writeFileSync, mkdirSync, existsSync, unlinkSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath, pathToFileURL } from 'url';
import { tmpdir } from 'os';
import { createClient } from '@supabase/supabase-js';
import { build as esbuildBuild } from 'esbuild';
import {
  generateCategorySEOData,
  generateCategoriesHubSEOData,
  generateCategoryJSONLD,
  generateCategoriesHubJSONLD,
  generateCategoryStaticBodyHTML,
  generateCategoriesHubStaticBodyHTML,
  injectSEOTags,
} from './category-seo-generator.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..');

const SLUG_PATTERN = /^[a-z0-9-]+$/;

function initSupabase() {
  const supabaseUrl = process.env.VITE_SUPABASE_URL;
  const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;
  if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase credentials not found in environment for category prerender');
  }
  return createClient(supabaseUrl, supabaseKey);
}

// Bundles the optional per-category `extendedContent` overlay (TypeScript,
// used by the React client) into a temp ESM file so this plain Node build
// script can read it too — same pattern as prerender-tools.js's
// loadGetToolContent. Every category has no entry today, so this always
// resolves `undefined` right now; it exists so a category gets its buyer's
// guide/FAQ/methodology sections in prerendered HTML the moment editorial
// content is added, with zero prerender-script changes required.
async function loadGetCategoryContent() {
  const outfile = join(tmpdir(), `gappsy-category-content-${Date.now()}.mjs`);
  await esbuildBuild({
    entryPoints: [join(projectRoot, 'src/data/categoryContent/index.ts')],
    bundle: true,
    format: 'esm',
    platform: 'node',
    outfile,
  });
  try {
    const mod = await import(pathToFileURL(outfile).href);
    return mod.getCategoryContent;
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

async function fetchAllPublishedCategories(supabase) {
  const { data, error } = await supabase
    .from('tool_categories')
    .select('id, slug, name, description, seo_title, seo_description, updated_at')
    .eq('status', 'published')
    .order('name', { ascending: true });

  if (error) throw new Error(`Failed to fetch published categories: ${error.message}`);
  return data || [];
}

// One bulk query for every category's tools regardless of category count —
// same scaling answer as prerender-tools.js's fetchRelatedData.
async function fetchToolsByCategory(supabase, categoryIds) {
  if (categoryIds.length === 0) return new Map();

  const { data, error } = await supabase
    .from('tool_category_links')
    .select('category_id, tools!inner(slug, name, short_description, status)')
    .in('category_id', categoryIds)
    .eq('tools.status', 'published');

  if (error) throw new Error(`Failed to fetch category tools: ${error.message}`);

  const byCategory = new Map();
  for (const row of data || []) {
    if (!row.tools) continue;
    const list = byCategory.get(row.category_id) || [];
    list.push(row.tools);
    byCategory.set(row.category_id, list);
  }
  return byCategory;
}

export async function prerenderCategories(options = {}) {
  const { distDir: customDistDir, failOnError = true } = options;
  const distDir = customDistDir || join(projectRoot, 'dist');
  const baseHtmlPath = join(distDir, 'index.html');

  console.log('\n🚀 Starting pre-render for category pages...\n');

  if (!existsSync(baseHtmlPath)) {
    throw new Error('dist/index.html not found. Run Vite build first.');
  }
  const baseHtml = readFileSync(baseHtmlPath, 'utf-8');

  const supabase = initSupabase();
  const categories = await fetchAllPublishedCategories(supabase);
  console.log(`📡 Found ${categories.length} published categor${categories.length === 1 ? 'y' : 'ies'}\n`);

  const getCategoryContent = await loadGetCategoryContent();

  // Hub page (/tool-categories/) — always rendered, even with zero categories,
  // since the hub itself is always a valid page to crawl.
  const hubSeoData = generateCategoriesHubSEOData();
  const hubJsonLd = generateCategoriesHubJSONLD(categories);
  const hubStaticBodyHTML = generateCategoriesHubStaticBodyHTML(categories);
  const hubHtml = injectSEOTags(baseHtml, hubSeoData, hubJsonLd, hubStaticBodyHTML);
  const hubDir = join(distDir, 'tool-categories');
  mkdirSync(hubDir, { recursive: true });
  writeFileSync(join(hubDir, 'index.html'), hubHtml, 'utf-8');
  console.log('✅ Hub page → dist/tool-categories/index.html');

  if (categories.length === 0) {
    writeFileSync(
      join(distDir, '__prerendered-categories.txt'),
      `PRERENDER_CATEGORIES_COMPLETE\nTimestamp: ${new Date().toISOString()}\nCategories Total: 0\n`,
      'utf-8'
    );
    return { success: true, successCount: 0, errorCount: 0, failedCategories: [], categoriesSummary: [] };
  }

  const categoryIds = categories.map((c) => c.id);
  const toolsByCategory = await fetchToolsByCategory(supabase, categoryIds);

  let successCount = 0;
  let errorCount = 0;
  const failedCategories = [];
  const categoriesSummary = [];
  const buildTimestamp = new Date().toISOString();

  for (const category of categories) {
    try {
      if (!SLUG_PATTERN.test(category.slug)) {
        throw new Error(`slug "${category.slug}" is not filesystem-safe`);
      }

      const seoData = generateCategorySEOData(category);
      if (!seoData.title) throw new Error('missing title');
      if (!seoData.description) {
        throw new Error('missing seo_description and description — cannot generate a real (non-generic) meta description');
      }

      const tools = toolsByCategory.get(category.id) || [];
      const extendedContent = getCategoryContent(category.slug);
      const jsonLd = generateCategoryJSONLD({ category, tools, extendedContent, seoData });
      const staticBodyHTML = generateCategoryStaticBodyHTML({ category, tools, extendedContent });
      const html = injectSEOTags(baseHtml, seoData, jsonLd, staticBodyHTML);

      const categoryDir = join(distDir, 'tool-categories', category.slug);
      mkdirSync(categoryDir, { recursive: true });
      writeFileSync(join(categoryDir, 'index.html'), html, 'utf-8');

      console.log(`✅ ${category.name.padEnd(24)} → ${tools.length} tool(s)${extendedContent ? ', extended content' : ''}`);
      successCount++;
      categoriesSummary.push({ slug: category.slug, name: category.name, title: seoData.title, canonical: seoData.canonical });
    } catch (error) {
      console.error(`❌ ${category.name || category.slug} → Error: ${error.message}`);
      errorCount++;
      failedCategories.push({ slug: category.slug, name: category.name, error: error.message });
      if (failOnError) {
        throw new Error(`Category "${category.name}" (${category.slug}) failed to generate: ${error.message}`);
      }
    }
  }

  console.log(`\n📊 Category prerender complete:`);
  console.log(`   ✅ Success: ${successCount} category pages`);
  if (errorCount > 0) console.log(`   ❌ Failed: ${errorCount} category pages`);

  const markerContent = `PRERENDER_CATEGORIES_COMPLETE
Timestamp: ${buildTimestamp}
Categories Total: ${categories.length}
Categories Success: ${successCount}
Categories Failed: ${errorCount}

${categoriesSummary.map((c) => `- ${c.name} (${c.slug}): ${c.title}`).join('\n')}
`;
  writeFileSync(join(distDir, '__prerendered-categories.txt'), markerContent, 'utf-8');
  console.log(`\n✅ Deploy marker written to dist/__prerendered-categories.txt`);

  if (errorCount > 0 && failOnError) {
    throw new Error(`Category prerender failed for ${errorCount} categor${errorCount === 1 ? 'y' : 'ies'}. Build cannot continue.`);
  }

  return { success: errorCount === 0, successCount, errorCount, failedCategories, categoriesSummary };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  prerenderCategories().catch((error) => {
    console.error('\n❌ Category prerender failed:', error.message);
    process.exit(1);
  });
}
