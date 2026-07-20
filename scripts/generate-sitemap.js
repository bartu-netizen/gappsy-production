#!/usr/bin/env node
/**
 * Dynamic Sitemap Generator for Gappsy.com
 *
 * Strict allowlist: only indexable routes are emitted. Funnel and
 * noindex child routes are never included. State pages are the primary
 * SEO drivers.
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { createClient } from '@supabase/supabase-js';
import { loadEnv } from 'vite';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const CANONICAL_DOMAIN = 'https://gappsy.com';
const TODAY = new Date().toISOString().split('T')[0];

const CORE_PAGES = [
  { url: '/', priority: '1.0', changefreq: 'weekly' },
  { url: '/marketing-agencies/', priority: '0.9', changefreq: 'weekly' },
  { url: '/marketing-agencies/usa/', priority: '0.9', changefreq: 'weekly' },
  { url: '/your-agency', priority: '0.7', changefreq: 'monthly' },
  { url: '/appbuilder/', priority: '0.8', changefreq: 'monthly' },
  { url: '/analytics/', priority: '0.8', changefreq: 'monthly' },
  { url: '/proof/', priority: '0.8', changefreq: 'monthly' },
  { url: '/about/', priority: '0.6', changefreq: 'monthly' },
  { url: '/contact/', priority: '0.6', changefreq: 'monthly' },
  { url: '/editorial-policy/', priority: '0.5', changefreq: 'yearly' },
  { url: '/terms/', priority: '0.5', changefreq: 'yearly' },
  { url: '/privacy/', priority: '0.5', changefreq: 'yearly' },
];

const US_STATES = [
  'alabama', 'alaska', 'arizona', 'arkansas', 'california', 'colorado',
  'connecticut', 'delaware', 'district-of-columbia', 'florida', 'georgia',
  'hawaii', 'idaho', 'illinois', 'indiana', 'iowa', 'kansas', 'kentucky',
  'louisiana', 'maine', 'maryland', 'massachusetts', 'michigan', 'minnesota',
  'mississippi', 'missouri', 'montana', 'nebraska', 'nevada', 'new-hampshire',
  'new-jersey', 'new-mexico', 'new-york', 'north-carolina', 'north-dakota',
  'ohio', 'oklahoma', 'oregon', 'pennsylvania', 'puerto-rico', 'rhode-island',
  'south-carolina', 'south-dakota', 'tennessee', 'texas', 'utah', 'vermont',
  'virginia', 'washington', 'west-virginia', 'wisconsin', 'wyoming'
];

// Any URL in the sitemap must match one of these patterns. Anything else
// is a regression and blocks the build.
const ALLOWED_PATTERNS = [
  /^\/$/,
  /^\/marketing-agencies\/$/,
  /^\/marketing-agencies\/usa\/$/,
  /^\/marketing-agencies-in-[a-z-]+-united-states\/$/,
  /^\/your-agency$/,
  /^\/appbuilder\/$/,
  /^\/analytics\/$/,
  /^\/proof\/$/,
  /^\/about\/$/,
  /^\/contact\/$/,
  /^\/editorial-policy\/$/,
  /^\/terms\/$/,
  /^\/privacy\/$/,
  /^\/tools\/[a-z0-9-]+\/$/,
  /^\/tool-categories\/$/,
  /^\/tool-categories\/[a-z0-9-]+\/$/,
  /^\/compare\/$/,
  // Matches both pairwise ("a-vs-b") and group ("a-vs-b-vs-c") comparison
  // slugs — the pattern is generic to any number of "-vs-"-joined segments.
  /^\/compare\/[a-z0-9-]+-vs-[a-z0-9-]+\/$/,
];

async function fetchPublishedToolSlugs() {
  try {
    const env = loadEnv('production', path.join(__dirname, '..'), '');
    const supabaseUrl = env.VITE_SUPABASE_URL || process.env.VITE_SUPABASE_URL;
    const supabaseKey = env.VITE_SUPABASE_ANON_KEY || process.env.VITE_SUPABASE_ANON_KEY;
    if (!supabaseUrl || !supabaseKey) {
      console.warn('⚠️  Supabase credentials not found — skipping tool URLs in sitemap');
      return [];
    }
    const supabase = createClient(supabaseUrl, supabaseKey);
    // PostgREST caps a single response at 1000 rows — paginate so the tool
    // count can grow past that without silently dropping URLs from the sitemap.
    const PAGE_SIZE = 1000;
    const slugs = [];
    for (let page = 0; ; page++) {
      const { data, error } = await supabase
        .from('tools')
        .select('slug')
        .eq('status', 'published')
        .range(page * PAGE_SIZE, page * PAGE_SIZE + PAGE_SIZE - 1);
      if (error) {
        console.warn(`⚠️  Failed to fetch tool slugs for sitemap: ${error.message}`);
        return slugs;
      }
      slugs.push(...(data || []).map((t) => t.slug));
      if (!data || data.length < PAGE_SIZE) break;
    }
    return slugs;
  } catch (err) {
    console.warn(`⚠️  Error fetching tool slugs for sitemap: ${err.message}`);
    return [];
  }
}

async function fetchPublishedCategorySlugs() {
  try {
    const env = loadEnv('production', path.join(__dirname, '..'), '');
    const supabaseUrl = env.VITE_SUPABASE_URL || process.env.VITE_SUPABASE_URL;
    const supabaseKey = env.VITE_SUPABASE_ANON_KEY || process.env.VITE_SUPABASE_ANON_KEY;
    if (!supabaseUrl || !supabaseKey) {
      console.warn('⚠️  Supabase credentials not found — skipping category URLs in sitemap');
      return [];
    }
    const supabase = createClient(supabaseUrl, supabaseKey);
    const { data, error } = await supabase.from('tool_categories').select('slug').eq('status', 'published');
    if (error) {
      console.warn(`⚠️  Failed to fetch category slugs for sitemap: ${error.message}`);
      return [];
    }
    return (data || []).map((c) => c.slug);
  } catch (err) {
    console.warn(`⚠️  Error fetching category slugs for sitemap: ${err.message}`);
    return [];
  }
}

function generateUrlEntry(url, lastmod, priority, changefreq) {
  return `  <url>
    <loc>${CANONICAL_DOMAIN}${url}</loc>
    <lastmod>${lastmod}</lastmod>
    <priority>${priority}</priority>
    <changefreq>${changefreq}</changefreq>
  </url>`;
}

function assertAllowed(url) {
  if (!ALLOWED_PATTERNS.some((re) => re.test(url))) {
    throw new Error(`Sitemap regression: url not in allowlist: ${url}`);
  }
}

// Only approved, published comparisons — never every possible tool pair.
// Mirrors fetchPublishedToolSlugs/fetchPublishedCategorySlugs above.
async function fetchPublishedComparisonSlugs() {
  try {
    const env = loadEnv('production', path.join(__dirname, '..'), '');
    const supabaseUrl = env.VITE_SUPABASE_URL || process.env.VITE_SUPABASE_URL;
    const supabaseKey = env.VITE_SUPABASE_ANON_KEY || process.env.VITE_SUPABASE_ANON_KEY;
    if (!supabaseUrl || !supabaseKey) {
      console.warn('⚠️  Supabase credentials not found — skipping comparison URLs in sitemap');
      return [];
    }
    const supabase = createClient(supabaseUrl, supabaseKey);
    const { data, error } = await supabase.from('tool_comparisons').select('slug').eq('status', 'published');
    if (error) {
      console.warn(`⚠️  Failed to fetch comparison slugs for sitemap: ${error.message}`);
      return [];
    }
    return (data || []).map((c) => c.slug);
  } catch (err) {
    console.warn(`⚠️  Error fetching comparison slugs for sitemap: ${err.message}`);
    return [];
  }
}

// Only approved, published group comparisons (3+ tools) — mirrors
// fetchPublishedComparisonSlugs above for the N-ary comparison page type.
async function fetchPublishedGroupComparisonSlugs() {
  try {
    const env = loadEnv('production', path.join(__dirname, '..'), '');
    const supabaseUrl = env.VITE_SUPABASE_URL || process.env.VITE_SUPABASE_URL;
    const supabaseKey = env.VITE_SUPABASE_ANON_KEY || process.env.VITE_SUPABASE_ANON_KEY;
    if (!supabaseUrl || !supabaseKey) {
      console.warn('⚠️  Supabase credentials not found — skipping group comparison URLs in sitemap');
      return [];
    }
    const supabase = createClient(supabaseUrl, supabaseKey);
    const { data, error } = await supabase.from('tool_group_comparisons').select('slug').eq('status', 'published');
    if (error) {
      console.warn(`⚠️  Failed to fetch group comparison slugs for sitemap: ${error.message}`);
      return [];
    }
    return (data || []).map((r) => r.slug);
  } catch (err) {
    console.warn(`⚠️  Error fetching group comparison slugs for sitemap: ${err.message}`);
    return [];
  }
}

async function generateSitemap() {
  const urls = [];
  const paths = [];

  CORE_PAGES.forEach((page) => {
    assertAllowed(page.url);
    paths.push(page.url);
    urls.push(generateUrlEntry(page.url, TODAY, page.priority, page.changefreq));
  });

  US_STATES.forEach((stateSlug) => {
    const url = `/marketing-agencies-in-${stateSlug}-united-states/`;
    assertAllowed(url);
    paths.push(url);
    urls.push(generateUrlEntry(url, TODAY, '0.7', 'weekly'));
  });

  const toolSlugs = await fetchPublishedToolSlugs();
  toolSlugs.forEach((slug) => {
    const url = `/tools/${slug}/`;
    assertAllowed(url);
    paths.push(url);
    urls.push(generateUrlEntry(url, TODAY, '0.7', 'weekly'));
  });
  console.log(`Tool URLs included: ${toolSlugs.length}`);

  const hubUrl = '/tool-categories/';
  assertAllowed(hubUrl);
  paths.push(hubUrl);
  urls.push(generateUrlEntry(hubUrl, TODAY, '0.7', 'weekly'));

  const categorySlugs = await fetchPublishedCategorySlugs();
  categorySlugs.forEach((slug) => {
    const url = `/tool-categories/${slug}/`;
    assertAllowed(url);
    paths.push(url);
    urls.push(generateUrlEntry(url, TODAY, '0.6', 'weekly'));
  });
  console.log(`Category URLs included: ${categorySlugs.length} (+ 1 hub)`);

  const compareHubUrl = '/compare/';
  assertAllowed(compareHubUrl);
  paths.push(compareHubUrl);
  urls.push(generateUrlEntry(compareHubUrl, TODAY, '0.6', 'weekly'));

  const comparisonSlugs = await fetchPublishedComparisonSlugs();
  comparisonSlugs.forEach((slug) => {
    const url = `/compare/${slug}/`;
    assertAllowed(url);
    paths.push(url);
    // High-intent, long-form editorial content — matches tool-page priority (0.7),
    // above the /compare/ hub itself and generic category pages (both 0.6).
    urls.push(generateUrlEntry(url, TODAY, '0.7', 'weekly'));
  });
  console.log(`Comparison URLs included: ${comparisonSlugs.length} (+ 1 hub)`);

  // No separate hub URL — group comparisons are listed on the same /compare
  // hub as pairwise comparisons (see ComparePage.tsx's "3+ Tool Comparisons"
  // section), so only their individual detail-page URLs need sitemap entries.
  const groupComparisonSlugs = await fetchPublishedGroupComparisonSlugs();
  groupComparisonSlugs.forEach((slug) => {
    const url = `/compare/${slug}/`;
    assertAllowed(url);
    paths.push(url);
    urls.push(generateUrlEntry(url, TODAY, '0.7', 'weekly'));
  });
  console.log(`Group comparison URLs included: ${groupComparisonSlugs.length}`);

  const xmlContent = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
        http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
  <!--
    Gappsy.com Sitemap
    Generated: ${new Date().toISOString()}
    Total URLs: ${urls.length}
    Canonical domain: ${CANONICAL_DOMAIN}
    Strict allowlist: only indexable routes are emitted.
  -->

${urls.join('\n')}
</urlset>
`;

  const outputPath = path.join(__dirname, '..', 'public', 'sitemap.xml');
  fs.writeFileSync(outputPath, xmlContent, 'utf8');

  console.log(`Sitemap generated: ${urls.length} URLs -> ${outputPath}`);
  return { totalUrls: urls.length, paths };
}

generateSitemap()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error('Error generating sitemap:', error);
    process.exit(1);
  });
