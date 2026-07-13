import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";

// CRUD for the configurable first-publish gate (publishing_rules table —
// see 20260713190000). GET lists every rule; POST update toggles
// required/enabled for one rule by field_key. This is the ONLY thing that
// changes what admin-tools' getConfiguredFirstPublishRequiredKeys enforces
// — no code deploy needed to add/remove a required field from the six
// seeded rows, and disabling a rule here takes effect on the very next
// publish attempt (no caching).

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
      const { data, error } = await supabase.from("publishing_rules").select("*").order("field_key", { ascending: true });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: data || [] });
    }

    if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();

    if (payload.action === "update") {
      const fieldKey = typeof payload.field_key === "string" ? payload.field_key : null;
      if (!fieldKey) return jsonResponse({ ok: false, error: "field_key is required" }, 400);

      const update: Record<string, unknown> = { updated_by: session.email, updated_at: new Date().toISOString() };
      if (typeof payload.required === "boolean") update.required = payload.required;
      if (typeof payload.enabled === "boolean") update.enabled = payload.enabled;

      const { data: updated, error } = await supabase.from("publishing_rules").update(update).eq("field_key", fieldKey).select().maybeSingle();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      if (!updated) return jsonResponse({ ok: false, error: "Rule not found" }, 404);

      await writeAuditLog({ actor_session_type: "session_token", actor_email: session.email || undefined, action: "publishing_rule_updated", target_table: "publishing_rules", target_id: fieldKey, status: "success" });
      return jsonResponse({ ok: true, data: updated });
    }

    return jsonResponse({ ok: false, error: "Unknown action" }, 400);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
