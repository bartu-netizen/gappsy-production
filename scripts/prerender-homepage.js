// Prerenders "/" (dist/index.html) with real, crawlable content instead of
// the bare `<div id="root"></div>` SPA shell. Same conventions as the other
// prerender-*.js scripts: build-time Supabase queries feed a static body
// HTML + JSON-LD, injected into the same dist/index.html Vite already
// wrote. Since src/main.tsx uses createRoot().render() (not hydrateRoot),
// React fully replaces this markup on mount for real users with JS — this
// content only has to be correct and crawlable, not pixel-identical to the
// client-rendered homepage.
import { readFileSync, writeFileSync, unlinkSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath, pathToFileURL } from 'url';
import { tmpdir } from 'os';
import { createClient } from '@supabase/supabase-js';
import { build as esbuildBuild } from 'esbuild';
import { escapeHtml } from './seo-generator.js';
import { injectToolSEOTags } from './tool-seo-generator.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..');
const DOMAIN = 'https://gappsy.com';

function initSupabase() {
  const supabaseUrl = process.env.VITE_SUPABASE_URL;
  const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;
  if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase credentials not found in environment for homepage prerender');
  }
  return createClient(supabaseUrl, supabaseKey);
}

// Bundles src/data/recentlyFeaturedTools.ts (TypeScript, used by
// HomePage.tsx) into a temp ESM file so this plain Node build script can
// read the same list — mirrors loadGetToolContent in prerender-tools.js.
async function loadRecentlyFeaturedTools() {
  const outfile = join(tmpdir(), `gappsy-homepage-tools-${Date.now()}.mjs`);
  await esbuildBuild({
    entryPoints: [join(projectRoot, 'src/data/recentlyFeaturedTools.ts')],
    bundle: true,
    format: 'esm',
    platform: 'node',
    outfile,
  });
  try {
    const mod = await import(pathToFileURL(outfile).href);
    return mod.RECENTLY_FEATURED_TOOLS;
  } finally {
    try { unlinkSync(outfile); } catch { /* best-effort cleanup */ }
  }
}

// Real, live counts for the homepage's "about" text and category rail —
// exactly what a SaaShub-style directory homepage needs for both SEO
// (substantive, accurate body text) and LLM citability (a dense, factual
// summary of what the site actually contains).
async function fetchHomepageStats(supabase) {
  const { count: totalTools, error: countError } = await supabase
    .from('tools')
    .select('id', { count: 'exact', head: true })
    .eq('status', 'published');
  if (countError) throw new Error(`Failed to fetch published tool count: ${countError.message}`);

  const { data: categories, error: catError } = await supabase
    .from('tool_categories')
    .select('id, slug, name')
    .eq('status', 'published');
  if (catError) throw new Error(`Failed to fetch categories: ${catError.message}`);

  const categoryIds = (categories || []).map((c) => c.id);
  const countByCategory = new Map();
  if (categoryIds.length > 0) {
    // PostgREST caps a response at 1000 rows — paginate so a category ->
    // tool link count past that doesn't silently under-count popular
    // categories (same class of bug fixed in the other prerender scripts).
    const PAGE_SIZE = 1000;
    for (let page = 0; ; page++) {
      const { data, error } = await supabase
        .from('tool_category_links')
        .select('category_id, tools!inner(status)')
        .in('category_id', categoryIds)
        .eq('tools.status', 'published')
        .range(page * PAGE_SIZE, page * PAGE_SIZE + PAGE_SIZE - 1);
      if (error) throw new Error(`Failed to fetch category tool counts: ${error.message}`);
      for (const row of data || []) {
        countByCategory.set(row.category_id, (countByCategory.get(row.category_id) || 0) + 1);
      }
      if (!data || data.length < PAGE_SIZE) break;
    }
  }

  const topCategories = (categories || [])
    .map((c) => ({ slug: c.slug, name: c.name, count: countByCategory.get(c.id) || 0 }))
    .filter((c) => c.count > 0)
    .sort((a, b) => b.count - a.count)
    .slice(0, 10);

  return {
    totalTools: totalTools || 0,
    totalCategories: (categories || []).length,
    topCategories,
  };
}

