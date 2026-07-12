// Shared crawl-extraction -> Tool Draft creation path. Moved out of
// admin-crawl-extraction/index.ts (the manual per-field review screen) so
// the automatic pipeline (crawlRunner.ts) can produce a draft the exact
// same way, without a human clicking through every field first. Never
// writes to `tools` directly — always goes through the EXISTING admin-tools
// endpoint, reusing its validation/child-row/completeness logic.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows + extraction tree walk throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import type { FaqCandidate, NormalizedExtraction, ProvenanceField } from "./crawlExtractionAdapter.ts";

export type FieldReviewStatus = "approved" | "rejected" | "edited";
export interface FieldReviewEntry {
  status: FieldReviewStatus;
  edited_value?: unknown;
  reviewed_by: string;
  reviewed_at: string;
}
export type ReviewState = Record<string, FieldReviewEntry>;

function slugify(name: string): string {
  return name.toLowerCase().trim().replace(/[^a-z0-9]+/g, "-").replace(/^-+|-+$/g, "").slice(0, 80) || "draft";
}

export async function uniqueToolSlug(supabase: SupabaseClient, base: string): Promise<string> {
  const baseSlug = slugify(base);
  let candidate = baseSlug;
  let suffix = 1;
  while (true) {
    const { data } = await supabase.from("tools").select("id").eq("slug", candidate).maybeSingle();
    if (!data) return candidate;
    suffix += 1;
    candidate = `${baseSlug}-${suffix}`;
  }
}

// Every leaf ProvenanceField in the extraction (excluding FAQs, which have
// their own shape/resolver below), addressed by a stable "group.field" path
// (arrays use "group.field[index]"), so review_state can key
// approvals without a schema-aware walker on the client.
export function walkFields(extraction: NormalizedExtraction, visit: (path: string, f: ProvenanceField<unknown>) => void) {
  for (const [groupName, group] of Object.entries(extraction) as [string, unknown][]) {
    if (groupName === "crawl_sources" || groupName === "warnings") continue;
    if (Array.isArray(group)) continue;
    for (const [fieldName, value] of Object.entries(group as Record<string, unknown>)) {
      if (fieldName === "faq_candidates") continue; // FaqCandidate has no `.value` — walked separately, see walkFaqs.
      if (Array.isArray(value)) {
        value.forEach((item, idx) => {
          if (item && typeof item === "object" && "confidence" in item) visit(`${groupName}.${fieldName}[${idx}]`, item as ProvenanceField<unknown>);
        });
      } else if (value && typeof value === "object" && "confidence" in value) {
        visit(`${groupName}.${fieldName}`, value as ProvenanceField<unknown>);
      }
    }
  }
}

export function walkFaqs(extraction: NormalizedExtraction, visit: (path: string, faq: FaqCandidate) => void) {
  extraction.content.faq_candidates.forEach((faq, idx) => visit(`content.faq_candidates[${idx}]`, faq));
}

export function resolveApprovedValue(path: string, field: ProvenanceField<unknown>, reviewState: ReviewState): unknown {
  const entry = reviewState[path];
  if (!entry) return null;
  if (entry.status === "rejected") return null;
  if (entry.status === "edited") return entry.edited_value;
  if (entry.status === "approved") return field.value;
  return null;
}

export function resolveApprovedFaq(path: string, faq: FaqCandidate, reviewState: ReviewState): { question: string; answer: string } | null {
  const entry = reviewState[path];
  if (!entry) return null;
  if (entry.status === "rejected") return null;
  if (entry.status === "edited") return entry.edited_value as { question: string; answer: string };
  if (entry.status === "approved") return { question: faq.question, answer: faq.answer };
  return null;
}

// Marks every field with a non-null value as "approved" — the automatic
// pipeline's stand-in for a human clicking through the review screen.
// Never marks a null/empty field approved (there is nothing to approve),
// which is exactly how "mark missing fields" falls out for free: anything
// left out of the returned ReviewState is a field the crawl never found.
export function buildAutoApproveReviewState(extraction: NormalizedExtraction, reviewedBy: string): ReviewState {
  const now = new Date().toISOString();
  const reviewState: ReviewState = {};
  walkFields(extraction, (path, f) => {
    if (f.value !== null && f.value !== undefined && f.value !== "") {
      reviewState[path] = { status: "approved", reviewed_by: reviewedBy, reviewed_at: now };
    }
  });
  walkFaqs(extraction, (path, faq) => {
    if (faq.question && faq.answer) {
      reviewState[path] = { status: "approved", reviewed_by: reviewedBy, reviewed_at: now };
    }
  });
  return reviewState;
}

export interface DraftCandidateInfo {
  id: string;
  name: string;
  official_website: string | null;
  category_id: string | null;
}

