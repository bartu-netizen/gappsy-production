import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { computeCompleteness, validateFirstPublishStrict, type ToolCompletenessInput } from "../_shared/toolCompleteness.ts";

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const TOOL_FIELDS = [
  "slug", "name", "logo", "website", "affiliate_link", "short_description",
  "long_description", "pricing_model", "starting_price", "youtube_url",
  "verified", "featured", "rating", "review_count", "status",
  "founded_year", "company_size", "headquarters", "languages",
  "seo_title", "seo_meta_description", "og_title", "og_description", "og_image",
  "noindex", "sitemap_eligible", "is_editors_pick",
  "source", "source_url", "scheduled_publish_at", "canonical_url",
];

const URL_FIELDS = ["website", "affiliate_link", "logo", "youtube_url", "og_image", "source_url", "canonical_url"];
const VALID_SOURCES = new Set(["manual", "wizard", "bulk", "api"]);

// The one workflow rule the publishing pipeline enforces server-side:
// Draft can never become Published in a single step unless explicitly
// forced. Every other transition (including skips like needs_review ->
// published, or moving backward) stays as flexible as it already was —
// the Publishing Queue's bulk "Move to X" actions rely on that
// flexibility, and the spec only calls out this one specific guard.
function validateStatusTransition(fromStatus: string | null, toStatus: string | undefined, force: boolean) {
  if (!toStatus || toStatus === fromStatus) return;
  const effectiveFrom = fromStatus ?? "draft";
  if (effectiveFrom === "draft" && toStatus === "published" && !force) {
    throw new ValidationError(
      'Cannot publish directly from Draft. Move it to "Ready to Publish" first, or confirm "Force publish" to override.'
    );
  }
}

// Optional ISO-8601 timestamp, e.g. tools.scheduled_publish_at.
function validateOptionalTimestamp(value: unknown, fieldName: string): string | null {
  if (value === undefined || value === null || value === "") return null;
  if (typeof value !== "string") {
    throw new ValidationError(`${fieldName} must be a string`);
  }
  const parsed = new Date(value);
  if (Number.isNaN(parsed.getTime())) {
    throw new ValidationError(`${fieldName} is not a valid date/time`);
  }
  return parsed.toISOString();
}

const UNIQUE_VIOLATION = "23505";
const SORTABLE_COLUMNS = new Set(["name", "updated_at", "created_at", "rating"]);
const DEFAULT_PER_PAGE = 25;
const MAX_PER_PAGE = 100;

class ValidationError extends Error {}

// Validates an optional URL field. Accepts only http:// and https://, rejects
// protocol-relative ("//host"), javascript:/data:/file: schemes, and malformed
// input. Returns null for empty/null/undefined (field is optional).
function validateOptionalUrl(value: unknown, fieldName: string): string | null {
  if (value === undefined || value === null || value === "") return null;
  if (typeof value !== "string") {
    throw new ValidationError(`${fieldName} must be a string`);
  }
  const trimmed = value.trim();
  if (trimmed === "") return null;
  if (trimmed.startsWith("//")) {
    throw new ValidationError(`${fieldName} must not be a protocol-relative URL`);
  }
  let parsed: URL;
  try {
    parsed = new URL(trimmed);
  } catch {
    throw new ValidationError(`${fieldName} is not a valid URL`);
  }
  if (parsed.protocol !== "http:" && parsed.protocol !== "https:") {
    throw new ValidationError(`${fieldName} must use http:// or https://`);
  }
  return trimmed;
}

interface ScreenshotInput {
  image_url: string;
  caption: string | null;
  alt_text: string | null;
  is_featured: boolean;
  sort_order: number;
}

interface ReviewInput {
  author_name: string;
  author_title: string | null;
  rating: number;
  quote: string;
  source: string | null;
  sort_order: number;
}

interface PricingPlanInput {
  plan_name: string | null;
  price: string | null;
  billing_cycle: string | null;
  description: string | null;
  features: string[];
  is_recommended: boolean;
  sort_order: number;
}

interface IntegrationInput {
  integration_name: string;
  integration_slug: string | null;
  integration_logo: string | null;
  description: string | null;
}

interface FeatureInput {
  group_name: string | null;
  title: string;
  description: string | null;
  sort_order: number;
}

interface UseCaseInput {
  title: string;
  description: string | null;
  audience: string | null;
  sort_order: number;
}

interface FaqInput {
  question: string;
  answer: string;
  status: "draft" | "published";
  sort_order: number;
}

interface VideoInput {
  title: string | null;
  video_url: string;
  thumbnail_url: string | null;
  sort_order: number;
}

interface InternalLinkInput {
  label: string;
  url: string;
  sort_order: number;
}

interface AlternativeInput {
  alternative_tool_id: string | null;
  alternative_name: string | null;
  alternative_url: string | null;
  alternative_logo: string | null;
  note: string | null;
  sort_order: number;
}

// Validates founded_year: optional, but if present must be a plausible year.
function validateOptionalYear(value: unknown, fieldName: string): number | null {
  if (value === undefined || value === null || value === "") return null;
  const year = Number(value);
  if (!Number.isInteger(year) || year < 1900 || year > 2100) {
    throw new ValidationError(`${fieldName} must be a whole number year between 1900 and 2100`);
  }
  return year;
}

// Validates `source` (provenance — manual/wizard/bulk/api): optional, but if
// present must be one of the known values. Never trusts the frontend.
function validateSource(value: unknown): string | undefined {
  if (value === undefined || value === null || value === "") return undefined;
  if (typeof value !== "string" || !VALID_SOURCES.has(value)) {
    throw new ValidationError(`source must be one of: ${[...VALID_SOURCES].join(", ")}`);
  }
  return value;
}

// Validates languages: optional array of non-empty strings (deduped, trimmed).
function validateLanguages(value: unknown): string[] {
  if (value === undefined || value === null) return [];
  if (!Array.isArray(value)) {
    throw new ValidationError("languages must be an array of strings");
  }
  const cleaned = value
    .map((v) => (typeof v === "string" ? v.trim() : ""))
    .filter((v) => v.length > 0);
  return [...new Set(cleaned)];
}

