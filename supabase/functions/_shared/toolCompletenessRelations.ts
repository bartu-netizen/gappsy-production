// Batch completeness-relation fetchers, extracted from admin-tools/index.ts
// so the new completeness_rescan scheduler job (and any future caller) can
// reuse the exact same fixed ~9-query batch pattern instead of computing
// completeness one tool at a time. Behavior is unchanged from the
// admin-tools originals — this is a pure move, not a rewrite.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { FIRST_PUBLISH_DEFAULT_REQUIRED_KEYS, type ToolCompletenessInput } from "./toolCompleteness.ts";

export async function attachToolCategories(supabase: SupabaseClient, toolIds: string[]) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await supabase
    .from("tool_category_links")
    .select("tool_id, primary_category, tool_categories(id, slug, name)")
    .in("tool_id", toolIds);
  if (error) throw new Error(`Failed to load tool categories: ${error.message}`);

  const map = new Map<string, unknown[]>();
  for (const row of (data || []) as any[]) {
    const list = map.get(row.tool_id) || [];
    list.push({ ...row.tool_categories, primary_category: row.primary_category });
    map.set(row.tool_id, list);
  }
  return map;
}

export async function attachToolTags(supabase: SupabaseClient, toolIds: string[]) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await supabase
    .from("tool_tag_links")
    .select("tool_id, tool_tags(id, slug, name)")
    .in("tool_id", toolIds);
  if (error) throw new Error(`Failed to load tool tags: ${error.message}`);

  const map = new Map<string, unknown[]>();
  for (const row of (data || []) as any[]) {
    const list = map.get(row.tool_id) || [];
    list.push(row.tool_tags);
    map.set(row.tool_id, list);
  }
  return map;
}

// A fixed set of bulk queries regardless of how many tools are being
// scored — this is what lets both the admin-tools list endpoint AND the
// completeness_rescan scheduler job stay cheap at 50,000+ tools: never one
// query per tool, always ~9 queries per batch.
export async function fetchCompletenessRelations(supabase: SupabaseClient, toolIds: string[]) {
  if (toolIds.length === 0) {
    return { screenshots: new Map(), faqs: new Map(), pros: new Map(), cons: new Map(), useCases: new Map(), pricingPlans: new Map(), features: new Map(), integrations: new Map(), tags: new Map() };
  }
  const [screenshots, faqs, pros, cons, useCases, pricingPlans, features, integrations, tags] = await Promise.all([
    supabase.from("tool_screenshots").select("tool_id").in("tool_id", toolIds),
    supabase.from("tool_faqs").select("tool_id").in("tool_id", toolIds),
    supabase.from("tool_pros").select("tool_id").in("tool_id", toolIds),
    supabase.from("tool_cons").select("tool_id").in("tool_id", toolIds),
    supabase.from("tool_use_cases").select("tool_id").in("tool_id", toolIds),
    supabase.from("tool_pricing_plans").select("tool_id").in("tool_id", toolIds),
    supabase.from("tool_features").select("tool_id").in("tool_id", toolIds),
    supabase.from("tool_integrations").select("tool_id").in("tool_id", toolIds),
    supabase.from("tool_tag_links").select("tool_id").in("tool_id", toolIds),
  ]);
  const countBy = (rows: any[]) => {
    const map = new Map<string, number>();
    for (const row of rows || []) map.set(row.tool_id, (map.get(row.tool_id) || 0) + 1);
    return map;
  };
  return {
    screenshots: countBy(screenshots.data),
    faqs: countBy(faqs.data),
    pros: countBy(pros.data),
    cons: countBy(cons.data),
    useCases: countBy(useCases.data),
    pricingPlans: countBy(pricingPlans.data),
    features: countBy(features.data),
    integrations: countBy(integrations.data),
    tags: countBy(tags.data),
  };
}

export function buildCompletenessInput(tool: any, categoryCount: number, relations: Awaited<ReturnType<typeof fetchCompletenessRelations>>): ToolCompletenessInput {
  const id = tool.id;
  return {
    name: tool.name,
    slug: tool.slug,
    website: tool.website,
    short_description: tool.short_description,
    long_description: tool.long_description,
    seo_meta_description: tool.seo_meta_description,
    seo_title: tool.seo_title,
    pricing_model: tool.pricing_model,
    status: tool.status,
    categoryCount,
    tagCount: relations.tags.get(id) || 0,
    logoPresent: Boolean(tool.logo && String(tool.logo).trim()),
    sitemapEligible: tool.sitemap_eligible !== false,
    screenshotCount: relations.screenshots.get(id) || 0,
    faqCount: relations.faqs.get(id) || 0,
    prosCount: relations.pros.get(id) || 0,
    consCount: relations.cons.get(id) || 0,
    useCaseCount: relations.useCases.get(id) || 0,
    pricingPlanCount: relations.pricingPlans.get(id) || 0,
    featureCount: relations.features.get(id) || 0,
    integrationCount: relations.integrations.get(id) || 0,
  };
}

// A simple confidence/quality composite: completeness carries most of the
// weight (it's the most reliable, deterministic signal); freshness
// (updated_at recency) nudges the score down for stale, un-reviewed
// records so an editor can find rot without a separate "stale tools"
// report. Deliberately simple and explainable — no hidden ML weighting.
export function computeQualityScore(completenessPercent: number, updatedAt: string | null): number {
  if (!updatedAt) return Math.round(completenessPercent * 0.8);
  const ageDays = (Date.now() - new Date(updatedAt).getTime()) / (24 * 60 * 60 * 1000);
  const freshnessFactor = ageDays <= 30 ? 1 : ageDays <= 90 ? 0.9 : ageDays <= 180 ? 0.75 : 0.6;
  return Math.round(completenessPercent * freshnessFactor);
}

// Reads the admin-configurable first-publish gate (publishing_rules table)
// — falls back to the historical hardcoded set ONLY on a query error (fail
// safe: an unreachable config table must never silently disable the
// publish gate). An empty-but-successful result is a valid admin choice
// (every first-publish check disabled), not an error.
export async function getConfiguredFirstPublishRequiredKeys(supabase: SupabaseClient): Promise<Set<string>> {
  const { data, error } = await supabase
    .from("publishing_rules")
    .select("field_key")
    .eq("tier", "first_publish")
    .eq("enabled", true)
    .eq("required", true);
  if (error) return FIRST_PUBLISH_DEFAULT_REQUIRED_KEYS;
  return new Set((data || []).map((r: any) => r.field_key as string));
}
