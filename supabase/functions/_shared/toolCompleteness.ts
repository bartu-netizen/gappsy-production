// Deterministic tool-completeness scoring — Deno/edge-function side.
// MUST stay in sync with src/utils/toolCompleteness.ts (the frontend
// mirror, used for live completeness in the editor and the Tools list
// column). Two copies, not a shared import, because supabase/functions
// (Deno) and src/ (Vite/browser) are different runtimes/toolchains — same
// pattern already used for generateToolDescription between
// scripts/tool-seo-generator.js and src/pages/ToolDetailPage.tsx.
//
// Required items gate publishing (see admin-tools/index.ts's
// validatePublishRequirements, the actual enforcement point — this module
// only computes the score/labels, it never blocks anything by itself).
// Recommended items only affect the percentage and the CMS-style checklist.
//
// A second, stricter gate — validateFirstPublishStrict below — applies
// only at the moment a tool first transitions into 'published'. It is not
// part of the required set here because Canva/Figma (published before this
// checklist existed) have zero DB logo/screenshots/features/FAQs — they
// render from file-based editorial content instead. Making those fields
// universally required would block ordinary re-saves of already-published
// tools. See admin-tools/index.ts for where this is invoked.

export interface ToolCompletenessInput {
  name: string | null;
  slug: string | null;
  website: string | null;
  short_description: string | null;
  long_description: string | null;
  seo_meta_description: string | null;
  seo_title: string | null;
  pricing_model: string | null;
  status: string;
  categoryCount: number;
  tagCount: number;
  logoPresent: boolean;
  sitemapEligible: boolean;
  screenshotCount: number;
  faqCount: number;
  prosCount: number;
  consCount: number;
  useCaseCount: number;
  pricingPlanCount: number;
  featureCount: number;
  integrationCount: number;
}

export interface CompletenessItem {
  key: string;
  label: string;
  required: boolean;
  met: boolean;
}

export interface CompletenessResult {
  percent: number;
  requiredMet: boolean;
  missingRequired: string[];
  items: CompletenessItem[];
}

function hasText(value: string | null | undefined): boolean {
  return Boolean(value && value.trim().length > 0);
}

export function computeCompleteness(input: ToolCompletenessInput): CompletenessResult {
  const items: CompletenessItem[] = [
    { key: "name", label: "Name", required: true, met: hasText(input.name) },
    { key: "slug", label: "Slug", required: true, met: hasText(input.slug) },
    { key: "website", label: "Website", required: true, met: hasText(input.website) },
    { key: "category", label: "Category", required: true, met: input.categoryCount > 0 },
    { key: "description", label: "Description", required: true, met: hasText(input.short_description) || hasText(input.long_description) },
    {
      key: "seo",
      label: "SEO meta description",
      required: true,
      met: hasText(input.seo_meta_description) || hasText(input.short_description) || hasText(input.long_description),
    },
    { key: "pricing_model", label: "Pricing model", required: true, met: hasText(input.pricing_model) },
    { key: "status", label: "Status", required: true, met: hasText(input.status) },

    { key: "seo_title", label: "Meta title", required: false, met: hasText(input.seo_title) },
    { key: "canonical", label: "Canonical URL", required: false, met: hasText(input.slug) },
    { key: "sitemap_eligible", label: "Sitemap eligibility", required: false, met: input.sitemapEligible },
    { key: "tags", label: "Tags", required: false, met: input.tagCount > 0 },
    { key: "logo", label: "Logo", required: false, met: input.logoPresent },
    { key: "screenshots", label: "Screenshots (hero image)", required: false, met: input.screenshotCount > 0 },
    { key: "faq", label: "FAQ", required: false, met: input.faqCount > 0 },
    { key: "pros", label: "Pros", required: false, met: input.prosCount > 0 },
    { key: "cons", label: "Cons", required: false, met: input.consCount > 0 },
    { key: "use_cases", label: "Use cases", required: false, met: input.useCaseCount > 0 },
    { key: "pricing_plans", label: "Pricing plans", required: false, met: input.pricingPlanCount > 0 },
    { key: "features", label: "Features", required: false, met: input.featureCount > 0 },
    { key: "integrations", label: "Integrations", required: false, met: input.integrationCount > 0 },
  ];

  const metCount = items.filter((i) => i.met).length;
  const percent = Math.round((metCount / items.length) * 100);
  const missingRequired = items.filter((i) => i.required && !i.met).map((i) => i.label);

  return { percent, requiredMet: missingRequired.length === 0, missingRequired, items };
}

// The base required-for-publish gate — reusable by any edge function that
// creates or updates a tool (admin-tools today; a future import/AI/bulk
// pipeline tomorrow, without duplicating this logic). Returns the list of
// missing human-readable labels; empty array means the gate passes. Callers
// decide what to do with a non-empty result (admin-tools throws a
// ValidationError with this list joined into the message).
export function getMissingPublishRequirements(merged: {
  name: string;
  slug: string;
  website: string | null;
  short_description: string | null;
  long_description: string | null;
  seo_meta_description: string | null;
  pricing_model: string | null;
  categoryIds: string[];
}): string[] {
  const missing: string[] = [];
  if (!merged.name?.trim()) missing.push("name");
  if (!merged.slug?.trim()) missing.push("slug");
  if (!merged.website?.trim()) missing.push("website");
  if (merged.categoryIds.length === 0) missing.push("category");
  if (!merged.short_description?.trim() && !merged.long_description?.trim()) missing.push("description");
  if (!merged.seo_meta_description?.trim() && !merged.short_description?.trim() && !merged.long_description?.trim()) {
    missing.push("SEO meta description");
  }
  if (!merged.pricing_model?.trim()) missing.push("pricing model");
  return missing;
}

// The stricter gate applied only at the draft/ready_to_publish -> published
// transition (see admin-tools/index.ts). Returns the list of missing
// human-readable labels; empty array means the gate passes.
//
// Deliberately does NOT include canonical URL or JSON-LD/schema as separate
// checks here even though the Phase 4 spec lists them: both are always
// satisfied automatically once name/slug/website/description are present
// (already-required fields getMissingPublishRequirements enforces), so a
// separate blocking check would be a no-op that can never actually fire.
// The Publishing/Validation tab still displays them as pass/fail items —
// see toolCompleteness's "canonical" item — so the CMS checklist reads
// honestly without adding a redundant gate.
export function validateFirstPublishStrict(input: {
  logoPresent: boolean;
  screenshotCount: number;
  featureCount: number;
  faqCount: number;
  tagCount: number;
  seoTitlePresent: boolean;
}): string[] {
  const missing: string[] = [];
  if (!input.logoPresent) missing.push("logo");
  if (input.screenshotCount === 0) missing.push("hero image / screenshot");
  if (input.featureCount === 0) missing.push("at least one feature");
  if (input.faqCount === 0) missing.push("at least one FAQ");
  if (input.tagCount === 0) missing.push("at least one tag");
  if (!input.seoTitlePresent) missing.push("meta title");
  return missing;
}
