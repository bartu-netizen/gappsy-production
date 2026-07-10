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
