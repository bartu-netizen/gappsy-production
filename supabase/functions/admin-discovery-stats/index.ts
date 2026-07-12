import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Read-only dashboard rollup for the Discovery Dashboard page — mirrors
// admin-publishing-stats' shape for the existing Publishing pipeline.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const STATUSES = ["new", "validated", "needs_review", "duplicate", "rejected", "approved_for_crawl", "crawled"] as const;

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);
    if (req.method !== "GET") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const byStatus: Record<string, number> = {};
    await Promise.all(
      STATUSES.map(async (status) => {
        const { count } = await supabase.from("discovered_tools").select("id", { count: "exact", head: true }).eq("status", status);
        byStatus[status] = count || 0;
      }),
    );

    const { count: totalDiscovered } = await supabase.from("discovered_tools").select("id", { count: "exact", head: true });

    const { data: providerRows } = await supabase.from("discovered_tools").select("provider_id, discovery_providers(key, name)");
    const byProvider: Record<string, number> = {};
    for (const row of providerRows || []) {
      const provider = row as unknown as { discovery_providers: { key: string; name: string } | null };
      const key = provider.discovery_providers?.name || "Unknown";
      byProvider[key] = (byProvider[key] || 0) + 1;
    }

    const { data: categoryRows } = await supabase.from("discovered_tools").select("category_id, tool_categories(name)");
    const byCategory: Record<string, number> = {};
    for (const row of categoryRows || []) {
      const cat = row as unknown as { tool_categories: { name: string } | null };
      const key = cat.tool_categories?.name || "Uncategorized";
      byCategory[key] = (byCategory[key] || 0) + 1;
    }

    const fourteenDaysAgo = new Date(Date.now() - 14 * 24 * 60 * 60 * 1000).toISOString();
    const { data: recentRows } = await supabase
      .from("discovered_tools")
      .select("created_at")
      .gte("created_at", fourteenDaysAgo);
    const byDay: Record<string, number> = {};
    for (const row of recentRows || []) {
      const day = new Date(row.created_at as string).toISOString().slice(0, 10);
      byDay[day] = (byDay[day] || 0) + 1;
    }

    const validatedOrBetter = (byStatus.validated || 0) + (byStatus.approved_for_crawl || 0) + (byStatus.crawled || 0) + (byStatus.needs_review || 0);
    const validationAttempts = validatedOrBetter + (byStatus.duplicate || 0) + (byStatus.rejected || 0);
    const validationSuccessRate = validationAttempts > 0 ? Math.round(((byStatus.validated || 0) / validationAttempts) * 100) : null;

    const { data: recent } = await supabase
      .from("discovered_tools")
      .select("id, name, logo_url, status, created_at")
      .order("created_at", { ascending: false })
      .limit(8);

    return jsonResponse({
      ok: true,
      data: {
        total_discovered: totalDiscovered || 0,
        by_status: byStatus,
        by_provider: byProvider,
        by_category: byCategory,
        by_day: byDay,
        validation_success_rate: validationSuccessRate,
        recent: recent || [],
      },
    });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