// Every group.field this module is prepared to map into a Tool Draft field,
// used only to compute "what's known to be missing" for editorial_notes —
// keep in sync with the mapping in buildToolPayloadFromExtraction below.
const KEY_SCALAR_PATHS: { path: string; label: string }[] = [
  { path: "identity.canonical_website", label: "website" },
  { path: "identity.logo_candidates[0]", label: "logo" },
  { path: "identity.meta_description", label: "short description" },
  { path: "pricing.pricing_model_candidate", label: "pricing model" },
  { path: "pricing.starting_price_candidate", label: "starting price" },
  { path: "company.founded_year_candidate", label: "founded year" },
  { path: "company.headquarters_candidate", label: "headquarters" },
  { path: "company.company_size_candidate", label: "company size" },
  { path: "product.api_documentation", label: "API documentation" },
];

// Builds the admin-tools POST payload from an extraction + whatever review
// decisions exist (human-made for the manual path, buildAutoApproveReviewState's
// output for the automatic path) — the exact same function serves both.
export function buildToolPayloadFromExtraction(
  extraction: NormalizedExtraction,
  reviewState: ReviewState,
  candidate: DraftCandidateInfo,
  crawlJobId: string,
  crawlCompletedAt: string | null,
): { payload: Record<string, unknown>; missingFields: string[] } {
  const nameValue = resolveApprovedValue("identity.tool_name_candidate", extraction.identity.tool_name_candidate, reviewState) as string | null;
  const websiteValue = resolveApprovedValue("identity.canonical_website", extraction.identity.canonical_website, reviewState) as string | null;
  const logoValue = resolveApprovedValue(
    "identity.logo_candidates[0]",
    extraction.identity.logo_candidates[0] || { value: null, source_url: null, evidence: null, confidence: 0, review_status: "pending" },
    reviewState,
  ) as string | null;
  const descValue = resolveApprovedValue("identity.meta_description", extraction.identity.meta_description, reviewState) as string | null;
  const pricingModelValue = resolveApprovedValue("pricing.pricing_model_candidate", extraction.pricing.pricing_model_candidate, reviewState) as string | null;
  const startingPriceValue = resolveApprovedValue("pricing.starting_price_candidate", extraction.pricing.starting_price_candidate, reviewState) as string | null;
  const foundedValue = resolveApprovedValue("company.founded_year_candidate", extraction.company.founded_year_candidate, reviewState) as string | null;
  const hqValue = resolveApprovedValue("company.headquarters_candidate", extraction.company.headquarters_candidate, reviewState) as string | null;
  const sizeValue = resolveApprovedValue("company.company_size_candidate", extraction.company.company_size_candidate, reviewState) as string | null;

  const finalName = nameValue || candidate.name || "Untitled";

  const missingFields = KEY_SCALAR_PATHS
    .filter(({ path }) => {
      const [group, rest] = path.split(".");
      const arrayMatch = rest.match(/^([a-zA-Z_]+)\[(\d+)\]$/);
      const f = arrayMatch
        ? ((extraction as any)[group]?.[arrayMatch[1]] || [])[Number(arrayMatch[2])]
        : (extraction as any)[group]?.[rest];
      return !f || f.value === null || f.value === undefined || f.value === "";
    })
    .map(({ label }) => label);

  const payload: Record<string, unknown> = {
    name: finalName,
    status: "needs_review",
    noindex: true,
    sitemap_eligible: false,
    source: "api",
    source_url: candidate.official_website || websiteValue || undefined,
    website: websiteValue || candidate.official_website || undefined,
    logo: logoValue || undefined,
    short_description: descValue || undefined,
    pricing_model: pricingModelValue || undefined,
    starting_price: startingPriceValue || undefined,
    founded_year: foundedValue ? Number(foundedValue) : undefined,
    headquarters: hqValue || undefined,
    company_size: sizeValue || undefined,
    editorial_notes: [
      `Created from Crawl4AI extraction. discovery_candidate_id=${candidate.id} crawl_job_id=${crawlJobId}`,
      crawlCompletedAt ? `crawled_at=${crawlCompletedAt}` : null,
      "Review all fields before publishing — nothing here has been independently verified.",
      missingFields.length > 0 ? `Fields the crawl could not find (need manual research): ${missingFields.join(", ")}.` : null,
    ].filter(Boolean).join(" "),
  };

  // Repeatable groups — additive, never invented: each entry only exists
  // because the extraction found real evidence for it.
  const features: { group_name: null; title: string; description: null; sort_order: number }[] = [];
  extraction.product.feature_candidates.forEach((f, idx) => {
    const v = resolveApprovedValue(`product.feature_candidates[${idx}]`, f, reviewState) as string | null;
    if (v) features.push({ group_name: null, title: v, description: null, sort_order: features.length });
  });
  if (features.length > 0) payload.features = features;

  const integrations: { integration_name: string; integration_slug: null; integration_logo: null; description: null }[] = [];
  extraction.product.integrations.forEach((f, idx) => {
    const v = resolveApprovedValue(`product.integrations[${idx}]`, f, reviewState) as string | null;
    if (v) integrations.push({ integration_name: v, integration_slug: null, integration_logo: null, description: null });
  });
  if (integrations.length > 0) payload.integrations = integrations;

  const faqs: { question: string; answer: string; status: "draft"; sort_order: number }[] = [];
  walkFaqs(extraction, (path, faq) => {
    const resolved = resolveApprovedFaq(path, faq, reviewState);
    if (resolved) faqs.push({ question: resolved.question, answer: resolved.answer, status: "draft", sort_order: faqs.length });
  });
  if (faqs.length > 0) payload.faqs = faqs;

  const screenshots: { image_url: string; caption: null; alt_text: null; is_featured: boolean; sort_order: number }[] = [];
  extraction.assets.screenshot_candidates.forEach((f, idx) => {
    const v = resolveApprovedValue(`assets.screenshot_candidates[${idx}]`, f, reviewState) as string | null;
    if (v) screenshots.push({ image_url: v, caption: null, alt_text: null, is_featured: screenshots.length === 0, sort_order: screenshots.length });
  });
  if (screenshots.length > 0) payload.screenshots = screenshots;

  // Categories/tags: union of the discovery candidate's own category (if
  // any) with taxonomy suggestions the crawl matched against EXISTING
  // taxonomy — never a newly-invented category/tag.
  const suggestedCategoryIds: string[] = [];
  extraction.taxonomy.category_suggestions.forEach((f, idx) => {
    const v = resolveApprovedValue(`taxonomy.category_suggestions[${idx}]`, f, reviewState) as string | null;
    if (v) suggestedCategoryIds.push(v);
  });
  const categoryIds = [...new Set([candidate.category_id, ...suggestedCategoryIds].filter((v): v is string => Boolean(v)))];
  if (categoryIds.length > 0) {
    payload.category_ids = categoryIds;
    payload.primary_category_id = candidate.category_id || categoryIds[0];
  }

  const tagIds: string[] = [];
  extraction.taxonomy.tag_suggestions.forEach((f, idx) => {
    const v = resolveApprovedValue(`taxonomy.tag_suggestions[${idx}]`, f, reviewState) as string | null;
    if (v) tagIds.push(v);
  });
  if (tagIds.length > 0) payload.tag_ids = tagIds;

  return { payload, missingFields };
}

