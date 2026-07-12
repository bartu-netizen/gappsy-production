import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Provider registry CRUD. GET lists every provider with a live candidate
// count (discovered_tools rows). PUT ?id= toggles enabled/updates config.
// Adding a NEW provider is a migration seed row + a provider module, never
// a change to this function.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      const { data: providers, error } = await supabase.from("discovery_providers").select("*").order("created_at", { ascending: true });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const withCounts = await Promise.all(
        (providers || []).map(async (provider: { id: string }) => {
          const { count } = await supabase
            .from("discovered_tools")
            .select("id", { count: "exact", head: true })
            .eq("provider_id", provider.id);
          return { ...provider, candidate_count: count || 0 };
        }),
      );

      return jsonResponse({ ok: true, data: withCounts });
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Provider ID is required" }, 400);
      const payload = await req.json();

      const updates: Record<string, unknown> = { updated_at: new Date().toISOString() };
      if (Object.prototype.hasOwnProperty.call(payload, "enabled")) updates.enabled = Boolean(payload.enabled);
      if (Object.prototype.hasOwnProperty.call(payload, "config") && typeof payload.config === "object" && payload.config !== null) {
        updates.config = payload.config;
      }

      const { data: record, error } = await supabase.from("discovery_providers").update(updates).eq("id", id).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      if (!record) return jsonResponse({ ok: false, error: "Provider not found" }, 404);

      return jsonResponse({ ok: true, data: record });
    }

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