function validateReviews(input: unknown): ReviewInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("reviews must be an array");
  }
  return input.map((raw, index) => {
    const review = raw as Record<string, unknown>;
    const authorName = typeof review?.author_name === "string" ? review.author_name.trim() : "";
    if (!authorName) {
      throw new ValidationError(`reviews[${index}].author_name is required`);
    }
    const quote = typeof review?.quote === "string" ? review.quote.trim() : "";
    if (!quote) {
      throw new ValidationError(`reviews[${index}].quote is required`);
    }
    const rating = Number(review?.rating);
    if (!Number.isFinite(rating) || rating < 1 || rating > 5) {
      throw new ValidationError(`reviews[${index}].rating must be a number between 1 and 5`);
    }
    const authorTitle = typeof review?.author_title === "string" && review.author_title.trim() ? review.author_title.trim() : null;
    const source = typeof review?.source === "string" && review.source.trim() ? review.source.trim() : null;
    const sortOrder = typeof review?.sort_order === "number" ? review.sort_order : index;
    return { author_name: authorName, author_title: authorTitle, rating, quote, source, sort_order: sortOrder };
  });
}

// Unlike tool URL fields, image_url is required (NOT NULL in the schema) —
// an empty/invalid value is rejected rather than silently dropped.
function validateScreenshots(input: unknown): ScreenshotInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("screenshots must be an array");
  }
  return input.map((raw, index) => {
    const shot = raw as Record<string, unknown>;
    const url = validateOptionalUrl(shot?.image_url, `screenshots[${index}].image_url`);
    if (!url) {
      throw new ValidationError(`screenshots[${index}].image_url is required`);
    }
    const caption = typeof shot?.caption === "string" && shot.caption.trim() ? shot.caption : null;
    const altText = typeof shot?.alt_text === "string" && shot.alt_text.trim() ? shot.alt_text : null;
    const isFeatured = shot?.is_featured === true;
    const sortOrder = typeof shot?.sort_order === "number" ? shot.sort_order : index;
    return { image_url: url, caption, alt_text: altText, is_featured: isFeatured, sort_order: sortOrder };
  });
}

function validatePricingPlans(input: unknown): PricingPlanInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("pricing_plans must be an array");
  }
  return input.map((raw, index) => {
    const plan = raw as Record<string, unknown>;
    const planName = typeof plan?.plan_name === "string" && plan.plan_name.trim() ? plan.plan_name.trim() : null;
    const price = typeof plan?.price === "string" && plan.price.trim() ? plan.price.trim() : null;
    const billingCycle = typeof plan?.billing_cycle === "string" && plan.billing_cycle.trim() ? plan.billing_cycle.trim() : null;
    const description = typeof plan?.description === "string" && plan.description.trim() ? plan.description.trim() : null;
    const features = Array.isArray(plan?.features)
      ? (plan.features as unknown[]).map((f) => String(f).trim()).filter(Boolean)
      : [];
    const isRecommended = plan?.is_recommended === true;
    const sortOrder = typeof plan?.sort_order === "number" ? plan.sort_order : index;
    return { plan_name: planName, price, billing_cycle: billingCycle, description, features, is_recommended: isRecommended, sort_order: sortOrder };
  });
}

function validateIntegrations(input: unknown): IntegrationInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("integrations must be an array");
  }
  return input.map((raw, index) => {
    const integration = raw as Record<string, unknown>;
    const name = typeof integration?.integration_name === "string" ? integration.integration_name.trim() : "";
    if (!name) {
      throw new ValidationError(`integrations[${index}].integration_name is required`);
    }
    const slug = typeof integration?.integration_slug === "string" && integration.integration_slug.trim() ? integration.integration_slug.trim() : null;
    const logo = validateOptionalUrl(integration?.integration_logo, `integrations[${index}].integration_logo`);
    const description = typeof integration?.description === "string" && integration.description.trim() ? integration.description.trim() : null;
    return { integration_name: name, integration_slug: slug, integration_logo: logo, description };
  });
}

function validateFeatures(input: unknown): FeatureInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("features must be an array");
  }
  return input.map((raw, index) => {
    const feature = raw as Record<string, unknown>;
    const title = typeof feature?.title === "string" ? feature.title.trim() : "";
    if (!title) {
      throw new ValidationError(`features[${index}].title is required`);
    }
    const groupName = typeof feature?.group_name === "string" && feature.group_name.trim() ? feature.group_name.trim() : null;
    const description = typeof feature?.description === "string" && feature.description.trim() ? feature.description.trim() : null;
    const sortOrder = typeof feature?.sort_order === "number" ? feature.sort_order : index;
    return { group_name: groupName, title, description, sort_order: sortOrder };
  });
}

// Pros/cons are simple ordered strings — one item per row in the admin UI.
function validateStringList(input: unknown, fieldName: string): string[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError(`${fieldName} must be an array`);
  }
  return (input as unknown[]).map((v) => String(v).trim()).filter(Boolean);
}

function validateUseCases(input: unknown): UseCaseInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("use_cases must be an array");
  }
  return input.map((raw, index) => {
    const useCase = raw as Record<string, unknown>;
    const title = typeof useCase?.title === "string" ? useCase.title.trim() : "";
    if (!title) {
      throw new ValidationError(`use_cases[${index}].title is required`);
    }
    const description = typeof useCase?.description === "string" && useCase.description.trim() ? useCase.description.trim() : null;
    const audience = typeof useCase?.audience === "string" && useCase.audience.trim() ? useCase.audience.trim() : null;
    const sortOrder = typeof useCase?.sort_order === "number" ? useCase.sort_order : index;
    return { title, description, audience, sort_order: sortOrder };
  });
}

function validateFaqs(input: unknown): FaqInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("faqs must be an array");
  }
  return input.map((raw, index) => {
    const faq = raw as Record<string, unknown>;
    const question = typeof faq?.question === "string" ? faq.question.trim() : "";
    if (!question) {
      throw new ValidationError(`faqs[${index}].question is required`);
    }
    const answer = typeof faq?.answer === "string" ? faq.answer.trim() : "";
    if (!answer) {
      throw new ValidationError(`faqs[${index}].answer is required`);
    }
    const status = faq?.status === "draft" ? "draft" : "published";
    const sortOrder = typeof faq?.sort_order === "number" ? faq.sort_order : index;
    return { question, answer, status, sort_order: sortOrder };
  });
}

