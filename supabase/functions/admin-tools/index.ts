import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const TOOL_FIELDS = [
  "slug", "name", "logo", "website", "affiliate_link", "short_description",
  "long_description", "pricing_model", "starting_price", "youtube_url",
  "verified", "featured", "rating", "review_count", "status",
  "founded_year", "company_size", "headquarters", "languages",
];

const URL_FIELDS = ["website", "affiliate_link", "logo", "youtube_url"];

const UNIQUE_VIOLATION = "23505";

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

// Validates founded_year: optional, but if present must be a plausible year.
function validateOptionalYear(value: unknown, fieldName: string): number | null {
  if (value === undefined || value === null || value === "") return null;
  const year = Number(value);
  if (!Number.isInteger(year) || year < 1900 || year > 2100) {
    throw new ValidationError(`${fieldName} must be a whole number year between 1900 and 2100`);
  }
  return year;
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

// Validates the full reviews array up front, mirroring validateScreenshots.
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

// Validates the full screenshots array up front. Unlike tool URL fields,
// image_url is required (NOT NULL in the schema) — an empty/invalid value is
// rejected rather than silently dropped.
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
    const sortOrder = typeof shot?.sort_order === "number" ? shot.sort_order : index;
    return { image_url: url, caption, sort_order: sortOrder };
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

// See transactional-limitation note on replaceCategoryLinks above — applies here too.
// `screenshots` is expected to already be validated (see validateScreenshots).
// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function replaceScreenshots(supabase: any, toolId: string, screenshots: ScreenshotInput[]) {
  const { error: deleteError } = await supabase.from("tool_screenshots").delete().eq("tool_id", toolId);
  if (deleteError) throw new Error(`Failed to clear existing screenshots: ${deleteError.message}`);

  if (screenshots.length === 0) return;

  const rows = screenshots.map((s, index) => ({
    tool_id: toolId,
    image_url: s.image_url,
    caption: s.caption,
    sort_order: s.sort_order ?? index,
  }));
  const { error: insertError } = await supabase.from("tool_screenshots").insert(rows);
  if (insertError) throw new Error(`Failed to save screenshots: ${insertError.message}`);
}

// See transactional-limitation note on replaceCategoryLinks above — applies here too.
// `reviews` is expected to already be validated (see validateReviews).
// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function replaceReviews(supabase: any, toolId: string, reviews: ReviewInput[]) {
  const { error: deleteError } = await supabase.from("tool_reviews").delete().eq("tool_id", toolId);
  if (deleteError) throw new Error(`Failed to clear existing reviews: ${deleteError.message}`);

  if (reviews.length === 0) return;

  const rows = reviews.map((r, index) => ({
    tool_id: toolId,
    author_name: r.author_name,
    author_title: r.author_title,
    rating: r.rating,
    quote: r.quote,
    source: r.source,
    sort_order: r.sort_order ?? index,
  }));
  const { error: insertError } = await supabase.from("tool_reviews").insert(rows);
  if (insertError) throw new Error(`Failed to save reviews: ${insertError.message}`);
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function generateUniqueSlug(supabase: any, baseSlug: string) {
  let candidate = `${baseSlug}-copy`;
  let suffix = 2;
  // eslint-disable-next-line no-constant-condition
  while (true) {
    const { data, error } = await supabase.from("tools").select("id").eq("slug", candidate).maybeSingle();
    if (error) throw new Error(`Failed to check slug uniqueness: ${error.message}`);
    if (!data) return candidate;
    candidate = `${baseSlug}-copy-${suffix}`;
    suffix += 1;
  }
}

