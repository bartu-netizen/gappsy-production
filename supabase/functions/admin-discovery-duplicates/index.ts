import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Duplicate Manager: GET lists every discovered_tools row currently flagged
// status='duplicate', including what it matched against (an existing
// published tool, or another pending candidate). POST action:'resolve'
// lets an admin either confirm it (leave as duplicate / reject outright) or
// override a false-positive match back into the review queue.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const DEFAULT_PER_PAGE = 25;
const MAX_PER_PAGE = 100;

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const session = await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    if (req.method === "GET") {
      const url = new URL(req.url);
      const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
      const perPage = Math.min(MAX_PER_PAGE, Math.max(1, Number(url.searchParams.get("per_page")) || DEFAULT_PER_PAGE));
      const rangeFrom = (page - 1) * perPage;
      const rangeTo = rangeFrom + perPage - 1;

      const { data, error, count } = await supabase
        .from("discovered_tools")
        .select("*, tool_categories(id, name), discovery_providers(id, name), duplicate_of_tool:duplicate_of_tool_id(id, name, slug, website), duplicate_of_discovery:duplicate_of_discovery_id(id, name, official_website)", { count: "exact" })
        .eq("status", "duplicate")
        .order("duplicate_score", { ascending: false })
        .range(rangeFrom, rangeTo);
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      return jsonResponse({ ok: true, data: data || [], total: count || 0, page, per_page: perPage });
    }

    if (req.method === "POST") {
      const payload = await req.json();
      if (payload.action !== "resolve") return jsonResponse({ ok: false, error: "Unknown action" }, 400);

      const id = typeof payload.id === "string" ? payload.id : null;
      const resolution = typeof payload.resolution === "string" ? payload.resolution : null;
      if (!id || (resolution !== "confirm" && resolution !== "not_a_duplicate")) {
        return jsonResponse({ ok: false, error: "id and resolution ('confirm' | 'not_a_duplicate') are required" }, 400);
      }

      const updates =
        resolution === "confirm"
          ? { status: "rejected", reviewed_by: session.email, reviewed_at: new Date().toISOString() }
          : {
              status: "needs_review",
              duplicate_score: 0,
              duplicate_of_tool_id: null,
              duplicate_of_discovery_id: null,
              reviewed_by: session.email,
              reviewed_at: new Date().toISOString(),
            };

      const { data: record, error } = await supabase.from("discovered_tools").update(updates).eq("id", id).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      if (!record) return jsonResponse({ ok: false, error: "Discovered tool not found" }, 404);

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
