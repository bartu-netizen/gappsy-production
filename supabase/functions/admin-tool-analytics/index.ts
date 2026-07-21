import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { fetchInChunks } from "../_shared/dbChunking.ts";

// Read-only analytics surface for /wp-admin/tool-analytics, backed by
// tool_page_views / tool_outbound_clicks (see 20260716020000) and the
// get_tool_analytics_summary() aggregation RPC (20260716030000).
//
// GET (no params)        -> per-tool summary list (views/clicks, all-time + 7d/30d)
// GET ?tool_slug=canva   -> that tool's recent events + country breakdown

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

// deno-lint-ignore no-explicit-any
function topCountries(rows: any[], limit = 8) {
  const counts = new Map<string, { country_code: string | null; country_name: string | null; count: number }>();
  for (const row of rows) {
    const key = row.country_code || row.country_name || "unknown";
    const existing = counts.get(key);
    if (existing) existing.count += 1;
    else counts.set(key, { country_code: row.country_code, country_name: row.country_name, count: 1 });
  }
  return [...counts.values()].sort((a, b) => b.count - a.count).slice(0, limit);
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "GET") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const toolSlug = url.searchParams.get("tool_slug");

    if (!toolSlug) {
      const { data: summary, error: summaryError } = await supabase.rpc("get_tool_analytics_summary");
      if (summaryError) return jsonResponse({ ok: false, error: summaryError.message }, 500);

      const toolIds = (summary || []).map((row: { tool_id: string }) => row.tool_id);
      if (toolIds.length === 0) return jsonResponse({ ok: true, tools: [] });

      const { data: tools, error: toolsError } = await fetchInChunks(toolIds, (chunk) =>
        supabase.from("tools").select("id, slug, name, logo").in("id", chunk)
      );
      if (toolsError) return jsonResponse({ ok: false, error: toolsError.message }, 500);

      const toolById = new Map((tools || []).map((t) => [t.id, t]));
      const merged = (summary || [])
        // deno-lint-ignore no-explicit-any
        .map((row: any) => ({ ...row, tool: toolById.get(row.tool_id) || null }))
        // deno-lint-ignore no-explicit-any
        .filter((row: any) => row.tool);

      return jsonResponse({ ok: true, tools: merged });
    }

    const { data: tool, error: toolError } = await supabase.from("tools").select("id, slug, name, logo").eq("slug", toolSlug).maybeSingle();
    if (toolError) return jsonResponse({ ok: false, error: toolError.message }, 500);
    if (!tool) return jsonResponse({ ok: false, error: "Tool not found" }, 404);

    // Recent-events + country breakdown are derived from up to the last 500
    // rows (plenty for both purposes); true totals come from a separate
    // exact count so a popular tool's real lifetime total isn't silently
    // capped at 500 in the UI.
    const [viewsResult, clicksResult, viewsCountResult, clicksCountResult] = await Promise.all([
      supabase.from("tool_page_views").select("id, ip_address, country_code, country_name, referrer, created_at").eq("tool_id", tool.id).order("created_at", { ascending: false }).limit(500),
      supabase.from("tool_outbound_clicks").select("id, link_type, destination_url, ip_address, country_code, country_name, referrer, created_at").eq("tool_id", tool.id).order("created_at", { ascending: false }).limit(500),
      supabase.from("tool_page_views").select("id", { count: "exact", head: true }).eq("tool_id", tool.id),
      supabase.from("tool_outbound_clicks").select("id", { count: "exact", head: true }).eq("tool_id", tool.id),
    ]);
    if (viewsResult.error) return jsonResponse({ ok: false, error: viewsResult.error.message }, 500);
    if (clicksResult.error) return jsonResponse({ ok: false, error: clicksResult.error.message }, 500);

    const views = viewsResult.data || [];
    const clicks = clicksResult.data || [];

    return jsonResponse({
      ok: true,
      tool,
      counts: { views_total: viewsCountResult.count ?? views.length, clicks_total: clicksCountResult.count ?? clicks.length },
      recent_views: views.slice(0, 50),
      recent_clicks: clicks.slice(0, 50),
      view_countries: topCountries(views),
      click_countries: topCountries(clicks),
    });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    console.error("[admin-tool-analytics] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
