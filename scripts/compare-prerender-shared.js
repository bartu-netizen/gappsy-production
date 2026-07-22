// Shared per-tool-id fetchers used by both prerender-comparisons.js (2-tool)
// and prerender-group-comparisons.js (N-tool) — one place for the Supabase
// queries that back the Pricing / Pros & Cons / Use Cases / Screenshots /
// At a Glance sections in both pages' static (crawlable) HTML, so the two
// scripts can't silently drift from each other.
import { fetchInChunks } from './prerender-tools.js';

// Mirrors src/components/tools/detail/ToolFactsSidebar.tsx's PLATFORM_TAGS —
// tag slugs with no dedicated `tools` column, read from tool_tag_links.
export const PLATFORM_TAG_LABELS = {
  'web-app': 'Web',
  ios: 'iOS',
  android: 'Android',
  mac: 'Mac',
  windows: 'Windows',
  'chrome-extension': 'Browser Extension',
  'desktop-app': 'Desktop App',
  'mobile-app': 'Mobile App',
};

export function buildFactsFlags(tagSlugs) {
  return {
    hasFreePlan: tagSlugs.has('free-plan') || tagSlugs.has('freemium'),
    hasFreeTrial: tagSlugs.has('free-trial'),
    hasApi: tagSlugs.has('api'),
    hasAI: tagSlugs.has('ai'),
    hasTeamCollaboration: tagSlugs.has('real-time-collaboration') || tagSlugs.has('team-management'),
    platforms: Object.entries(PLATFORM_TAG_LABELS).filter(([slug]) => tagSlugs.has(slug)).map(([, label]) => label),
  };
}

export async function fetchTagsByToolId(supabase, toolIds) {
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

export async function fetchCategoriesByToolId(supabase, toolIds) {
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

export async function fetchPricingPlansByToolId(supabase, toolIds) {
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

// Live equivalents of getToolContent's pros/cons/useCases — the file
// registry only covers a couple of flagship tools, so this is what makes
// the Pros & Cons / Use Cases sections non-empty in the crawlable static
// HTML for the other ~99% of comparisons (mirrors fetchToolExtras in
// src/components/compare/compareToolFacts.ts).
export async function fetchProsByToolId(supabase, toolIds) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await fetchInChunks(toolIds, (ids) => supabase.from('tool_pros').select('tool_id, text, sort_order').in('tool_id', ids).order('sort_order', { ascending: true }));
  if (error) throw new Error(`Failed to fetch tool pros: ${error.message}`);
  const map = new Map();
  for (const row of data || []) {
    const list = map.get(row.tool_id) || [];
    list.push(row.text);
    map.set(row.tool_id, list);
  }
  return map;
}

export async function fetchConsByToolId(supabase, toolIds) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await fetchInChunks(toolIds, (ids) => supabase.from('tool_cons').select('tool_id, text, sort_order').in('tool_id', ids).order('sort_order', { ascending: true }));
  if (error) throw new Error(`Failed to fetch tool cons: ${error.message}`);
  const map = new Map();
  for (const row of data || []) {
    const list = map.get(row.tool_id) || [];
    list.push(row.text);
    map.set(row.tool_id, list);
  }
  return map;
}

export async function fetchUseCasesByToolId(supabase, toolIds) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await fetchInChunks(toolIds, (ids) => supabase.from('tool_use_cases').select('tool_id, title, description, audience, sort_order').in('tool_id', ids).order('sort_order', { ascending: true }));
  if (error) throw new Error(`Failed to fetch tool use cases: ${error.message}`);
  const map = new Map();
  for (const row of data || []) {
    const list = map.get(row.tool_id) || [];
    list.push({ title: row.title, description: row.description || '', audience: row.audience || '' });
    map.set(row.tool_id, list);
  }
  return map;
}

export async function fetchScreenshotsByToolId(supabase, toolIds) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await fetchInChunks(toolIds, (ids) => supabase.from('tool_screenshots').select('tool_id, image_url, caption, sort_order').in('tool_id', ids).order('sort_order', { ascending: true }));
  if (error) throw new Error(`Failed to fetch tool screenshots: ${error.message}`);
  const map = new Map();
  for (const row of data || []) {
    const list = map.get(row.tool_id) || [];
    list.push({ image_url: row.image_url, caption: row.caption || '' });
    map.set(row.tool_id, list);
  }
  return map;
}
