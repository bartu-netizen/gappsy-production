import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Read-only aggregator powering the Review Workspace's side-by-side view
// (crawl evidence -> current draft -> AI suggestion -> final value).
// Deliberately does NOT duplicate admin-tools' "current draft" fetch (the
// frontend calls admin-tools?id=X directly for that) and does NOT expose
// any mutation of its own — accept/reject/edit still go through the exact
// endpoints that already own that logic: admin-crawl-extraction for crawl
// fields, admin-enrichment-review for AI suggestions, admin-tools PUT for
// the final saved value. This endpoint only answers "what evidence and
// what AI suggestions exist for this tool," which today requires knowing
// to look in two different places (crawl_jobs.created_draft_tool_id, and
// enrichment_jobs.tool_id) that nothing currently joins together.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "GET") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const toolId = url.searchParams.get("tool_id");
    if (!toolId) return jsonResponse({ ok: false, error: "tool_id is required" }, 400);

    const [crawlJobRes, enrichmentJobRes] = await Promise.all([
      supabase
        .from("crawl_jobs")
        .select("id, discovery_candidate_id, requested_url, normalized_url, normalized_extraction, review_state, crawl4ai_version, source_urls, completed_at")
        .eq("created_draft_tool_id", toolId)
        .order("completed_at", { ascending: false })
        .limit(1)
        .maybeSingle(),
      supabase
        .from("enrichment_jobs")
        .select("id, status, generation_version, requested_fields, provider, model, completed_at")
        .eq("tool_id", toolId)
        .order("created_at", { ascending: false })
        .limit(1)
        .maybeSingle(),
    ]);
    if (crawlJobRes.error) return jsonResponse({ ok: false, error: crawlJobRes.error.message }, 500);
    if (enrichmentJobRes.error) return jsonResponse({ ok: false, error: enrichmentJobRes.error.message }, 500);

    let suggestions: unknown[] = [];
    if (enrichmentJobRes.data) {
      const { data: suggestionRows, error: suggestionsError } = await supabase
        .from("enrichment_field_suggestions")
        .select("id, field_key, generated_value, confidence, reason, source_urls, supporting_evidence, unsupported, review_status, approved_value, reviewer, reviewed_at")
        .eq("enrichment_job_id", enrichmentJobRes.data.id)
        .order("field_key", { ascending: true });
      if (suggestionsError) return jsonResponse({ ok: false, error: suggestionsError.message }, 500);
      suggestions = suggestionRows || [];
    }

    return jsonResponse({
      ok: true,
      data: {
        tool_id: toolId,
        crawl_evidence: crawlJobRes.data ? {
          crawl_job_id: crawlJobRes.data.id,
          discovery_candidate_id: crawlJobRes.data.discovery_candidate_id,
          requested_url: crawlJobRes.data.requested_url,
          normalized_url: crawlJobRes.data.normalized_url,
          normalized_extraction: crawlJobRes.data.normalized_extraction,
          review_state: crawlJobRes.data.review_state,
          crawl4ai_version: crawlJobRes.data.crawl4ai_version,
          source_urls: crawlJobRes.data.source_urls,
          completed_at: crawlJobRes.data.completed_at,
        } : null,
        enrichment_job: enrichmentJobRes.data,
        ai_suggestions: suggestions,
      },
    });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
