import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS, extractToken } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";
import { applyApprovedSuggestions, ApprovedSuggestion } from "../_shared/enrichmentApply.ts";
import { createBatchAndJobs, EnrichmentBatchError } from "../_shared/enrichmentBatchOps.ts";

// Every per-field and per-tool review action: approve / reject / edit /
// regenerate (single field or whole job) / bulk approve-or-reject /
// approve-all-eligible-high-confidence / apply-to-tool-draft. Nothing here
// ever writes to `tools` directly — apply always goes through admin-tools
// via enrichmentApply.ts, and nothing is EVER applied automatically; every
// path requires an explicit reviewer action.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    const anonKey = Deno.env.get("SUPABASE_ANON_KEY");
    if (!supabaseUrl || !serviceRoleKey || !anonKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const payload = await req.json();
    const nowIso = new Date().toISOString();

    if (payload.action === "approve" || payload.action === "reject" || payload.action === "edit") {
      const id = typeof payload.suggestion_id === "string" ? payload.suggestion_id : null;
      if (!id) return jsonResponse({ ok: false, error: "suggestion_id is required" }, 400);
      const { data: suggestion } = await supabase.from("enrichment_field_suggestions").select("*").eq("id", id).maybeSingle();
      if (!suggestion) return jsonResponse({ ok: false, error: "Suggestion not found" }, 404);

      const update: Record<string, unknown> = { reviewer: session.email, reviewed_at: nowIso };
      if (payload.action === "approve") {
        update.review_status = "approved";
        update.approved_value = suggestion.generated_value;
      } else if (payload.action === "reject") {
        update.review_status = "rejected";
      } else {
        if (payload.new_value === undefined) return jsonResponse({ ok: false, error: "new_value is required for edit" }, 400);
        update.review_status = "edited";
        update.approved_value = payload.new_value;
      }
      const { data: updated, error } = await supabase.from("enrichment_field_suggestions").update(update).eq("id", id).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: updated });
    }

    if (payload.action === "bulk-approve" || payload.action === "bulk-reject") {
      const ids = Array.isArray(payload.suggestion_ids) ? payload.suggestion_ids.filter((v: unknown) => typeof v === "string") : [];
      if (ids.length === 0) return jsonResponse({ ok: false, error: "suggestion_ids is required" }, 400);
      if (payload.action === "bulk-approve") {
        const { data: rows } = await supabase.from("enrichment_field_suggestions").select("id, generated_value").in("id", ids).eq("review_status", "pending");
        for (const row of rows || []) {
          await supabase.from("enrichment_field_suggestions").update({ review_status: "approved", approved_value: row.generated_value, reviewer: session.email, reviewed_at: nowIso }).eq("id", row.id);
        }
        return jsonResponse({ ok: true, data: { updated: (rows || []).length } });
      }
      const { data: updated, error } = await supabase
        .from("enrichment_field_suggestions")
        .update({ review_status: "rejected", reviewer: session.email, reviewed_at: nowIso })
        .in("id", ids)
        .eq("review_status", "pending")
        .select("id");
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: { updated: (updated || []).length } });
    }

    if (payload.action === "approve-all-eligible") {
      const jobId = typeof payload.job_id === "string" ? payload.job_id : null;
      if (!jobId) return jsonResponse({ ok: false, error: "job_id is required" }, 400);
      let threshold = typeof payload.threshold === "number" ? payload.threshold : null;
      if (threshold === null) {
        const { data: settings } = await supabase.from("enrichment_settings").select("default_confidence_threshold").eq("id", true).maybeSingle();
        threshold = settings?.default_confidence_threshold ?? 90;
      }
      const { data: eligible } = await supabase
        .from("enrichment_field_suggestions")
        .select("id, generated_value")
        .eq("enrichment_job_id", jobId)
        .eq("review_status", "pending")
        .eq("unsupported", false)
        .gte("confidence", threshold);
      for (const row of eligible || []) {
        await supabase.from("enrichment_field_suggestions").update({ review_status: "approved", approved_value: row.generated_value, reviewer: session.email, reviewed_at: nowIso }).eq("id", row.id);
      }
      return jsonResponse({ ok: true, data: { approved: (eligible || []).length, threshold } });
    }

    if (payload.action === "regenerate") {
      const jobId = typeof payload.job_id === "string" ? payload.job_id : null;
      if (!jobId) return jsonResponse({ ok: false, error: "job_id is required" }, 400);
      const fieldKey = typeof payload.field_key === "string" ? payload.field_key : null;

      const { data: sourceJob, error: sourceError } = await supabase.from("enrichment_jobs").select("*").eq("id", jobId).maybeSingle();
      if (sourceError) return jsonResponse({ ok: false, error: sourceError.message }, 500);
      if (!sourceJob) return jsonResponse({ ok: false, error: "Job not found" }, 404);

      const requestedFields = fieldKey ? [fieldKey] : (sourceJob.requested_fields || []);
      try {
        const { batch, jobs } = await createBatchAndJobs(supabase, {
          toolIds: [sourceJob.tool_id],
          requestedFields,
          createdBy: session.email,
          promptVersionId: sourceJob.prompt_version_id,
          provider: sourceJob.provider,
        });
        await writeAuditLog({
          actor_session_type: "session_token", actor_email: session.email || undefined,
          action: "enrichment_regenerate_requested", target_table: "enrichment_jobs", target_id: jobs[0]?.id, status: "success",
        });
        return jsonResponse({ ok: true, data: { batch, job: jobs[0] } });
      } catch (err) {
        if (err instanceof EnrichmentBatchError) {
          return jsonResponse({ ok: false, error_code: err.error_code, error: err.message }, 409);
        }
        throw err;
      }
    }

    if (payload.action === "apply") {
      const toolId = typeof payload.tool_id === "string" ? payload.tool_id : null;
      if (!toolId) return jsonResponse({ ok: false, error: "tool_id is required" }, 400);
      const confirmOverwriteFieldKeys = Array.isArray(payload.confirm_overwrite_field_keys)
        ? payload.confirm_overwrite_field_keys.filter((v: unknown) => typeof v === "string")
        : [];

      // Only the latest (approved|edited, unapplied) suggestion per field_key
      // across all of this tool's jobs — a regenerated field's older
      // suggestion is never reapplied once superseded.
      const { data: jobs } = await supabase.from("enrichment_jobs").select("id").eq("tool_id", toolId);
      const jobIds = (jobs || []).map((j) => j.id);
      if (jobIds.length === 0) return jsonResponse({ ok: false, error: "No enrichment jobs exist for this tool." }, 404);

      let query = supabase
        .from("enrichment_field_suggestions")
        .select("*")
        .in("enrichment_job_id", jobIds)
        .in("review_status", ["approved", "edited"])
        .eq("applied_to_tool", false)
        .order("generated_at", { ascending: false });
      const suggestionIds = Array.isArray(payload.suggestion_ids) ? payload.suggestion_ids.filter((v: unknown) => typeof v === "string") : null;
      if (suggestionIds && suggestionIds.length > 0) query = query.in("id", suggestionIds);

      const { data: candidates, error: candidatesError } = await query;
      if (candidatesError) return jsonResponse({ ok: false, error: candidatesError.message }, 500);
      if (!candidates || candidates.length === 0) return jsonResponse({ ok: false, error: "No approved suggestions to apply." }, 409);

      const latestByFieldKey = new Map<string, typeof candidates[number]>();
      for (const s of candidates) {
        if (!latestByFieldKey.has(s.field_key)) latestByFieldKey.set(s.field_key, s);
      }

      const approved: ApprovedSuggestion[] = [...latestByFieldKey.values()].map((s) => ({
        field_key: s.field_key,
        value: s.review_status === "edited" ? s.approved_value : s.generated_value,
      }));

      const token = extractToken(req);
      const outcome = await applyApprovedSuggestions(supabase, supabaseUrl, anonKey, token || "", toolId, approved, confirmOverwriteFieldKeys);

      const appliedIds = [...latestByFieldKey.entries()]
        .filter(([key]) => outcome.applied_field_keys.includes(key))
        .map(([, s]) => s.id);
      if (appliedIds.length > 0) {
        await supabase.from("enrichment_field_suggestions").update({ applied_to_tool: true, applied_at: nowIso }).in("id", appliedIds);
      }

      // Mark a job "applied" once every one of its suggestions is resolved
      // (approved-and-applied or rejected) and at least one was applied.
      for (const jobId of jobIds) {
        const { count: unresolvedCount } = await supabase
          .from("enrichment_field_suggestions")
          .select("id", { count: "exact", head: true })
          .eq("enrichment_job_id", jobId)
          .in("review_status", ["pending", "approved", "edited"])
          .eq("applied_to_tool", false);
        const { count: appliedCount } = await supabase
          .from("enrichment_field_suggestions")
          .select("id", { count: "exact", head: true })
          .eq("enrichment_job_id", jobId)
          .eq("applied_to_tool", true);
        if ((unresolvedCount || 0) === 0 && (appliedCount || 0) > 0) {
          await supabase.from("enrichment_jobs").update({ status: "applied", updated_at: nowIso }).eq("id", jobId).eq("status", "needs_review");
        }
      }

      await writeAuditLog({
        actor_session_type: "session_token", actor_email: session.email || undefined,
        action: "enrichment_applied", target_table: "tools", target_id: toolId,
        status: outcome.conflicts.length > 0 ? "success" : "success",
        rejection_reason: outcome.conflicts.length > 0 ? `${outcome.conflicts.length} field(s) held back pending overwrite confirmation` : undefined,
      });

      return jsonResponse({ ok: true, data: outcome });
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
