import type { TaxonomyRef } from '../tools/detail/types';

// Shared, DB+tag-derived fact shape for one side of a comparison. Built
// once in CompareDetailPage from `tools` columns + tool_tag_links (the same
// tag-derived-flag pattern ToolFactsSidebar.tsx already uses on the tool
// detail page) and passed down to every Compare section component below —
// one seam between Supabase rows and the presentational layer, mirroring
// tools/detail/types.ts.
export interface CompareToolFacts {
  slug: string;
  name: string;
  logo: string | null;
  websiteUrl: string | null;
  affiliateUrl: string | null;
  rating: number;
  reviewCount: number;
  verified: boolean;
  pricingModel: string | null;
  startingPrice: string | null;
  primaryCategory: TaxonomyRef | null;
  hasFreePlan: boolean;
  hasFreeTrial: boolean;
  hasApi: boolean;
  hasAI: boolean;
  hasTeamCollaboration: boolean;
  platforms: string[];
  integrationCount: number;
}
