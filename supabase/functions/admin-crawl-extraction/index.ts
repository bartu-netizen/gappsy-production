import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS, extractToken } from "../_shared/adminSession.ts";
import type { NormalizedExtraction } from "../_shared/crawlExtractionAdapter.ts";
import { walkFields, resolveApprovedValue, createDraftFromCrawlJob, type ReviewState } from "../_shared/crawlDraftCreation.ts";

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
      if (!nameValue) return jsonResponse({ ok: false, error: "Approve or edit a tool name before creating a draft." }, 400);

      // Reuse the EXISTING admin-tools creation path — same validation,
      // same child-row handling, same completeness gate — rather than
      // inserting into `tools` directly. Passes through the caller's own
      // admin session token (already verified above), exactly as the
      // frontend would when calling admin-tools itself.
      const token = extractToken(req);
      const result = await createDraftFromCrawlJob(
        supabase,
        supabaseUrl,
        Deno.env.get("SUPABASE_ANON_KEY") || "",
        token || "",
        { id: job.id, discovery_candidate_id: job.discovery_candidate_id, completed_at: job.completed_at },
        extraction,
        reviewState,
      );
      if (!result.ok) return jsonResponse({ ok: false, error: result.error }, 502);

      // createDraftFromCrawlJob already persisted created_draft_tool_id onto
      // this crawl_jobs row — re-fetch it so the response shape (job + tool)
      // stays exactly what callers of this action already expect.
      const { data: updatedJob, error: updateError } = await supabase.from("crawl_jobs").select("*").eq("id", jobId).maybeSingle();
      if (updateError) return jsonResponse({ ok: false, error: updateError.message }, 500);

      return jsonResponse({ ok: true, data: { job: updatedJob, tool: result.tool } });
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
