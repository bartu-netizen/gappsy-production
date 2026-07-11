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
// Recommended items only affect the percentage.

export interface ToolCompletenessInput {
  name: string | null;
  slug: string | null;
  website: string | null;
  short_description: string | null;
  long_description: string | null;
  seo_meta_description: string | null;
  pricing_model: string | null;
  status: string;
  categoryCount: number;
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

    { key: "screenshots", label: "Screenshots", required: false, met: input.screenshotCount > 0 },
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
