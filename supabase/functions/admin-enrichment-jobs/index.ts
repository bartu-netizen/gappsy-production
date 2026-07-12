import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Read path for the AI Dashboard / Queue / Needs Review / Completed /
// Failed / Generation History pages — all are just filtered views over
// enrichment_jobs. GET ?id= returns one job with its suggestions.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id) {
        const { data: job, error } = await supabase.from("enrichment_jobs").select("*, tools(id, name, slug, status)").eq("id", id).maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!job) return jsonResponse({ ok: false, error: "Job not found" }, 404);
        const { data: suggestions } = await supabase
          .from("enrichment_field_suggestions")
          .select("*")
          .eq("enrichment_job_id", id)
          .order("field_key", { ascending: true });
        return jsonResponse({ ok: true, data: { job, suggestions: suggestions || [] } });
      }

      const statusFilter = url.searchParams.get("status");
      const toolId = url.searchParams.get("tool_id");
      const batchId = url.searchParams.get("batch_id");
      const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
      const pageSize = Math.min(100, Math.max(1, Number(url.searchParams.get("page_size")) || 25));

      let query = supabase
        .from("enrichment_jobs")
        .select("*, tools(id, name, slug)", { count: "exact" })
        .order("created_at", { ascending: false })
        .range((page - 1) * pageSize, page * pageSize - 1);
      if (statusFilter) query = query.eq("status", statusFilter);
      if (toolId) query = query.eq("tool_id", toolId);
      if (batchId) query = query.eq("batch_id", batchId);

      const { data, error, count } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: data || [], total: count || 0, page, page_size: pageSize });
    }

    if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();

    if (payload.action === "cancel") {
      const jobId = typeof payload.id === "string" ? payload.id : null;
      if (!jobId) return jsonResponse({ ok: false, error: "id is required" }, 400);
      const { data: job } = await supabase.from("enrichment_jobs").select("status").eq("id", jobId).maybeSingle();
      if (!job) return jsonResponse({ ok: false, error: "Job not found" }, 404);
      if (!["queued", "exported"].includes(job.status)) {
        return jsonResponse({ ok: false, error: `Cannot cancel a job in status '${job.status}'.` }, 409);
      }
      const { data: updated, error } = await supabase.from("enrichment_jobs").update({ status: "cancelled", updated_at: new Date().toISOString() }).eq("id", jobId).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: updated });
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
