import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";

// Prompt versions are append-only: creating one always inserts a NEW row
// (version = max+1 for that prompt_key). There is no update/delete
// endpoint — history is permanent by omission, not by convention.

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

    if (req.method === "GET") {
      const url = new URL(req.url);
      const promptKey = url.searchParams.get("prompt_key");
      let query = supabase.from("enrichment_prompt_versions").select("*").order("prompt_key").order("version", { ascending: false });
      if (promptKey) query = query.eq("prompt_key", promptKey);
      const { data, error } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: data || [] });
    }

    if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();

    if (payload.action === "activate") {
      const id = typeof payload.id === "string" ? payload.id : null;
      if (!id) return jsonResponse({ ok: false, error: "id is required" }, 400);
      const { data: row } = await supabase.from("enrichment_prompt_versions").select("prompt_key").eq("id", id).maybeSingle();
      if (!row) return jsonResponse({ ok: false, error: "Prompt version not found" }, 404);
      await supabase.from("enrichment_prompt_versions").update({ active: false }).eq("prompt_key", row.prompt_key).eq("active", true);
      const { data: updated, error } = await supabase.from("enrichment_prompt_versions").update({ active: true }).eq("id", id).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      await writeAuditLog({ actor_session_type: "session_token", actor_email: session.email || undefined, action: "enrichment_prompt_version_activated", target_table: "enrichment_prompt_versions", target_id: id, status: "success" });
      return jsonResponse({ ok: true, data: updated });
    }

    // Create a new version (default action).
    const promptKey = typeof payload.prompt_key === "string" ? payload.prompt_key.trim() : "";
    const name = typeof payload.name === "string" ? payload.name.trim() : "";
    const systemTemplate = typeof payload.system_template === "string" ? payload.system_template : "";
    const userTemplate = typeof payload.user_template === "string" ? payload.user_template : "";
    const outputSchema = payload.output_schema;
    if (!promptKey) return jsonResponse({ ok: false, error: "prompt_key is required" }, 400);
    if (!name) return jsonResponse({ ok: false, error: "name is required" }, 400);
    if (!systemTemplate) return jsonResponse({ ok: false, error: "system_template is required" }, 400);
    if (!userTemplate) return jsonResponse({ ok: false, error: "user_template is required" }, 400);
    if (!outputSchema || typeof outputSchema !== "object") return jsonResponse({ ok: false, error: "output_schema (object) is required" }, 400);

    const { data: latest } = await supabase.from("enrichment_prompt_versions").select("version").eq("prompt_key", promptKey).order("version", { ascending: false }).limit(1).maybeSingle();
    const nextVersion = (latest?.version || 0) + 1;
    const makeActive = payload.make_active === true;

    if (makeActive) {
      await supabase.from("enrichment_prompt_versions").update({ active: false }).eq("prompt_key", promptKey).eq("active", true);
    }

    const { data: inserted, error: insertError } = await supabase.from("enrichment_prompt_versions").insert({
      prompt_key: promptKey,
      version: nextVersion,
      name,
      purpose: typeof payload.purpose === "string" ? payload.purpose : null,
      system_template: systemTemplate,
      user_template: userTemplate,
      required_input_fields: Array.isArray(payload.required_input_fields) ? payload.required_input_fields : [],
      output_schema: outputSchema,
      provider_compatibility: Array.isArray(payload.provider_compatibility) && payload.provider_compatibility.length > 0 ? payload.provider_compatibility : ["claude_code_batch"],
      model_recommendation: typeof payload.model_recommendation === "string" ? payload.model_recommendation : null,
      active: makeActive,
      created_by: session.email,
      change_notes: typeof payload.change_notes === "string" ? payload.change_notes : null,
    }).select().single();
    if (insertError) return jsonResponse({ ok: false, error: insertError.message }, 500);

    await writeAuditLog({ actor_session_type: "session_token", actor_email: session.email || undefined, action: "enrichment_prompt_version_created", target_table: "enrichment_prompt_versions", target_id: inserted.id, status: "success" });
    return jsonResponse({ ok: true, data: inserted });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
