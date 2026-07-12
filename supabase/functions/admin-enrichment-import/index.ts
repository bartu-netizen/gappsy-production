import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";
import { getProvider } from "../_shared/enrichmentProviders/registry.ts";

// Imports the JSON an admin pasted back from Claude Code, validates it
// per-field (malformed fields are dropped and recorded, not silently
// discarded — see enrichmentValidation.ts), and creates
// enrichment_field_suggestions rows. Every suggestion starts `pending` —
// nothing is ever auto-applied here.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const MAX_RAW_IMPORT_BYTES = 2_000_000; // bounded — this is a schema-shaped result, not raw page content

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const payload = await req.json();
    const batchId = typeof payload.batch_id === "string" ? payload.batch_id : null;
    if (!batchId) return jsonResponse({ ok: false, error: "batch_id is required" }, 400);
    const rawResult = payload.raw_result;
    if (rawResult === undefined || rawResult === null) return jsonResponse({ ok: false, error: "raw_result is required" }, 400);
    const rawSize = typeof rawResult === "string" ? rawResult.length : JSON.stringify(rawResult).length;
    if (rawSize > MAX_RAW_IMPORT_BYTES) {
      return jsonResponse({ ok: false, error: `Pasted result is too large (${rawSize} bytes, max ${MAX_RAW_IMPORT_BYTES}).` }, 413);
    }

    const { data: batch, error: batchError } = await supabase.from("enrichment_batches").select("*").eq("id", batchId).maybeSingle();
    if (batchError) return jsonResponse({ ok: false, error: batchError.message }, 500);
    if (!batch) return jsonResponse({ ok: false, error: "Batch not found" }, 404);
    if (!["exported", "importing"].includes(batch.status)) {
      return jsonResponse({ ok: false, error: `Cannot import into a batch in status '${batch.status}'.` }, 409);
    }

    const { data: jobs, error: jobsError } = await supabase
      .from("enrichment_jobs")
      .select("*")
      .eq("batch_id", batchId)
      .eq("status", "exported");
    if (jobsError) return jsonResponse({ ok: false, error: jobsError.message }, 500);
    if (!jobs || jobs.length === 0) return jsonResponse({ ok: false, error: "No exported jobs to import into." }, 409);

    const jobByToolId = new Map(jobs.map((j) => [j.tool_id, j]));
    const expectedToolIds = new Set(jobs.map((j) => j.tool_id));
    const requestedFieldsByTool = new Map(jobs.map((j) => [j.tool_id, (j.requested_fields || []) as string[]]));

    const provider = getProvider(batch.provider);
    const parsed = provider.parseResult(rawResult, expectedToolIds, requestedFieldsByTool);

    const nowIso = new Date().toISOString();
    let succeededJobs = 0;
    let failedJobs = 0;

    for (const [toolId, job] of jobByToolId) {
      const result = parsed.results.find((r) => r.tool_id === toolId);
      const duration = job.started_at ? new Date(nowIso).getTime() - new Date(job.started_at).getTime() : null;
      if (!result || result.fields.length === 0) {
        await supabase.from("enrichment_jobs").update({
          status: "failed",
          error_code: "no_valid_fields",
          error_message: "No valid fields were returned for this tool.",
          completed_at: nowIso, duration_ms: duration, updated_at: nowIso,
        }).eq("id", job.id);
        failedJobs++;
        continue;
      }

      const suggestionRows = result.fields.map((f) => ({
        enrichment_job_id: job.id,
        field_key: f.field_key,
        generated_value: f.value,
        confidence: f.confidence,
        reason: f.reason || null,
        source_urls: f.source_urls || [],
        supporting_evidence: f.evidence || null,
        classification: f.classification,
        unsupported: f.unsupported || false,
        warnings: f.warnings || [],
        review_status: f.unsupported ? "unsupported" : "pending",
        provider: batch.provider,
        prompt_version_id: job.prompt_version_id,
      }));
      const { error: insertError } = await supabase.from("enrichment_field_suggestions").insert(suggestionRows);
      if (insertError) {
        await supabase.from("enrichment_jobs").update({
          status: "failed", error_code: "suggestion_insert_failed", error_message: insertError.message.slice(0, 500),
          completed_at: nowIso, duration_ms: duration, updated_at: nowIso,
        }).eq("id", job.id);
        failedJobs++;
        continue;
      }

      await supabase.from("enrichment_jobs").update({
        status: "needs_review", completed_at: nowIso, duration_ms: duration, updated_at: nowIso,
      }).eq("id", job.id);
      succeededJobs++;
    }

    const batchStatus = failedJobs === 0 ? "completed" : succeededJobs === 0 ? "failed" : "partially_completed";
    const { data: updatedBatch, error: updateError } = await supabase
      .from("enrichment_batches")
      .update({
        status: batchStatus,
        import_raw: typeof rawResult === "string" ? rawResult.slice(0, MAX_RAW_IMPORT_BYTES) : rawResult,
        import_warnings: parsed.issues,
        imported_at: nowIso,
        updated_at: nowIso,
      })
      .eq("id", batchId)
      .select()
      .single();
    if (updateError) return jsonResponse({ ok: false, error: updateError.message }, 500);

    await writeAuditLog({
      actor_session_type: "session_token", actor_email: session.email || undefined,
      action: "enrichment_batch_imported", target_table: "enrichment_batches", target_id: batchId,
      status: failedJobs === 0 ? "success" : "error",
      rejection_reason: failedJobs > 0 ? `${failedJobs} job(s) failed import` : undefined,
    });

    return jsonResponse({
      ok: true,
      data: { batch: updatedBatch, succeeded_jobs: succeededJobs, failed_jobs: failedJobs, issues: parsed.issues },
    });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