function validateVideos(input: unknown): VideoInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("videos must be an array");
  }
  return input.map((raw, index) => {
    const video = raw as Record<string, unknown>;
    const url = validateOptionalUrl(video?.video_url, `videos[${index}].video_url`);
    if (!url) {
      throw new ValidationError(`videos[${index}].video_url is required`);
    }
    const title = typeof video?.title === "string" && video.title.trim() ? video.title.trim() : null;
    const thumbnailUrl = validateOptionalUrl(video?.thumbnail_url, `videos[${index}].thumbnail_url`);
    const sortOrder = typeof video?.sort_order === "number" ? video.sort_order : index;
    return { title, video_url: url, thumbnail_url: thumbnailUrl, sort_order: sortOrder };
  });
}

function validateInternalLinks(input: unknown): InternalLinkInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("internal_links must be an array");
  }
  return input.map((raw, index) => {
    const link = raw as Record<string, unknown>;
    const label = typeof link?.label === "string" ? link.label.trim() : "";
    if (!label) {
      throw new ValidationError(`internal_links[${index}].label is required`);
    }
    const url = typeof link?.url === "string" ? link.url.trim() : "";
    if (!url) {
      throw new ValidationError(`internal_links[${index}].url is required`);
    }
    const sortOrder = typeof link?.sort_order === "number" ? link.sort_order : index;
    return { label, url, sort_order: sortOrder };
  });
}

function validateAlternatives(input: unknown): AlternativeInput[] {
  if (input === undefined || input === null) return [];
  if (!Array.isArray(input)) {
    throw new ValidationError("alternatives must be an array");
  }
  return input.map((raw, index) => {
    const alt = raw as Record<string, unknown>;
    const name = typeof alt?.alternative_name === "string" && alt.alternative_name.trim() ? alt.alternative_name.trim() : null;
    const alternativeToolId = typeof alt?.alternative_tool_id === "string" && alt.alternative_tool_id.trim() ? alt.alternative_tool_id.trim() : null;
    if (!name && !alternativeToolId) {
      throw new ValidationError(`alternatives[${index}] requires either alternative_tool_id or alternative_name`);
    }
    const url = validateOptionalUrl(alt?.alternative_url, `alternatives[${index}].alternative_url`);
    const logo = validateOptionalUrl(alt?.alternative_logo, `alternatives[${index}].alternative_logo`);
    const note = typeof alt?.note === "string" && alt.note.trim() ? alt.note.trim() : null;
    const sortOrder = typeof alt?.sort_order === "number" ? alt.sort_order : index;
    return { alternative_tool_id: alternativeToolId, alternative_name: name, alternative_url: url, alternative_logo: logo, note, sort_order: sortOrder };
  });
}

// Validates that category_ids/primary_category_id are internally consistent.
// Never trusts the frontend: this runs on every create/update regardless of
// what the admin UI already enforces client-side.
function validateCategorySelection(categoryIds: string[], primaryCategoryId: string | null) {
  if (primaryCategoryId === null) return;
  if (typeof primaryCategoryId !== "string") {
    throw new ValidationError("primary_category_id must be a single string id");
  }
  if (categoryIds.length === 0) {
    throw new ValidationError("Cannot set a primary category when category_ids is empty");
  }
  if (!categoryIds.includes(primaryCategoryId)) {
    throw new ValidationError("primary_category_id must be one of the selected category_ids");
  }
}

