import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Read-only: lists every tool eligible for AI enrichment — the engine
// works on any tool status (draft, needs_review, ready_to_publish,
// published, archived), not just drafts. Applying to a published tool
// still requires the normal review/approve/apply steps; it just also
// means the change goes live immediately once applied (the review screen
// surfaces a warning for that case). Each row is annotated with its most
// recent enrichment job (if any) so the Queue page can show "not yet
// enriched" vs "needs review" vs "applied".

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const ALL_STATUSES = ["draft", "needs_review", "ready_to_publish", "published", "archived"];

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
    const search = url.searchParams.get("search")?.trim() || null;
    const statusFilter = url.searchParams.get("status"); // one of ALL_STATUSES, or "all"/omitted for every status
    const enrichmentFilter = url.searchParams.get("enrichment_status"); // "never" | "needs_review" | "applied"
    const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
    const pageSize = Math.min(100, Math.max(1, Number(url.searchParams.get("page_size")) || 25));

    const statusesToQuery = statusFilter && statusFilter !== "all" && ALL_STATUSES.includes(statusFilter)
      ? [statusFilter]
      : ALL_STATUSES;

    let query = supabase
      .from("tools")
      .select("id, name, slug, status, source, short_description, updated_at", { count: "exact" })
      .in("status", statusesToQuery)
      .order("updated_at", { ascending: false });
    if (search) query = query.ilike("name", `%${search}%`);

    const { data: tools, error: toolsError, count } = await query.range((page - 1) * pageSize, page * pageSize - 1);
    if (toolsError) return jsonResponse({ ok: false, error: toolsError.message }, 500);

    const toolIds = (tools || []).map((t) => t.id);
    const latestJobByTool = new Map<string, { status: string } & Record<string, unknown>>();
    if (toolIds.length > 0) {
      const { data: jobs } = await supabase
        .from("enrichment_jobs")
        .select("id, tool_id, status, generation_version, created_at, completed_at")
        .in("tool_id", toolIds)
        .order("created_at", { ascending: false });
      for (const job of jobs || []) {
        if (!latestJobByTool.has(job.tool_id)) latestJobByTool.set(job.tool_id, job);
      }
    }

    let rows = (tools || []).map((tool) => ({
      ...tool,
      latest_enrichment_job: latestJobByTool.get(tool.id) || null,
    }));

    if (enrichmentFilter === "never") rows = rows.filter((r) => !r.latest_enrichment_job);
    else if (enrichmentFilter) rows = rows.filter((r) => r.latest_enrichment_job?.status === enrichmentFilter);

    return jsonResponse({ ok: true, data: rows, total: count || 0, page, page_size: pageSize });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
