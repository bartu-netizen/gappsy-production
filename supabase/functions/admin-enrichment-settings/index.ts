import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";
import { getProvider } from "../_shared/enrichmentProviders/registry.ts";
import { ProviderNotImplementedError } from "../_shared/enrichmentProviders/types.ts";
import { MAX_BATCH_SIZE_HARD_CEILING } from "../_shared/enrichmentSchema.ts";

// Singleton settings row (id=true). GET returns it (seeded by migration,
// so it always exists); PUT updates it, refusing to switch to a provider
// that isn't actually implemented yet.

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
      const { data, error } = await supabase.from("enrichment_settings").select("*").eq("id", true).maybeSingle();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data });
    }

    if (req.method !== "PUT") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();
    const update: Record<string, unknown> = { updated_by: session.email, updated_at: new Date().toISOString() };

    if (payload.active_provider !== undefined) {
      try {
        getProvider(payload.active_provider);
      } catch (err) {
        if (err instanceof ProviderNotImplementedError) return jsonResponse({ ok: false, error: err.message }, 400);
        throw err;
      }
      update.active_provider = payload.active_provider;
    }
    if (payload.default_confidence_threshold !== undefined) {
      const v = Number(payload.default_confidence_threshold);
      if (!Number.isFinite(v) || v < 0 || v > 100) return jsonResponse({ ok: false, error: "default_confidence_threshold must be 0-100" }, 400);
      update.default_confidence_threshold = Math.round(v);
    }
    if (payload.default_batch_size !== undefined) {
      const v = Number(payload.default_batch_size);
      if (!Number.isFinite(v) || v < 1) return jsonResponse({ ok: false, error: "default_batch_size must be >= 1" }, 400);
      update.default_batch_size = Math.round(v);
    }
    if (payload.max_batch_size !== undefined) {
      const v = Number(payload.max_batch_size);
      if (!Number.isFinite(v) || v < 1 || v > MAX_BATCH_SIZE_HARD_CEILING) {
        return jsonResponse({ ok: false, error: `max_batch_size must be between 1 and ${MAX_BATCH_SIZE_HARD_CEILING}` }, 400);
      }
      update.max_batch_size = Math.round(v);
    }
    if (payload.default_prompt_key !== undefined) {
      if (typeof payload.default_prompt_key !== "string" || !payload.default_prompt_key.trim()) {
        return jsonResponse({ ok: false, error: "default_prompt_key must be a non-empty string" }, 400);
      }
      const { data: hasActive } = await supabase.from("enrichment_prompt_versions").select("id").eq("prompt_key", payload.default_prompt_key).eq("active", true).maybeSingle();
      if (!hasActive) return jsonResponse({ ok: false, error: `prompt_key "${payload.default_prompt_key}" has no active version` }, 409);
      update.default_prompt_key = payload.default_prompt_key;
    }

    const { data: updated, error } = await supabase.from("enrichment_settings").update(update).eq("id", true).select().single();
    if (error) return jsonResponse({ ok: false, error: error.message }, 500);

    await writeAuditLog({ actor_session_type: "session_token", actor_email: session.email || undefined, action: "enrichment_settings_updated", target_table: "enrichment_settings", target_id: "singleton", status: "success" });
    return jsonResponse({ ok: true, data: updated });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