function buildHomepageStaticBodyHTML({ stats, tools }) {
  const { totalTools, totalCategories, topCategories } = stats;

  const toolsHTML = tools
    .map(
      (t) => `
        <li style="display:inline-block;margin:0 12px 12px 0;">
          <a href="/tools/${escapeHtml(t.slug)}" style="display:block;padding:12px 16px;border:1px solid #eef0f3;border-radius:14px;text-decoration:none;color:#111827;min-width:200px;">
            <strong style="display:block;font-size:0.85rem;color:#111827;">${escapeHtml(t.name)}</strong>
            <span style="display:block;font-size:0.75rem;color:#4B5563;margin-top:2px;">${escapeHtml(t.tagline)}</span>
          </a>
        </li>`
    )
    .join('');

  const categoriesHTML = topCategories
    .map(
      (c) => `
        <li style="display:inline-block;margin:0 10px 10px 0;">
          <a href="/tool-categories/${escapeHtml(c.slug)}/" style="display:inline-block;padding:8px 16px;background:#F3F4F6;border-radius:9999px;text-decoration:none;color:#111827;font-size:0.85rem;">
            ${escapeHtml(c.name)} <span style="color:#6B7280;">(${c.count})</span>
          </a>
        </li>`
    )
    .join('');

  return `
    <!-- PRERENDER_OK: Static HTML for crawlers -->
    <div style="max-width:1300px;margin:0 auto;padding:20px;font-family:system-ui,-apple-system,sans-serif;">
      <header style="text-align:center;margin-bottom:2rem;">
        <h1 style="font-size:2rem;font-weight:700;line-height:1.1;color:#0B1221;margin-bottom:0.5rem;">
          Find the best software tools<br />to grow your business
        </h1>
        <p style="color:#64748B;font-size:1rem;">Plus top-rated marketing agencies, all in one directory.</p>
      </header>

      <section style="max-width:800px;margin:0 auto 2.5rem auto;text-align:center;">
        <p style="color:#374151;line-height:1.7;font-size:1rem;">
          Gappsy is a software tool directory covering ${totalTools.toLocaleString('en-US')}+ tools across ${totalCategories}+ categories —
          from AI and no-code builders to CRM, marketing, and productivity software. Compare pricing, features, and
          real user reviews side by side, and find top-rated marketing agencies, all in one place.
        </p>
      </section>

      <section style="margin-bottom:2.5rem;">
        <h2 style="font-size:1.1rem;font-weight:600;color:#0A0F1B;margin-bottom:1rem;">Browse Popular Categories</h2>
        <ul style="list-style:none;padding:0;margin:0;">
          ${categoriesHTML}
        </ul>
        <p style="margin-top:0.75rem;"><a href="/tool-categories/" style="color:#4F46E5;font-size:0.875rem;">View all categories &rarr;</a></p>
      </section>

      <section style="margin-bottom:2.5rem;">
        <h2 style="font-size:1.1rem;font-weight:600;color:#0A0F1B;margin-bottom:1rem;">Recently Featured Tools</h2>
        <ul style="list-style:none;padding:0;margin:0;">
          ${toolsHTML}
        </ul>
        <p style="margin-top:0.75rem;"><a href="/tools/" style="color:#4F46E5;font-size:0.875rem;">View all tools &rarr;</a></p>
      </section>

      <noscript>
        <p style="background:#FEF3C7;border:1px solid #F59E0B;padding:1rem;border-radius:0.5rem;margin-top:2rem;">
          JavaScript is required for the full interactive experience, including live search, agency listings, and account features.
        </p>
      </noscript>
    </div>
  `;
}

function buildHomepageJSONLD(stats) {
  return {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'WebSite',
        '@id': `${DOMAIN}/#website`,
        url: `${DOMAIN}/`,
        name: 'Gappsy',
        description: `Directory of ${stats.totalTools}+ software tools across ${stats.totalCategories}+ categories, plus top-rated marketing agencies.`,
        publisher: { '@id': `${DOMAIN}/#organization` },
        potentialAction: {
          '@type': 'SearchAction',
          target: {
            '@type': 'EntryPoint',
            urlTemplate: `${DOMAIN}/tools?q={search_term_string}`,
          },
          'query-input': 'required name=search_term_string',
        },
      },
      {
        '@type': 'Organization',
        '@id': `${DOMAIN}/#organization`,
        name: 'Gappsy',
        url: `${DOMAIN}/`,
        logo: `${DOMAIN}/logos/gappsy_-_white_-_logo_-_small.png`,
      },
    ],
  };
}

export async function prerenderHomepage(options = {}) {
  const { distDir: customDistDir, failOnError = true } = options;

  try {
    const distDir = customDistDir || join(projectRoot, 'dist');
    const indexPath = join(distDir, 'index.html');
    const baseHtml = readFileSync(indexPath, 'utf-8');

    const supabase = initSupabase();
    const stats = await fetchHomepageStats(supabase);
    const tools = await loadRecentlyFeaturedTools();

    if (stats.totalTools === 0) {
      throw new Error('Homepage stats query returned 0 published tools — refusing to prerender the homepage with degenerate data');
    }

    const seoData = {
      title: 'Gappsy - Find the Best Software Tools for Your Business',
      description: `Discover and compare ${stats.totalTools}+ software tools across ${stats.totalCategories}+ categories, plus top-rated marketing agencies — all in one directory.`,
      canonical: `${DOMAIN}/`,
      ogImage: `${DOMAIN}/og/default-og-image.svg`,
    };
    const jsonLd = buildHomepageJSONLD(stats);
    const staticBodyHTML = buildHomepageStaticBodyHTML({ stats, tools });

    const html = injectToolSEOTags(baseHtml, seoData, jsonLd, staticBodyHTML);
    writeFileSync(indexPath, html, 'utf-8');

    console.log(`✅ Homepage prerendered: ${stats.totalTools} tools across ${stats.totalCategories} categories (${stats.topCategories.length} linked in category rail)`);
    return { success: true, errorCount: 0 };
  } catch (error) {
    console.error(`❌ Homepage prerender error: ${error.message}`);
    if (failOnError) throw error;
    return { success: false, errorCount: 1 };
  }
}
