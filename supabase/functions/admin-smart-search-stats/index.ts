import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Read-only observability for the homepage smart-search router
// (smart-search-route). Every query gets one row in smart_search_logs;
// this surfaces the fallback rate and the actual fallback query text so
// the team can see, in their own words, what visitors are looking for
// that the site doesn't have a confident category/tool/state match for —
// real content gaps, not guesses.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const RESULT_TYPES = ["tool", "category", "compare", "state", "fallback"] as const;

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "GET") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const dayAgoIso = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
    const weekAgoIso = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString();

    const [
      totalRes,
      last24hRes,
      last7dRes,
      ...byTypeResults
    ] = await Promise.all([
      supabase.from("smart_search_logs").select("id", { count: "exact", head: true }),
      supabase.from("smart_search_logs").select("id", { count: "exact", head: true }).gte("created_at", dayAgoIso),
      supabase.from("smart_search_logs").select("id", { count: "exact", head: true }).gte("created_at", weekAgoIso),
      ...RESULT_TYPES.map((t) => supabase.from("smart_search_logs").select("id", { count: "exact", head: true }).eq("result_type", t)),
    ]);

    const total = totalRes.count || 0;
    const byType: Record<string, number> = {};
    RESULT_TYPES.forEach((t, i) => {
      byType[t] = byTypeResults[i].count || 0;
    });
    const fallbackRatePct = total > 0 ? Math.round(((byType.fallback || 0) / total) * 1000) / 10 : 0;

    const [recentFallbackRes, recentAllRes] = await Promise.all([
      supabase
        .from("smart_search_logs")
        .select("query, created_at, ip_address, city, country_code, country_name")
        .eq("result_type", "fallback")
        .order("created_at", { ascending: false })
        .limit(50),
      supabase
        .from("smart_search_logs")
        .select("query, result_type, result_path, created_at, ip_address, city, country_code, country_name")
        .order("created_at", { ascending: false })
        .limit(50),
    ]);

    return jsonResponse({
      ok: true,
      totals: { total, last_24h: last24hRes.count || 0, last_7d: last7dRes.count || 0 },
      by_type: byType,
      fallback_rate_pct: fallbackRatePct,
      recent_fallback_queries: recentFallbackRes.data || [],
      recent_queries: recentAllRes.data || [],
    });
  } catch (error) {
    const msg = error instanceof Error ? error.message : "Unknown error";
    if (msg.includes("session") || msg.includes("token") || msg.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    console.error("[admin-smart-search-stats] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
