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

    // Provider health rollup — one row per registered provider (including
    // unimplemented stubs) with its last-run status/time and a recent error
    // count, so the Discovery Dashboard can show "which sources are
    // healthy" without a separate page. Read-only; never changes anything.
    const { data: providers } = await supabase
      .from("discovery_providers")
      .select("id, key, name, type, enabled, implemented, priority, schedule_frequency, last_run_at, last_run_status, disabled_reason")
      .order("priority", { ascending: true });

    const providerIds = (providers || []).map((p: { id: string }) => p.id);
    const recentErrorCountByProvider: Record<string, number> = {};
    const lastRunByProvider: Record<string, unknown> = {};
    const throughputByProvider: Record<string, number> = {};
    const duplicateRateByProvider: Record<string, number | null> = {};
    if (providerIds.length > 0) {
      const sevenDaysAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString();
      const { data: runs } = await supabase
        .from("discovery_provider_runs")
        .select("id, provider_id, status, candidates_found, candidates_created, candidates_duplicate, candidates_rejected, error_message, started_at, completed_at, duration_ms")
        .in("provider_id", providerIds)
        .gte("started_at", sevenDaysAgo)
        .order("started_at", { ascending: false });

      // Provider contribution / throughput / duplicate-rate rollup (Phase 6
      // of the Discovery scale work) — summed over the same 7-day window
      // already fetched above for recent_error_count, so no extra query.
      const foundByProvider: Record<string, number> = {};
      const createdByProvider: Record<string, number> = {};
      const duplicateByProvider: Record<string, number> = {};
      for (const run of runs || []) {
        const r = run as { provider_id: string; status: string; candidates_found: number | null; candidates_created: number | null; candidates_duplicate: number | null };
        if (r.status === "failed") {
          recentErrorCountByProvider[r.provider_id] = (recentErrorCountByProvider[r.provider_id] || 0) + 1;
        }
        if (!lastRunByProvider[r.provider_id]) lastRunByProvider[r.provider_id] = run;
        foundByProvider[r.provider_id] = (foundByProvider[r.provider_id] || 0) + (r.candidates_found || 0);
        createdByProvider[r.provider_id] = (createdByProvider[r.provider_id] || 0) + (r.candidates_created || 0);
        duplicateByProvider[r.provider_id] = (duplicateByProvider[r.provider_id] || 0) + (r.candidates_duplicate || 0);
      }

      for (const id of providerIds) {
        throughputByProvider[id] = createdByProvider[id] || 0;
        const found = foundByProvider[id] || 0;
        duplicateRateByProvider[id] = found > 0 ? Math.round(((duplicateByProvider[id] || 0) / found) * 100) : null;
      }
    }

    const providerHealth = (providers || []).map((p: { id: string }) => ({
      ...p,
      recent_error_count: recentErrorCountByProvider[p.id] || 0,
      last_run: lastRunByProvider[p.id] || null,
      throughput_7d: throughputByProvider[p.id] || 0,
      duplicate_rate_7d: duplicateRateByProvider[p.id] ?? null,
    }));

    // Change detection rollup (Phase 6) — surfaced on the same Discovery
    // Dashboard rather than a new page, per "do not create duplicate
    // dashboards where existing pages can be extended."
    const { count: fingerprintsTracked } = await supabase.from("tool_page_fingerprints").select("id", { count: "exact", head: true });
    const twentyFourHoursAgo = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
    const { count: checked24h } = await supabase
      .from("tool_page_fingerprints")
      .select("id", { count: "exact", head: true })
      .gte("last_checked_at", twentyFourHoursAgo);
    const sevenDaysAgoIso = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString();
    const { data: recentSeverityRows } = await supabase
      .from("tool_page_fingerprints")
      .select("last_change_severity")
      .gte("last_changed_at", sevenDaysAgoIso);
    const severityBreakdown7d: Record<string, number> = {};
    for (const row of (recentSeverityRows || []) as { last_change_severity: string }[]) {
      severityBreakdown7d[row.last_change_severity] = (severityBreakdown7d[row.last_change_severity] || 0) + 1;
    }
    const { count: recrawlsQueued7d } = await supabase
      .from("crawl_jobs")
      .select("id", { count: "exact", head: true })
      .eq("created_by", "system:change-detection")
      .gte("created_at", sevenDaysAgoIso);
    const { count: staleBackedOff } = await supabase
      .from("tool_page_fingerprints")
      .select("id", { count: "exact", head: true })
      .gte("consecutive_failures", 3);
    const { data: recentChangeRows } = await supabase
      .from("tool_page_fingerprints")
      .select("tool_id, page_type, last_change_severity, last_changed_at, last_change_evidence, canonical_url, tools(name)")
      .in("last_change_severity", ["meaningful", "critical"])
      .order("last_changed_at", { ascending: false })
      .limit(10);
    const recentChanges = ((recentChangeRows || []) as unknown as Array<{
      tool_id: string; page_type: string; last_change_severity: string; last_changed_at: string;
      canonical_url: string; tools: { name: string } | null;
    }>).map((row) => ({
      tool_id: row.tool_id,
      tool_name: row.tools?.name || "Unknown",
      page_type: row.page_type,
      severity: row.last_change_severity,
      changed_at: row.last_changed_at,
      canonical_url: row.canonical_url,
    }));

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
        provider_health: providerHealth,
        change_detection: {
          fingerprints_tracked: fingerprintsTracked || 0,
          checked_24h: checked24h || 0,
          severity_breakdown_7d: severityBreakdown7d,
          recrawls_queued_7d: recrawlsQueued7d || 0,
          stale_backed_off: staleBackedOff || 0,
          recent_changes: recentChanges,
        },
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
