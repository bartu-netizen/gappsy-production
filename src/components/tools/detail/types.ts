// Shared DB-shape types used across the tool-detail "master template"
// components, so every section works generically against real query results
// (this file, not any single component, is the seam between Supabase rows
// and the presentational layer).

export interface TaxonomyRef {
  slug: string;
  name: string;
}

export interface ScreenshotItem {
  id: string;
  image_url: string;
  caption: string | null;
}

export interface PricingPlanItem {
  id: string;
  plan_name: string | null;
  price: string | null;
  billing_cycle: string | null;
  description: string | null;
  features: string[];
  sort_order: number;
}

export interface IntegrationItem {
  id: string;
  integration_name: string;
  integration_slug: string | null;
  integration_logo: string | null;
  description: string | null;
}

// A real, publicly-submitted review (tool_user_reviews_public view) —
// approved only, no reviewer_email (never exposed publicly, see migration
// 20260715040000_20260715_tool_user_reviews.sql).
export interface ReviewItem {
  id: string;
  reviewer_name: string;
  rating: number;
  title: string | null;
  body: string;
  created_at: string | null;
}
