// Shared DB-fetch + fact-building logic for one tool's side of a
// comparison — extracted from CompareDetailPage so GroupCompareDetailPage
// (N tools instead of exactly 2) can reuse the exact same logic rather than
// duplicating it.
import { PLATFORM_TAGS } from '../tools/detail/ToolFactsSidebar';
import type { TaxonomyRef, ScreenshotItem, PricingPlanItem } from '../tools/detail/types';
import type { CompareToolFacts } from './types';
import { supabase } from '../../lib/supabase';

export interface ToolRow {
  id: string;
  slug: string;
  name: string;
  logo: string | null;
  website: string | null;
  affiliate_link: string | null;
  pricing_model: string | null;
  starting_price: string | null;
  rating: number;
  review_count: number;
  verified: boolean;
}

export interface ToolExtras {
  primaryCategory: TaxonomyRef | null;
  tagSlugs: Set<string>;
  integrationCount: number;
  pricingPlans: PricingPlanItem[];
  screenshots: ScreenshotItem[];
}

export const EMPTY_EXTRAS: ToolExtras = { primaryCategory: null, tagSlugs: new Set(), integrationCount: 0, pricingPlans: [], screenshots: [] };

export function isSafeHttpUrl(value: string | null | undefined): value is string {
  if (!value) return false;
  if (value.startsWith('//')) return false;
  try {
    const parsed = new URL(value);
    return parsed.protocol === 'http:' || parsed.protocol === 'https:';
  } catch {
    return false;
  }
}

export async function fetchToolExtras(toolId: string): Promise<ToolExtras> {
  const [catResult, tagResult, integrationsResult, pricingResult, screenshotsResult] = await Promise.all([
    supabase
      .from('tool_category_links')
      .select('primary_category, tool_categories!inner(id, slug, name, status)')
      .eq('tool_id', toolId)
      .eq('tool_categories.status', 'published'),
    supabase.from('tool_tag_links').select('tool_tags(slug)').eq('tool_id', toolId),
    supabase.from('tool_integrations').select('id', { count: 'exact', head: true }).eq('tool_id', toolId),
    supabase
      .from('tool_pricing_plans')
      .select('id, plan_name, price, billing_cycle, description, features, sort_order')
      .eq('tool_id', toolId)
      .order('sort_order', { ascending: true }),
    supabase.from('tool_screenshots').select('id, image_url, caption').eq('tool_id', toolId).order('sort_order', { ascending: true }),
  ]);

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const categoryLinks = (catResult.data || []) as any[];
  const primaryLink = categoryLinks.find((r) => r.primary_category) || categoryLinks[0] || null;
  const primaryCategory: TaxonomyRef | null = primaryLink?.tool_categories || null;

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const tagSlugs = new Set(((tagResult.data || []) as any[]).map((r) => r.tool_tags?.slug).filter(Boolean));

  return {
    primaryCategory,
    tagSlugs,
    integrationCount: integrationsResult.count || 0,
    pricingPlans: (pricingResult.data || []).map((p) => ({ ...p, features: Array.isArray(p.features) ? p.features : [] })),
    screenshots: (screenshotsResult.data || []).filter((s) => isSafeHttpUrl(s.image_url)),
  };
}

export function buildFacts(tool: ToolRow, extras: ToolExtras): CompareToolFacts {
  const platforms = PLATFORM_TAGS.filter((p) => extras.tagSlugs.has(p.slug)).map((p) => p.label);
  return {
    slug: tool.slug,
    name: tool.name,
    logo: isSafeHttpUrl(tool.logo) ? tool.logo : null,
    websiteUrl: isSafeHttpUrl(tool.website) ? tool.website : null,
    affiliateUrl: isSafeHttpUrl(tool.affiliate_link) ? tool.affiliate_link : null,
    rating: tool.rating,
    reviewCount: tool.review_count,
    verified: tool.verified,
    pricingModel: tool.pricing_model,
    startingPrice: tool.starting_price,
    primaryCategory: extras.primaryCategory,
    hasFreePlan: extras.tagSlugs.has('free-plan') || extras.tagSlugs.has('freemium'),
    hasFreeTrial: extras.tagSlugs.has('free-trial'),
    hasApi: extras.tagSlugs.has('api'),
    hasAI: extras.tagSlugs.has('ai'),
    hasTeamCollaboration: extras.tagSlugs.has('real-time-collaboration') || extras.tagSlugs.has('team-management'),
    platforms,
    integrationCount: extras.integrationCount,
  };
}
