import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";
import { buildToolExportInput } from "../_shared/enrichmentInputBuilder.ts";
import { getProvider } from "../_shared/enrichmentProviders/registry.ts";
import type { PromptVersionRow } from "../_shared/enrichmentPromptBuilder.ts";

// Turns a queued enrichment_batches row into the "Claude Code Batch
// Package" (master prompt + input JSON + output schema + validation
// rules) — the exact bundle an admin copies into Claude Code. Idempotent:
// re-calling on an already-exported batch returns the stored package
// unless force=true regenerates it (e.g. after editing a tool's evidence).

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
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const payload = await req.json();
    const batchId = typeof payload.batch_id === "string" ? payload.batch_id : null;
    if (!batchId) return jsonResponse({ ok: false, error: "batch_id is required" }, 400);
    const force = payload.force === true;

    const { data: batch, error: batchError } = await supabase.from("enrichment_batches").select("*").eq("id", batchId).maybeSingle();
    if (batchError) return jsonResponse({ ok: false, error: batchError.message }, 500);
    if (!batch) return jsonResponse({ ok: false, error: "Batch not found" }, 404);

    if (batch.status === "exported" && batch.export_package && !force) {
      return jsonResponse({ ok: true, data: { batch, export_package: batch.export_package } });
    }
    if (!["queued", "exported"].includes(batch.status)) {
      return jsonResponse({ ok: false, error: `Cannot export a batch in status '${batch.status}'.` }, 409);
    }

    const { data: promptVersion, error: promptError } = await supabase
      .from("enrichment_prompt_versions")
      .select("*")
      .eq("id", batch.prompt_version_id)
      .maybeSingle();
    if (promptError) return jsonResponse({ ok: false, error: promptError.message }, 500);
    if (!promptVersion) return jsonResponse({ ok: false, error: "Prompt version not found" }, 409);

    const provider = getProvider(batch.provider);

    try {
      const toolInputs = await Promise.all(
        (batch.tool_ids as string[]).map((toolId: string) => buildToolExportInput(supabase, toolId, batch.requested_fields || [])),
      );

      const exportPackage = provider.buildExportPackage(promptVersion as PromptVersionRow, toolInputs, batch.id);

      const nowIso = new Date().toISOString();
      const { data: updatedBatch, error: updateError } = await supabase
        .from("enrichment_batches")
        .update({ status: "exported", export_package: exportPackage, exported_at: nowIso, updated_at: nowIso })
        .eq("id", batchId)
        .select()
        .single();
      if (updateError) return jsonResponse({ ok: false, error: updateError.message }, 500);

      await supabase
        .from("enrichment_jobs")
        .update({ status: "exported", started_at: nowIso, updated_at: nowIso })
        .eq("batch_id", batchId)
        .eq("status", "queued");

      await writeAuditLog({
        actor_session_type: "session_token", actor_email: session.email || undefined,
        action: "enrichment_batch_exported", target_table: "enrichment_batches", target_id: batchId, status: "success",
      });

      return jsonResponse({ ok: true, data: { batch: updatedBatch, export_package: exportPackage } });
    } catch (buildErr) {
      const message = buildErr instanceof Error ? buildErr.message : "Failed to build the export package.";
      await supabase.from("enrichment_batches").update({ status: "failed", error_code: "export_build_failed", error_message: message.slice(0, 500), updated_at: new Date().toISOString() }).eq("id", batchId);
      return jsonResponse({ ok: false, error: message }, 500);
    }
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