export interface CreateDraftResult {
  ok: true;
  tool: any;
  missingFields: string[];
}
export interface CreateDraftError {
  ok: false;
  error: string;
}

// Calls the EXISTING admin-tools creation endpoint — same validation, same
// child-row handling, same completeness gate — rather than inserting into
// `tools` directly. `adminToken` is the caller's own already-verified admin
// session token (manual path) or a freshly-created system session (automatic
// path, see crawlRunner.ts).
export async function createDraftFromCrawlJob(
  supabase: SupabaseClient,
  supabaseUrl: string,
  anonKey: string,
  adminToken: string,
  job: { id: string; discovery_candidate_id: string; completed_at: string | null },
  extraction: NormalizedExtraction,
  reviewState: ReviewState,
): Promise<CreateDraftResult | CreateDraftError> {
  const { data: candidate } = await supabase
    .from("discovered_tools")
    .select("id, name, official_website, category_id")
    .eq("id", job.discovery_candidate_id)
    .maybeSingle();
  if (!candidate) return { ok: false, error: "Discovery candidate not found" };

  const nameValue = resolveApprovedValue("identity.tool_name_candidate", extraction.identity.tool_name_candidate, reviewState) as string | null;
  if (!nameValue && !candidate.name) return { ok: false, error: "No tool name available — approve or edit a name before creating a draft." };

  const { payload, missingFields } = buildToolPayloadFromExtraction(
    extraction,
    reviewState,
    candidate as DraftCandidateInfo,
    job.id,
    job.completed_at,
  );
  payload.slug = await uniqueToolSlug(supabase, payload.name as string);

  const res = await fetch(`${supabaseUrl}/functions/v1/admin-tools`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${anonKey}`,
      "apikey": anonKey,
      "x-admin-token": adminToken,
    },
    body: JSON.stringify(payload),
  });
  const body = await res.json().catch(() => null);
  if (!res.ok || !body?.ok) {
    return { ok: false, error: body?.error || "Failed to create the tool draft." };
  }

  await supabase.from("crawl_jobs").update({ created_draft_tool_id: body.data.id, updated_at: new Date().toISOString() }).eq("id", job.id);

  return { ok: true, tool: body.data, missingFields };
}
