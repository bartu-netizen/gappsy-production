import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";
import { createBatchAndJobs, EnrichmentBatchError } from "../_shared/enrichmentBatchOps.ts";
import { ALL_FIELD_KEYS, FIELD_REGISTRY } from "../_shared/enrichmentSchema.ts";

// Owns enrichment_batches: create a batch from selected Queue tools (POST),
// list/get batches with their jobs (GET). Export/import are separate
// functions (admin-enrichment-export / admin-enrichment-import) so each
// step is independently retryable.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id) {
        const { data: batch, error } = await supabase.from("enrichment_batches").select("*").eq("id", id).maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!batch) return jsonResponse({ ok: false, error: "Batch not found" }, 404);
        const { data: jobs } = await supabase
          .from("enrichment_jobs")
          .select("*, tools(id, name, slug)")
          .eq("batch_id", id)
          .order("created_at", { ascending: true });
        return jsonResponse({ ok: true, data: { batch, jobs: jobs || [] } });
      }
      const statusFilter = url.searchParams.get("status");
      let query = supabase.from("enrichment_batches").select("*", { count: "exact" }).order("created_at", { ascending: false }).limit(50);
      if (statusFilter) query = query.eq("status", statusFilter);
      const { data, error, count } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: data || [], total: count || 0 });
    }

    if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();

    if (payload.action === "create" || !payload.action) {
      const toolIds = Array.isArray(payload.tool_ids) ? payload.tool_ids.filter((v: unknown) => typeof v === "string") : [];
      const requestedFields = Array.isArray(payload.requested_fields)
        ? payload.requested_fields.filter((v: unknown) => typeof v === "string" && Object.prototype.hasOwnProperty.call(FIELD_REGISTRY, v))
        : [];
      for (const key of requestedFields) {
        if (!ALL_FIELD_KEYS.includes(key)) return jsonResponse({ ok: false, error: `Unknown requested field: ${key}` }, 400);
      }

      const { data: settings } = await supabase.from("enrichment_settings").select("*").eq("id", true).maybeSingle();
      const provider = settings?.active_provider || "claude_code_batch";

      let promptVersionId = typeof payload.prompt_version_id === "string" ? payload.prompt_version_id : null;
      if (!promptVersionId) {
        const promptKey = settings?.default_prompt_key || "tool_editorial_enrichment";
        const { data: activePrompt } = await supabase
          .from("enrichment_prompt_versions")
          .select("id")
          .eq("prompt_key", promptKey)
          .eq("active", true)
          .maybeSingle();
        if (!activePrompt) return jsonResponse({ ok: false, error: "No active prompt version configured. Set one in Prompt Versions first." }, 409);
        promptVersionId = activePrompt.id;
      }

      try {
        const { batch, jobs } = await createBatchAndJobs(supabase, {
          toolIds,
          requestedFields,
          createdBy: session.email,
          promptVersionId,
          provider,
        });
        await writeAuditLog({
          actor_session_type: "session_token", actor_email: session.email || undefined,
          action: "enrichment_batch_created", target_table: "enrichment_batches", target_id: batch.id, status: "success",
        });
        return jsonResponse({ ok: true, data: { batch, jobs } });
      } catch (err) {
        if (err instanceof EnrichmentBatchError) {
          return jsonResponse({ ok: false, error_code: err.error_code, error: err.message, blocked_tool_ids: err.blocked || [] }, 409);
        }
        throw err;
      }
    }

    if (payload.action === "cancel") {
      const batchId = typeof payload.id === "string" ? payload.id : null;
      if (!batchId) return jsonResponse({ ok: false, error: "id is required" }, 400);
      const { data: batch } = await supabase.from("enrichment_batches").select("status").eq("id", batchId).maybeSingle();
      if (!batch) return jsonResponse({ ok: false, error: "Batch not found" }, 404);
      if (!["queued", "exported"].includes(batch.status)) {
        return jsonResponse({ ok: false, error: `Cannot cancel a batch in status '${batch.status}'.` }, 409);
      }
      await supabase.from("enrichment_jobs").update({ status: "cancelled", updated_at: new Date().toISOString() }).eq("batch_id", batchId).in("status", ["queued", "exported"]);
      const { data: updated, error } = await supabase.from("enrichment_batches").update({ status: "cancelled", updated_at: new Date().toISOString() }).eq("id", batchId).select().single();
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
