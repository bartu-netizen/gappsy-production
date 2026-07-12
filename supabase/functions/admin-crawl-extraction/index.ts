import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS, extractToken } from "../_shared/adminSession.ts";
import type { NormalizedExtraction, ProvenanceField } from "../_shared/crawlExtractionAdapter.ts";

// Owns the review workflow over one crawl_jobs row's normalized_extraction:
// GET returns the extraction grouped for the review screen; POST handles
// per-field approve/reject/edit, "approve all high-confidence" (never
// touches anything below the threshold), and create-draft (maps ONLY
// approved/edited fields into a new `tools` row by calling the EXISTING
// admin-tools function — reusing its full validation/child-row logic
// rather than duplicating it, passing through the caller's own admin
// session token).

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const HIGH_CONFIDENCE_THRESHOLD = 70;

type ReviewState = Record<string, { status: "approved" | "rejected" | "edited"; edited_value?: unknown; reviewed_by: string; reviewed_at: string }>;

function slugify(name: string): string {
  return name.toLowerCase().trim().replace(/[^a-z0-9]+/g, "-").replace(/^-+|-+$/g, "").slice(0, 80) || "draft";
}

async function uniqueToolSlug(supabase: ReturnType<typeof createClient>, base: string): Promise<string> {
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

// Every leaf ProvenanceField in the extraction, addressed by a stable
// "group.field" path (arrays use "group.field[index]"), so review_state can
// key approvals without needing a schema-aware walker on the client.
function walkFields(extraction: NormalizedExtraction, visit: (path: string, f: ProvenanceField<unknown>) => void) {
  for (const [groupName, group] of Object.entries(extraction) as [string, unknown][]) {
    if (groupName === "crawl_sources" || groupName === "warnings") continue;
    if (Array.isArray(group)) continue; // content.faq_candidates etc. handled separately by the UI, not auto-approved here
    for (const [fieldName, value] of Object.entries(group as Record<string, unknown>)) {
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

function resolveApprovedValue(path: string, field: ProvenanceField<unknown>, reviewState: ReviewState): unknown {
  const entry = reviewState[path];
  if (!entry) return null;
  if (entry.status === "rejected") return null;
  if (entry.status === "edited") return entry.edited_value;
  if (entry.status === "approved") return field.value;
  return null;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    if (req.method === "GET") {
      const url = new URL(req.url);
      const jobId = url.searchParams.get("job_id");
      if (!jobId) return jsonResponse({ ok: false, error: "job_id is required" }, 400);
      const { data: job, error } = await supabase.from("crawl_jobs").select("*, discovered_tools(id, name, official_website)").eq("id", jobId).maybeSingle();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      if (!job) return jsonResponse({ ok: false, error: "Crawl job not found" }, 404);
      if (!job.normalized_extraction) return jsonResponse({ ok: false, error: "This job has no extraction data yet." }, 409);
      return jsonResponse({ ok: true, data: { job, extraction: job.normalized_extraction, review_state: job.review_state || {} } });
    }

    if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();
    const jobId = typeof payload.job_id === "string" ? payload.job_id : null;
    if (!jobId) return jsonResponse({ ok: false, error: "job_id is required" }, 400);

    const { data: job, error: jobError } = await supabase.from("crawl_jobs").select("*").eq("id", jobId).maybeSingle();
    if (jobError) return jsonResponse({ ok: false, error: jobError.message }, 500);
    if (!job) return jsonResponse({ ok: false, error: "Crawl job not found" }, 404);

    if (["approve-field", "reject-field", "edit-field"].includes(payload.action)) {
      const path = typeof payload.field_path === "string" ? payload.field_path : null;
      if (!path) return jsonResponse({ ok: false, error: "field_path is required" }, 400);
      const reviewState: ReviewState = { ...(job.review_state || {}) };
      if (payload.action === "approve-field") reviewState[path] = { status: "approved", reviewed_by: session.email || "", reviewed_at: new Date().toISOString() };
      else if (payload.action === "reject-field") reviewState[path] = { status: "rejected", reviewed_by: session.email || "", reviewed_at: new Date().toISOString() };
      else reviewState[path] = { status: "edited", edited_value: payload.value, reviewed_by: session.email || "", reviewed_at: new Date().toISOString() };

      const { data: updated, error } = await supabase.from("crawl_jobs").update({ review_state: reviewState, updated_at: new Date().toISOString() }).eq("id", jobId).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: updated });
    }

    if (payload.action === "approve-all-high-confidence") {
      if (!job.normalized_extraction) return jsonResponse({ ok: false, error: "This job has no extraction data yet." }, 409);
      const threshold = Number.isFinite(Number(payload.threshold)) ? Number(payload.threshold) : HIGH_CONFIDENCE_THRESHOLD;
      const reviewState: ReviewState = { ...(job.review_state || {}) };
      let approvedCount = 0;
      walkFields(job.normalized_extraction as NormalizedExtraction, (path, f) => {
        if (f.confidence >= threshold && f.value !== null && !reviewState[path]) {
          reviewState[path] = { status: "approved", reviewed_by: session.email || "", reviewed_at: new Date().toISOString() };
          approvedCount += 1;
        }
      });
      const { data: updated, error } = await supabase.from("crawl_jobs").update({ review_state: reviewState, updated_at: new Date().toISOString() }).eq("id", jobId).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: { job: updated, approved_count: approvedCount } });
    }

    if (payload.action === "create-draft") {
      if (job.created_draft_tool_id) return jsonResponse({ ok: false, error_code: "already_converted", error: "This crawl job already has a draft." }, 409);
      if (!job.normalized_extraction) return jsonResponse({ ok: false, error: "This job has no extraction data yet." }, 409);

      const extraction = job.normalized_extraction as NormalizedExtraction;
      const reviewState: ReviewState = job.review_state || {};

      const nameValue = resolveApprovedValue("identity.tool_name_candidate", extraction.identity.tool_name_candidate, reviewState) as string | null;
      const websiteValue = resolveApprovedValue("identity.canonical_website", extraction.identity.canonical_website, reviewState) as string | null;
      if (!nameValue) return jsonResponse({ ok: false, error: "Approve or edit a tool name before creating a draft." }, 400);

      const { data: candidate } = await supabase.from("discovered_tools").select("id, name, official_website, category_id").eq("id", job.discovery_candidate_id).maybeSingle();
      const finalName = nameValue || candidate?.name || "Untitled";
      const slug = await uniqueToolSlug(supabase, finalName);

      const logoValue = resolveApprovedValue("identity.logo_candidates[0]", (extraction.identity.logo_candidates[0] || { confidence: 0, value: null, source_url: null, evidence: null, review_status: "pending" }), reviewState);
      const descValue = resolveApprovedValue("identity.meta_description", extraction.identity.meta_description, reviewState) as string | null;
      const pricingModelValue = resolveApprovedValue("pricing.pricing_model_candidate", extraction.pricing.pricing_model_candidate, reviewState) as string | null;
      const startingPriceValue = resolveApprovedValue("pricing.starting_price_candidate", extraction.pricing.starting_price_candidate, reviewState) as string | null;
      const foundedValue = resolveApprovedValue("company.founded_year_candidate", extraction.company.founded_year_candidate, reviewState) as string | null;
      const hqValue = resolveApprovedValue("company.headquarters_candidate", extraction.company.headquarters_candidate, reviewState) as string | null;
      const sizeValue = resolveApprovedValue("company.company_size_candidate", extraction.company.company_size_candidate, reviewState) as string | null;

      const toolPayload: Record<string, unknown> = {
        name: finalName,
        slug,
        status: "needs_review",
        noindex: true,
        sitemap_eligible: false,
        source: "api",
        source_url: candidate?.official_website || websiteValue || undefined,
        website: websiteValue || candidate?.official_website || undefined,
        logo: logoValue || undefined,
        short_description: descValue || undefined,
        pricing_model: pricingModelValue || undefined,
        starting_price: startingPriceValue || undefined,
        founded_year: foundedValue ? Number(foundedValue) : undefined,
        headquarters: hqValue || undefined,
        company_size: sizeValue || undefined,
        editorial_notes: `Created from Crawl4AI extraction. discovery_candidate_id=${job.discovery_candidate_id} crawl_job_id=${job.id}. Review all fields before publishing — nothing here has been verified.`,
      };
      if (candidate?.category_id) {
        toolPayload.category_ids = [candidate.category_id];
        toolPayload.primary_category_id = candidate.category_id;
      }

      // Reuse the EXISTING admin-tools creation path — same validation,
      // same child-row handling, same completeness gate — rather than
      // inserting into `tools` directly. Passes through the caller's own
      // admin session token (already verified above), exactly as the
      // frontend would when calling admin-tools itself.
      const token = extractToken(req);
      const adminToolsRes = await fetch(`${supabaseUrl}/functions/v1/admin-tools`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${Deno.env.get("SUPABASE_ANON_KEY") || ""}`,
          "apikey": Deno.env.get("SUPABASE_ANON_KEY") || "",
          "x-admin-token": token || "",
        },
        body: JSON.stringify(toolPayload),
      });
      const adminToolsBody = await adminToolsRes.json().catch(() => null);
      if (!adminToolsRes.ok || !adminToolsBody?.ok) {
        return jsonResponse({ ok: false, error: adminToolsBody?.error || "Failed to create the tool draft." }, 502);
      }

      const newToolId = adminToolsBody.data?.id;
      const { data: updatedJob, error: updateError } = await supabase.from("crawl_jobs").update({ created_draft_tool_id: newToolId, updated_at: new Date().toISOString() }).eq("id", jobId).select().single();
      if (updateError) return jsonResponse({ ok: false, error: updateError.message }, 500);

      return jsonResponse({ ok: true, data: { job: updatedJob, tool: adminToolsBody.data } });
    }

    return jsonResponse({ ok: false, error: "Unknown action" }, 400);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
