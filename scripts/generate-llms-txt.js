#!/usr/bin/env node
/**
 * Generates public/llms.txt following the llmstxt.org convention: a plain
 * Markdown index of the site's indexable content, meant to help AI/LLM
 * crawlers and answer engines (ChatGPT, Claude, Perplexity, etc.) discover
 * and cite pages without having to parse the full HTML/JS app.
 *
 * Runs before `vite build` (see package.json) so the file lands in public/
 * and gets copied into dist/ by Vite like sitemap.xml already does.
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { createClient } from '@supabase/supabase-js';
import { loadEnv } from 'vite';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const CANONICAL_DOMAIN = 'https://gappsy.com';

function initSupabase() {
  const env = loadEnv('production', path.join(__dirname, '..'), '');
  const supabaseUrl = env.VITE_SUPABASE_URL || process.env.VITE_SUPABASE_URL;
  const supabaseKey = env.VITE_SUPABASE_ANON_KEY || process.env.VITE_SUPABASE_ANON_KEY;
  if (!supabaseUrl || !supabaseKey) {
    console.warn('⚠️  Supabase credentials not found — generating llms.txt without tools/comparisons');
    return null;
  }
  return createClient(supabaseUrl, supabaseKey);
}

async function fetchTools(supabase) {
  if (!supabase) return [];
  // PostgREST caps a single response at 1000 rows — paginate so the tool
  // count can grow past that without silently dropping tools from llms.txt.
  const PAGE_SIZE = 1000;
  const tools = [];
  for (let page = 0; ; page++) {
    const { data, error } = await supabase
      .from('tools')
      .select('slug, name, llm_readable_summary, short_description, featured')
      .eq('status', 'published')
      .order('name', { ascending: true })
      .range(page * PAGE_SIZE, page * PAGE_SIZE + PAGE_SIZE - 1);
    if (error) {
      console.warn(`⚠️  Failed to fetch tools for llms.txt: ${error.message}`);
      return tools;
    }
    tools.push(...(data || []));
    if (!data || data.length < PAGE_SIZE) break;
  }
  return tools;
}

async function fetchCategories(supabase) {
  if (!supabase) return [];
  const { data, error } = await supabase
    .from('tool_categories')
    .select('slug, name')
    .eq('status', 'published')
    .order('name', { ascending: true });
  if (error) {
    console.warn(`⚠️  Failed to fetch categories for llms.txt: ${error.message}`);
    return [];
  }
  return data || [];
}

async function fetchComparisons(supabase) {
  if (!supabase) return [];
  const { data, error } = await supabase
    .from('tool_comparisons')
    .select('slug, tool_a:tools!tool_comparisons_tool_a_id_fkey(name,status), tool_b:tools!tool_comparisons_tool_b_id_fkey(name,status)')
    .eq('status', 'published')
    .order('slug', { ascending: true });
  if (error) {
    console.warn(`⚠️  Failed to fetch comparisons for llms.txt: ${error.message}`);
    return [];
  }
  return (data || []).filter((c) => c.tool_a?.status === 'published' && c.tool_b?.status === 'published');
}

function mdEscape(text) {
  return String(text).replace(/[[\]]/g, '').replace(/\r?\n/g, ' ').trim();
}

function truncate(text, max) {
  const trimmed = text.trim();
  if (trimmed.length <= max) return trimmed;
  const cut = trimmed.slice(0, max - 1);
  const lastSpace = cut.lastIndexOf(' ');
  const clean = lastSpace > max - 20 ? cut.slice(0, lastSpace) : cut;
  return `${clean.trimEnd()}…`;
}

async function generateLlmsTxt() {
  const supabase = initSupabase();
  const [tools, categories, comparisons] = await Promise.all([
    fetchTools(supabase),
    fetchCategories(supabase),
    fetchComparisons(supabase),
  ]);

  const lines = [];
  lines.push('# Gappsy');
  lines.push('');
  lines.push(
    '> Gappsy is a directory of business and marketing software tools, with independent, ' +
      'DB-verified comparison pages covering pricing, features, and head-to-head verdicts to ' +
      'help buyers pick the right tool.'
  );
  lines.push('');
  lines.push(
    '> All facts on tool and comparison pages (pricing, ratings, platform support, feature ' +
      'availability) are sourced directly from Gappsy\'s own database, not inferred.'
  );
  lines.push('');

  if (categories.length > 0) {
    lines.push('## Categories');
    lines.push('');
    for (const c of categories) {
      lines.push(`- [${mdEscape(c.name)}](${CANONICAL_DOMAIN}/tool-categories/${c.slug}/)`);
    }
    lines.push('');
  }

  if (tools.length > 0) {
    lines.push('## Tools');
    lines.push('');

    // Growth-subscribed tools (tools.featured) get their own, earlier
    // section — genuine priority placement for AI/LLM answer engines that
    // weight earlier content more heavily, not just a cosmetic label. The
    // full alphabetical list below still includes them too, so nothing is
    // ever omitted from the complete index.
    const featuredTools = tools.filter((t) => t.featured);
    if (featuredTools.length > 0) {
      lines.push('### Recommended tools');
      lines.push('');
      for (const t of featuredTools) {
        const summary = t.llm_readable_summary || t.short_description;
        const desc = summary ? `: ${mdEscape(truncate(summary, 200))}` : '';
        lines.push(`- [${mdEscape(t.name)}](${CANONICAL_DOMAIN}/tools/${t.slug}/)${desc}`);
      }
      lines.push('');
    }

    lines.push('### All tools');
    lines.push('');
    for (const t of tools) {
      const summary = t.llm_readable_summary || t.short_description;
      const desc = summary ? `: ${mdEscape(truncate(summary, 200))}` : '';
      lines.push(`- [${mdEscape(t.name)}](${CANONICAL_DOMAIN}/tools/${t.slug}/)${desc}`);
    }
    lines.push('');
  }

  if (comparisons.length > 0) {
    lines.push('## Comparisons');
    lines.push('');
    for (const c of comparisons) {
      const title = `${c.tool_a.name} vs ${c.tool_b.name}`;
      lines.push(`- [${mdEscape(title)}](${CANONICAL_DOMAIN}/compare/${c.slug}/)`);
    }
    lines.push('');
  }

  lines.push('## Optional');
  lines.push('');
  lines.push(`- [Sitemap](${CANONICAL_DOMAIN}/sitemap.xml)`);

  const outputPath = path.join(__dirname, '..', 'public', 'llms.txt');
  fs.writeFileSync(outputPath, `${lines.join('\n')}\n`, 'utf8');
  console.log(
    `llms.txt generated: ${tools.length} tool(s), ${comparisons.length} comparison(s), ${categories.length} categor(y/ies) -> ${outputPath}`
  );
}

generateLlmsTxt().catch((err) => {
  console.error('❌ Failed to generate llms.txt:', err.message);
  process.exit(1);
});