// Applies validated URL fields onto TOOL_FIELDS-shaped payload in place, and
// returns the validated screenshots array. Throws ValidationError on any bad
// input — caller is responsible for turning that into a 400 response.
function validateAndNormalizeToolPayload(payload: Record<string, unknown>) {
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

  const categoryIds: string[] = Array.isArray(payload.category_ids) ? payload.category_ids : [];
  const primaryCategoryId: string | null = (payload.primary_category_id as string | null | undefined) ?? null;
  validateCategorySelection(categoryIds, primaryCategoryId);

  const screenshots = validateScreenshots(payload.screenshots);
  const reviews = validateReviews(payload.reviews);

  return { categoryIds, primaryCategoryId, screenshots, reviews };
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

        const [categoriesMap, tagsMap, screenshotsResult, reviewsResult] = await Promise.all([
          attachToolCategories(supabase, [id]),
          attachToolTags(supabase, [id]),
          supabase.from("tool_screenshots").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
          supabase.from("tool_reviews").select("*").eq("tool_id", id).order("sort_order", { ascending: true }),
        ]);
        if (screenshotsResult.error) {
          return jsonResponse({ ok: false, error: `Failed to load screenshots: ${screenshotsResult.error.message}` }, 500);
        }
        if (reviewsResult.error) {
          return jsonResponse({ ok: false, error: `Failed to load reviews: ${reviewsResult.error.message}` }, 500);
        }

        return jsonResponse({
          ok: true,
          data: {
            ...tool,
            categories: categoriesMap.get(id) || [],
            tags: tagsMap.get(id) || [],
            screenshots: screenshotsResult.data || [],
            reviews: reviewsResult.data || [],
          },
        });
      }

      const { data: tools, error } = await supabase.from("tools").select("*").order("name", { ascending: true });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const toolIds = (tools || []).map((t: { id: string }) => t.id);
      const [categoriesMap, tagsMap] = await Promise.all([
        attachToolCategories(supabase, toolIds),
        attachToolTags(supabase, toolIds),
      ]);

      const data = (tools || []).map((t: { id: string }) => ({
        ...t,
        categories: categoriesMap.get(t.id) || [],
        tags: tagsMap.get(t.id) || [],
      }));

      return jsonResponse({ ok: true, data });
    }

    if (req.method === "POST") {
      const payload = await req.json();

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

        const [catLinksResult, tagLinksResult, screenshotsResult, reviewsResult] = await Promise.all([
          supabase.from("tool_category_links").select("category_id, primary_category").eq("tool_id", payload.id),
          supabase.from("tool_tag_links").select("tag_id").eq("tool_id", payload.id),
          supabase.from("tool_screenshots").select("image_url, caption, sort_order").eq("tool_id", payload.id),
          supabase.from("tool_reviews").select("author_name, author_title, rating, quote, source, sort_order").eq("tool_id", payload.id),
        ]);
        if (catLinksResult.error) throw new Error(`Failed to read source categories: ${catLinksResult.error.message}`);
        if (tagLinksResult.error) throw new Error(`Failed to read source tags: ${tagLinksResult.error.message}`);
        if (screenshotsResult.error) throw new Error(`Failed to read source screenshots: ${screenshotsResult.error.message}`);
        if (reviewsResult.error) throw new Error(`Failed to read source reviews: ${reviewsResult.error.message}`);

        const catLinks = catLinksResult.data || [];
        const tagLinks = tagLinksResult.data || [];
        const sourceScreenshots = screenshotsResult.data || [];
        const sourceReviews = reviewsResult.data || [];

        const categoryIds = catLinks.map((c: { category_id: string }) => c.category_id);
        const primaryCategoryId = catLinks.find((c: { primary_category: boolean }) => c.primary_category)?.category_id ?? null;
        const tagIds = tagLinks.map((t: { tag_id: string }) => t.tag_id);
        const screenshotsToCopy: ScreenshotInput[] = sourceScreenshots.map(
          (s: { image_url: string; caption: string | null; sort_order: number }, index: number) => ({
            image_url: s.image_url,
            caption: s.caption,
            sort_order: s.sort_order ?? index,
          })
        );
        const reviewsToCopy: ReviewInput[] = sourceReviews.map(
          (r: { author_name: string; author_title: string | null; rating: number; quote: string; source: string | null; sort_order: number }, index: number) => ({
            author_name: r.author_name,
            author_title: r.author_title,
            rating: r.rating,
            quote: r.quote,
            source: r.source,
            sort_order: r.sort_order ?? index,
          })
        );

        // Relation copies are validated + error-checked the same way as create/update
        // (see replace* helpers above) — a failure here throws and is surfaced as a
        // 500 by the outer catch, never reported as a false ok:true.
        await Promise.all([
          replaceCategoryLinks(supabase, newTool.id, categoryIds, primaryCategoryId),
          replaceTagLinks(supabase, newTool.id, tagIds),
          replaceScreenshots(supabase, newTool.id, screenshotsToCopy),
          replaceReviews(supabase, newTool.id, reviewsToCopy),
        ]);

        return jsonResponse({ ok: true, data: newTool });
      }

      if (!payload.slug || !payload.name) {
        return jsonResponse({ ok: false, error: "Missing required fields: slug, name" }, 400);
      }

      let categoryIds: string[];
      let primaryCategoryId: string | null;
      let screenshots: ScreenshotInput[];
      let reviews: ReviewInput[];
      try {
        ({ categoryIds, primaryCategoryId, screenshots, reviews } = validateAndNormalizeToolPayload(payload));
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
        replaceCategoryLinks(supabase, newTool.id, categoryIds, primaryCategoryId),
        replaceTagLinks(supabase, newTool.id, Array.isArray(payload.tag_ids) ? payload.tag_ids : []),
        replaceScreenshots(supabase, newTool.id, screenshots),
        replaceReviews(supabase, newTool.id, reviews),
      ]);

      return jsonResponse({ ok: true, data: newTool });
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Tool ID is required" }, 400);

      const { data: existing } = await supabase.from("tools").select("id, slug").eq("id", id).maybeSingle();
      if (!existing) return jsonResponse({ ok: false, error: "Tool not found" }, 404);

      const payload = await req.json();

      // Resolve category_ids/primary_category_id together so an update that omits
      // primary_category_id does not silently clear an existing primary category —
      // it is preserved as long as it's still among the submitted category_ids.
      //
      // IMPORTANT: only *resolve and validate* here — do NOT call replaceCategoryLinks
      // yet. Calling it now would kick off its delete()/insert() network calls before
      // we know whether the main `tools` row update below will even succeed (e.g. a
      // slug conflict returns early). Relation writes must only run once we're
      // committed to returning success, exactly like the tag_ids/screenshots writes
      // below.
      let categoryUpdate: { categoryIds: string[]; primaryCategoryId: string | null } | null = null;
      if (Object.prototype.hasOwnProperty.call(payload, "category_ids")) {
        const categoryIds: string[] = Array.isArray(payload.category_ids) ? [...new Set(payload.category_ids)] : [];
        let primaryCategoryId: string | null;

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

        try {
          validateCategorySelection(categoryIds, primaryCategoryId);
        } catch (validationError) {
          if (validationError instanceof ValidationError) {
            return jsonResponse({ ok: false, error: validationError.message }, 400);
          }
          throw validationError;
        }

        categoryUpdate = { categoryIds, primaryCategoryId };
      }

      let screenshotsToSave: ScreenshotInput[] | null = null;
      let reviewsToSave: ReviewInput[] | null = null;
      try {
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
        if (Object.prototype.hasOwnProperty.call(payload, "screenshots")) {
          screenshotsToSave = validateScreenshots(payload.screenshots);
        }
        if (Object.prototype.hasOwnProperty.call(payload, "reviews")) {
          reviewsToSave = validateReviews(payload.reviews);
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
      if (categoryUpdate) {
        tasks.push(replaceCategoryLinks(supabase, id, categoryUpdate.categoryIds, categoryUpdate.primaryCategoryId));
      }
      if (Object.prototype.hasOwnProperty.call(payload, "tag_ids")) {
        tasks.push(replaceTagLinks(supabase, id, Array.isArray(payload.tag_ids) ? payload.tag_ids : []));
      }
      if (screenshotsToSave !== null) {
        tasks.push(replaceScreenshots(supabase, id, screenshotsToSave));
      }
      if (reviewsToSave !== null) {
        tasks.push(replaceReviews(supabase, id, reviewsToSave));
      }
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