// Required-for-publish gate — the authoritative check (client-side
// completeness UI mirrors this for live feedback, but this is what actually
// blocks a publish). Mirrors src/utils/toolCompleteness.ts's REQUIRED_KEYS.
function validatePublishRequirements(merged: {
  name: string;
  slug: string;
  website: string | null;
  short_description: string | null;
  long_description: string | null;
  seo_meta_description: string | null;
  pricing_model: string | null;
  categoryIds: string[];
}) {
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
  if (missing.length > 0) {
    throw new ValidationError(`Cannot publish — missing required field(s): ${missing.join(", ")}`);
  }
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function attachToolCategories(supabase: any, toolIds: string[]) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await supabase
    .from("tool_category_links")
    .select("tool_id, primary_category, tool_categories(id, slug, name)")
    .in("tool_id", toolIds);
  if (error) throw new Error(`Failed to load tool categories: ${error.message}`);

  const map = new Map<string, unknown[]>();
  for (const row of data || []) {
    const list = map.get(row.tool_id) || [];
    list.push({ ...row.tool_categories, primary_category: row.primary_category });
    map.set(row.tool_id, list);
  }
  return map;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function attachToolTags(supabase: any, toolIds: string[]) {
  if (toolIds.length === 0) return new Map();
  const { data, error } = await supabase
    .from("tool_tag_links")
    .select("tool_id, tool_tags(id, slug, name)")
    .in("tool_id", toolIds);
  if (error) throw new Error(`Failed to load tool tags: ${error.message}`);

  const map = new Map<string, unknown[]>();
  for (const row of data || []) {
    const list = map.get(row.tool_id) || [];
    list.push(row.tool_tags);
    map.set(row.tool_id, list);
  }
  return map;
}

// A fixed set of bulk queries regardless of how many tools are on the
// current page — this is what lets the list endpoint stay cheap at 50,000+
// tools: never one query per tool, always ~9 queries per page.
// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function fetchCompletenessRelations(supabase: any, toolIds: string[]) {
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
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
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

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function buildCompletenessInput(tool: any, categoryCount: number, relations: Awaited<ReturnType<typeof fetchCompletenessRelations>>): ToolCompletenessInput {
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

// NOTE — transactional limitation: delete() and insert() below are two
// independent network round-trips against PostgREST, not one atomic DB
// transaction. If the process dies or the connection drops between them, the
// tool can be left with no categories until the next successful save. What we
// DO guarantee is that every failure is surfaced (thrown) — callers must never
// report success when a relation write failed. A real fix (wrapping both
// statements in a single Postgres function/RPC) is future work, not required
// for Sprint 1A's admin-only, low-concurrency write volume.
// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function replaceCategoryLinks(supabase: any, toolId: string, categoryIds: string[], primaryCategoryId: string | null) {
  const uniqueCategoryIds = [...new Set(categoryIds)];
  validateCategorySelection(uniqueCategoryIds, primaryCategoryId);

  const { error: deleteError } = await supabase.from("tool_category_links").delete().eq("tool_id", toolId);
  if (deleteError) throw new Error(`Failed to clear existing categories: ${deleteError.message}`);

  if (uniqueCategoryIds.length === 0) return;

  const rows = uniqueCategoryIds.map((categoryId) => ({
    tool_id: toolId,
    category_id: categoryId,
    primary_category: categoryId === primaryCategoryId,
  }));
  const { error: insertError } = await supabase.from("tool_category_links").insert(rows);
  if (insertError) throw new Error(`Failed to save categories: ${insertError.message}`);
}

// See transactional-limitation note on replaceCategoryLinks above — applies here too.
// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function replaceTagLinks(supabase: any, toolId: string, tagIds: string[]) {
  const uniqueTagIds = [...new Set(tagIds)];

  const { error: deleteError } = await supabase.from("tool_tag_links").delete().eq("tool_id", toolId);
  if (deleteError) throw new Error(`Failed to clear existing tags: ${deleteError.message}`);

  if (uniqueTagIds.length === 0) return;

  const rows = uniqueTagIds.map((tagId) => ({ tool_id: toolId, tag_id: tagId }));
  const { error: insertError } = await supabase.from("tool_tag_links").insert(rows);
  if (insertError) throw new Error(`Failed to save tags: ${insertError.message}`);
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function replaceChildRows(supabase: any, table: string, toolId: string, rows: Record<string, unknown>[]) {
  const { error: deleteError } = await supabase.from(table).delete().eq("tool_id", toolId);
  if (deleteError) throw new Error(`Failed to clear existing ${table}: ${deleteError.message}`);
  if (rows.length === 0) return;
  const { error: insertError } = await supabase.from(table).insert(rows.map((r) => ({ ...r, tool_id: toolId })));
  if (insertError) throw new Error(`Failed to save ${table}: ${insertError.message}`);
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function generateUniqueSlug(supabase: any, baseSlug: string) {
  let candidate = `${baseSlug}-copy`;
  let suffix = 2;
  while (true) {
    const { data, error } = await supabase.from("tools").select("id").eq("slug", candidate).maybeSingle();
    if (error) throw new Error(`Failed to check slug uniqueness: ${error.message}`);
    if (!data) return candidate;
    candidate = `${baseSlug}-copy-${suffix}`;
    suffix += 1;
  }
}

interface NormalizedToolPayload {
  categoryIds: string[];
  primaryCategoryId: string | null;
  screenshots: ScreenshotInput[];
  reviews: ReviewInput[];
  pricingPlans: PricingPlanInput[];
  integrations: IntegrationInput[];
  features: FeatureInput[];
  pros: string[];
  cons: string[];
  useCases: UseCaseInput[];
  faqs: FaqInput[];
  videos: VideoInput[];
  internalLinks: InternalLinkInput[];
  alternatives: AlternativeInput[];
}

// Applies validated URL fields onto TOOL_FIELDS-shaped payload in place, and
// returns the validated relation arrays. Throws ValidationError on any bad
// input — caller is responsible for turning that into a 400 response.
function validateAndNormalizeToolPayload(payload: Record<string, unknown>): NormalizedToolPayload {
  for (const field of URL_FIELDS) {
    if (Object.prototype.hasOwnProperty.call(payload, field)) {
      payload[field] = validateOptionalUrl(payload[field], field);
    }
  }
  if (Object.prototype.hasOwnProperty.call(payload, "founded_year")) {
    payload.founded_year = validateOptionalYear(payload.founded_year, "founded_year");
  }
  if (Object.prototype.hasOwnProperty.call(payload, "languages")) {
    payload.languages = validateLanguages(payload.languages);
  }
  if (Object.prototype.hasOwnProperty.call(payload, "source")) {
    const validated = validateSource(payload.source);
    if (validated) payload.source = validated;
    else delete payload.source;
  }
  if (Object.prototype.hasOwnProperty.call(payload, "scheduled_publish_at")) {
    payload.scheduled_publish_at = validateOptionalTimestamp(payload.scheduled_publish_at, "scheduled_publish_at");
  }

  const categoryIds: string[] = Array.isArray(payload.category_ids) ? payload.category_ids : [];
  const primaryCategoryId: string | null = (payload.primary_category_id as string | null | undefined) ?? null;
  validateCategorySelection(categoryIds, primaryCategoryId);

  return {
    categoryIds,
    primaryCategoryId,
    screenshots: validateScreenshots(payload.screenshots),
    reviews: validateReviews(payload.reviews),
    pricingPlans: validatePricingPlans(payload.pricing_plans),
    integrations: validateIntegrations(payload.integrations),
    features: validateFeatures(payload.features),
    pros: validateStringList(payload.pros, "pros"),
    cons: validateStringList(payload.cons, "cons"),
    useCases: validateUseCases(payload.use_cases),
    faqs: validateFaqs(payload.faqs),
    videos: validateVideos(payload.videos),
    internalLinks: validateInternalLinks(payload.internal_links),
    alternatives: validateAlternatives(payload.alternatives),
  };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey);
    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id) {
        const { data: tool, error } = await supabase.from("tools").select("*").eq("id", id).maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!tool) return jsonResponse({ ok: false, error: "Tool not found" }, 404);

        const [categoriesMap, tagsMap, screenshotsResult, reviewsResult, pricingResult, integrationsResult, featuresResult, prosResult, consResult, useCasesResult, faqsResult, videosResult, internalLinksResult, alternativesResult] = await Promise.all([
          attachToolCategories(supabase, [id]),
          attachToolTags(supabase, [id]),
          supabase.from("tool_screenshots").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_reviews").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_pricing_plans").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_integrations").select("*").eq("tool_id", id),
          supabase.from("tool_features").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_pros").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_cons").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_use_cases").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_faqs").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_videos").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_internal_links").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_alternatives").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
        ]);
        for (const [label, result] of [
          ["screenshots", screenshotsResult], ["reviews", reviewsResult], ["pricing plans", pricingResult],
          ["integrations", integrationsResult], ["features", featuresResult], ["pros", prosResult],
          ["cons", consResult], ["use cases", useCasesResult], ["faqs", faqsResult],
          ["videos", videosResult], ["internal links", internalLinksResult], ["alternatives", alternativesResult],
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
        ] as [string, any][]) {
          if (result.error) return jsonResponse({ ok: false, error: `Failed to load ${label}: ${result.error.message}` }, 500);
        }

        const categories = categoriesMap.get(id) || [];
        const relations = await fetchCompletenessRelations(supabase, [id]);
        const completeness = computeCompleteness(buildCompletenessInput(tool, categories.length, relations));
        const firstPublishMissing = validateFirstPublishStrict({
          logoPresent: Boolean(tool.logo && String(tool.logo).trim()),
          screenshotCount: relations.screenshots.get(id) || 0,
          featureCount: relations.features.get(id) || 0,
          faqCount: relations.faqs.get(id) || 0,
        });

        return jsonResponse({
          ok: true,
          data: {
            ...tool,
            categories,
            tags: tagsMap.get(id) || [],
            screenshots: screenshotsResult.data || [],
            reviews: reviewsResult.data || [],
            pricing_plans: pricingResult.data || [],
            integrations: integrationsResult.data || [],
            features: featuresResult.data || [],
            pros: (prosResult.data || []).map((r: { text: string }) => r.text),
            cons: (consResult.data || []).map((r: { text: string }) => r.text),
            use_cases: useCasesResult.data || [],
            faqs: faqsResult.data || [],
            videos: videosResult.data || [],
            internal_links: internalLinksResult.data || [],
            alternatives: alternativesResult.data || [],
            completeness,
            first_publish_missing: firstPublishMissing,
          },
        });
      }

      // ── List: server-side search / status filter / category filter / sort / pagination ──
      const q = (url.searchParams.get("q") || "").trim();
      const statusFilter = url.searchParams.get("status");
      const categoryFilter = url.searchParams.get("category");
      // "imported" is a sentinel meaning "source is anything but manual" —
      // what Import History shows. A concrete value (wizard/bulk/api)
      // filters to exactly that source.
      const sourceFilter = url.searchParams.get("source");
      const sortColumn = SORTABLE_COLUMNS.has(url.searchParams.get("sort") || "") ? (url.searchParams.get("sort") as string) : "updated_at";
      const sortAscending = url.searchParams.get("dir") === "asc";
      const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
      const perPage = Math.min(MAX_PER_PAGE, Math.max(1, Number(url.searchParams.get("per_page")) || DEFAULT_PER_PAGE));
      const rangeFrom = (page - 1) * perPage;
      const rangeTo = rangeFrom + perPage - 1;

      let toolIdsInCategory: string[] | null = null;
      if (categoryFilter) {
        const { data: links, error: linksError } = await supabase
          .from("tool_category_links")
          .select("tool_id")
          .eq("category_id", categoryFilter);
        if (linksError) return jsonResponse({ ok: false, error: linksError.message }, 500);
        toolIdsInCategory = (links || []).map((l: { tool_id: string }) => l.tool_id);
        if (toolIdsInCategory.length === 0) {
          return jsonResponse({ ok: true, data: [], total: 0, page, per_page: perPage });
        }
      }

      let query = supabase.from("tools").select("*", { count: "exact" });
      if (statusFilter && statusFilter !== "all") query = query.eq("status", statusFilter);
      if (sourceFilter === "imported") query = query.neq("source", "manual");
      else if (sourceFilter && sourceFilter !== "all") query = query.eq("source", sourceFilter);
      if (q) query = query.or(`name.ilike.%${q}%,slug.ilike.%${q}%`);
      if (toolIdsInCategory) query = query.in("id", toolIdsInCategory);
      query = query.order(sortColumn, { ascending: sortAscending }).range(rangeFrom, rangeTo);

      const { data: tools, error, count } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const toolIds = (tools || []).map((t: { id: string }) => t.id);
      const [categoriesMap, relations] = await Promise.all([
        attachToolCategories(supabase, toolIds),
        fetchCompletenessRelations(supabase, toolIds),
      ]);

      const data = (tools || []).map((t: { id: string }) => {
        const categories = categoriesMap.get(t.id) || [];
        return {
          ...t,
          categories,
          completeness: computeCompleteness(buildCompletenessInput(t, categories.length, relations)),
        };
      });

      return jsonResponse({ ok: true, data, total: count || 0, page, per_page: perPage });
    }

    if (req.method === "POST") {
      const payload = await req.json();

      // Used by the New Software wizard's Step 1 (duplicate-tool check).
      // Compares by normalized hostname (so https://canva.com,
      // https://www.canva.com/, and canva.com all match) and by slug —
      // never fabricates a "no duplicate" result on a lookup failure.
      if (payload.action === "check-duplicate") {
        const rawWebsite = typeof payload.website === "string" ? payload.website.trim() : "";
        const rawSlug = typeof payload.slug === "string" ? payload.slug.trim() : "";
        if (!rawWebsite && !rawSlug) {
          return jsonResponse({ ok: false, error: "website or slug is required" }, 400);
        }

        let hostname: string | null = null;
        if (rawWebsite) {
          try {
            hostname = new URL(rawWebsite.match(/^https?:\/\//) ? rawWebsite : `https://${rawWebsite}`).hostname.replace(/^www\./, "").toLowerCase();
          } catch {
            hostname = null;
          }
        }

        const { data: candidates, error: candidatesError } = await supabase
          .from("tools")
          .select("id, name, slug, website, status")
          .or([rawSlug ? `slug.eq.${rawSlug}` : null, hostname ? `website.ilike.%${hostname}%` : null].filter(Boolean).join(","));
        if (candidatesError) return jsonResponse({ ok: false, error: candidatesError.message }, 500);

        const bySlug = rawSlug ? (candidates || []).find((t: { slug: string }) => t.slug === rawSlug) : null;
        const byHostname = hostname
          ? (candidates || []).find((t: { website: string | null }) => {
              if (!t.website) return false;
              try {
                return new URL(t.website).hostname.replace(/^www\./, "").toLowerCase() === hostname;
              } catch {
                return false;
              }
            })
          : null;
        const match = bySlug || byHostname;

        return jsonResponse({ ok: true, data: { exists: Boolean(match), tool: match || null, matchedBy: match ? (bySlug ? "slug" : "website") : null } });
      }

      if (payload.action === "duplicate") {
        if (!payload.id) return jsonResponse({ ok: false, error: "Tool ID is required" }, 400);

        const { data: source, error: sourceError } = await supabase
          .from("tools")
          .select("*")
          .eq("id", payload.id)
          .maybeSingle();

        if (sourceError) return jsonResponse({ ok: false, error: sourceError.message }, 500);
        if (!source) return jsonResponse({ ok: false, error: "Tool not found" }, 404);

        const newSlug = await generateUniqueSlug(supabase, source.slug);
        const clone = { ...source };
        delete clone.id;
        delete clone.created_at;
        delete clone.updated_at;
        clone.slug = newSlug;
        clone.name = `${source.name} (Copy)`;
        clone.status = "draft";

        const { data: newTool, error: insertError } = await supabase.from("tools").insert(clone).select().single();
        if (insertError) {
          if (insertError.code === UNIQUE_VIOLATION) {
            return jsonResponse({ ok: false, error: `A tool with slug "${clone.slug}" already exists` }, 409);
          }
          return jsonResponse({ ok: false, error: insertError.message }, 500);
        }

        const [catLinksResult, tagLinksResult, screenshotsResult, reviewsResult, pricingResult, integrationsResult, featuresResult, prosResult, consResult, useCasesResult, faqsResult] = await Promise.all([
          supabase.from("tool_category_links").select("category_id, primary_category").eq("tool_id", payload.id),
          supabase.from("tool_tag_links").select("tag_id").eq("tool_id", payload.id),
          supabase.from("tool_screenshots").select("image_url, caption, alt_text, is_featured, sort_order").eq("tool_id", payload.id),
          supabase.from("tool_reviews").select("author_name, author_title, rating, quote, source, sort_order").eq("tool_id", payload.id),
          supabase.from("tool_pricing_plans").select("plan_name, price, billing_cycle, description, features, is_recommended, sort_order").eq("tool_id", payload.id),
          supabase.from("tool_integrations").select("integration_name, integration_slug, integration_logo, description").eq("tool_id", payload.id),
          supabase.from("tool_features").select("group_name, title, description, sort_order").eq("tool_id", payload.id),
          supabase.from("tool_pros").select("text, sort_order").eq("tool_id", payload.id),
          supabase.from("tool_cons").select("text, sort_order").eq("tool_id", payload.id),
          supabase.from("tool_use_cases").select("title, description, audience, sort_order").eq("tool_id", payload.id),
          supabase.from("tool_faqs").select("question, answer, status, sort_order").eq("tool_id", payload.id),
        ]);
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        for (const [label, result] of [["categories", catLinksResult], ["tags", tagLinksResult], ["screenshots", screenshotsResult], ["reviews", reviewsResult], ["pricing plans", pricingResult], ["integrations", integrationsResult], ["features", featuresResult], ["pros", prosResult], ["cons", consResult], ["use cases", useCasesResult], ["faqs", faqsResult]] as [string, any][]) {
          if (result.error) throw new Error(`Failed to read source ${label}: ${result.error.message}`);
        }

        const catLinks = catLinksResult.data || [];
        const categoryIds = catLinks.map((c: { category_id: string }) => c.category_id);
        const primaryCategoryId = catLinks.find((c: { primary_category: boolean }) => c.primary_category)?.category_id ?? null;
        const tagIds = (tagLinksResult.data || []).map((t: { tag_id: string }) => t.tag_id);

        await Promise.all([
          replaceCategoryLinks(supabase, newTool.id, categoryIds, primaryCategoryId),
          replaceTagLinks(supabase, newTool.id, tagIds),
          replaceChildRows(supabase, "tool_screenshots", newTool.id, screenshotsResult.data || []),
          replaceChildRows(supabase, "tool_reviews", newTool.id, reviewsResult.data || []),
          replaceChildRows(supabase, "tool_pricing_plans", newTool.id, pricingResult.data || []),
          replaceChildRows(supabase, "tool_integrations", newTool.id, integrationsResult.data || []),
          replaceChildRows(supabase, "tool_features", newTool.id, featuresResult.data || []),
          replaceChildRows(supabase, "tool_pros", newTool.id, prosResult.data || []),
          replaceChildRows(supabase, "tool_cons", newTool.id, consResult.data || []),
          replaceChildRows(supabase, "tool_use_cases", newTool.id, useCasesResult.data || []),
          replaceChildRows(supabase, "tool_faqs", newTool.id, faqsResult.data || []),
        ]);

        return jsonResponse({ ok: true, data: newTool });
      }

      if (!payload.slug || !payload.name) {
        return jsonResponse({ ok: false, error: "Missing required fields: slug, name" }, 400);
      }

      let normalized: NormalizedToolPayload;
      try {
        validateStatusTransition(null, payload.status as string | undefined, payload.force === true);
        normalized = validateAndNormalizeToolPayload(payload);
        if (payload.status === "published") {
          validatePublishRequirements({
            name: payload.name,
            slug: payload.slug,
            website: (payload.website as string) ?? null,
            short_description: (payload.short_description as string) ?? null,
            long_description: (payload.long_description as string) ?? null,
            seo_meta_description: (payload.seo_meta_description as string) ?? null,
            pricing_model: (payload.pricing_model as string) ?? null,
            categoryIds: normalized.categoryIds,
          });
          const firstPublishMissing = validateFirstPublishStrict({
            logoPresent: Boolean(payload.logo && String(payload.logo).trim()),
            screenshotCount: normalized.screenshots.length,
            featureCount: normalized.features.length,
            faqCount: normalized.faqs.length,
          });
          if (firstPublishMissing.length > 0) {
            throw new ValidationError(`Cannot publish — missing required field(s): ${firstPublishMissing.join(", ")}`);
          }
        }
      } catch (validationError) {
        if (validationError instanceof ValidationError) {
          return jsonResponse({ ok: false, error: validationError.message }, 400);
        }
        throw validationError;
      }

      // Pre-check for fast, friendly UX. The DB UNIQUE constraint (caught below via
      // error code 23505) is the actual source of truth — this check alone cannot be
      // trusted under concurrent writes.
      const { data: existing } = await supabase.from("tools").select("id").eq("slug", payload.slug).maybeSingle();
      if (existing) {
        return jsonResponse({ ok: false, error: `A tool with slug "${payload.slug}" already exists` }, 409);
      }

      const row: Record<string, unknown> = {};
      for (const field of TOOL_FIELDS) {
        if (Object.prototype.hasOwnProperty.call(payload, field)) row[field] = payload[field];
      }
      row.slug = payload.slug;
      row.name = payload.name;

      const { data: newTool, error: insertError } = await supabase.from("tools").insert(row).select().single();
      if (insertError) {
        if (insertError.code === UNIQUE_VIOLATION) {
          return jsonResponse({ ok: false, error: `A tool with slug "${payload.slug}" already exists` }, 409);
        }
        return jsonResponse({ ok: false, error: insertError.message }, 500);
      }

      await Promise.all([
        replaceCategoryLinks(supabase, newTool.id, normalized.categoryIds, normalized.primaryCategoryId),
        replaceTagLinks(supabase, newTool.id, Array.isArray(payload.tag_ids) ? payload.tag_ids : []),
        replaceChildRows(supabase, "tool_screenshots", newTool.id, normalized.screenshots),
        replaceChildRows(supabase, "tool_reviews", newTool.id, normalized.reviews),
        replaceChildRows(supabase, "tool_pricing_plans", newTool.id, normalized.pricingPlans),
        replaceChildRows(supabase, "tool_integrations", newTool.id, normalized.integrations),
        replaceChildRows(supabase, "tool_features", newTool.id, normalized.features),
        replaceChildRows(supabase, "tool_pros", newTool.id, normalized.pros.map((text, index) => ({ text, sort_order: index }))),
        replaceChildRows(supabase, "tool_cons", newTool.id, normalized.cons.map((text, index) => ({ text, sort_order: index }))),
        replaceChildRows(supabase, "tool_use_cases", newTool.id, normalized.useCases),
        replaceChildRows(supabase, "tool_faqs", newTool.id, normalized.faqs),
        replaceChildRows(supabase, "tool_videos", newTool.id, normalized.videos),
        replaceChildRows(supabase, "tool_internal_links", newTool.id, normalized.internalLinks),
        replaceChildRows(supabase, "tool_alternatives", newTool.id, normalized.alternatives),
      ]);

      return jsonResponse({ ok: true, data: newTool });
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Tool ID is required" }, 400);

      const { data: existing } = await supabase.from("tools").select("*").eq("id", id).maybeSingle();
      if (!existing) return jsonResponse({ ok: false, error: "Tool not found" }, 404);

      const payload = await req.json();

      // Resolve category_ids/primary_category_id together so an update that omits
      // primary_category_id does not silently clear an existing primary category —
      // it is preserved as long as it's still among the submitted category_ids.
      //
      // IMPORTANT: only *resolve and validate* here — do NOT write relations yet.
      // Writing now would kick off delete()/insert() network calls before we know
      // whether the main `tools` row update below will even succeed (e.g. a slug
      // conflict returns early). Relation writes must only run once we're
      // committed to returning success.
      let categoryIds: string[];
      let primaryCategoryId: string | null;
      if (Object.prototype.hasOwnProperty.call(payload, "category_ids")) {
        categoryIds = Array.isArray(payload.category_ids) ? [...new Set(payload.category_ids)] : [];
        if (Object.prototype.hasOwnProperty.call(payload, "primary_category_id")) {
          primaryCategoryId = payload.primary_category_id || null;
        } else {
          const { data: existingLinks, error: existingLinksError } = await supabase
            .from("tool_category_links")
            .select("category_id, primary_category")
            .eq("tool_id", id);
          if (existingLinksError) {
            return jsonResponse({ ok: false, error: `Failed to read existing categories: ${existingLinksError.message}` }, 500);
          }
          const existingPrimary = (existingLinks || []).find((l: { primary_category: boolean }) => l.primary_category)?.category_id ?? null;
          primaryCategoryId = existingPrimary && categoryIds.includes(existingPrimary) ? existingPrimary : null;
        }
      } else {
        const { data: existingLinks } = await supabase.from("tool_category_links").select("category_id, primary_category").eq("tool_id", id);
        categoryIds = (existingLinks || []).map((l: { category_id: string }) => l.category_id);
        primaryCategoryId = (existingLinks || []).find((l: { primary_category: boolean }) => l.primary_category)?.category_id ?? null;
      }

      const normalized: Partial<NormalizedToolPayload> = {};
      try {
        validateCategorySelection(categoryIds, primaryCategoryId);
        validateStatusTransition(existing.status, payload.status as string | undefined, payload.force === true);
        for (const field of URL_FIELDS) {
          if (Object.prototype.hasOwnProperty.call(payload, field)) {
            payload[field] = validateOptionalUrl(payload[field], field);
          }
        }
        if (Object.prototype.hasOwnProperty.call(payload, "founded_year")) {
          payload.founded_year = validateOptionalYear(payload.founded_year, "founded_year");
        }
        if (Object.prototype.hasOwnProperty.call(payload, "languages")) {
          payload.languages = validateLanguages(payload.languages);
        }
        if (Object.prototype.hasOwnProperty.call(payload, "source")) {
          const validated = validateSource(payload.source);
          if (validated) payload.source = validated;
          else delete payload.source;
        }
        if (Object.prototype.hasOwnProperty.call(payload, "scheduled_publish_at")) {
          payload.scheduled_publish_at = validateOptionalTimestamp(payload.scheduled_publish_at, "scheduled_publish_at");
        }
        if (Object.prototype.hasOwnProperty.call(payload, "screenshots")) normalized.screenshots = validateScreenshots(payload.screenshots);
        if (Object.prototype.hasOwnProperty.call(payload, "reviews")) normalized.reviews = validateReviews(payload.reviews);
        if (Object.prototype.hasOwnProperty.call(payload, "pricing_plans")) normalized.pricingPlans = validatePricingPlans(payload.pricing_plans);
        if (Object.prototype.hasOwnProperty.call(payload, "integrations")) normalized.integrations = validateIntegrations(payload.integrations);
        if (Object.prototype.hasOwnProperty.call(payload, "features")) normalized.features = validateFeatures(payload.features);
        if (Object.prototype.hasOwnProperty.call(payload, "pros")) normalized.pros = validateStringList(payload.pros, "pros");
        if (Object.prototype.hasOwnProperty.call(payload, "cons")) normalized.cons = validateStringList(payload.cons, "cons");
        if (Object.prototype.hasOwnProperty.call(payload, "use_cases")) normalized.useCases = validateUseCases(payload.use_cases);
        if (Object.prototype.hasOwnProperty.call(payload, "faqs")) normalized.faqs = validateFaqs(payload.faqs);
        if (Object.prototype.hasOwnProperty.call(payload, "videos")) normalized.videos = validateVideos(payload.videos);
        if (Object.prototype.hasOwnProperty.call(payload, "internal_links")) normalized.internalLinks = validateInternalLinks(payload.internal_links);
        if (Object.prototype.hasOwnProperty.call(payload, "alternatives")) normalized.alternatives = validateAlternatives(payload.alternatives);

        if (payload.status === "published") {
          validatePublishRequirements({
            name: (payload.name as string) ?? existing.name,
            slug: (payload.slug as string) ?? existing.slug,
            website: Object.prototype.hasOwnProperty.call(payload, "website") ? (payload.website as string | null) : existing.website,
            short_description: Object.prototype.hasOwnProperty.call(payload, "short_description") ? (payload.short_description as string | null) : existing.short_description,
            long_description: Object.prototype.hasOwnProperty.call(payload, "long_description") ? (payload.long_description as string | null) : existing.long_description,
            seo_meta_description: Object.prototype.hasOwnProperty.call(payload, "seo_meta_description") ? (payload.seo_meta_description as string | null) : existing.seo_meta_description,
            pricing_model: Object.prototype.hasOwnProperty.call(payload, "pricing_model") ? (payload.pricing_model as string | null) : existing.pricing_model,
            categoryIds,
          });

          // The stricter logo/hero/feature/FAQ gate only applies the moment a
          // tool actually transitions into Published — not on ordinary edits
          // to a tool that's already published (see toolCompleteness.ts's
          // validateFirstPublishStrict doc comment for why: Canva/Figma have
          // zero DB logo/screenshots/features/FAQs today and must stay
          // editable).
          if (existing.status !== "published") {
            const logoPresent = Boolean((Object.prototype.hasOwnProperty.call(payload, "logo") ? payload.logo : existing.logo));
            const relations = await fetchCompletenessRelations(supabase, [id]);
            const screenshotCount = normalized.screenshots ? normalized.screenshots.length : (relations.screenshots.get(id) || 0);
            const featureCount = normalized.features ? normalized.features.length : (relations.features.get(id) || 0);
            const faqCount = normalized.faqs ? normalized.faqs.length : (relations.faqs.get(id) || 0);
            const firstPublishMissing = validateFirstPublishStrict({ logoPresent, screenshotCount, featureCount, faqCount });
            if (firstPublishMissing.length > 0) {
              throw new ValidationError(`Cannot publish — missing required field(s): ${firstPublishMissing.join(", ")}`);
            }
          }
        }
      } catch (validationError) {
        if (validationError instanceof ValidationError) {
          return jsonResponse({ ok: false, error: validationError.message }, 400);
        }
        throw validationError;
      }

      if (payload.slug && payload.slug !== existing.slug) {
        const { data: slugExists } = await supabase
          .from("tools")
          .select("id")
          .eq("slug", payload.slug)
          .neq("id", id)
          .maybeSingle();

        if (slugExists) {
          return jsonResponse({ ok: false, error: `A tool with slug "${payload.slug}" already exists` }, 409);
        }
      }

      const updates: Record<string, unknown> = { updated_at: new Date().toISOString() };
      for (const field of TOOL_FIELDS) {
        if (Object.prototype.hasOwnProperty.call(payload, field)) updates[field] = payload[field];
      }

      const { data: updated, error: updateError } = await supabase
        .from("tools")
        .update(updates)
        .eq("id", id)
        .select()
        .single();

      if (updateError) {
        if (updateError.code === UNIQUE_VIOLATION) {
          return jsonResponse({ ok: false, error: `A tool with slug "${payload.slug}" already exists` }, 409);
        }
        return jsonResponse({ ok: false, error: updateError.message }, 500);
      }

      const tasks: Promise<unknown>[] = [];
      if (Object.prototype.hasOwnProperty.call(payload, "category_ids")) {
        tasks.push(replaceCategoryLinks(supabase, id, categoryIds, primaryCategoryId));
      }
      if (Object.prototype.hasOwnProperty.call(payload, "tag_ids")) {
        tasks.push(replaceTagLinks(supabase, id, Array.isArray(payload.tag_ids) ? payload.tag_ids : []));
      }
      if (normalized.screenshots) tasks.push(replaceChildRows(supabase, "tool_screenshots", id, normalized.screenshots));
      if (normalized.reviews) tasks.push(replaceChildRows(supabase, "tool_reviews", id, normalized.reviews));
      if (normalized.pricingPlans) tasks.push(replaceChildRows(supabase, "tool_pricing_plans", id, normalized.pricingPlans));
      if (normalized.integrations) tasks.push(replaceChildRows(supabase, "tool_integrations", id, normalized.integrations));
      if (normalized.features) tasks.push(replaceChildRows(supabase, "tool_features", id, normalized.features));
      if (normalized.pros) tasks.push(replaceChildRows(supabase, "tool_pros", id, normalized.pros.map((text, index) => ({ text, sort_order: index }))));
      if (normalized.cons) tasks.push(replaceChildRows(supabase, "tool_cons", id, normalized.cons.map((text, index) => ({ text, sort_order: index }))));
      if (normalized.useCases) tasks.push(replaceChildRows(supabase, "tool_use_cases", id, normalized.useCases));
      if (normalized.faqs) tasks.push(replaceChildRows(supabase, "tool_faqs", id, normalized.faqs));
      if (normalized.videos) tasks.push(replaceChildRows(supabase, "tool_videos", id, normalized.videos));
      if (normalized.internalLinks) tasks.push(replaceChildRows(supabase, "tool_internal_links", id, normalized.internalLinks));
      if (normalized.alternatives) tasks.push(replaceChildRows(supabase, "tool_alternatives", id, normalized.alternatives));
      if (tasks.length > 0) await Promise.all(tasks);

      return jsonResponse({ ok: true, data: updated });
    }

    if (req.method === "DELETE") {
      if (!id) return jsonResponse({ ok: false, error: "Tool ID is required" }, 400);

      const { error } = await supabase.from("tools").delete().eq("id", id);
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true });
    }

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    if (error instanceof ValidationError) {
      return jsonResponse({ ok: false, error: error.message }, 400);
    }
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
